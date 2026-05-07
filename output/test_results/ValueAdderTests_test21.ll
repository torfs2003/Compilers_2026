; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=2;
  store i32 2, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=3;
  store i32 3, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=4;
  store i32 4, i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=5;
  store i32 5, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=6;
  store i32 6, i32* %"f"
  %".14" = bitcast [13 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: printf("%d%d%d%d%d%d",a,b,c,d,e,f);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a.1", i32 %"b.1", i32 %"c.1", i32 %"d.1", i32 %"e.1", i32 %"f.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [13 x i8] c"%d%d%d%d%d%d\00"