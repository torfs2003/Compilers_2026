; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"True" = internal global i32 5
define i32 @"main"()
{
entry:
  ;  Source: True
  %"True" = load i32, i32* @"True"
  ;  Source: intTrue=True;
  store i32 %"True", i32* @"True"
  ;  Source: return0;
  ret i32 0
}
