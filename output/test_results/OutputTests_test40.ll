; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 3, i32* %"x"
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: (*ptr)
  %"deref_load" = load i32, i32* %"ptr.1"
  ;  Source: --(*ptr);
  %".7" = load i32, i32* %"ptr.1"
  %".8" = sub i32 %".7", 1
  store i32 %".8", i32* %"ptr.1"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"x.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"