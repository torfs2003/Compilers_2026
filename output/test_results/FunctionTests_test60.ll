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

declare void @"free"(i8* %".1")

define void @"modifyConst"(i32 %".1")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=5;
  store i32 5, i32* %"x"
  %".7" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x.2")
  ret void
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=10;
  store i32 10, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: modifyConst(a);
  call void @"modifyConst"(i32 %"a.1")
  ;  Source: return0;
  ret i32 0
}
