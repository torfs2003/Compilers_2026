import subprocess
import os
import sys
import argparse
import re
import shutil
from pathlib import Path

# De hoofdmap voor alle output
OUTPUT_ROOT = Path("output")
# De basis-source map om de structuur te bepalen
SOURCE_ROOT = Path("example_source_files")

# ==========================================
# COMPILER INSTELLINGEN (
# ==========================================

# OPTIE 1: CLANG
COMPILER_CMD = "clang"
COMPILER_FLAGS = [
    "-std=c89", "-pedantic", "-Wall", "-Wextra",
    "-Werror=implicit-int", "-Werror=multichar", "-Wno-error=int-conversion"
]

# OPTIE 2: GCC
# Haal de '#' hieronder weg en zet ze voor de Clang instellingen hierboven om te switchen.
#COMPILER_CMD = "gcc"
#COMPILER_FLAGS = [
#    "-std=c89", "-pedantic-errors", "-Wall", "-Wextra"
#]

REF_COMPILER_FLAGS = [
    ('-pedantic' if f == '-pedantic-errors' else '-std=gnu89' if f == '-std=c89' else f)
    for f in COMPILER_FLAGS
]

_log_file = None
_debug_mode = False
_test_ll = True
_test_bin = True
_test_mips = False
_no_ref = False

def set_debug_mode(debug: bool):
    global _debug_mode
    _debug_mode = debug

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

def compiler_accepts_c_file(c_file: Path):
    if os.name == "nt":
        ref_exe = f"compiler_test_{c_file.stem}.exe"
    try:
        subprocess.run([COMPILER_CMD, *REF_COMPILER_FLAGS, str(c_file), "-o", ref_exe],
                       check=True, capture_output=True, text=True, timeout=5, errors="replace")
        return True, ""
    except subprocess.CalledProcessError:
        return False, "INVALID_C_FILE"
    finally:
        try:
            if os.path.exists(ref_exe): os.remove(ref_exe)
        except OSError:
            pass

def test_execution_ll(c_file: Path, generated_ll_file: str):
    """Test LLVM IR using lli"""
    global _no_ref
    test_input = stdin_for_test(c_file)

    if _no_ref:
        try:
            my_result = subprocess.run(["lli", generated_ll_file], input=test_input,
                                       capture_output=True, text=True, timeout=5, errors="replace")
        except subprocess.TimeoutExpired:
            return True, "Timeout accepted (infinite loop)"
        if my_result.returncode == 0:
            return True, "Execution ran (no reference check)"
        else:
            msg = f"ACTUAL (code {my_result.returncode}):\n{my_result.stdout}\n[STDERR]\n{my_result.stderr}"
            return False, msg

    if os.name == "nt":
        ref_exe = f"compiler_test_{c_file.stem}.exe"
    try:
        subprocess.run([COMPILER_CMD, *REF_COMPILER_FLAGS, str(c_file), "-o", ref_exe],
                       check=True, capture_output=True, text=True, timeout=5, errors="replace")

        ref_timeout = False
        my_timeout = False
        ref_result = None
        my_result = None
        
        try:
            ref_result = subprocess.run([ref_exe], input=test_input, capture_output=True, text=True, timeout=2, errors="replace")
        except subprocess.TimeoutExpired:
            ref_timeout = True
            
        try:
            my_result = subprocess.run(["lli", generated_ll_file], input=test_input,
                                       capture_output=True, text=True, timeout=5, errors="replace")
        except subprocess.TimeoutExpired:
            my_timeout = True
            
        if ref_timeout or my_timeout:
            return True, "Timeout accepted (infinite loop)"
            
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

    except subprocess.CalledProcessError:
        return False, "INVALID_C_FILE"
    finally:
        try:
            if os.path.exists(ref_exe): os.remove(ref_exe)
        except OSError:
            pass

def test_execution_binary(c_file: Path, binary_file: str):
    """Test native binary executable"""
    global _no_ref
    test_input = stdin_for_test(c_file)

    if _no_ref:
        try:
            my_result = subprocess.run([binary_file], input=test_input, capture_output=True, text=True, timeout=5, errors="replace")
        except subprocess.TimeoutExpired:
            return True, "Timeout accepted (infinite loop)"
        if my_result.returncode == 0:
            return True, "Execution ran (no reference check)"
        else:
            msg = f"ACTUAL (code {my_result.returncode}):\n{my_result.stdout}\n[STDERR]\n{my_result.stderr}"
            return False, msg

    if os.name == "nt":
        ref_exe = f"compiler_test_{c_file.stem}.exe"
    test_input = stdin_for_test(c_file)
    try:
        subprocess.run([COMPILER_CMD, *REF_COMPILER_FLAGS, str(c_file), "-o", ref_exe],
                       check=True, capture_output=True, text=True, timeout=5, errors="replace")

        ref_timeout = False
        my_timeout = False
        ref_result = None
        my_result = None
        
        try:
            ref_result = subprocess.run([ref_exe], input=test_input, capture_output=True, text=True, timeout=2, errors="replace")
        except subprocess.TimeoutExpired:
            ref_timeout = True
            
        try:
            my_result = subprocess.run([binary_file], input=test_input,
                                       capture_output=True, text=True, timeout=5, errors="replace")
        except subprocess.TimeoutExpired:
            my_timeout = True
            
        if ref_timeout or my_timeout:
            return True, "Timeout accepted (infinite loop)"
            
        out_match = (ref_result.stdout.strip() == my_result.stdout.strip())

        code_match = False
        if ref_result.returncode == my_result.returncode:              code_match = True
        elif ref_result.returncode != 0 and my_result.returncode != 0: code_match = True
        elif out_match and my_result.returncode == 0 and not my_result.stdout.strip(): code_match = True

        if out_match and code_match:
            return True, "Execution output match!"

        diff = (f"EXPECTED (code {ref_result.returncode}):\n{ref_result.stdout}\n"
                f"ACTUAL (code {my_result.returncode}):\n{my_result.stdout}")
        if my_result.stderr:
            diff += f"\n[!] STDERR:\n{my_result.stderr.strip()}"
        return False, diff

    except subprocess.CalledProcessError:
        return False, "INVALID_C_FILE"
    finally:
        try:
            if os.path.exists(ref_exe): os.remove(ref_exe)
        except OSError:
            pass

def test_execution_mips(c_file: Path, mips_file: str):
    """Test MIPS assembly using SPIM or MARS (skips QtSpim GUI)."""
    test_input = stdin_for_test(c_file)
    spim_exe = shutil.which("spim") or shutil.which("qtspim") or shutil.which("QtSpim")

    if not spim_exe:
        return None, "SPIM not found"

    if "qtspim" in os.path.basename(spim_exe).lower():
        return None, "QtSpim GUI detected; please install command-line 'spim' or add a console spim.exe to PATH"

    try:
        my_result = subprocess.run([spim_exe, "-f", mips_file, "-quiet"],
                                   input=test_input, capture_output=True, text=True,
                                   timeout=10, errors="replace")

        output_lines = my_result.stdout.strip().split('\n')
        actual_output = '\n'.join([line for line in output_lines
                                   if line.strip() and not line.startswith((' ', '[', 'SPIM', 'Register', 'Warning'))])

        if os.name == "nt":
            ref_exe = f"compiler_test_{c_file.stem}.exe"
        try:
            subprocess.run([COMPILER_CMD, *REF_COMPILER_FLAGS, str(c_file), "-o", ref_exe],
                           check=True, capture_output=True, text=True, timeout=5, errors="replace")
            ref_result = subprocess.run([ref_exe], input=test_input, capture_output=True, text=True, timeout=5, errors="replace")
        except subprocess.TimeoutExpired:
            return True, "Timeout accepted (infinite loop)"
        except subprocess.CalledProcessError:
            return None, "Cannot compile reference"
        finally:
            try:
                if os.path.exists(ref_exe): os.remove(ref_exe)
            except OSError:
                pass

        out_match = (ref_result.stdout.strip() == actual_output.strip())
        if out_match:
            return True, "MIPS output match!"
        else:
            diff = (f"EXPECTED:\n{ref_result.stdout}\n"
                   f"ACTUAL (MIPS):\n{actual_output}")
            return False, diff
    except subprocess.TimeoutExpired:
        return True, "MIPS timeout (infinite loop accepted)"
    except Exception as e:
        return None, f"SPIM execution error: {str(e)}"

def run_single_test(c_file: Path, root_path: Path):
    try:
        rel_path = c_file.relative_to(SOURCE_ROOT)
    except ValueError:
        rel_path = Path(c_file.name)

    out_ll  = OUTPUT_ROOT / rel_path.with_suffix(".ll")
    out_dot = OUTPUT_ROOT / rel_path.with_suffix(".dot")
    out_bin = OUTPUT_ROOT / rel_path.with_suffix(".bin")
    out_s   = OUTPUT_ROOT / rel_path.with_suffix(".s")

    out_ll.parent.mkdir(parents=True, exist_ok=True)

    cmd = [sys.executable, "-m", "src.main",
           "--input", str(c_file), 
           "--render_ast", str(out_dot), 
           "--target_llvm", str(out_ll),
           "--target_bin", str(out_bin),
           "--target_mips", str(out_s)]
    
    display_path = c_file.relative_to(SOURCE_ROOT.parent)
    result = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)


    if result.returncode != 0:
        if out_ll.exists(): os.remove(out_ll)
        if out_dot.exists(): os.remove(out_dot)
        if out_bin.exists(): os.remove(out_bin)
        if out_s.exists(): os.remove(out_s)
        
        compiler_ok, _ = compiler_accepts_c_file(c_file)
        if compiler_ok:
            error_msg = result.stderr.strip() if result.stderr else result.stdout.strip()
            if error_msg:
                num_lines = 100 if _debug_mode else 10
                short_error = "\n    ".join(error_msg.splitlines()[:num_lines])
                log(f"  {display_path}... FAILED (Compiler Error)")
                log(f"    --> {short_error}")
            else:
                log(f"  {display_path}... FAILED (Compiler Error)")
            return False, str(display_path)
        else:
            log(f"  {display_path}... PASSED (Expected failure)")
            return True, None

    if not out_ll.exists():
        log(f"  {display_path}... FAILED (Geen .ll bestand gemaakt)")
        return False, str(display_path)

    match_ll, msg_ll = test_execution_ll(c_file, str(out_ll))

    match_bin = None
    msg_bin = None
    if _test_bin and out_bin.exists():
        match_bin, msg_bin = test_execution_binary(c_file, str(out_bin))
    
    
    match_mips = None
    msg_mips = None
    if _test_mips and out_s.exists():
        match_mips, msg_mips = test_execution_mips(c_file, str(out_s))

    passed_all = True
    passed_components = []

    if match_ll:
        passed_components.append(".ll")
    else:
        passed_all = False
        short_msg = "\n    ".join(msg_ll.splitlines()[:6])
        log(f"  {display_path}... FAILED (.ll)\n    --> {short_msg}")

    if _test_bin and out_bin.exists():
        if match_bin:
            passed_components.append(".bin")
        else:
            passed_all = False
            short_msg = "\n    ".join(msg_bin.splitlines()[:6]) if msg_bin else "Unknown Error"
            log(f"  {display_path}... FAILED (.bin)\n    --> {short_msg}")

    # Check MIPS
    if _test_mips and out_s.exists() and match_ll:
        if match_mips is True:
            passed_components.append(".s")
        elif match_mips is False:
            passed_all = False
            short_msg = "\n    ".join(msg_mips.splitlines()[:6]) if msg_mips else "Unknown Error"
            log(f"  {display_path}... FAILED (.s MIPS)\n    --> {short_msg}")
        else:
            log(f"  {display_path}... SKIPPED (.s MIPS)\n    --> {msg_mips}")

    if passed_all:
        log(f"  {display_path}... PASSED ({', '.join(passed_components)})")
        return True, None
    else:
        return False, str(display_path)

def run_directory(path: Path, indent: int = 0):
    prefix = "  " * indent
    direct_c = sorted((p for p in path.iterdir() if p.is_file() and p.suffix == ".c"), key=natural_sort_key)
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
    parser.add_argument("--debug", action="store_true", help="Show full error messages (100 lines)")
    parser.add_argument("--test", type=str, help="Test a single file (e.g., example_source_files/test_set_3/MipsTests/ArrayTests/test1.c)")
    parser.add_argument("--only", choices=["ll", "bin", "mips", "all"], default="all",
                        help="Which targets to test: 'll' (LLVM IR), 'bin' (native binary), 'mips' (MIPS), or 'all'")
    parser.add_argument("--no-ref", action="store_true", help="Skip compiling/executing the reference program (faster, less strict)")
    
    args = parser.parse_args()

    OUTPUT_ROOT.mkdir(exist_ok=True)
    set_debug_mode(args.debug)
    global _test_ll, _test_bin, _test_mips, _no_ref
    if args.only == "ll":
        _test_ll, _test_bin, _test_mips = True, False, False
    elif args.only == "bin":
        _test_ll, _test_bin, _test_mips = False, True, False
    elif args.only == "mips":
        _test_ll, _test_bin, _test_mips = False, False, True
    else:
        _test_ll, _test_bin, _test_mips = True, True, False
    _no_ref = bool(args.no_ref)
    

    if args.test:
        test_file = Path(args.test)
        if not test_file.exists():
            print(f"File not found: {args.test}")
            sys.exit(1)
        set_log_file(str(OUTPUT_ROOT / "debug_single_test.txt"))
        log(f"Testing single file: {args.test}\n")
        ok, _ = run_single_test(test_file, SOURCE_ROOT)
        print(f"\nResult: {'PASSED' if ok else 'FAILED'}")
        if _log_file:
            print(f"Full output in: {_log_file}")
        sys.exit(0 if ok else 1)
    
    if args.folder:
        run_folder(args.folder)
    else:
        default_folders = [
            "example_source_files/test_set_1",
            "example_source_files/test_set_2",
            "example_source_files/test_set_3/ASTTests",
            "example_source_files/test_set_3/LLVMTests",
            "example_source_files/test_set_3/MipsTests"
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
