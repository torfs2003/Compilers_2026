; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"g"(i32 %".1")
{
entry:
  %"c" = alloca i32
  store i32 %".1", i32* %"c"
  %"d" = alloca i32
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c+5
  %".6" = add i32 %"c.1", 5
  ;  Source: intd=c+5;
  store i32 %".6", i32* %"d"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: d++;
  %".11" = load i32, i32* %"d"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"d"
  ;  Source: returnc;
  %"c.2" = load i32, i32* %"c"
  ret i32 %"c.2"
}

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"v" = alloca i32
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: g(a)
  %".6" = call i32 @"g"(i32 %"a.1")
  ;  Source: intv=g(a);
  store i32 %".6", i32* %"v"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: v
  %"v.1" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"v.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"