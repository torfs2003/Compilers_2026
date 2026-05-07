; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 6, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=6;
  store i32 6, i32* %"a"
  %"b" = alloca i32
  store i32 2, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=2;
  store i32 2, i32* %"b"
  %"c" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %".10" = add i32 %"a.2", %"b.2"
  store i32 %".10", i32* %"c"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"c.1")
  %"d" = alloca i32
  %"a.3" = load i32, i32* %"a"
  %"b.3" = load i32, i32* %"b"
  %".16" = sub i32 %"a.3", %"b.3"
  store i32 %".16", i32* %"d"
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"d.1")
  %"e" = alloca i32
  %"a.4" = load i32, i32* %"a"
  %"b.4" = load i32, i32* %"b"
  %".22" = mul i32 %"a.4", %"b.4"
  store i32 %".22", i32* %"e"
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"e.1")
  %"f" = alloca i32
  %"a.5" = load i32, i32* %"a"
  %"b.5" = load i32, i32* %"b"
  %".28" = sdiv i32 %"a.5", %"b.5"
  store i32 %".28", i32* %"f"
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"f.1")
  %"g" = alloca i32
  %"a.6" = load i32, i32* %"a"
  %"b.6" = load i32, i32* %"b"
  %".34" = icmp eq i32 %"a.6", %"b.6"
  %".35" = zext i1 %".34" to i32
  store i32 %".35", i32* %"g"
  %".37" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"g.1")
  %"h" = alloca i32
  %"a.7" = load i32, i32* %"a"
  %"b.7" = load i32, i32* %"b"
  %".41" = icmp slt i32 %"a.7", %"b.7"
  %".42" = zext i1 %".41" to i32
  store i32 %".42", i32* %"h"
  %".44" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"h.1")
  %"i" = alloca i32
  %"a.8" = load i32, i32* %"a"
  %"b.8" = load i32, i32* %"b"
  %".48" = icmp sgt i32 %"a.8", %"b.8"
  %".49" = zext i1 %".48" to i32
  store i32 %".49", i32* %"i"
  %".51" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"i.1")
  %"j" = alloca i32
  %"a.9" = load i32, i32* %"a"
  %"b.9" = load i32, i32* %"b"
  %".55" = icmp ne i32 %"a.9", %"b.9"
  %".56" = zext i1 %".55" to i32
  store i32 %".56", i32* %"j"
  %".58" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: printf("%d",j);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %"j.1")
  %"k" = alloca i32
  %"a.10" = load i32, i32* %"a"
  %"b.10" = load i32, i32* %"b"
  %".62" = icmp sle i32 %"a.10", %"b.10"
  %".63" = zext i1 %".62" to i32
  store i32 %".63", i32* %"k"
  %".65" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %"k.1")
  %"l" = alloca i32
  %"a.11" = load i32, i32* %"a"
  %"b.11" = load i32, i32* %"b"
  %".69" = icmp sge i32 %"a.11", %"b.11"
  %".70" = zext i1 %".69" to i32
  store i32 %".70", i32* %"l"
  %".72" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: l
  %"l.1" = load i32, i32* %"l"
  ;  Source: printf("%d",l);
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %"l.1")
  %"m" = alloca i32
  %"a.12" = load i32, i32* %"a"
  %"b.12" = load i32, i32* %"b"
  %".76" = srem i32 %"a.12", %"b.12"
  store i32 %".76", i32* %"m"
  %".78" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: m
  %"m.1" = load i32, i32* %"m"
  ;  Source: printf("%d",m);
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %"m.1")
  %"n" = alloca i32
  %"a.13" = load i32, i32* %"a"
  %"b.13" = load i32, i32* %"b"
  %".82" = shl i32 %"a.13", %"b.13"
  store i32 %".82", i32* %"n"
  %".84" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %"n.1")
  %"o" = alloca i32
  %"a.14" = load i32, i32* %"a"
  %"b.14" = load i32, i32* %"b"
  %".88" = ashr i32 %"a.14", %"b.14"
  store i32 %".88", i32* %"o"
  %".90" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: printf("%d",0);
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 0)
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