; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",(int)5.2);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 5)
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",5);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 5)
  %".8" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%c",'a');
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".8", i8 97)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"