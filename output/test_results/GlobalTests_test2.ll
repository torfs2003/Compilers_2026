; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"True" = internal global i32 1
define i32 @"main"()
{
entry:
  %"success" = alloca i32
  %"True" = load i32, i32* @"True"
  store i32 %"True", i32* %"success"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: success
  %"success.1" = load i32, i32* %"success"
  ;  Source: printf("%d",success);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"success.1")
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: True
  %"True.1" = load i32, i32* @"True"
  ;  Source: printf("%d",True);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"True.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"