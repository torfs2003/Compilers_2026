; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=5;
  store i32 5, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=6;
  store i32 6, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=6;
  store i32 6, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=3;
  store i32 3, i32* %"c"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c=3;
  store i32 3, i32* %"c"
  %"d" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: (a+b)
  %".20" = add i32 %"a.2", %"b.2"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (a+b)*c
  %".23" = mul i32 %".20", %"c.2"
  ;  Source: intd=(a+b)*c;
  store i32 %".23", i32* %"d"
  %".26" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"