import sys
import os
import argparse
from antlr4 import *
from src.antlr_files.CmmLexer import CmmLexer
from src.antlr_files.CmmParser import CmmParser
from src.parser.AST_visitor import ASTVisitor
from src.parser.dot_visitor import DOTVisitor
from src.parser.optimizer import ConstantFoldingVisitor
from src.parser.semantic_visitor import SemanticVisitor
from src.llvm_target.llvm_visitor import LLVMVisitor

def main():
    # Argument Parser opzetten
    parser = argparse.ArgumentParser(description='Compiler Project')
    parser.add_argument('--input', type=str, required=True, help='Path to the input C file')
    parser.add_argument('--render_ast', type=str, help='Path to render the AST as a .dot file')
    parser.add_argument('--no_opt', action='store_true', help='Disable constant folding optimization')
    parser.add_argument('--target_llvm', type=str, help='Path to save the LLVM IR as a.ll file')

    args = parser.parse_args()

    # ANTLR opstarten
    input_stream = FileStream(args.input, encoding='utf-8')   
    lexer = CmmLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser_antlr = CmmParser(stream)
    
    # Parse Tree (CST) genereren
    tree = parser_antlr.compilationUnit()
    
    # Check op syntax fouten
    if parser_antlr.getNumberOfSyntaxErrors() > 0:
        print("Syntax errors found, stopping.")
        sys.exit(1)

    visitor = ASTVisitor(stream)
    ast_root = visitor.visit(tree) 
    
    if len(visitor.warnings) > 0:
        for warning in visitor.warnings:
            print(warning)
            
    if not ast_root:
        print("Geen geldige AST gegenereerd.")
        return
    
    semantic_checker = SemanticVisitor()
    semantic_checker.visit(ast_root)

    if len(semantic_checker.warnings) > 0:
        for warning in semantic_checker.warnings:
            print(warning)

    if len(semantic_checker.errors) > 0:
        print("Semantic errors found, stopping.")
        for error in semantic_checker.errors:
            print(error)
        sys.exit(1)

    # Optimalisatie toepassen
    if not args.no_opt:
        optimizer = ConstantFoldingVisitor()
        optimizer.visit(ast_root)
        ast_root = optimizer.results.get(id(ast_root), ast_root)

    # Visualisatie
    if args.render_ast:
        dot_visitor = DOTVisitor()
        
        final_dot_string = dot_visitor.generate(ast_root)
        
        output_dir = os.path.dirname(args.render_ast)

        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
        
        with open(args.render_ast, 'w') as f:
            f.write(final_dot_string)
        print(f"AST rendered to {args.render_ast}")
    
    if args.target_llvm:
        llvm_visitor = LLVMVisitor()
        llvm_ir = llvm_visitor.generate(ast_root) 
        
        output_dir = os.path.dirname(args.target_llvm)
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
        
        with open(args.target_llvm, 'w') as f:
            f.write(llvm_ir)
        print(f"LLVM IR generated at {args.target_llvm}")

if __name__ == '__main__':
    main()