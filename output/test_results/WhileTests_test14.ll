; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  store i8 10, i8* %"c"
  %"f" = alloca float
  store float 0x40408cccc0000000, float* %"f"
  %"final_line" = alloca float
  store float 0x4040ffdda0000000, float* %"final_line"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f*10000
  %".8" = sitofp i32 10000 to float
  %".9" = fmul float %"f.2", %".8"
  ;  Source: f=f*10000;
  store float %".9", float* %"f"
  %"f_int" = alloca i32
  %"f.3" = load float, float* %"f"
  %".12" = fptosi float %"f.3" to i32
  store i32 %".12", i32* %"f_int"
  ;  Source: final_line
  %"final_line.1" = load float, float* %"final_line"
  ;  Source: final_line
  %"final_line.2" = load float, float* %"final_line"
  ;  Source: final_line*100000
  %".17" = sitofp i32 100000 to float
  %".18" = fmul float %"final_line.2", %".17"
  ;  Source: final_line=final_line*100000;
  store float %".18", float* %"final_line"
  %"final_line_int" = alloca i32
  %"final_line.3" = load float, float* %"final_line"
  %".21" = fptosi float %"final_line.3" to i32
  store i32 %".21", i32* %"final_line_int"
  %".23" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: final_line_int
  %"final_line_int.1" = load i32, i32* %"final_line_int"
  ;  Source: printf("%d",final_line_int);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"final_line_int.1")
  %".27" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f_int
  %"f_int.1" = load i32, i32* %"f_int"
  ;  Source: printf("%d",f_int);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"f_int.1")
  %".31" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i8 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"