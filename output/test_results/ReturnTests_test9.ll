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

define i32 @"d"(i32 %".1")
{
entry:
  %"w" = alloca i32
  store i32 %".1", i32* %"w"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: w
  %"w.1" = load i32, i32* %"w"
  ;  Source: printf("%d",w);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"w.1")
  ;  Source: returnw;
  %"w.2" = load i32, i32* %"w"
  ret i32 %"w.2"
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
  %"b" = alloca i32
  ;  Source: intb=6;
  store i32 6, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=4;
  store i32 4, i32* %"b"
  %"a" = alloca i32
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: d(b)
  %".9" = call i32 @"d"(i32 %"b.2")
  ;  Source: inta=d(b);
  store i32 %".9", i32* %"a"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"a.1")
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: e()
  %".18" = call float @"e"()
  ;  Source: a=e();
  %".20" = fptosi float %".18" to i32
  store i32 %".20", i32* %"a"
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"a.3")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"