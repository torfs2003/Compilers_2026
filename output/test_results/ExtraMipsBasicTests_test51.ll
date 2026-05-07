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
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=1;
  store i32 1, i32* %"b"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: a==b
  %".10" = icmp eq i32 %"a.1", %"b.1"
  %".11" = zext i1 %".10" to i32
  ;  Source: printf("%d",a==b);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".11")
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: a!=b
  %".18" = icmp ne i32 %"a.2", %"b.2"
  %".19" = zext i1 %".18" to i32
  ;  Source: printf("%d",a!=b);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".19")
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  %".25" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: a==b
  %".29" = icmp eq i32 %"a.3", %"b.4"
  %".30" = zext i1 %".29" to i32
  ;  Source: printf("%d",a==b);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".30")
  %".33" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: a!=b
  %".37" = icmp ne i32 %"a.4", %"b.5"
  %".38" = zext i1 %".37" to i32
  ;  Source: printf("%d",a!=b);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".38")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"