; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"a"()
{
entry:
  ;  Source: return97;
  ret i32 97
}

define i32 @"main"()
{
entry:
  %"f" = alloca i8
  ;  Source: a()
  %".3" = call i32 @"a"()
  ;  Source: (char)a()
  %".5" = trunc i32 %".3" to i8
  ;  Source: charf=(char)a();
  store i8 %".5", i8* %"f"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.1" = load i8, i8* %"f"
  ;  Source: printf("%c",f);
  %".11" = zext i8 %"f.1" to i32
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"