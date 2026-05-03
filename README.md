# Compilers_2026

|   | Functionaliteit      | Status |
|---|---------------------------|---|
| 1 | Binary operations +, -, *, and / | v |
|   | Binary operations >, <, and == | v |
|   | Unary operators + and - | v |
|   | Parenthesis to overwrite the order of operations | v |
|   | Logical operators &&, \|\| , and ! | v |
|   | Comparison operators >=, <=, and != | v |
|   | Binary operator % | v |
|   | Shift operators <<, >> | v |
|   | Bitwise operators &, \| , ~, and ^ | v |
|   | Abstract Syntax Tree | v |
|   | Constant Folding | v |
|   | Visualization | v |
| 2 | int main() \{ ... \} | v |
|   | const, char, int, and float | v |
|   | literals of any type | v |
|   | Variables | v |
|   | Pointers | v |
|   | Constants | v |
|   | Implicit conversions | v |
|   | Explicit conversions | v |
|   | Pointer arithmetic | v |
|   | Increment/Decrement Operations | v |
|   | Const casting | v |
|   | Abstract Syntax Tree | v |
|   | Visualization | v |
|   | Constant Propagation | v |
|   | Syntax Errors | v |
|   | Semantic Errors | v |
| 3 | multi line comments      | v |
|   | retaining comments         | v |
|   | readabilty generated code                   | v |
|   | Arrays                    | v |
|   | Array variables             | v |
|   | multi-dimensional arrays      | v |
|   | array initialisation              | v |
|   | dynamic arrays/ calloc  | x |
|   | strings as zero-terminated character arrays              | v |
|   | including stdio.h                 | v |
|   | Format string               | v |
|   | AST              | v |
|   | Visualization             | v |
|   | Semantic Analysis  | v |
|   | type checking array type  | v |
|   | array index type int           | v |
|   | array initialisers                    | v |
|   | Code Generation: LLVM IR             | v |
| 4 | Conditional statements      | v |
|   | else if statements              | v |
|   | Loops  | v |
|   | Anonymous scopes              | v |
|   | switch statements                 | v |
|   | enumerations               | v |
|   | AST              | v |
|   | Visualization             | v |
|   | Semantic Analysis  | v |
|   | Code Generation: LLVM  | v |
| 5 | Function scopes           | v |
|   | Local and global variables                 | v |
|   | Functions               | v |
|   | overloading of functions             | x |
|   | small pre-processor that supports #define             | v |
|   | includes  | v |
|   |  include guards  | v |
|   | AST           | v |
|   | Visualization                   | v |
|   |  function scopes             | v |
|   | consistency of the return statement       | v |
|   | consistency between forward declarations and function definitions              | v |
|   | correct parameter types  | v |
|   |functions can only be called if they are declared/defined              | v |
|   | re-definitions of functions                | v |
|   | end with a return statement              | v |
|   | not generate code for statements that appear after a return in a function             | v |
|   | support the break or continue keywords             | v |
|   | not generate code for variables that are not used  | v |
|   |not generate code for conditionals that are never true | v |
|   | Code Generation: LLVM           | v |
| 6 | typedefs  | v |
|   | User-defined structs             | v |
|   |  uninitialised structs                 | v |
|   | Nested structs               | x |
|   | Arrays that contain structs              | x |
|   | Dynamic allocation of structs            | x |
|   | Unions  | x |
|   | Function pointers  | x |
|   | File reading using fgets          | x |
|   | File writing using fputs                 | x |
|   | Dynamically allocated strings and character buffers              | x |
|   | AST             | v |
|   | Visualization             | v |
|   | Semantic Analysis  | v |
|   |  Type checking for function pointers  | v |
|   |  Type checking for accessing and assigning struct members           | v |
|   | Type checking for accessing and assigning union members                   | v |
|   |  Code Generation: LLVM             | v |