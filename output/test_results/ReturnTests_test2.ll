; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i8 @"d"()
{
entry:
  ;  Source: return98;
  %".3" = trunc i32 98 to i8
  ret i8 %".3"
}

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: chara='q';
  store i8 113, i8* %"a"
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: d()
  %".6" = call i8 @"d"()
  ;  Source: a=d();
  store i8 %".6", i8* %"a"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: printf("%c",a);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 %"a.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"