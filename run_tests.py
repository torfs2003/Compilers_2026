import subprocess
import os
import sys
import argparse
import re  # Nieuw: nodig voor de logische sortering
from pathlib import Path

# De hoofdmap voor alle output
OUTPUT_ROOT = Path("output")
# De basis-source map om de structuur te bepalen
SOURCE_ROOT = Path("example_source_files")

CLANG_FLAGS = [
    "-std=c89", "-pedantic", "-Wall", "-Wextra",
    "-Werror=implicit-int", "-Werror=multichar", "-Wno-error=int-conversion"
]

_log_file = None

def natural_sort_key(path: Path):
    """
    Zorgt ervoor dat 'test_file_2' voor 'test_file_10' komt.
    Splitst de tekst in stukjes tekst en stukjes getal.
    """
    return [int(text) if text.isdigit() else text.lower()
            for text in re.split('([0-9]+)', str(path.name))]

def set_log_file(path: str):
    global _log_file
    _log_file = path
    os.makedirs(os.path.dirname(path), exist_ok=True)
    if os.path.exists(path):
        os.remove(path)

def log(message, end="\n"):
    print(message, end=end)
    if _log_file:
        with open(_log_file, "a", encoding="utf-8", errors="replace") as f:
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
                       check=True, capture_output=True, text=True, timeout=5, errors="replace")
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
                       check=True, capture_output=True, text=True, timeout=5, errors="replace")
        
        ref_result = subprocess.run([ref_exe], input=test_input, capture_output=True, text=True, timeout=2, errors="replace")
        my_result  = subprocess.run(["lli", generated_ll_file], input=test_input,
                                    capture_output=True, text=True, timeout=5, errors="replace")

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

def run_single_test(c_file: Path, root_path: Path):
    try:
        rel_path = c_file.relative_to(SOURCE_ROOT)
    except ValueError:
        rel_path = Path(c_file.name)

    out_ll  = OUTPUT_ROOT / rel_path.with_suffix(".ll")
    out_dot = OUTPUT_ROOT / rel_path.with_suffix(".dot")

    out_ll.parent.mkdir(parents=True, exist_ok=True)

    cmd = [sys.executable, "-m", "src.main",
           "--input", str(c_file), 
           "--render_ast", str(out_dot), 
           "--target_llvm", str(out_ll)]
    
    display_path = c_file.relative_to(SOURCE_ROOT.parent)
    result = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")

    if result.returncode != 0:
        if out_ll.exists(): os.remove(out_ll)
        if out_dot.exists(): os.remove(out_dot)
        
        clang_ok, _ = clang_accepts_c_file(c_file)
        if clang_ok:
            log(f"  {display_path}... FAILED (Compiler Error)")
            return False, str(display_path)
        else:
            log(f"  {display_path}... PASSED (Expected failure)")
            return True, None

    if not out_ll.exists():
        log(f"  {display_path}... FAILED (Geen .ll bestand gemaakt)")
        return False, str(display_path)

    match, msg = test_execution(c_file, str(out_ll))

    if match:
        log(f"  {display_path}... PASSED")
        return True, None
    else:
        short_msg = "\n    ".join(msg.splitlines()[:6])
        log(f"  {display_path}... FAILED\n    --> {short_msg}")
        return False, str(display_path)

def run_directory(path: Path, indent: int = 0):
    prefix = "  " * indent
    # Gebruik de natural_sort_key voor de bestanden
    direct_c = sorted((p for p in path.iterdir() if p.is_file() and p.suffix == ".c"), key=natural_sort_key)
    # Gebruik de natural_sort_key voor de submappen
    subdirs  = sorted((p for p in path.iterdir() if p.is_dir()), key=natural_sort_key)
    total_passed, total_failed = 0, 0

    for c_file in direct_c:
        ok, _ = run_single_test(c_file, SOURCE_ROOT)
        if ok: total_passed += 1
        else:  total_failed += 1

    for sub in subdirs:
        log(f"{prefix}[{sub.name}]")
        sp, sf = run_directory(sub, indent + 1)
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

    log_name = path.name + ".txt"
    log_path = OUTPUT_ROOT / log_name
    set_log_file(str(log_path))

    log(f"\n{'='*60}")
    log(f"  TEST MAP : {folder}")
    log(f"  Resultaten in : {OUTPUT_ROOT}")
    log(f"{'='*60}")

    # Sortering gefixt met natural_sort_key
    top_subdirs = sorted((p for p in path.iterdir() if p.is_dir()), key=natural_sort_key)
    direct_c    = sorted((p for p in path.iterdir() if p.is_file() and p.suffix == ".c"), key=natural_sort_key)

    set_passed, set_failed = 0, 0

    for c_file in direct_c:
        ok, _ = run_single_test(c_file, SOURCE_ROOT)
        if ok: set_passed += 1
        else:  set_failed += 1

    for top in top_subdirs:
        log(f"\n{'─'*50}")
        log(f"  [{top.name}]")
        log(f"{'─'*50}")
        sp, sf = run_directory(top, indent=1)
        set_passed += sp
        set_failed += sf
        status = "ALLES GESLAAGD" if sf == 0 else f"{sf} GEFAALD"
        log(f"\n  |== {top.name} TOTAAL: {sp} passed, {sf} failed  [{status}] ==|")

    log(f"\n{'='*60}")
    log(f"  EINDTOTAAL: {set_passed} passed, {set_failed} failed")
    log(f"{'='*60}\n")
    return set_passed, set_failed

def main():
    parser = argparse.ArgumentParser(description="Test runner voor de C compiler.")
    parser.add_argument("folder", nargs="?", default=None)
    args = parser.parse_args()

    OUTPUT_ROOT.mkdir(exist_ok=True)

    if args.folder:
        run_folder(args.folder)
    else:
        default_folders = [
            "example_source_files/test_set_1",
            "example_source_files/test_set_2",
            "example_source_files/test_set_3/ASTTests",
            "example_source_files/test_set_3/LLVMTests",
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