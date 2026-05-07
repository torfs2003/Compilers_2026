; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i8
  ;  Source: charx='x';
  store i8 120, i8* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: printf("%c",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %"x.1")
  %"dot" = alloca i8
  ;  Source: chardot='.';
  store i8 46, i8* %"dot"
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: dot
  %"dot.1" = load i8, i8* %"dot"
  ;  Source: printf("%c",dot);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i8 %"dot.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"