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
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %"c" = alloca [1 x i8]
  store [1 x i8] zeroinitializer, [1 x i8]* %"c"
  %".4" = getelementptr [1 x i8], [1 x i8]* %"c", i32 0, i32 0
  %".5" = ptrtoint i8* %"a" to i8
  store i8 %".5", i8* %".4"
  %"t" = alloca i8**
  %".7" = bitcast [1 x i8]* %"c" to i8**
  store i8** %".7", i8*** %"t"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: t
  %"t_load" = load i8**, i8*** %"t"
  %"deref_load" = load i8*, i8** %"t_load"
  ;  Source: **t
  %"deref_load.1" = load i8, i8* %"deref_load"
  ;  Source: printf("%c",**t);
  %".13" = sext i8 %"deref_load.1" to i32
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"