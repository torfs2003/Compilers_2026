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