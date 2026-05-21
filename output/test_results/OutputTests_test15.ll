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
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"f" = alloca float
  store float 0x3fe18ef340000000, float* %"f"
  %"y" = alloca i32
  store i32 -875, i32* %"y"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%x",y);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 -875)
  %"z" = alloca float
  store float 0x3fc52535a0000000, float* %"z"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%f",z);
  %".11" = fpext float 0x3fc52535a0000000 to double
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", double %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%f\00"