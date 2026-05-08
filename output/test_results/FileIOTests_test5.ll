; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"c" = alloca i8*
  %".2" = call i8* @"malloc"(i32 50)
  store i8* %".2", i8** %"c"
  %"fp" = alloca i8*
  %".4" = bitcast [16 x i8]* @"str" to i8*
  %".5" = bitcast [2 x i8]* @"str.1" to i8*
  %".6" = call i8* @"fopen"(i8* %".4", i8* %".5")
  store i8* %".6", i8** %"fp"
  ;  Source: c
  %"c_load" = load i8*, i8** %"c"
  ;  Source: fp
  %"fp_load" = load i8*, i8** %"fp"
  ;  Source: fgets(c,50,fp);
  %".11" = call i8* @"fgets"(i8* %"c_load", i32 50, i8* %"fp_load")
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c_load.1" = load i8*, i8** %"c"
  ;  Source: printf("%s",c);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i8* %"c_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"files/test1.txt\00"
@"str.1" = internal constant [2 x i8] c"r\00"
@"str.2" = internal constant [3 x i8] c"%s\00"