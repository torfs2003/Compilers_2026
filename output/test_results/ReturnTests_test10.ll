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

define i32 @"d"(i32* %".1")
{
entry:
  %"w" = alloca i32*
  store i32* %".1", i32** %"w"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: w
  %"w.1" = load i32*, i32** %"w"
  ;  Source: *w
  %"deref_load" = load i32, i32* %"w.1"
  ;  Source: printf("%d",*w);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"deref_load")
  ;  Source: w
  %"w.2" = load i32*, i32** %"w"
  %"deref_load.1" = load i32, i32* %"w.2"
  ;  Source: *w=6;
  store i32 6, i32* %"w.2"
  ;  Source: return*w;
  %"w.3" = load i32*, i32** %"w"
  %"deref_load.2" = load i32, i32* %"w.3"
  ret i32 %"deref_load.2"
}

@"str" = internal constant [3 x i8] c"%d\00"
define float @"e"()
{
entry:
  ;  Source: return5.67;
  ret float 0x4016ae1480000000
}

define i32 @"main"()
{
entry:
  %"c" = alloca i32
  ;  Source: intc=5;
  store i32 5, i32* %"c"
  %"b" = alloca i32*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: &c
  ;  Source: int*b=&c;
  store i32* %"c", i32** %"b"
  %"a" = alloca i32
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: d(b)
  %".10" = call i32 @"d"(i32* %"b.1")
  ;  Source: inta=d(b);
  store i32 %".10", i32* %"a"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.2" = load i32*, i32** %"b"
  ;  Source: *b
  %"deref_load" = load i32, i32* %"b.2"
  ;  Source: printf("%d",*b);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"deref_load")
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"a.1")
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: e()
  %".24" = call float @"e"()
  ;  Source: a=e();
  %".26" = fptosi float %".24" to i32
  store i32 %".26", i32* %"a"
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"a.3")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"