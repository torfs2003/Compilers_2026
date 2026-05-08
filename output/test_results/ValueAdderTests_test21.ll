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
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 2, i32* %"b"
  %"c" = alloca i32
  store i32 3, i32* %"c"
  %"d" = alloca i32
  store i32 4, i32* %"d"
  %"e" = alloca i32
  store i32 5, i32* %"e"
  %"f" = alloca i32
  store i32 6, i32* %"f"
  %".8" = bitcast [13 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: d
  %"d_load" = load i32, i32* %"d"
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: printf("%d%d%d%d%d%d",a,b,c,d,e,f);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"a_load", i32 %"b_load", i32 %"c_load", i32 %"d_load", i32 %"e_load", i32 %"f_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [13 x i8] c"%d%d%d%d%d%d\00"