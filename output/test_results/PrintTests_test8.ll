; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"b" = alloca float
  store float 0x4014ccccc0000000, float* %"b"
  %"c" = alloca i8
  store i8 97, i8* %"c"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i8 %"c.1")
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"a.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%d\00"