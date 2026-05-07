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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  ;  Source: charc='\n';
  store i8 10, i8* %"c"
  %"f" = alloca float
  ;  Source: floatf=33.1;
  store float 0x40408cccc0000000, float* %"f"
  %"final_line" = alloca float
  ;  Source: floatfinal_line=33.99895;
  store float 0x4040ffdda0000000, float* %"final_line"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f*10000
  %".11" = sitofp i32 10000 to float
  %".12" = fmul float %"f.2", %".11"
  ;  Source: f=f*10000;
  store float %".12", float* %"f"
  %"f_int" = alloca i32
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: (int)f
  %".17" = fptosi float %"f.3" to i32
  ;  Source: intf_int=(int)f;
  store i32 %".17", i32* %"f_int"
  ;  Source: final_line
  %"final_line.1" = load float, float* %"final_line"
  ;  Source: final_line
  %"final_line.2" = load float, float* %"final_line"
  ;  Source: final_line*100000
  %".23" = sitofp i32 100000 to float
  %".24" = fmul float %"final_line.2", %".23"
  ;  Source: final_line=final_line*100000;
  store float %".24", float* %"final_line"
  %"final_line_int" = alloca i32
  ;  Source: final_line
  %"final_line.3" = load float, float* %"final_line"
  ;  Source: (int)final_line
  %".29" = fptosi float %"final_line.3" to i32
  ;  Source: intfinal_line_int=(int)final_line;
  store i32 %".29", i32* %"final_line_int"
  %".32" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: final_line_int
  %"final_line_int.1" = load i32, i32* %"final_line_int"
  ;  Source: printf("%d",final_line_int);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"final_line_int.1")
  %".36" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f_int
  %"f_int.1" = load i32, i32* %"f_int"
  ;  Source: printf("%d",f_int);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"f_int.1")
  %".40" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".43" = zext i8 %"c.1" to i32
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"