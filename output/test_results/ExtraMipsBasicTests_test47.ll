; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: a>b
  %".8" = icmp sgt i32 %"a.1", %"b.1"
  %".9" = zext i1 %".8" to i32
  ;  Source: printf("%d",a>b);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"