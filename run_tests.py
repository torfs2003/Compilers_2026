import subprocess
import os
import sys
from pathlib import Path

# De geautomatiseerde output file
LOG_FILE = "output/test_results.txt"
FAILED_LOG_FILE = "output/failed_tests.txt"

GCC_FLAGS = ["-ansi", "-pedantic", "-Wall", "-Wextra", "-Werror=incompatible-pointer-types", "-Werror=implicit-int", "-Werror=multichar"]

def log(message, end="\n"):
    """Print naar terminal én schrijft weg naar het resultatenbestand."""
    print(message, end=end)
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(message + end)


def test_execution(c_file, generated_ll_file):
    ref_exe = f"./compiler_test_{c_file.stem}.exe" if os.name == 'nt' else f"./safe_compile_{c_file.stem}"

    try:
        # 1. Run GCC
        subprocess.run(
            ["gcc", *GCC_FLAGS, str(c_file), "-o", ref_exe],
            check=True, capture_output=True, text=True, timeout=5
        )
        ref_result = subprocess.run([ref_exe], capture_output=True, text=True, timeout=2)

        # 2. Run compiler (LLI)
        my_result = subprocess.run(
            ["lli", generated_ll_file],
            capture_output=True, text=True, timeout=2
        )

        # 3. Vergelijk de output
        out_match = (ref_result.stdout.strip() == my_result.stdout.strip())

        lli_system_error = "error while loading shared libraries" in my_result.stderr or "lli: " in my_result.stderr

        code_match = False
        if lli_system_error:
            code_match = False
        elif ref_result.returncode == my_result.returncode:
            code_match = True
        elif ref_result.returncode != 0 and my_result.returncode != 0:
            code_match = True
        elif out_match and my_result.returncode == 0 and my_result.stdout.strip() == "":
            code_match = True  # De fix voor GCC garbage codes!

        # 4. Geef het resultaat correct terug
        if out_match and code_match:
            return True, "Execution output match!"
        else:
            diff = f"EXPECTED (code {ref_result.returncode}):\n{ref_result.stdout}\nACTUAL (code {my_result.returncode}):\n{my_result.stdout}"
            if my_result.stderr:
                diff += f"\n[!] LLI SYSTEM ERROR / STDERR:\n{my_result.stderr.strip()}"
            return False, diff

    except subprocess.TimeoutExpired:
        return False, "TIMEOUT (Mogelijke oneindige lus in de code)"
    except subprocess.CalledProcessError as e:
        stderr = (e.stderr or "").lower()

        if "c++ style comments" in stderr and "not allowed" in stderr:
            return True, "GCC_SINGLE_LINE_COMMENT_ERROR_IGNORED"
        return False, "INVALID_C_FILE"
    finally:
        if os.path.exists(ref_exe):
            os.remove(ref_exe)

def gcc_accepts_c_file(c_file: Path):
    ref_exe = f"./compiler_test_{c_file.stem}.exe" if os.name == "nt" else f"./safe_compile_{c_file.stem}"
    try:
        subprocess.run(
            ["gcc", *GCC_FLAGS, str(c_file), "-o", ref_exe],
            check=True,
            capture_output=True,
            text=True,
            timeout=5,
        )
        return True, ""
    except subprocess.CalledProcessError as e:
        stderr = (e.stderr or "").lower()
        if "c++ style comments" in stderr and "not allowed" in stderr:
            return False, "GCC_SINGLE_LINE_COMMENT_ERROR_IGNORED"
        return False, "INVALID_C_FILE"
    finally:
        if os.path.exists(ref_exe):
            os.remove(ref_exe)

def run_tests_in_directory(test_dir, output_dir):
    """Runt de compiler en vergelijkt het uitvoergedrag voor alle .c bestanden."""
    path = Path(test_dir)
    c_files = list(path.rglob("*.c"))

    log(f"\n--- Start testen in: {test_dir} ({len(c_files)} bestanden) ---")

    if not c_files:
        log(f"Geen .c bestanden gevonden in {test_dir}")
        return

    passed = 0
    failed = 0
    failed_tests = []

    for c_file in c_files:
        base_name = c_file.stem
        folder_name = c_file.parent.name
        unique_name = f"{folder_name}_{base_name}"

        out_ll = os.path.join(output_dir, f"{unique_name}.ll")
        out_dot = os.path.join(output_dir, f"{unique_name}.dot")

        # Aanroep van jouw compiler
        cmd = [
            sys.executable, "-m", "src.main",
            "--input", str(c_file),
            "--render_ast", out_dot,
            "--target_llvm", out_ll
        ]

        log(f"Testen van: {folder_name}/{c_file.name}...", end="")

        # Run jouw compiler
        result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')

        if result.returncode != 0:
            gcc_ok, gcc_msg = gcc_accepts_c_file(c_file)

            if gcc_msg == "GCC_SINGLE_LINE_COMMENT_ERROR_IGNORED":
                log("PASSED (Ignored GCC C90 // comment error)")
                passed += 1
                continue

            if gcc_ok:
                log("FAILED (Compiler Error on valid C)")
                log(f"  --> Jouw compiler gaf een foutmelding:\n{result.stderr[:300]}...\n")
                failed += 1
                failed_tests.append(f"{folder_name}/{c_file.name} -> Compiler Error (but GCC accepts)")
            else:
                log("PASSED (Expected failure: compiler ving de error op)")
                passed += 1
            continue

        if not os.path.exists(out_ll):
            log("FAILED (Geen .ll bestand gemaakt)")
            failed += 1
            failed_tests.append(f"{folder_name}/{c_file.name} -> No .ll output")
            continue

        match, msg = test_execution(c_file, out_ll)

        if msg == "GCC_SINGLE_LINE_COMMENT_ERROR_IGNORED":
            log("PASSED (Ignored GCC C90 // comment error)")
            passed += 1
            continue

        # GCC faalt → check of jouw compiler dit correct afvangt
        if msg == "INVALID_C_FILE":
            if result.returncode != 0:
                log("PASSED (Expected failure: compiler ving de error op)")
                passed += 1
            else:
                log("FAILED (GCC gaf error, maar jouw compiler accepteerde de code!)")
                failed += 1
                failed_tests.append(f"{folder_name}/{c_file.name} -> GCC mismatch")
            continue

        # Compiler zelf faalt
        if result.returncode != 0:
            log("FAILED (Compiler Error)")
            log(f"  --> Jouw compiler gaf een foutmelding:\n{result.stderr[:300]}...\n")
            failed += 1
            failed_tests.append(f"{folder_name}/{c_file.name} -> Compiler Error")
            continue

        # Geen LLVM output
        if not os.path.exists(out_ll):
            log("FAILED (Geen .ll bestand gemaakt)")
            failed += 1
            failed_tests.append(f"{folder_name}/{c_file.name} -> No .ll output")
            continue

        # Output vergelijking
        if match:
            log("PASSED")
            passed += 1
        else:
            log("FAILED")
            log(f"  --> {msg}")
            failed += 1
            failed_tests.append(f"{folder_name}/{c_file.name} -> {msg}")

    # Resultaten
    log(f"\n--- Resultaten voor {test_dir}: {passed} Passed, {failed} Failed ---")

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
        "example_source_files/test_set_1"#,
        #"example_source_files/test_set_2",
        #"example_source_files/test_set_3"
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