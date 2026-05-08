class SymbolTable:
    def __init__(self):
        self.scopes = [{}]  # Stack van scopes

    def enter_scope(self):
        self.scopes.append({})

    def exit_scope(self):
        if len(self.scopes) > 1:
            self.scopes.pop()

    def put(self, name, symbol_data):
        """Voeg een symbool toe aan de huidige scope."""
        current_scope = self.scopes[-1]
        if name in current_scope:
            return False
        current_scope[name] = symbol_data
        return True

    def get(self, name):
        """Zoek een symbool, beginnend bij de diepste scope."""
        for scope in reversed(self.scopes):
            if name in scope:
                return scope[name]
        return None

    def resolve_type(self, type_name):
        if not isinstance(type_name, str):
            return type_name

        current_type = type_name
        total_pointers = ""

        while True:
            # 1. Splits de basisnaam en de sterretjes
            base_type = current_type.replace('*', '').strip()
            # Verzamel alle sterretjes van deze stap
            total_pointers += '*' * current_type.count('*')

            if base_type.startswith("enum "):
                return "int" + total_pointers

            # 2. Zoek in de symbol table voor typedefs
            symbol = self.get(base_type)
            
            if symbol and symbol.get('type') == 'typedef':
                current_type = symbol.get('original_type')
            else:
                return base_type + total_pointers