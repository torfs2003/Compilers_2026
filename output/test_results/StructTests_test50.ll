; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.v" = type {i32, float, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca %"struct.v"
  ;  Source: structva;
  %"c" = alloca %"struct.v"*
  ;  Source: a
  ;  Source: &a
  ;  Source: unionv*c=&a;
  store %"struct.v"* %"a", %"struct.v"** %"c"
  ;  Source: return0;
  ret i32 0
}
