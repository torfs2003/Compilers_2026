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

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  %".2" = bitcast [4 x i8]* @"str" to i8*
  %".3" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: printf("%s\n","lol")
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %".3")
  ;  Source: inta=printf("%s\n","lol");
  store i32 %".5", i32* %"a"
  %".8" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"a.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%s\0a\00"
@"str.1" = internal constant [4 x i8] c"lol\00"
@"str.2" = internal constant [3 x i8] c"%d\00"