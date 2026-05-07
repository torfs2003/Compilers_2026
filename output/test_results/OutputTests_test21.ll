; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  store i8 115, i8* %"c"
  %"f" = alloca float
  store float 0x40408cccc0000000, float* %"f"
  %"final_line" = alloca float
  store float 0x4040ffdda0000000, float* %"final_line"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: final_line
  %"final_line.1" = load float, float* %"final_line"
  ;  Source: (int)final_line
  %".8" = fptosi float %"final_line.1" to i32
  ;  Source: printf("%d",(int)final_line);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".8")
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".14" = fptosi float %"f.1" to i32
  ;  Source: printf("%d",(int)f);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  %".17" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i8 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"