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

@"global" = internal global i32 0
define float @"foo"(i32 %".1")
{
entry:
  %"bar" = alloca i32
  store i32 %".1", i32* %"bar"
  ;  Source: if(global){global=1;foo(1);}else{printf("%d",bar);}
  %"global" = load i32, i32* @"global"
  %"ifcond" = icmp ne i32 %"global", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"global.1" = load i32, i32* @"global"
  store i32 1, i32* @"global"
  %".7" = call float @"foo"(i32 1)
  br label %"if.end"
if.end:
  ;  Source: return0.0;
  ret float              0x0
if.else:
  %".9" = bitcast [3 x i8]* @"str" to i8*
  %"bar.1" = load i32, i32* %"bar"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"bar.1")
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  ;  Source: foo(2);
  %".3" = call float @"foo"(i32 2)
  ;  Source: return0;
  ret i32 0
}
