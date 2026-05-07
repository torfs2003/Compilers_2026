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
  %"c" = alloca i8
  store i8 10, i8* %"c"
  %"f" = alloca float
  store float 0x40408cccc0000000, float* %"f"
  %"final_line" = alloca float
  store float 0x4040ffdda0000000, float* %"final_line"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: final_line
  %"final_line.1" = load float, float* %"final_line"
  ;  Source: printf("%f",final_line);
  %".8" = fpext float %"final_line.1" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".8")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".13" = fpext float %"f.1" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".13")
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i8 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%c\00"