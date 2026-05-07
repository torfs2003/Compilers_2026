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

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: constchara='a';
  store i8 97, i8* %"a"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: printf("%c",a);
  %".7" = zext i8 %"a.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"b" = alloca i32
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: constintb=a;
  %".11" = sext i8 %"a.2" to i32
  store i32 %".11", i32* %"b"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"b.1")
  %"c" = alloca float
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: constfloatc=b;
  %".19" = sitofp i32 %"b.2" to float
  store float %".19", float* %"c"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: printf("%f",c);
  %".24" = fpext float %"c.1" to double
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", double %".24")
  %"d" = alloca i32
  ;  Source: c
  %"c.2" = load float, float* %"c"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".28" = sitofp i32 %"b.3" to float
  %".29" = fadd float %"c.2", %".28"
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: c+b+a
  %".32" = sitofp i8 %"a.3" to float
  %".33" = fadd float %".29", %".32"
  ;  Source: constintd=c+b+a;
  %".35" = fptosi float %".33" to i32
  store i32 %".35", i32* %"d"
  %".37" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"d.1")
  %"e" = alloca i8
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.3" = load float, float* %"c"
  %".43" = sitofp i32 %"d.2" to float
  %".44" = fadd float %".43", %"c.3"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  %".46" = sitofp i32 %"b.4" to float
  %".47" = fadd float %".44", %".46"
  ;  Source: a
  %"a.4" = load i8, i8* %"a"
  ;  Source: d+c+b+a
  %".50" = sitofp i8 %"a.4" to float
  %".51" = fadd float %".47", %".50"
  ;  Source: constchare=d+c+b+a;
  %".53" = fptosi float %".51" to i8
  store i8 %".53", i8* %"e"
  %".55" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf("%c",e);
  %".58" = zext i8 %"e.1" to i32
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  %"f" = alloca float
  ;  Source: e
  %"e.2" = load i8, i8* %"e"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".62" = sext i8 %"e.2" to i32
  %".63" = add i32 %".62", %"d.3"
  ;  Source: c
  %"c.4" = load float, float* %"c"
  %".65" = sitofp i32 %".63" to float
  %".66" = fadd float %".65", %"c.4"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".68" = sitofp i32 %"b.5" to float
  %".69" = fadd float %".66", %".68"
  ;  Source: a
  %"a.5" = load i8, i8* %"a"
  ;  Source: e+d+c+b+a
  %".72" = sitofp i8 %"a.5" to float
  %".73" = fadd float %".69", %".72"
  ;  Source: constfloatf=e+d+c+b+a;
  store float %".73", float* %"f"
  %".76" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".79" = fpext float %"f.1" to double
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".76", double %".79")
  %"g" = alloca i32
  ;  Source: e
  %"e.3" = load i8, i8* %"e"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".83" = sext i8 %"e.3" to i32
  %".84" = add i32 %".83", %"d.4"
  ;  Source: c
  %"c.5" = load float, float* %"c"
  %".86" = sitofp i32 %".84" to float
  %".87" = fadd float %".86", %"c.5"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".89" = sitofp i32 %"b.6" to float
  %".90" = fadd float %".87", %".89"
  ;  Source: a
  %"a.6" = load i8, i8* %"a"
  %".92" = sitofp i8 %"a.6" to float
  %".93" = fadd float %".90", %".92"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: e+d+c+b+a+f
  %".96" = fadd float %".93", %"f.2"
  ;  Source: constintg=e+d+c+b+a+f;
  %".98" = fptosi float %".96" to i32
  store i32 %".98", i32* %"g"
  %".100" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".100", i32 %"g.1")
  %"h" = alloca i32
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: g%12
  %".106" = srem i32 %"g.2", 12
  ;  Source: constinth=g%12;
  store i32 %".106", i32* %"h"
  %".109" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%x",h);
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".109", i32 %"h.1")
  %"i" = alloca i32
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  %".116" = mul i32 %"g.3", %"b.7"
  ;  Source: e
  %"e.4" = load i8, i8* %"e"
  %".118" = sext i8 %"e.4" to i32
  %".119" = sdiv i32 %".116", %".118"
  ;  Source: h-g*b/e
  %".121" = sub i32 %"h.2", %".119"
  ;  Source: constinti=h-g*b/e;
  store i32 %".121", i32* %"i"
  %".124" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%x",i);
  %".127" = call i32 (i8*, ...) @"printf"(i8* %".124", i32 %"i.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%f\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%f\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%x\00"
@"str.8" = internal constant [3 x i8] c"%x\00"