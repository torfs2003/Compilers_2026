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
  %"str_src_0" = getelementptr i8, i8* %".2", i32 0
  %"str_dst_0" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 0
  %"ch_0" = load i8, i8* %"str_src_0"
  store i8 %"ch_0", i8* %"str_dst_0"
  %"str_src_1" = getelementptr i8, i8* %".2", i32 1
  %"str_dst_1" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 1
  %"ch_1" = load i8, i8* %"str_src_1"
  store i8 %"ch_1", i8* %"str_dst_1"
  %"str_src_2" = getelementptr i8, i8* %".2", i32 2
  %"str_dst_2" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 2
  %"ch_2" = load i8, i8* %"str_src_2"
  store i8 %"ch_2", i8* %"str_dst_2"
  %"str_src_3" = getelementptr i8, i8* %".2", i32 3
  %"str_dst_3" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 3
  %"ch_3" = load i8, i8* %"str_src_3"
  store i8 %"ch_3", i8* %"str_dst_3"
  %"str_src_4" = getelementptr i8, i8* %".2", i32 4
  %"str_dst_4" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 4
  %"ch_4" = load i8, i8* %"str_src_4"
  store i8 %"ch_4", i8* %"str_dst_4"
  %"str_src_5" = getelementptr i8, i8* %".2", i32 5
  %"str_dst_5" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 5
  %"ch_5" = load i8, i8* %"str_src_5"
  store i8 %"ch_5", i8* %"str_dst_5"
  %"str_src_6" = getelementptr i8, i8* %".2", i32 6
  %"str_dst_6" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 6
  %"ch_6" = load i8, i8* %"str_src_6"
  store i8 %"ch_6", i8* %"str_dst_6"
  %"str_src_7" = getelementptr i8, i8* %".2", i32 7
  %"str_dst_7" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 7
  %"ch_7" = load i8, i8* %"str_src_7"
  store i8 %"ch_7", i8* %"str_dst_7"
  %"str_src_8" = getelementptr i8, i8* %".2", i32 8
  %"str_dst_8" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 8
  %"ch_8" = load i8, i8* %"str_src_8"
  store i8 %"ch_8", i8* %"str_dst_8"
  %"str_src_9" = getelementptr i8, i8* %".2", i32 9
  %"str_dst_9" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 9
  %"ch_9" = load i8, i8* %"str_src_9"
  store i8 %"ch_9", i8* %"str_dst_9"
  ;  Source: s
  ;  Source: s[0]
  %"gep_array" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 0
  %"array_element" = load i8, i8* %"gep_array"
  ;  Source: s[0]='a';
  store i8 97, i8* %"gep_array"
  ;  Source: s
  ;  Source: s[1]
  %"gep_array.1" = getelementptr [10 x i8], [10 x i8]* %"s", i32 0, i32 1
  %"array_element.1" = load i8, i8* %"gep_array.1"
  ;  Source: s[1]=101;
  %".20" = trunc i32 101 to i8
  store i8 %".20", i8* %"gep_array.1"
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %"v" = alloca i8*
  store i8* %"a", i8** %"v"
  ;  Source: v
  %"v.1" = load i8*, i8** %"v"
  %"deref_load" = load i8, i8* %"v.1"
  ;  Source: *v='y';
  store i8 121, i8* %"v.1"
  %".27" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: v
  %"v.2" = load i8*, i8** %"v"
  ;  Source: *v
  %"deref_load.1" = load i8, i8* %"v.2"
  ;  Source: printf("%c",*v);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i8 %"deref_load.1")
  %".32" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: s
  ;  Source: printf("%s",s);
  %".35" = getelementptr inbounds [10 x i8], [10 x i8]* %"s", i32 0, i32 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i8* %".35")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"string he\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%s\00"