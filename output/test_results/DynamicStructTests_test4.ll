; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.cheese" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.cheese"
  ;  Source: structcheesegouda;
  %"a" = alloca i32
  ;  Source: sizeof(gouda)
  %".4" = getelementptr i32, i32* null, i32 1
  %".5" = ptrtoint i32* %".4" to i32
  ;  Source: inta=sizeof(gouda);
  store i32 %".5", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
