; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = bitcast [28 x i8]* @"str.1" to i8*
  ;  Source: printf("%s","This is a beautifull string");
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %".3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%s\00"
@"str.1" = internal constant [28 x i8] c"This is a beautifull string\00"