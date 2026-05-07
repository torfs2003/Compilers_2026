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
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=5;
  store i32 5, i32* %"b"
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
  ;  Source: (a||b)
  %".20" = icmp ne i32 %"a.2", 0
  %".21" = icmp ne i32 %"b.2", 0
  %".22" = or i1 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (a||b)&&c
  %".26" = icmp ne i32 %".23", 0
  %".27" = icmp ne i32 %"c.2", 0
  %".28" = and i1 %".26", %".27"
  %".29" = zext i1 %".28" to i32
  ;  Source: intd=(a||b)&&c;
  store i32 %".29", i32* %"d"
  %".32" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  User Comment: /*Explain using CFG*/
  ;  Source: printf("%d",d);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"d.1")
  %"e" = alloca i32
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: !a
  %".39" = icmp eq i32 %"a.3", 0
  %".40" = zext i1 %".39" to i32
  ;  Source: inte=!a;
  store i32 %".40", i32* %"e"
  %".43" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %"e.1")
  %"f" = alloca i32
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: a&b
  %".50" = and i32 %"a.4", %"b.3"
  ;  Source: intf=a&b;
  store i32 %".50", i32* %"f"
  %".53" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %"f.1")
  %"g" = alloca i32
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: a|b
  %".60" = or i32 %"a.5", %"b.4"
  ;  Source: intg=a|b;
  store i32 %".60", i32* %"g"
  %".63" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"g.1")
  %"h" = alloca i32
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: a^b
  %".70" = xor i32 %"a.6", %"b.5"
  ;  Source: inth=a^b;
  store i32 %".70", i32* %"h"
  %".73" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %"h.1")
  %"i" = alloca i32
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: ~a
  %".79" = xor i32 %"a.7", -1
  ;  Source: inti=~a;
  store i32 %".79", i32* %"i"
  %".82" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %"i.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"