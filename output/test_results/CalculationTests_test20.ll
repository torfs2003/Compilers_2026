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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: chara=0;
  %".3" = trunc i32 0 to i8
  store i8 %".3", i8* %"a"
  %"b" = alloca i8
  ;  Source: charb=1;
  %".6" = trunc i32 1 to i8
  store i8 %".6", i8* %"b"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: b
  %"b.1" = load i8, i8* %"b"
  ;  Source: a&&b
  %".12" = icmp ne i8 %"a.1", 0
  %".13" = icmp ne i8 %"b.1", 0
  %".14" = and i1 %".12", %".13"
  %".15" = zext i1 %".14" to i32
  ;  Source: printf("%d",a&&b);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".15")
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: b
  %"b.2" = load i8, i8* %"b"
  ;  Source: a||b
  %".22" = icmp ne i8 %"a.2", 0
  %".23" = icmp ne i8 %"b.2", 0
  %".24" = or i1 %".22", %".23"
  %".25" = zext i1 %".24" to i32
  ;  Source: printf("%d",a||b);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".25")
  %".28" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: b
  %"b.3" = load i8, i8* %"b"
  ;  Source: (a||b)
  %".32" = icmp ne i8 %"a.3", 0
  %".33" = icmp ne i8 %"b.3", 0
  %".34" = or i1 %".32", %".33"
  %".35" = zext i1 %".34" to i32
  ;  Source: !(a||b)
  %".37" = icmp eq i32 %".35", 0
  %".38" = zext i1 %".37" to i32
  ;  Source: printf("%d",!(a||b));
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".38")
  %"c" = alloca i8
  ;  Source: charc=0;
  %".42" = trunc i32 0 to i8
  store i8 %".42", i8* %"c"
  %"d" = alloca i8
  ;  Source: chard=0;
  %".45" = trunc i32 0 to i8
  store i8 %".45", i8* %"d"
  %".47" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: d
  %"d.1" = load i8, i8* %"d"
  ;  Source: c&&d
  %".51" = icmp ne i8 %"c.1", 0
  %".52" = icmp ne i8 %"d.1", 0
  %".53" = and i1 %".51", %".52"
  %".54" = zext i1 %".53" to i32
  ;  Source: printf("%d",c&&d);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".54")
  %".57" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: d
  %"d.2" = load i8, i8* %"d"
  ;  Source: c||d
  %".61" = icmp ne i8 %"c.2", 0
  %".62" = icmp ne i8 %"d.2", 0
  %".63" = or i1 %".61", %".62"
  %".64" = zext i1 %".63" to i32
  ;  Source: printf("%d",c||d);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %".64")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"