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
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%f",5.2);
  %".4" = fpext float 0x4014ccccc0000000 to double
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", double %".4")
  %".6" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%x",'a');
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".6", i8 97)
  %".9" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%c",'a');
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 97)
  %".12" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",6);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 6)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%x\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%d\00"