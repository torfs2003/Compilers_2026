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
  ;  Source: inta=6;
  store i32 6, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=6;
  store i32 6, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=2;
  store i32 2, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=2;
  store i32 2, i32* %"b"
  %"c" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: a+b
  %".15" = add i32 %"a.2", %"b.2"
  ;  Source: intc=a+b;
  store i32 %".15", i32* %"c"
  %".18" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"c.1")
  %"d" = alloca i32
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: a-b
  ;  Source: intd=a-b;
  %".26" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"d.1")
  %"e" = alloca i32
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: a*b
  %".33" = mul i32 %"a.4", %"b.4"
  ;  Source: inte=a*b;
  store i32 %".33", i32* %"e"
  %".36" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"e.1")
  %"f" = alloca i32
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: a/b
  %".43" = sdiv i32 %"a.5", %"b.5"
  ;  Source: intf=a/b;
  store i32 %".43", i32* %"f"
  %".46" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %"f.1")
  %"g" = alloca i32
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: a==b
  %".53" = icmp eq i32 %"a.6", %"b.6"
  %".54" = zext i1 %".53" to i32
  ;  Source: intg=a==b;
  store i32 %".54", i32* %"g"
  %".57" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %"g.1")
  %"h" = alloca i32
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: a<b
  %".64" = icmp slt i32 %"a.7", %"b.7"
  %".65" = zext i1 %".64" to i32
  ;  Source: inth=a<b;
  store i32 %".65", i32* %"h"
  %".68" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %"h.1")
  %"i" = alloca i32
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  ;  Source: a>b
  %".75" = icmp sgt i32 %"a.8", %"b.8"
  %".76" = zext i1 %".75" to i32
  ;  Source: inti=a>b;
  store i32 %".76", i32* %"i"
  %".79" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %"i.1")
  %"j" = alloca i32
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: a!=b
  %".86" = icmp ne i32 %"a.9", %"b.9"
  %".87" = zext i1 %".86" to i32
  ;  Source: intj=a!=b;
  store i32 %".87", i32* %"j"
  %".90" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: printf("%d",j);
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 %"j.1")
  %"k" = alloca i32
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: b
  %"b.10" = load i32, i32* %"b"
  ;  Source: a<=b
  %".97" = icmp sle i32 %"a.10", %"b.10"
  %".98" = zext i1 %".97" to i32
  ;  Source: intk=a<=b;
  store i32 %".98", i32* %"k"
  %".101" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".104" = call i32 (i8*, ...) @"printf"(i8* %".101", i32 %"k.1")
  %"l" = alloca i32
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  ;  Source: a>=b
  %".108" = icmp sge i32 %"a.11", %"b.11"
  %".109" = zext i1 %".108" to i32
  ;  Source: intl=a>=b;
  store i32 %".109", i32* %"l"
  %".112" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: l
  %"l.1" = load i32, i32* %"l"
  ;  Source: printf("%d",l);
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".112", i32 %"l.1")
  %"m" = alloca i32
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: a%b
  %".119" = srem i32 %"a.12", %"b.12"
  ;  Source: intm=a%b;
  store i32 %".119", i32* %"m"
  %".122" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: m
  %"m.1" = load i32, i32* %"m"
  ;  Source: printf("%d",m);
  %".125" = call i32 (i8*, ...) @"printf"(i8* %".122", i32 %"m.1")
  %"n" = alloca i32
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: b
  %"b.13" = load i32, i32* %"b"
  ;  Source: a<<b
  %".129" = shl i32 %"a.13", %"b.13"
  ;  Source: intn=a<<b;
  store i32 %".129", i32* %"n"
  %".132" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".135" = call i32 (i8*, ...) @"printf"(i8* %".132", i32 %"n.1")
  %"o" = alloca i32
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: b
  %"b.14" = load i32, i32* %"b"
  ;  Source: a>>b
  %".139" = ashr i32 %"a.14", %"b.14"
  ;  Source: into=a>>b;
  store i32 %".139", i32* %"o"
  %".142" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: printf("%d",0);
  %".144" = call i32 (i8*, ...) @"printf"(i8* %".142", i32 0)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"
@"str.9" = internal constant [3 x i8] c"%d\00"
@"str.10" = internal constant [3 x i8] c"%d\00"
@"str.11" = internal constant [3 x i8] c"%d\00"
@"str.12" = internal constant [3 x i8] c"%d\00"