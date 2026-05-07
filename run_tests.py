import subprocess
import os
import sys
from pathlib import Path

# De geautomatiseerde output file
LOG_FILE = "output/test_results.txt"
FAILED_LOG_FILE = "output/failed_tests.txt"

# Clang flags (strikte C89 modus)
CLANG_FLAGS = [
    "-std=c89",
    "-pedantic-errors", # Verander waarschuwingen in harde errors
    "-Wall",
    "-Wextra",
    "-Werror=implicit-int",
    "-Werror=multichar",
    "-Wno-error=int-conversion"
]

def log(message, end="\n"):
    print(message, end=end)
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(message + end)

def test_execution(c_file: Path, generated_ll_file: str):
    ref_exe = Path(f"./ref_{c_file.stem}.exe" if os.name == "nt" else f"./ref_{c_file.stem}")

    try:
        # 1. Probeer referentie te compileren
        # We gebruiken GEEN check=True zodat we de returncode zelf kunnen checken
        ref_compile = subprocess.run(
            ["clang", *CLANG_FLAGS, str(c_file), "-o", str(ref_exe)],
            capture_output=True, text=True, timeout=5
        )

        if ref_compile.returncode != 0:
            # Specifieke check voor C89 commentaren (//)
            if "//" in ref_compile.stderr or "C++ style comments" in ref_compile.stderr:
                return False, "C89_COMMENT_ERROR"
            return False, "INVALID_C89_FILE"

        # 2. Run reference executable
        ref_result = subprocess.run([str(ref_exe)], capture_output=True, text=True, timeout=2)

        # 3. Run jouw compiler output via LLI
        if not os.path.exists(generated_ll_file):
            return False, "MISSING_LL_FILE"

        my_result = subprocess.run(
            ["lli", generated_ll_file],
            capture_output=True, text=True, timeout=2
        )

        # 4. Vergelijk output en exit codes
        out_match = (ref_result.stdout.strip() == my_result.stdout.strip())
        
        # We beschouwen het als een match als de output klopt EN de exit codes overeenkomen
        # OF als beide programma's crashen (returncode != 0)
        code_match = (ref_result.returncode == my_result.returncode) or \
                     (ref_result.returncode != 0 and my_result.returncode != 0)

        if out_match and code_match:
            return True, "MATCH"
        else:
            diff = f"EXPECTED (code {ref_result.returncode}): {ref_result.stdout.strip()} | ACTUAL (code {my_result.returncode}): {my_result.stdout.strip()}"
            return False, diff

    except subprocess.TimeoutExpired:
        return False, "TIMEOUT"
    except Exception as e:
        return False, f"SYSTEM_ERROR: {str(e)}"
    finally:
        if ref_exe.exists():
            ref_exe.unlink() # Pathlib manier om te verwijderen

def run_tests_in_directory(test_dir, output_dir):
    path = Path(test_dir)
    c_files = list(path.rglob("*.c"))
    log(f"\n--- Start testen in: {test_dir} ({len(c_files)} bestanden) ---")

    passed, failed = 0, 0
    failed_tests = []

    for c_file in c_files:
        unique_name = f"{c_file.parent.name}_{c_file.stem}"
        out_ll = os.path.join(output_dir, f"{unique_name}.ll")
        out_dot = os.path.join(output_dir, f"{unique_name}.dot")

        log(f"Testen van: {c_file.parent.name}/{c_file.name}...", end=" ")

        # 1. Run jouw compiler
        cmd = [sys.executable, "-m", "src.main", "--input", str(c_file), "--render_ast", out_dot, "--target_llvm", out_ll]
        my_compiler_res = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')

        # 2. Vergelijk met Clang referentie
        match, msg = test_execution(c_file, out_ll)

        # 3. Logica voor resultaat
        if msg == "INVALID_C89_FILE":
            if my_compiler_res.returncode != 0:
                log("PASSED (Correctly rejected invalid C89)")
                passed += 1
            else:
                log("FAILED (Your compiler accepted invalid C89!)")
                failed += 1
                failed_tests.append(f"{c_file.name}: Accepted invalid C89")
        
        elif msg == "C89_COMMENT_ERROR":
            log("SKIPPED (C89 // comment check)")
            # Optioneel: passed += 1 als je dit als een succes ziet

        elif match:
            log("PASSED")
            passed += 1
        else:
            # Als jouw compiler faalt op legale C code
            if my_compiler_res.returncode != 0 and msg != "INVALID_C89_FILE":
                log("FAILED (Compiler Error on legal C)")
                log(f"  --> {my_compiler_res.stderr.strip()[:200]}")
                failed += 1
                failed_tests.append(f"{c_file.name}: Compiler Error")
            else:
                log(f"FAILED ({msg})")
                failed += 1
                failed_tests.append(f"{c_file.name}: {msg}")

    log(f"--- Resultaten: {passed} Passed, {failed} Failed ---\n")
    # ... rest van je logging code ...
    if failed_tests:
        log("\nGefaalde tests (zie apart bestand)")

        # Schrijf naar apart bestand
        with open(FAILED_LOG_FILE, "a", encoding="utf-8") as f:
            f.write(f"\n--- Gefaalde tests in {test_dir} ---\n")
            for test in failed_tests:
                f.write(f"{test}\n")
    else:
        log("\nGeen gefaalde tests 🎉")

    log("\n")


def main():
    if os.path.exists(FAILED_LOG_FILE):
        os.remove(FAILED_LOG_FILE)

    test_folders = [
        "example_source_files/test_set_1",
        "example_source_files/test_set_2",
        "example_source_files/test_set_3"
    ]

    output_folder = "output/test_results"
    os.makedirs(output_folder, exist_ok=True)

    # Verwijder oud logbestand
    if os.path.exists(LOG_FILE):
        os.remove(LOG_FILE)

    for folder in test_folders:
        if os.path.exists(folder):
            run_tests_in_directory(folder, output_folder)
        else:
            print(f"Waarschuwing: Map '{folder}' niet gevonden, overgeslagen.")

    print(f"\nAlle resultaten zijn opgeslagen in: {LOG_FILE}")


if __name__ == "__main__":
    main()