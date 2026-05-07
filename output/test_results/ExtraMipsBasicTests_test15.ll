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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"a"()
{
entry:
  ;  Source: return0;
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"b.1")
  %"c" = alloca i32
  ;  Source: intc=5;
  store i32 5, i32* %"c"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: 4+b
  %".13" = add i32 4, %"b.2"
  ;  Source: c=4+b;
  store i32 %".13", i32* %"c"
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"c.2")
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: 4+b
  %".23" = add i32 4, %"b.3"
  ;  Source: c=4+b;
  store i32 %".23", i32* %"c"
  %".26" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"c.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"