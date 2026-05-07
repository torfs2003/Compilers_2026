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

define i32 @"foo"(float %".1")
{
entry:
  %"foo" = alloca float
  store float %".1", float* %"foo"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: foo
  ;  Source: (int)foo
  %".7" = ptrtoint i32 (float)* @"foo" to i32
  ;  Source: printf("%d\n",(int)foo);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ;  Source: returnfoo;
  %".11" = ptrtoint i32 (float)* @"foo" to i32
  ret i32 %".11"
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: foo(3.14)
  %".3" = call i32 @"foo"(float 0x40091eb860000000)
  ;  Source: intx=foo(3.14);
  store i32 %".3", i32* %"x"
  %".6" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"x.1")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [4 x i8] c"%d\0a\00"