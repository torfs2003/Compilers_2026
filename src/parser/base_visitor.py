class BaseVisitor:    
    def visit(self, node):
        method_name = 'visit_' + type(node).__name__
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):
        raise Exception(f'Geen {type(node).__name__} methode gedefinieerd in {self.__class__.__name__}!')