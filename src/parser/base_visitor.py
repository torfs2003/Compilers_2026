from src.parser.AST import *
class BaseVisitor:
    def get_children(self, node):
        """Generieke methode om de kinderen van een ASTNode op te halen."""
        if isinstance(node, ProgramNode): return node.children
        if isinstance(node, FunctionNode): return [node.body]
        if isinstance(node, CompoundNode): return node.items
        if isinstance(node, DeclNode):
            return [node.init_expr] if getattr(node, 'init_expr', None) else []  
        if isinstance(node, ArrayDeclNode):
            children = list(node.sizes) 
            if getattr(node, 'init_expr', None):
                children.append(node.init_expr)
            return children
        if isinstance(node, AssignNode): return [node.left, node.right]
        if isinstance(node, BinOpNode): return [node.left, node.right]
        if isinstance(node, UnaryOpNode): return [node.child]
        if isinstance(node, CastNode): return [node.expr]
        if isinstance(node, FuncCallNode): return node.args
        if isinstance(node, ArrayInitNode): return node.values
        if isinstance(node, IfNode):
            children = [node.condition, node.scope]
            if getattr(node, 'else_scope', None): 
                children.append(node.else_scope)
            return children
        
        if isinstance(node, WhileNode): 
            return [node.condition, node.scope]

            
        if isinstance(node, SwitchNode):
            children = [node.condition]
            for val, body in node.cases:
                children.append(body)
            if node.default_case:
                children.append(node.default_case)
            return children
        
        if isinstance(node, ReturnNode):
            return [node.expr] if node.expr else []
            
        if isinstance(node, StructDeclNode):
            return node.members
            
        if isinstance(node, MemberAccessNode):
            return [node.expr]
            
        if isinstance(node, (FunctionDeclNode, TypedefNode)):
            return []

        if isinstance(node, (BreakNode, ContinueNode, EnumNode)):
            return []
            
        return []
    
    def visit(self, root_node):
        stack = [(root_node, False)]

        while stack:
            node, is_post_order = stack.pop()

            if not is_post_order:
                # --- FASE 1: PRE-ORDER ---
                pre_method_name = f"pre_visit_{type(node).__name__}"
                pre_method = getattr(self, pre_method_name, None)
                if pre_method:
                    pre_method(node)

                stack.append((node, True))

                children = self.get_children(node)
                for child in reversed(children):
                    stack.append((child, False))

            else:
                # --- FASE 2: POST-ORDER ---
                post_method_name = f"visit_{type(node).__name__}"
                post_method = getattr(self, post_method_name, None)
                if post_method:
                    post_method(node)
                    
        return root_node