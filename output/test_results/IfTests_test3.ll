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
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"a.1")
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"c.1")
  %"q" = alloca i32
  ;  Source: intq=0;
  store i32 0, i32* %"q"
  %".16" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: q
  %"q.1" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"q.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"