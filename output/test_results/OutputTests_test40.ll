; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=3;
  store i32 3, i32* %"x"
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: (*ptr)
  %"deref_load" = load i32, i32* %"ptr.1"
  ;  Source: --(*ptr);
  %".11" = load i32, i32* %"ptr.1"
  %".12" = sub i32 %".11", 1
  store i32 %".12", i32* %"ptr.1"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"x.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"