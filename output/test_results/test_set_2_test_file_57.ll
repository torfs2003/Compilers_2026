; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%s",5);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 5)
  ;  Source: return1;
  ret i32 1
}

@"str" = internal constant [3 x i8] c"%s\00"