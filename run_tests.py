import os
import subprocess
import argparse
import difflib
import shutil
from pathlib import Path

def compare_files(actual_file, expected_file):
    """Vergelijkt twee bestanden en retourneert de verschillen."""
    if not os.path.exists(expected_file) and not os.path.exists(actual_file):
        return True, "" # Geen van beide bestaat, dat is ook een match (bijv. geen AST bij een error)
        
    if not os.path.exists(expected_file):
        return False, f"Verwacht bestand ontbreekt: {expected_file}"
    if not os.path.exists(actual_file):
        return False, f"Gegenereerd bestand ontbreekt: {actual_file}"
    
    with open(actual_file, 'r', encoding='utf-8') as f_act, open(expected_file, 'r', encoding='utf-8') as f_exp:
        actual_lines = f_act.readlines()
        expected_lines = f_exp.readlines()
        
    if actual_lines == expected_lines:
        return True, ""
    
    diff = difflib.unified_diff(
        expected_lines, actual_lines, 
        fromfile='Expected', tofile='Actual', lineterm=''
    )
    return False, '\n'.join(diff)

def run_tests_in_directory(test_dir, output_dir, expected_dir, generate_expected=False):
    """Runt de compiler voor alle .c bestanden in een map."""
    path = Path(test_dir)
    c_files = list(path.rglob("*.c"))
    
    if not c_files:
        print(f"Geen .c bestanden gevonden in {test_dir}")
        return

    print(f"\n--- Start testen in: {test_dir} ({len(c_files)} bestanden) ---")
    
    passed = 0
    failed = 0

    for c_file in c_files:
        base_name = c_file.stem
        folder_name = c_file.parent.name
        
        unique_name = f"{folder_name}_{base_name}"
        
        # Paden voor de output (inclusief een nieuwe .out voor terminal text!)
        out_dot = os.path.join(output_dir, f"{unique_name}.dot")
        out_ll = os.path.join(output_dir, f"{unique_name}.ll")
        out_txt = os.path.join(output_dir, f"{unique_name}.out")
        
        exp_dot = os.path.join(expected_dir, f"{unique_name}.dot")
        exp_ll = os.path.join(expected_dir, f"{unique_name}.ll")
        exp_txt = os.path.join(expected_dir, f"{unique_name}.out")
        
        cmd = [
            "python", "-m", "src.main", 
            "--input", str(c_file), 
            "--render_ast", out_dot, 
            "--target_llvm", out_ll
        ]
        
        print(f"Testen van: {folder_name}/{c_file.name}...", end=" ")
        
        # Voer compiler uit
        result = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
        
        with open(out_txt, 'w', encoding='utf-8') as f:
            f.write(result.stdout)
            if result.stderr:
                f.write(result.stderr)

        if generate_expected:
            os.makedirs(expected_dir, exist_ok=True)
            # Kopieer console output
            shutil.copy(out_txt, exp_txt)
            # Kopieer DOT en LLVM alleen als de compiler ze succesvol heeft gemaakt
            if os.path.exists(out_dot): shutil.copy(out_dot, exp_dot)
            if os.path.exists(out_ll): shutil.copy(out_ll, exp_ll)
            print("EXPECTED FILES GEGENEREERD")
            continue

        # Vergelijk alles
        txt_match, txt_diff = compare_files(out_txt, exp_txt)
        dot_match, dot_diff = compare_files(out_dot, exp_dot)
        ll_match, ll_diff = compare_files(out_ll, exp_ll)
        
        if txt_match and dot_match and ll_match:
            print("PASSED")
            passed += 1
        else:
            print("FAILED")
            if not txt_match:
                print(f"  --> Verschil in Console Output (.out):\n{txt_diff[:500]}...\n")
            if not dot_match:
                print(f"  --> Verschil in AST (.dot):\n{dot_diff[:500]}...\n")
            if not ll_match:
                print(f"  --> Verschil in LLVM (.ll):\n{ll_diff[:500]}...\n")
            failed += 1

    if not generate_expected:
        print(f"--- Resultaten voor {test_dir}: {passed} Passed, {failed} Failed ---")

def main():
    parser = argparse.ArgumentParser(description='Run Compiler Tests')
    parser.add_argument('--generate-expected', action='store_true', help='Genereer de verwachte bestanden')
    args = parser.parse_args()

    test_folders = [
        "example_source_files/test_set_1", 
        #"example_source_files/test_set_2", 
        #"example_source_files/test_set_3"
    ]
    
    expected_folder = "example_source_files/expected_outputs" 
    output_folder = "output/test_results"
    
    os.makedirs(output_folder, exist_ok=True)
    os.makedirs(expected_folder, exist_ok=True)
    
    for folder in test_folders:
        if os.path.exists(folder):
            run_tests_in_directory(folder, output_folder, expected_folder, args.generate_expected)
        else:
            print(f"Map '{folder}' niet gevonden, slaat over.")

if __name__ == "__main__":
    main()