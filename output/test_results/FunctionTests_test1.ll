; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i32 @"func"(i32 %".1", i32 %".2")

define i32 @"main"()
{
entry:
  %"y" = alloca i32
  store i32 5, i32* %"y"
  %"u" = alloca i32
  store i32 10, i32* %"u"
  %"c" = alloca i32
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: u
  %"u_load" = load i32, i32* %"u"
  ;  Source: func(y,u)
  %".8" = call i32 @"func"(i32 %"y_load", i32 %"u_load")
  ;  Source: c=func(y,u);
  store i32 %".8", i32* %"c"
  %".11" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: c
  %"c_load.1" = load i32, i32* %"c"
  ;  Source: printf("%d\n",c);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"c_load.1")
  ;  Source: returny;
  %"y_load.1" = load i32, i32* %"y"
  ret i32 %"y_load.1"
}

@"str" = internal constant [4 x i8] c"%d\0a\00"