; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  ;  Source: while(i!=10){printf("%d",i);i++;}
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".5" = icmp ne i32 %"i_load", 10
  %".6" = zext i1 %".5" to i32
  %"whilecond" = icmp ne i32 %".6", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %"i_load.1" = load i32, i32* %"i"
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"i_load.1")
  %"i_load.2" = load i32, i32* %"i"
  %".10" = load i32, i32* %"i"
  %".11" = add i32 %".10", 1
  store i32 %".11", i32* %"i"
  br label %"while.cond"
while.end:
  %"j" = alloca i32
  ;  Source: j
  %"j_load" = load i32, i32* %"j"
  ;  Source: j=0
  store i32 0, i32* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"j_load.1" = load i32, i32* %"j"
  %".18" = icmp slt i32 %"j_load.1", 10
  %".19" = zext i1 %".18" to i32
  %"whilecond.1" = icmp ne i32 %".19", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  %"j_load.2" = load i32, i32* %"j"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"j_load.2")
  %"j_load.3" = load i32, i32* %"j"
  %".23" = load i32, i32* %"j"
  %".24" = add i32 %".23", 1
  store i32 %".24", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"