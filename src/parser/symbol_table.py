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
        """
        Kijkt of een naam (bijv. 'leeftijd') een typedef is.
        Als dat zo is, geeft hij het originele type (bijv. 'int') terug.
        Werkt recursief (typedef A B; typedef B C;).
        """
        if not isinstance(type_name, str):
            return type_name

        base_type = type_name.replace('*', '').strip()
        pointers = '*' * type_name.count('*')

        symbol = self.get(base_type)
        
        if symbol and symbol.get('type') == 'typedef':
            resolved_base = self.resolve_type(symbol.get('original_type'))
            return resolved_base + pointers
            
        return type_name