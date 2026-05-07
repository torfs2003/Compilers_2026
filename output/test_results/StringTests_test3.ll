; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"s" = alloca i8*
  %".2" = bitcast [10 x i8]* @"str" to i8*
  store i8* %".2", i8** %"s"
  %".4" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: s
  %"s.1" = load i8*, i8** %"s"
  ;  Source: printf("%s",s);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %"s.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"string he\00"
@"str.1" = internal constant [3 x i8] c"%s\00"