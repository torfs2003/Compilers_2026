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
  %"fp" = alloca i8*
  %".2" = bitcast [16 x i8]* @"str" to i8*
  %".3" = bitcast [2 x i8]* @"str.1" to i8*
  %".4" = call i8* @"fopen"(i8* %".2", i8* %".3")
  store i8* %".4", i8** %"fp"
  %".6" = bitcast [13 x i8]* @"str.2" to i8*
  ;  Source: fp
  %"fp_load" = load i8*, i8** %"fp"
  ;  Source: fputs("file content",fp);
  %".9" = call i32 @"fputs"(i8* %".6", i8* %"fp_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"files/test2.txt\00"
@"str.1" = internal constant [2 x i8] c"w\00"
@"str.2" = internal constant [13 x i8] c"file content\00"