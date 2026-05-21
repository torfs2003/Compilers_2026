; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"k" = alloca i32
  store i32 0, i32* %"k"
  %".3" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: k
  %"k.2" = load i32, i32* %"k"
  ;  Source: printf("%x %d",k,k);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"k.1", i32 %"k.2")
  %".8" = bitcast [6 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.3" = load i32, i32* %"k"
  ;  Source: k
  %"k.4" = load i32, i32* %"k"
  ;  Source: printf("%x %d",k,k);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"k.3", i32 %"k.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%x %d\00"
@"str.1" = internal constant [6 x i8] c"%x %d\00"