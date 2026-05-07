; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"printthings"(i8* %".1")
{
entry:
  %"z" = alloca i8*
  store i8* %".1", i8** %"z"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load i8*, i8** %"z"
  ;  Source: printf("%s",z);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %"z.1")
  ;  Source: return5;
  ret i32 5
}

define i32 @"main"()
{
entry:
  %"y" = alloca [6 x i8]
  %".2" = bitcast [6 x i8]* @"str.1" to i8*
  %"str_src_0" = getelementptr i8, i8* %".2", i32 0
  %"str_dst_0" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 0
  %"ch_0" = load i8, i8* %"str_src_0"
  store i8 %"ch_0", i8* %"str_dst_0"
  %"str_src_1" = getelementptr i8, i8* %".2", i32 1
  %"str_dst_1" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 1
  %"ch_1" = load i8, i8* %"str_src_1"
  store i8 %"ch_1", i8* %"str_dst_1"
  %"str_src_2" = getelementptr i8, i8* %".2", i32 2
  %"str_dst_2" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 2
  %"ch_2" = load i8, i8* %"str_src_2"
  store i8 %"ch_2", i8* %"str_dst_2"
  %"str_src_3" = getelementptr i8, i8* %".2", i32 3
  %"str_dst_3" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 3
  %"ch_3" = load i8, i8* %"str_src_3"
  store i8 %"ch_3", i8* %"str_dst_3"
  %"str_src_4" = getelementptr i8, i8* %".2", i32 4
  %"str_dst_4" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 4
  %"ch_4" = load i8, i8* %"str_src_4"
  store i8 %"ch_4", i8* %"str_dst_4"
  %"str_src_5" = getelementptr i8, i8* %".2", i32 5
  %"str_dst_5" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 5
  %"ch_5" = load i8, i8* %"str_src_5"
  store i8 %"ch_5", i8* %"str_dst_5"
  ;  Source: y
  ;  Source: printthings(y);
  %".11" = bitcast [6 x i8]* %"y" to i8*
  %".12" = call i32 @"printthings"(i8* %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%s\00"
@"str.1" = internal constant [6 x i8] c"jajaj\00"