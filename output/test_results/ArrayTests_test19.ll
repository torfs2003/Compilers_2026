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
  store [2 x i8] zeroinitializer, [2 x i8]* %"x"
  %".3" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  store i8 97, i8* %".3"
  %".5" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 1
  store i8 98, i8* %".5"
  %"z" = alloca i8*
  %".7" = bitcast [2 x i8]* %"x" to i8*
  store i8* %".7", i8** %"z"
  %"c" = alloca i8**
  store i8** %"z", i8*** %"c"
  ;  Source: c
  %"c_load" = load i8**, i8*** %"c"
  %"deref_load" = load i8*, i8** %"c_load"
  %"deref_load.1" = load i8, i8* %"deref_load"
  ;  Source: **c='c';
  store i8 99, i8* %"deref_load"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c_load.1" = load i8**, i8*** %"c"
  %"deref_load.2" = load i8*, i8** %"c_load.1"
  ;  Source: **c
  %"deref_load.3" = load i8, i8* %"deref_load.2"
  ;  Source: printf("%c",**c);
  %".17" = sext i8 %"deref_load.3" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  %".19" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  %"array_element" = load i8, i8* %"gep_array"
  ;  Source: printf("%c",x[0]);
  %".23" = sext i8 %"array_element" to i32
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".23")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"