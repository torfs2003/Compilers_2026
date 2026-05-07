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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  %".2" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: printf("%x\n",17)
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 17)
  ;  Source: inta=printf("%x\n",17);
  store i32 %".4", i32* %"a"
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"a.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%x\0a\00"
@"str.1" = internal constant [3 x i8] c"%d\00"