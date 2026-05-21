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

define i32 @"foo"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ;  Source: if(a<5){foo(++a);intfoo=0;}
  %"a.1" = load i32, i32* %"a"
  %".5" = icmp slt i32 %"a.1", 5
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"a.2" = load i32, i32* %"a"
  %".8" = load i32, i32* %"a"
  %".9" = add i32 %".8", 1
  store i32 %".9", i32* %"a"
  %".11" = call i32 @"foo"(i32 %".9")
  %"foo" = alloca i32
  store i32 0, i32* %"foo"
  br label %"if.end"
if.end:
  ;  Source: return5;
  ret i32 5
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: foo(1)
  %".4" = call i32 @"foo"(i32 1)
  ;  Source: printf("%d",foo(1));
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"