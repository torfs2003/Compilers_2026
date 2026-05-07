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
  %".3" = getelementptr [1 x i8], [1 x i8]* %"c", i32 0, i32 0
  %".4" = ptrtoint i8* %"a" to i8
  store i8 %".4", i8* %".3"
  %"t" = alloca i8**
  %".6" = bitcast [1 x i8]* %"c" to i8**
  store i8** %".6", i8*** %"t"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: t
  %"t.1" = load i8**, i8*** %"t"
  %"deref_load" = load i8*, i8** %"t.1"
  ;  Source: **t
  %"deref_load.1" = load i8, i8* %"deref_load"
  ;  Source: printf("%c",**t);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i8 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"