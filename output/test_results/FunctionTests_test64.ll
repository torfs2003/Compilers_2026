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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"foo"(i32 %".1")
{
entry:
  %"foo" = alloca i32
  store i32 %".1", i32* %"foo"
  %"x" = alloca i32
  ;  Source: foo
  ;  Source: intx=foo;
  %".6" = ptrtoint i32 (i32)* @"foo" to i32
  store i32 %".6", i32* %"x"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.1")
  ;  Source: returnfoo;
  %".13" = ptrtoint i32 (i32)* @"foo" to i32
  ret i32 %".13"
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  %"temp" = alloca i32
  ;  Source: foo(2)
  %".3" = call i32 @"foo"(i32 2)
  ;  Source: inttemp=foo(2);
  store i32 %".3", i32* %"temp"
  %".6" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: temp
  %"temp.1" = load i32, i32* %"temp"
  ;  Source: printf("%d",temp);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"temp.1")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [3 x i8] c"%d\00"