; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"line_of_code" = alloca i32
  store i32 5, i32* %"line_of_code"
  %"f" = alloca float
  %".3" = sitofp i32 45 to float
  store float %".3", float* %"f"
  %"c" = alloca i8
  store i8 98, i8* %"c"
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x.1")
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: line_of_code
  %"line_of_code.1" = load i32, i32* %"line_of_code"
  ;  Source: printf("%d",line_of_code);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"line_of_code.1")
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i8 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"