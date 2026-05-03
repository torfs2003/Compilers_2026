; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=42+17;
  store i32 59, i32* %"a"
  %"c" = alloca i32
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: 100-37+a
  %".6" = add i32 63, %"a.1"
  ;  Source: intc=100-37+a;
  store i32 %".6", i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=5*8;
  store i32 40, i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=64/4;
  store i32 16, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=25%7;
  store i32 4, i32* %"f"
  %"g" = alloca i32
  ;  Source: intg=2&5;
  store i32 0, i32* %"g"
  %"h" = alloca i32
  ;  Source: inth=7|3;
  store i32 7, i32* %"h"
  %"i" = alloca i32
  ;  Source: inti=9^14;
  store i32 7, i32* %"i"
  %"j" = alloca i32
  ;  Source: intj=~42;
  store i32 -43, i32* %"j"
  %"k" = alloca i32
  ;  Source: intk=8<<2;
  store i32 32, i32* %"k"
  %"l" = alloca i32
  ;  Source: intl=16>>3;
  store i32 2, i32* %"l"
  %"m" = alloca i32
  ;  Source: intm=(5>3)&&(10<20);
  store i32 1, i32* %"m"
  %"n" = alloca i32
  ;  Source: intn=(7>=6)||(3!=3);
  store i32 1, i32* %"n"
  %"o" = alloca i32
  ;  Source: into=!(8<=5);
  store i32 1, i32* %"o"
  %"p" = alloca i32
  ;  Source: intp=(4<7)-42/24;
  store i32 0, i32* %"p"
  %"q" = alloca i32
  ;  Source: intq=8<<2;
  store i32 32, i32* %"q"
  %"r" = alloca i32
  ;  Source: intr=16>>3;
  store i32 2, i32* %"r"
  %"s" = alloca i32
  ;  Source: ints=12&7;
  store i32 4, i32* %"s"
  %"t" = alloca i32
  ;  Source: intt=5|3;
  store i32 7, i32* %"t"
  %"u" = alloca i32
  ;  Source: intu=~478;
  store i32 -479, i32* %"u"
  %"v" = alloca i32
  ;  Source: intv=8<<3;
  store i32 64, i32* %"v"
  %"w" = alloca i32
  ;  Source: intw=16>>3;
  store i32 2, i32* %"w"
  %"x" = alloca i32
  ;  Source: intx=(5>3)&&(10<20);
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=(7>=6)||(3!=3);
  store i32 1, i32* %"y"
  %"z" = alloca i32
  ;  Source: intz=!(8<=5);
  store i32 1, i32* %"z"
  %"sofa" = alloca i32
  ;  Source: intsofa=9876543210123456789+1234567890987654321;
  store i32 11111111101111111110, i32* %"sofa"
  %"appel" = alloca i32
  ;  Source: intappel=~1234567890123456789;
  store i32 -1234567890123456790, i32* %"appel"
  %".59" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".59", i32 %"a.2")
  %".63" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"c.1")
  %".67" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %"d.1")
  %".71" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".71", i32 %"e.1")
  %".75" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %"f.1")
  %".79" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %"g.1")
  %".83" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %"h.1")
  %".87" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".87", i32 %"i.1")
  %".91" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: printf("%d",j);
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %"j.1")
  %".95" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".95", i32 %"k.1")
  %".99" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: l
  %"l.1" = load i32, i32* %"l"
  ;  Source: printf("%d",l);
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".99", i32 %"l.1")
  %".103" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: m
  %"m.1" = load i32, i32* %"m"
  ;  Source: printf("%d",m);
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".103", i32 %"m.1")
  %".107" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".107", i32 %"n.1")
  %".111" = bitcast [3 x i8]* @"str.13" to i8*
  ;  Source: o
  %"o.1" = load i32, i32* %"o"
  ;  Source: printf("%d",o);
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".111", i32 %"o.1")
  %".115" = bitcast [3 x i8]* @"str.14" to i8*
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: printf("%d",p);
  %".118" = call i32 (i8*, ...) @"printf"(i8* %".115", i32 %"p.1")
  %".119" = bitcast [3 x i8]* @"str.15" to i8*
  ;  Source: q
  %"q.1" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".119", i32 %"q.1")
  %".123" = bitcast [3 x i8]* @"str.16" to i8*
  ;  Source: r
  %"r.1" = load i32, i32* %"r"
  ;  Source: printf("%d",r);
  %".126" = call i32 (i8*, ...) @"printf"(i8* %".123", i32 %"r.1")
  %".127" = bitcast [3 x i8]* @"str.17" to i8*
  ;  Source: s
  %"s.1" = load i32, i32* %"s"
  ;  Source: printf("%d",s);
  %".130" = call i32 (i8*, ...) @"printf"(i8* %".127", i32 %"s.1")
  %".131" = bitcast [3 x i8]* @"str.18" to i8*
  ;  Source: t
  %"t.1" = load i32, i32* %"t"
  ;  Source: printf("%d",t);
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".131", i32 %"t.1")
  %".135" = bitcast [3 x i8]* @"str.19" to i8*
  ;  Source: u
  %"u.1" = load i32, i32* %"u"
  ;  Source: printf("%d",u);
  %".138" = call i32 (i8*, ...) @"printf"(i8* %".135", i32 %"u.1")
  %".139" = bitcast [3 x i8]* @"str.20" to i8*
  ;  Source: v
  %"v.1" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".142" = call i32 (i8*, ...) @"printf"(i8* %".139", i32 %"v.1")
  %".143" = bitcast [3 x i8]* @"str.21" to i8*
  ;  Source: w
  %"w.1" = load i32, i32* %"w"
  ;  Source: printf("%d",w);
  %".146" = call i32 (i8*, ...) @"printf"(i8* %".143", i32 %"w.1")
  %".147" = bitcast [3 x i8]* @"str.22" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".147", i32 %"x.1")
  %".151" = bitcast [3 x i8]* @"str.23" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%d",y);
  %".154" = call i32 (i8*, ...) @"printf"(i8* %".151", i32 %"y.1")
  %".155" = bitcast [3 x i8]* @"str.24" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".158" = call i32 (i8*, ...) @"printf"(i8* %".155", i32 %"z.1")
  %".159" = bitcast [3 x i8]* @"str.25" to i8*
  ;  Source: sofa
  %"sofa.1" = load i32, i32* %"sofa"
  ;  Source: printf("%d",sofa);
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".159", i32 %"sofa.1")
  %".163" = bitcast [3 x i8]* @"str.26" to i8*
  ;  Source: appel
  %"appel.1" = load i32, i32* %"appel"
  ;  Source: printf("%d",appel);
  %".166" = call i32 (i8*, ...) @"printf"(i8* %".163", i32 %"appel.1")
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
@"str.13" = internal constant [3 x i8] c"%d\00"
@"str.14" = internal constant [3 x i8] c"%d\00"
@"str.15" = internal constant [3 x i8] c"%d\00"
@"str.16" = internal constant [3 x i8] c"%d\00"
@"str.17" = internal constant [3 x i8] c"%d\00"
@"str.18" = internal constant [3 x i8] c"%d\00"
@"str.19" = internal constant [3 x i8] c"%d\00"
@"str.20" = internal constant [3 x i8] c"%d\00"
@"str.21" = internal constant [3 x i8] c"%d\00"
@"str.22" = internal constant [3 x i8] c"%d\00"
@"str.23" = internal constant [3 x i8] c"%d\00"
@"str.24" = internal constant [3 x i8] c"%d\00"
@"str.25" = internal constant [3 x i8] c"%d\00"
@"str.26" = internal constant [3 x i8] c"%d\00"