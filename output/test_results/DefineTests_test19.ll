; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"printthings1"(i8* %".1")
{
entry:
  %"z" = alloca i8*
  store i8* %".1", i8** %"z"
  ;  Source: returnprintf("%s",z);
  %".5" = bitcast [3 x i8]* @"str" to i8*
  %"z_load" = load i8*, i8** %"z"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %"z_load")
  ret i32 %".6"
}

define i32 @"printthings2"(i8* %".1")
{
entry:
  %"z" = alloca i8*
  store i8* %".1", i8** %"z"
  ;  Source: returnprintf("%s",z);
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  %"z_load" = load i8*, i8** %"z"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %"z_load")
  ret i32 %".6"
}

define i32 @"main"()
{
entry:
  %"y" = alloca [6 x i8]
  %".2" = bitcast [6 x i8]* @"str.2" to i8*
  %"str_char_src" = getelementptr i8, i8* %".2", i32 0
  %"str_char_dst" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 0
  %".3" = load i8, i8* %"str_char_src"
  store i8 %".3", i8* %"str_char_dst"
  %"str_char_src.1" = getelementptr i8, i8* %".2", i32 1
  %"str_char_dst.1" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 1
  %".5" = load i8, i8* %"str_char_src.1"
  store i8 %".5", i8* %"str_char_dst.1"
  %"str_char_src.2" = getelementptr i8, i8* %".2", i32 2
  %"str_char_dst.2" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 2
  %".7" = load i8, i8* %"str_char_src.2"
  store i8 %".7", i8* %"str_char_dst.2"
  %"str_char_src.3" = getelementptr i8, i8* %".2", i32 3
  %"str_char_dst.3" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 3
  %".9" = load i8, i8* %"str_char_src.3"
  store i8 %".9", i8* %"str_char_dst.3"
  %"str_char_src.4" = getelementptr i8, i8* %".2", i32 4
  %"str_char_dst.4" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 4
  %".11" = load i8, i8* %"str_char_src.4"
  store i8 %".11", i8* %"str_char_dst.4"
  %"str_char_src.5" = getelementptr i8, i8* %".2", i32 5
  %"str_char_dst.5" = getelementptr [6 x i8], [6 x i8]* %"y", i32 0, i32 5
  %".13" = load i8, i8* %"str_char_src.5"
  store i8 %".13", i8* %"str_char_dst.5"
  %"z" = alloca i8*
  %".15" = bitcast [6 x i8]* %"y" to i8*
  store i8* %".15", i8** %"z"
  ;  Source: z
  %"z_load" = load i8*, i8** %"z"
  ;  Source: printthings1(z);
  %".19" = call i32 @"printthings1"(i8* %"z_load")
  ;  Source: y
  ;  Source: printthings1(y);
  %".22" = bitcast [6 x i8]* %"y" to i8*
  %".23" = call i32 @"printthings1"(i8* %".22")
  ;  Source: y
  ;  Source: printthings2(y);
  %".26" = bitcast [6 x i8]* %"y" to i8*
  %".27" = call i32 @"printthings2"(i8* %".26")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%s\00"
@"str.1" = internal constant [3 x i8] c"%s\00"
@"str.2" = internal constant [6 x i8] c"jajaj\00"