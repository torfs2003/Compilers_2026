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
  %"s" = alloca [10 x i8]
  %".2" = bitcast [10 x i8]* @"str" to i8*
  %"str_char_src" = getelementptr i8, i8* %".2", i32 0
  %"str_char_dst" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 0
  %".3" = load i8, i8* %"str_char_src"
  store i8 %".3", i8* %"str_char_dst"
  %"str_char_src.1" = getelementptr i8, i8* %".2", i32 1
  %"str_char_dst.1" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 1
  %".5" = load i8, i8* %"str_char_src.1"
  store i8 %".5", i8* %"str_char_dst.1"
  %"str_char_src.2" = getelementptr i8, i8* %".2", i32 2
  %"str_char_dst.2" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 2
  %".7" = load i8, i8* %"str_char_src.2"
  store i8 %".7", i8* %"str_char_dst.2"
  %"str_char_src.3" = getelementptr i8, i8* %".2", i32 3
  %"str_char_dst.3" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 3
  %".9" = load i8, i8* %"str_char_src.3"
  store i8 %".9", i8* %"str_char_dst.3"
  %"str_char_src.4" = getelementptr i8, i8* %".2", i32 4
  %"str_char_dst.4" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 4
  %".11" = load i8, i8* %"str_char_src.4"
  store i8 %".11", i8* %"str_char_dst.4"
  %"str_char_src.5" = getelementptr i8, i8* %".2", i32 5
  %"str_char_dst.5" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 5
  %".13" = load i8, i8* %"str_char_src.5"
  store i8 %".13", i8* %"str_char_dst.5"
  %"str_char_src.6" = getelementptr i8, i8* %".2", i32 6
  %"str_char_dst.6" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 6
  %".15" = load i8, i8* %"str_char_src.6"
  store i8 %".15", i8* %"str_char_dst.6"
  %"str_char_src.7" = getelementptr i8, i8* %".2", i32 7
  %"str_char_dst.7" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 7
  %".17" = load i8, i8* %"str_char_src.7"
  store i8 %".17", i8* %"str_char_dst.7"
  %"str_char_src.8" = getelementptr i8, i8* %".2", i32 8
  %"str_char_dst.8" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 8
  %".19" = load i8, i8* %"str_char_src.8"
  store i8 %".19", i8* %"str_char_dst.8"
  %"str_char_src.9" = getelementptr i8, i8* %".2", i32 9
  %"str_char_dst.9" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 9
  %".21" = load i8, i8* %"str_char_src.9"
  store i8 %".21", i8* %"str_char_dst.9"
  %".23" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: s
  ;  Source: printf("%s",s);
  %".26" = getelementptr inbounds [10 x i8], [10 x i8]* %"s", i32 0, i32 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i8* %".26")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"string\0ahe\00"
@"str.1" = internal constant [3 x i8] c"%s\00"