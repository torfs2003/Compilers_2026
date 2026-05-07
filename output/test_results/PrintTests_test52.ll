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
  store i32 3, i32* %"a"
  %"b" = alloca i8*
  %".3" = bitcast [6 x i8]* @"str" to i8*
  store i8* %".3", i8** %"b"
  %"c" = alloca i32
  store i32 255, i32* %"c"
  %"d" = alloca float
  store float 0x40091eb860000000, float* %"d"
  %"e" = alloca i8
  store i8 99, i8* %"e"
  %".8" = bitcast [24 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i8*, i8** %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf(" %d \n %s \n %x \n %f \n %c",a,b,c,d,e);
  %".15" = fpext float %"d.1" to double
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"a.1", i8* %"b.1", i32 %"c.1", double %".15", i8 %"e.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"hello\00"
@"str.1" = internal constant [24 x i8] c" %d \0a %s \0a %x \0a %f \0a %c\00"