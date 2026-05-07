; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"k" = alloca i8
  ;  Source: chark='0';
  store i8 48, i8* %"k"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i8, i8* %"k"
  ;  Source: printf("%c",k);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %"k.1")
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.2" = load i8, i8* %"k"
  ;  Source: &k
  ;  Source: scanf("%c",&k);
  %".12" = call i32 (i8*, ...) @"scanf"(i8* %".8", i8* %"k")
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.3" = load i8, i8* %"k"
  ;  Source: printf("%c",k);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i8 %"k.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"