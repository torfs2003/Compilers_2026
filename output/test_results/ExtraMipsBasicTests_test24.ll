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
  ;  Source: return1;
  ret i32 1
}

define i32 @"e"()
{
entry:
  ;  Source: return5;
  ret i32 5
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: a()
  %".3" = call i32 @"a"()
  ;  Source: e()
  %".5" = call i32 @"e"()
  ;  Source: a()+e()
  %".7" = add i32 %".3", %".5"
  ;  Source: intb=a()+e();
  store i32 %".7", i32* %"b"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"b.1")
  %"c" = alloca i32
  ;  Source: intc=5;
  store i32 5, i32* %"c"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: 4+b
  %".19" = add i32 4, %"b.2"
  ;  Source: c=4+b;
  store i32 %".19", i32* %"c"
  %".22" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"