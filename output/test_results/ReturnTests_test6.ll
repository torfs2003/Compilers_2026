; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"d"()
{
entry:
  ;  Source: return6;
  ret i32 6
}

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: d()
  %".3" = call i32 @"d"()
  ;  Source: inta=d();
  store i32 %".3", i32* %"a"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"a.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"