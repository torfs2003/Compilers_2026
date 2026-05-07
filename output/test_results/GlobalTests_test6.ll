; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"True" = internal global i32 1
define i32 @"main"()
{
entry:
  ;  Source: intTrue=-20;
  store i32 -20, i32* @"True"
  %"success" = alloca i32
  ;  Source: True
  %"True" = load i32, i32* @"True"
  ;  Source: intsuccess=True;
  store i32 %"True", i32* %"success"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: success
  %"success.1" = load i32, i32* %"success"
  ;  Source: printf("%d",success);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"success.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"