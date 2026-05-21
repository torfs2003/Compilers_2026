; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: printf("%x\n%x",62,63);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 62, i32 63)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%x\0a%x\00"