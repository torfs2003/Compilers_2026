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
  %".25" = sub i32 %"a.3", %"b.3"
  ;  Source: intd=a-b;
  store i32 %".25", i32* %"d"
  %".28" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"d.1")
  %"e" = alloca i32
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: a*b
  %".35" = mul i32 %"a.4", %"b.4"
  ;  Source: inte=a*b;
  store i32 %".35", i32* %"e"
  %".38" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"e.1")
  %"f" = alloca i32
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: a/b
  %".45" = sdiv i32 %"a.5", %"b.5"
  ;  Source: intf=a/b;
  store i32 %".45", i32* %"f"
  %".48" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"f.1")
  %"g" = alloca i32
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: a==b
  %".55" = icmp eq i32 %"a.6", %"b.6"
  %".56" = zext i1 %".55" to i32
  ;  Source: intg=a==b;
  store i32 %".56", i32* %"g"
  %".59" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".59", i32 %"g.1")
  %"h" = alloca i32
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: a<b
  %".66" = icmp slt i32 %"a.7", %"b.7"
  %".67" = zext i1 %".66" to i32
  ;  Source: inth=a<b;
  store i32 %".67", i32* %"h"
  %".70" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %"h.1")
  %"i" = alloca i32
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  ;  Source: a>b
  %".77" = icmp sgt i32 %"a.8", %"b.8"
  %".78" = zext i1 %".77" to i32
  ;  Source: inti=a>b;
  store i32 %".78", i32* %"i"
  %".81" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".84" = call i32 (i8*, ...) @"printf"(i8* %".81", i32 %"i.1")
  %"j" = alloca i32
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: a!=b
  %".88" = icmp ne i32 %"a.9", %"b.9"
  %".89" = zext i1 %".88" to i32
  ;  Source: intj=a!=b;
  store i32 %".89", i32* %"j"
  %".92" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: printf("%d",j);
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %"j.1")
  %"k" = alloca i32
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: b
  %"b.10" = load i32, i32* %"b"
  ;  Source: a<=b
  %".99" = icmp sle i32 %"a.10", %"b.10"
  %".100" = zext i1 %".99" to i32
  ;  Source: intk=a<=b;
  store i32 %".100", i32* %"k"
  %".103" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".103", i32 %"k.1")
  %"l" = alloca i32
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  ;  Source: a>=b
  %".110" = icmp sge i32 %"a.11", %"b.11"
  %".111" = zext i1 %".110" to i32
  ;  Source: intl=a>=b;
  store i32 %".111", i32* %"l"
  %".114" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: l
  %"l.1" = load i32, i32* %"l"
  ;  Source: printf("%d",l);
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".114", i32 %"l.1")
  %"m" = alloca i32
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: a%b
  %".121" = srem i32 %"a.12", %"b.12"
  ;  Source: intm=a%b;
  store i32 %".121", i32* %"m"
  %".124" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: m
  %"m.1" = load i32, i32* %"m"
  ;  Source: printf("%d",m);
  %".127" = call i32 (i8*, ...) @"printf"(i8* %".124", i32 %"m.1")
  %"n" = alloca i32
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: b
  %"b.13" = load i32, i32* %"b"
  ;  Source: a<<b
  %".131" = shl i32 %"a.13", %"b.13"
  ;  Source: intn=a<<b;
  store i32 %".131", i32* %"n"
  %".134" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".134", i32 %"n.1")
  %"o" = alloca i32
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: b
  %"b.14" = load i32, i32* %"b"
  ;  Source: a>>b
  %".141" = ashr i32 %"a.14", %"b.14"
  ;  Source: into=a>>b;
  store i32 %".141", i32* %"o"
  %".144" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: printf("%d",0);
  %".146" = call i32 (i8*, ...) @"printf"(i8* %".144", i32 0)
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