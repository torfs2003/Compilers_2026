; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=10;
  store i32 10, i32* %"x"
  ;  Source: intx=20;
  store i32 20, i32* %"x"
  %".6" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"x.1")
  %".10" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"x.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"