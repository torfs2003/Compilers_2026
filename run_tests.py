import subprocess
import os
import sys
from pathlib import Path

# De geautomatiseerde output file
LOG_FILE = "output/test_results.txt"
FAILED_LOG_FILE = "output/failed_tests.txt"



def log(message, end="\n"):
    """Print naar terminal én schrijft weg naar het resultatenbestand."""
    print(message, end=end)
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(message + end)


def test_execution(c_file, generated_ll_file):
    ref_exe = f"./compiler_test_{c_file.stem}.exe" if os.name == 'nt' else f"./safe_compile_{c_file.stem}"

    try:
        # Referentie compileren
        subprocess.run(
            ["gcc", "-ansi", "-pedantic", str(c_file), "-o", ref_exe],
            check=True, capture_output=True, text=True, timeout=5
        )

        # Referentie uitvoeren
        ref_result = subprocess.run([ref_exe], capture_output=True, text=True, timeout=2)

        # LLVM uitvoeren
        my_result = subprocess.run(
            ["lli", generated_ll_file],
            capture_output=True, text=True, timeout=2
        )

        if ref_result.stdout == my_result.stdout and ref_result.returncode == my_result.returncode:
            return True, "Execution output match!"
        else:
            diff = f"EXPECTED:\n{ref_result.stdout}\nACTUAL:\n{my_result.stdout}"
            return False, diff

    except subprocess.TimeoutExpired:
        return False, "TIMEOUT (Mogelijke oneindige lus in de code)"
    except subprocess.CalledProcessError:
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

        log(f"Testen van: {folder_name}/{c_file.name}...", end=" ")

        # Run jouw compiler
        result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')

        match, msg = test_execution(c_file, out_ll)

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