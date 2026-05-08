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
  %"x" = alloca [2 x i8]
  %".2" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  store i8 97, i8* %".2"
  %".4" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 1
  store i8 98, i8* %".4"
  %"c" = alloca i8*
  %".6" = bitcast [2 x i8]* %"x" to i8*
  store i8* %".6", i8** %"c"
  ;  Source: c
  %"c_load" = load i8*, i8** %"c"
  %"deref_load" = load i8, i8* %"c_load"
  ;  Source: *c='c';
  store i8 99, i8* %"c_load"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c_load.1" = load i8*, i8** %"c"
  ;  Source: *c
  %"deref_load.1" = load i8, i8* %"c_load.1"
  ;  Source: printf("%c",*c);
  %".15" = sext i8 %"deref_load.1" to i32
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".15")
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  %"array_element" = load i8, i8* %"gep_array"
  ;  Source: printf("%c",x[0]);
  %".21" = sext i8 %"array_element" to i32
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".21")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"