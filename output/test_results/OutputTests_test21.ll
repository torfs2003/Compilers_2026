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
  ;  User Comment: // line 1
  ;  Source: charc='\n';
  store i8 10, i8* %"c"
  %"f" = alloca float
  ;  Source: floatf=33.1;
  store float 0x40408cccc0000000, float* %"f"
  %"final_line" = alloca float
  ;  User Comment: // another line
  ;  User Comment: /////// some documentation
  ;  User Comment: /////////////////////////////////////
  ;  User Comment: // abcdef 123 //////////
  ;  Source: floatfinal_line=33.99895;
  store float 0x4040ffdda0000000, float* %"final_line"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: final_line
  %"final_line.1" = load float, float* %"final_line"
  ;  Source: printf("%f",final_line);
  %".16" = fpext float %"final_line.1" to double
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", double %".16")
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".21" = fpext float %"f.1" to double
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", double %".21")
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".26" = zext i8 %"c.1" to i32
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%c\00"