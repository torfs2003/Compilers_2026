import sys
import os
import argparse
from antlr4 import *
from src.antlr_files.CmmLexer import CmmLexer
from src.antlr_files.CmmParser import CmmParser
from src.parser.AST_visitor import ASTVisitor
from src.parser.dot_visitor import DOTVisitor
from src.parser.optimizer import ConstantFoldingVisitor

def main():
    # 1. Argument Parser opzetten
    parser = argparse.ArgumentParser(description='Compiler Project 1: Expressions')
    parser.add_argument('--input', type=str, required=True, help='Path to the input C file')
    parser.add_argument('--render_ast', type=str, help='Path to render the AST as a .dot file')
    parser.add_argument('--no_opt', action='store_true', help='Disable constant folding optimization')
    
    args = parser.parse_args()

    # 2. ANTLR opstarten
    input_stream = FileStream(args.input)
    lexer = CmmLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser_antlr = CmmParser(stream)
    
    # 3. Parse Tree (CST) genereren
    tree = parser_antlr.compilationUnit()
    
    # Check op syntax fouten
    if parser_antlr.getNumberOfSyntaxErrors() > 0:
        print("Syntax errors found, stopping.")
        sys.exit(1)

    # 4. CST omzetten naar AST
    visitor = ASTVisitor()
    ast_root_list = visitor.visit(tree) 
    
    if not ast_root_list:
        print("Geen expressies gevonden in het input bestand.")
        return

    # 5. Optimalisatie toepassen op ALLE expressies
    final_asts = []
    optimizer = ConstantFoldingVisitor()

    for ast in ast_root_list:
        # Als de gebruiker niet --no_opt heeft meegegeven, optimaliseer de boom
        if not args.no_opt:
            ast = optimizer.visit(ast)
        final_asts.append(ast)

    # 6. Visualisatie
    if args.render_ast:
        dot_visitor = DOTVisitor()
        
        dot_content = ["digraph AST {"]
        
        for ast in final_asts:
            dot_visitor.visit(ast)
            
        dot_content.extend(dot_visitor.dot_content)
        dot_content.append("}")
        
        final_dot_string = "\n".join(dot_content)
        
        output_dir = os.path.dirname(args.render_ast)
        
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
        
        with open(args.render_ast, 'w') as f:
            f.write(final_dot_string)
        print(f"AST rendered to {args.render_ast}")

if __name__ == '__main__':
    main()