; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 10
define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x" = load i32, i32* @"x"
  ;  Source: printf("%d;",x);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %"x")
  %"x.1" = alloca i32
  store i32 20, i32* %"x.1"
  %".7" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x.1"
  ;  Source: printf("%d;",x);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x.2")
  ;  Source: x
  %"x.3" = load i32, i32* %"x.1"
  ;  Source: x=30;
  store i32 30, i32* %"x.1"
  %".14" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.4" = load i32, i32* %"x.1"
  ;  Source: printf("%d;",x);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"x.4")
  %"x.5" = alloca i32
  store i32 40, i32* %"x.5"
  %".19" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.6" = load i32, i32* %"x.5"
  ;  Source: printf("%d;",x);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"x.6")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d;\00"
@"str.1" = internal constant [4 x i8] c"%d;\00"
@"str.2" = internal constant [4 x i8] c"%d;\00"
@"str.3" = internal constant [4 x i8] c"%d;\00"