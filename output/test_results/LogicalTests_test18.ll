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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=0;
  store i32 0, i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=0;
  store i32 0, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=0;
  store i32 0, i32* %"f"
  %"g" = alloca i32
  ;  Source: intg=0;
  store i32 0, i32* %"g"
  %"h" = alloca i32
  ;  Source: inth=0;
  store i32 0, i32* %"h"
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".23" = and i32 %"d.1", 1
  %".24" = and i32 %"e.1", %".23"
  ;  Source: (a||e&&(d&&5<6))
  %".26" = or i32 %"a.1", %".24"
  ;  Source: !(a||e&&(d&&5<6))
  %".28" = icmp eq i32 %".26", 0
  %".29" = zext i1 %".28" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".29", i32* %"f"
  %".32" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"f.2")
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".39" = icmp slt i32 %"a.2", %"d.2"
  %".40" = zext i1 %".39" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  %".43" = icmp sge i32 %"e.2", %"b.1"
  %".44" = zext i1 %".43" to i32
  ;  Source: (a<d&&e>=b)
  %".46" = and i32 %".40", %".44"
  ;  Source: g=(a<d&&e>=b);
  store i32 %".46", i32* %"g"
  %".49" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"g.2")
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".56" = sub i32 %"a.3", %"b.2"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".58" = icmp slt i32 %".56", %"d.3"
  %".59" = zext i1 %".58" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".63" = icmp sgt i32 %"e.3", %"g.3"
  %".64" = zext i1 %".63" to i32
  ;  Source: (!(e>g))
  %".66" = icmp eq i32 %".64", 0
  %".67" = zext i1 %".66" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".69" = and i32 %".59", %".67"
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".69", i32* %"h"
  %".72" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %"h.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"