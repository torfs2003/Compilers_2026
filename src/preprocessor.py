import os
import re
import sys

class Preprocessor:
    def __init__(self, base_dir="."):
        self.base_dir = base_dir
        self.defines = {}
        self.errors = []

    def process_code(self, code: str) -> str:
        lines = code.splitlines()
        output_lines = []
        skip_mode = False        
        if_stack = 0 

        for line in lines:
            stripped_line = line.strip()

            # 0. Handle #ifndef en #endif
            if stripped_line.startswith("#ifndef"):
                parts = stripped_line.split()
                
                if len(parts) < 2:
                    foutmelding = "[Error] Preprocessor: '#ifndef' vereist een identifier."
                    print(foutmelding)
                    self.errors.append(foutmelding)
                    sys.exit(1)
                
                if_stack += 1
                macro_name = parts[1]
                if macro_name in self.defines:
                    skip_mode = True
                continue

            elif stripped_line.startswith("#endif"):
                if if_stack == 0:
                    foutmelding = "[Error] Preprocessor: stray '#endif' without matching '#ifndef'."
                    print(foutmelding)
                    self.errors.append(foutmelding)
                    sys.exit(1)
                
                if_stack -= 1
                skip_mode = False
                continue

            if skip_mode:
                continue

            # 1. Handle #include "..."
            if stripped_line.startswith("#include") and '"' in stripped_line:
                match = re.search(r'#include\s+"([^"]+)"', stripped_line)
                if match:
                    include_path = match.group(1)
                    full_path = os.path.join(self.base_dir, include_path)
                    
                    if os.path.exists(full_path):
                        with open(full_path, 'r', encoding='utf-8') as f:
                            included_code = f.read()
                            
                            old_base_dir = self.base_dir
                            self.base_dir = os.path.dirname(os.path.abspath(full_path))
                            processed_include = self.process_code(included_code)
                            self.base_dir = old_base_dir
                            
                            output_lines.append(processed_include)
                    else:
                        foutmelding = f"[Error] Preprocessor kon include bestand niet vinden: {full_path}"
                        print(foutmelding)
                        self.errors.append(foutmelding)
                        sys.exit(1)
                else:
                    output_lines.append(line)

            # 2. Handle #define A B
            elif stripped_line.startswith("#define"):
                parts = stripped_line.split()
                
                if len(parts) < 2:
                    foutmelding = "[Error] Preprocessor: #define zonder identifier."
                    print(foutmelding)
                    self.errors.append(foutmelding)
                    continue

                macro_name = parts[1]
                
                reserved_macros = {
                    "NULL", "EOF", "size_t", "ptrdiff_t", "wchar_t", 
                    "SEEK_SET", "SEEK_CUR", "SEEK_END", "RAND_MAX",
                    "EXIT_SUCCESS", "EXIT_FAILURE", "BUFSIZ", "FOPEN_MAX"
                }
                
                if macro_name in reserved_macros:
                    foutmelding = f"[Error] Redefinition of standard macro '{macro_name}' is illegal in C89."
                    print(foutmelding)
                    self.errors.append(foutmelding)
                    sys.exit(1)

                if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*$', macro_name):
                    foutmelding = f"[Error] Preprocessor: '{macro_name}' is geen geldige macro identifier."
                    print(foutmelding)
                    self.errors.append(foutmelding)
                    continue

                macro_value = " ".join(parts[2:]) if len(parts) >= 3 else ""
                
                if macro_name in self.defines and self.defines[macro_name] != macro_value:
                    foutmelding = f"[Error] Preprocessor: Redefinition of macro '{macro_name}' with a different value."
                    print(foutmelding)
                    self.errors.append(foutmelding)
                    sys.exit(1)
                
                self.defines[macro_name] = macro_value
            
            # 3. Standaard regel
            else:
                processed_line = line
                for macro, value in self.defines.items():
                    processed_line = re.sub(rf'\b{re.escape(macro)}\b', value, processed_line)
                
                output_lines.append(processed_line)

        return "\n".join(output_lines)

    def process_file(self, filepath: str) -> str:
        absolute_path = os.path.abspath(filepath)
        self.base_dir = os.path.dirname(absolute_path)
        with open(absolute_path, 'r', encoding='utf-8') as f:
            code = f.read()
        return self.process_code(code)