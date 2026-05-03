; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"a" = internal global i32 3
@"True" = internal global i32 1
define i32 @"main"()
{
entry:
  ;  Source: True
  %"True" = load i32, i32* @"True"
  ;  Source: True-20
  %".4" = sub i32 %"True", 20
  ;  Source: intTrue=True-20;
  store i32 %".4", i32* @"True"
  ;  User Comment: // True is here not undeclared; it can come from a higher scope!
  ;  Source: return0;
  ret i32 0
}
