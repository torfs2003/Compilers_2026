; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"k" = alloca i32
  store i32 0, i32* %"k"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"k.1")
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.2" = load i32, i32* %"k"
  ;  Source: &k
  ;  Source: scanf("%d",&k);
  %".11" = call i32 (i8*, ...) @"scanf"(i8* %".7", i32* %"k")
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.3" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"k.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"