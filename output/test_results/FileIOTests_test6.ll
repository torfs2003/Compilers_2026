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
  %"buffer" = alloca [5 x i8]
  %"fp" = alloca i8*
  %".2" = bitcast [16 x i8]* @"str" to i8*
  %".3" = bitcast [2 x i8]* @"str.1" to i8*
  %".4" = call i8* @"fopen"(i8* %".2", i8* %".3")
  store i8* %".4", i8** %"fp"
  ;  Source: buffer
  ;  Source: fp
  %"fp_load" = load i8*, i8** %"fp"
  ;  Source: fgets(buffer,5,fp);
  %".9" = getelementptr inbounds [5 x i8], [5 x i8]* %"buffer", i32 0, i32 0
  %".10" = call i8* @"fgets"(i8* %".9", i32 5, i8* %"fp_load")
  %".11" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: buffer
  ;  Source: printf("%s",buffer);
  %".14" = getelementptr inbounds [5 x i8], [5 x i8]* %"buffer", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".14")
  %"length" = alloca i32
  %"gep_array" = getelementptr [5 x i8], [5 x i8]* %"buffer", i32 0, i32 0
  %"array_element" = load i8, i8* %"gep_array"
  %".16" = sext i8 %"array_element" to i32
  store i32 %".16", i32* %"length"
  %".18" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: length
  %"length_load" = load i32, i32* %"length"
  ;  Source: printf("%d",length);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"length_load")
  %"c" = alloca i8*
  %"length_load.1" = load i32, i32* %"length"
  %".22" = call i8* @"malloc"(i32 %"length_load.1")
  store i8* %".22", i8** %"c"
  ;  Source: c
  %"c_load" = load i8*, i8** %"c"
  ;  Source: length
  %"length_load.2" = load i32, i32* %"length"
  ;  Source: fp
  %"fp_load.1" = load i8*, i8** %"fp"
  ;  Source: fgets(c,length,fp);
  %".28" = call i8* @"fgets"(i8* %"c_load", i32 %"length_load.2", i8* %"fp_load.1")
  %".29" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  %"c_load.1" = load i8*, i8** %"c"
  ;  Source: printf("%s",c);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".29", i8* %"c_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"files/test1.txt\00"
@"str.1" = internal constant [2 x i8] c"r\00"
@"str.2" = internal constant [3 x i8] c"%s\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%s\00"