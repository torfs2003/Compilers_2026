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
  %"buffer" = alloca [50 x i8]
  %"fp" = alloca i8*
  %".2" = bitcast [16 x i8]* @"str" to i8*
  %".3" = bitcast [2 x i8]* @"str.1" to i8*
  %".4" = call i8* @"fopen"(i8* %".2", i8* %".3")
  store i8* %".4", i8** %"fp"
  ;  Source: buffer
  ;  Source: fp
  %"fp.1" = load i8*, i8** %"fp"
  ;  Source: fgets(buffer,50,fp);
  %".9" = getelementptr inbounds [50 x i8], [50 x i8]* %"buffer", i32 0, i32 0
  %".10" = call i8* @"fgets"(i8* %".9", i32 50, i8* %"fp.1")
  %".11" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: buffer
  ;  Source: printf("%s",buffer);
  %".14" = getelementptr inbounds [50 x i8], [50 x i8]* %"buffer", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".14")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"files/test1.txt\00"
@"str.1" = internal constant [2 x i8] c"r\00"
@"str.2" = internal constant [3 x i8] c"%s\00"