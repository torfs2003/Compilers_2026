import os
import re

class Preprocessor:
    def __init__(self, base_dir="."):
        self.base_dir = base_dir
        self.defines = {}

    def process_code(self, code: str) -> str:
        lines = code.splitlines()
        output_lines = []

        for line in lines:
            stripped_line = line.strip()

            # 1. Handle #include "..."
            if stripped_line.startswith("#include") and '"' in stripped_line:
                match = re.search(r'#include\s+"([^"]+)"', stripped_line)
                if match:
                    include_path = match.group(1)
                    full_path = os.path.join(self.base_dir, include_path)
                    
                    if os.path.exists(full_path):
                        with open(full_path, 'r', encoding='utf-8') as f:
                            included_code = f.read()
                            processed_include = self.process_code(included_code)
                            output_lines.append(processed_include)
                    else:
                        print(f"[Warning] Preprocessor kon include bestand niet vinden: {full_path}")
                        output_lines.append(line)
                else:
                    output_lines.append(line)

            # 2. Handle #define A B
            elif stripped_line.startswith("#define"):
                parts = stripped_line.split()
                
                if len(parts) < 2:
                    print(f"[Error] Preprocessor: #define zonder identifier.")
                    continue

                macro_name = parts[1]
                
                if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*$', macro_name):
                    print(f"[Error] Preprocessor: '{macro_name}' is geen geldige macro identifier.")
                    continue

                macro_value = " ".join(parts[2:]) if len(parts) >= 3 else ""
                self.defines[macro_name] = macro_value
            
            # 3. Standaard regel
            else:
                processed_line = line
                for macro, value in self.defines.items():
                    processed_line = re.sub(rf'\b{re.escape(macro)}\b', value, processed_line)
                
                output_lines.append(processed_line)

        return "\n".join(output_lines)

    def process_file(self, filepath: str) -> str:
        self.base_dir = os.path.dirname(filepath)
        with open(filepath, 'r', encoding='utf-8') as f:
            code = f.read()
        return self.process_code(code)