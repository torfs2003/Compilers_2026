; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i8*
  %".2" = call i8* @"malloc"(i32 8)
  store i8* %".2", i8** %"a"
  ;  Source: a
  %"a.1" = load i8*, i8** %"a"
  %"deref_load" = load i8, i8* %"a.1"
  ;  Source: *a='5';
  store i8 53, i8* %"a.1"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i8*, i8** %"a"
  ;  Source: *a
  %"deref_load.1" = load i8, i8* %"a.2"
  ;  Source: printf("%c",*a);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i8 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"