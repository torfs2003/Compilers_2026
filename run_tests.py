import subprocess
import os
import sys
import argparse
from pathlib import Path

OUTPUT_DIR = "output/test_results"

CLANG_FLAGS = [
    "-std=c89", "-pedantic", "-Wall", "-Wextra",
    "-Werror=implicit-int", "-Werror=multichar", "-Wno-error=int-conversion"
]

_log_file = None

def set_log_file(path: str):
    global _log_file
    _log_file = path
    os.makedirs(os.path.dirname(path), exist_ok=True)
    if os.path.exists(path):
        os.remove(path)

def log(message, end="\n"):
    print(message, end=end)
    if _log_file:
        with open(_log_file, "a", encoding="utf-8") as f:
            f.write(message + end)

def stdin_for_test(c_file: Path) -> str:
    default = "0 0\n0 0\n0 0\nabcde\nabcde\n"
    name = c_file.name
    if name == "test_file_6.c":  return "5"
    if name == "test_file_15.c": return "10"
    if name == "test_file_19.c": return "0 0"
    if name == "test_file_20.c": return "abcd"
    return default

def clang_accepts_c_file(c_file: Path):
    ref_exe = f"./compiler_test_{c_file.stem}.exe" if os.name == "nt" else f"./safe_compile_{c_file.stem}"
    try:
        subprocess.run(["clang", *CLANG_FLAGS, str(c_file), "-o", ref_exe],
                       check=True, capture_output=True, text=True, timeout=5)
        return True, ""
    except subprocess.CalledProcessError:
        return False, "INVALID_C_FILE"
    finally:
        if os.path.exists(ref_exe): os.remove(ref_exe)

def test_execution(c_file: Path, generated_ll_file: str):
    ref_exe = f"./compiler_test_{c_file.stem}.exe" if os.name == "nt" else f"./safe_compile_{c_file.stem}"
    test_input = stdin_for_test(c_file)
    try:
        subprocess.run(["clang", *CLANG_FLAGS, str(c_file), "-o", ref_exe],
                       check=True, capture_output=True, text=True, timeout=5)
        ref_result = subprocess.run([ref_exe], input=test_input, capture_output=True, text=True, timeout=2)
        my_result  = subprocess.run(["lli", generated_ll_file], input=test_input,
                                    capture_output=True, text=True, timeout=5)

        out_match = (ref_result.stdout.strip() == my_result.stdout.strip())
        lli_err   = "error while loading shared libraries" in my_result.stderr or "lli: " in my_result.stderr

        code_match = False
        if not lli_err:
            if ref_result.returncode == my_result.returncode:              code_match = True
            elif ref_result.returncode != 0 and my_result.returncode != 0: code_match = True
            elif out_match and my_result.returncode == 0 and not my_result.stdout.strip(): code_match = True

        if out_match and code_match:
            return True, "Execution output match!"

        diff = (f"EXPECTED (code {ref_result.returncode}):\n{ref_result.stdout}\n"
                f"ACTUAL (code {my_result.returncode}):\n{my_result.stdout}")
        if my_result.stderr:
            diff += f"\n[!] LLI STDERR:\n{my_result.stderr.strip()}"
        return False, diff

    except subprocess.TimeoutExpired:
        return False, "TIMEOUT (Mogelijke oneindige lus)"
    except subprocess.CalledProcessError:
        return False, "INVALID_C_FILE"
    finally:
        if os.path.exists(ref_exe): os.remove(ref_exe)

def run_single_test(c_file: Path, output_dir: str, root_path: Path):
    unique_name = f"{c_file.parent.name}_{c_file.stem}"
    out_ll  = os.path.join(output_dir, f"{unique_name}.ll")
    out_dot = os.path.join(output_dir, f"{unique_name}.dot")

    cmd = [sys.executable, "-m", "src.main",
           "--input", str(c_file), "--render_ast", out_dot, "--target_llvm", out_ll]
    display_path = c_file.relative_to(root_path)
    result = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8")

    if result.returncode != 0:
        clang_ok, _ = clang_accepts_c_file(c_file)
        if clang_ok:
            log(f"  {display_path}... FAILED (Compiler Error)")
            for line in result.stderr.strip().splitlines()[:5]:
                log(f"    --> {line}")
            return False, str(display_path)
        else:
            log(f"  {display_path}... PASSED (Expected failure)")
            return True, None

    if not os.path.exists(out_ll):
        log(f"  {display_path}... FAILED (Geen .ll bestand gemaakt)")
        return False, str(display_path)

    match, msg = test_execution(c_file, out_ll)

    if msg == "INVALID_C_FILE":
        if result.returncode != 0:
            log(f"  {display_path}... PASSED (Expected failure)")
            return True, None
        else:
            log(f"  {display_path}... FAILED (Compiler accepteerde ongeldige C!)")
            return False, str(display_path)
    elif match:
        log(f"  {display_path}... PASSED")
        return True, None
    else:
        short_msg = "\n    ".join(msg.splitlines()[:6])
        log(f"  {display_path}... FAILED\n    --> {short_msg}")
        return False, str(display_path)

def run_directory(path: Path, output_dir: str, root_path: Path, indent: int = 0):
    prefix = "  " * indent
    direct_c = sorted(p for p in path.iterdir() if p.is_file() and p.suffix == ".c")
    subdirs  = sorted(p for p in path.iterdir() if p.is_dir())
    total_passed, total_failed = 0, 0

    for c_file in direct_c:
        ok, _ = run_single_test(c_file, output_dir, root_path)
        if ok: total_passed += 1
        else:  total_failed += 1

    for sub in subdirs:
        log(f"{prefix}[{sub.name}]")
        sp, sf = run_directory(sub, output_dir, root_path, indent + 1)
        total_passed += sp
        total_failed += sf
        status = "V" if sf == 0 else "X"
        log(f"{prefix}  |__ {sub.name}: {status}  {sp} passed, {sf} failed")
        log("")

    return total_passed, total_failed

def run_folder(folder: str):
    path = Path(folder)
    if not path.exists():
        print(f"Waarschuwing: Map '{folder}' niet gevonden.")
        return 0, 0

    # Log file = output/<foldernaam>.txt  (bijv. output/ArrayTests.txt)
    log_name = path.name + ".txt"
    log_path = os.path.join("output", log_name)
    set_log_file(log_path)

    log(f"\n{'='*60}")
    log(f"  TEST MAP : {folder}")
    log(f"  Log file : {log_path}")
    log(f"{'='*60}")

    top_subdirs = sorted(p for p in path.iterdir() if p.is_dir())
    direct_c    = sorted(p for p in path.iterdir() if p.is_file() and p.suffix == ".c")

    set_passed, set_failed = 0, 0

    for c_file in direct_c:
        ok, _ = run_single_test(c_file, OUTPUT_DIR, path)
        if ok: set_passed += 1
        else:  set_failed += 1

    for top in top_subdirs:
        log(f"\n{'─'*50}")
        log(f"  [{top.name}]")
        log(f"{'─'*50}")
        sp, sf = run_directory(top, OUTPUT_DIR, path, indent=1)
        set_passed += sp
        set_failed += sf
        status = "ALLES GESLAAGD" if sf == 0 else f"{sf} GEFAALD"
        log(f"\n  |== {top.name} TOTAAL: {sp} passed, {sf} failed  [{status}] ==|")

    log(f"\n{'='*60}")
    log(f"  EINDTOTAAL: {set_passed} passed, {set_failed} failed")
    log(f"{'='*60}\n")
    print(f"\n  => Log opgeslagen in: {log_path}")
    return set_passed, set_failed

def main():
    parser = argparse.ArgumentParser(description="Test runner voor de C compiler.")
    parser.add_argument(
        "folder", nargs="?", default=None,
        help=(
            "Specifieke map om te testen, bijv.:\n"
            "  python run_tests.py example_source_files/test_set_3/LLVMTests/ArrayTests\n"
            "Laat leeg voor de volledige test set."
        )
    )
    args = parser.parse_args()

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    if args.folder:
        # Enkel de opgegeven map
        run_folder(args.folder)
    else:
        # Volledige test set — elke top-level map krijgt zijn eigen log file
        default_folders = [
            "example_source_files/test_set_3/LLVMTests/ArrayTests",
            #"example_source_files/test_set_1",
            #"example_source_files/test_set_2",
        ]
        grand_passed, grand_failed = 0, 0
        for folder in default_folders:
            gp, gf = run_folder(folder)
            grand_passed += gp
            grand_failed += gf

        if len(default_folders) > 1:
            print(f"\n{'#'*60}")
            print(f"  GRAND TOTAL: {grand_passed} passed, {grand_failed} failed")
            print(f"{'#'*60}")

if __name__ == "__main__":
    main()