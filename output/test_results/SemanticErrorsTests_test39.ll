; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"a" = internal global i32 3
@"True" = internal global i32 1
define i32 @"main"()
{
entry:
  %"True" = alloca i32
  %"True.1" = load i32, i32* %"True"
  %".2" = sub i32 %"True.1", 20
  store i32 %".2", i32* %"True"
  ;  User Comment: // True is here not undeclared; it can come from a higher scope!
  ;  Source: return0;
  ret i32 0
}
