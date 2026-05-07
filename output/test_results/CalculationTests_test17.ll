; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %"a.1")
  %"b" = alloca i32
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: constintb=a;
  %".10" = sext i8 %"a.2" to i32
  store i32 %".10", i32* %"b"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"b.1")
  %"c" = alloca float
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: constfloatc=b;
  %".18" = sitofp i32 %"b.2" to float
  store float %".18", float* %"c"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: printf("%f",c);
  %".23" = fpext float %"c.1" to double
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", double %".23")
  %"d" = alloca i32
  ;  Source: c
  %"c.2" = load float, float* %"c"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".27" = sitofp i32 %"b.3" to float
  %".28" = fadd float %"c.2", %".27"
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: c+b+a
  %".31" = sitofp i8 %"a.3" to float
  %".32" = fadd float %".28", %".31"
  ;  Source: constintd=c+b+a;
  %".34" = fptosi float %".32" to i32
  store i32 %".34", i32* %"d"
  %".36" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"d.1")
  %"e" = alloca i8
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.3" = load float, float* %"c"
  %".42" = sitofp i32 %"d.2" to float
  %".43" = fadd float %".42", %"c.3"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  %".45" = sitofp i32 %"b.4" to float
  %".46" = fadd float %".43", %".45"
  ;  Source: a
  %"a.4" = load i8, i8* %"a"
  ;  Source: d+c+b+a
  %".49" = sitofp i8 %"a.4" to float
  %".50" = fadd float %".46", %".49"
  ;  Source: constchare=d+c+b+a;
  %".52" = fptosi float %".50" to i8
  store i8 %".52", i8* %"e"
  %".54" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf("%c",e);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".54", i8 %"e.1")
  %"f" = alloca float
  ;  Source: e
  %"e.2" = load i8, i8* %"e"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".60" = sext i8 %"e.2" to i32
  %".61" = add i32 %".60", %"d.3"
  ;  Source: c
  %"c.4" = load float, float* %"c"
  %".63" = sitofp i32 %".61" to float
  %".64" = fadd float %".63", %"c.4"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".66" = sitofp i32 %"b.5" to float
  %".67" = fadd float %".64", %".66"
  ;  Source: a
  %"a.5" = load i8, i8* %"a"
  ;  Source: e+d+c+b+a
  %".70" = sitofp i8 %"a.5" to float
  %".71" = fadd float %".67", %".70"
  ;  Source: constfloatf=e+d+c+b+a;
  store float %".71", float* %"f"
  %".74" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".77" = fpext float %"f.1" to double
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", double %".77")
  %"g" = alloca i32
  ;  Source: e
  %"e.3" = load i8, i8* %"e"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".81" = sext i8 %"e.3" to i32
  %".82" = add i32 %".81", %"d.4"
  ;  Source: c
  %"c.5" = load float, float* %"c"
  %".84" = sitofp i32 %".82" to float
  %".85" = fadd float %".84", %"c.5"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".87" = sitofp i32 %"b.6" to float
  %".88" = fadd float %".85", %".87"
  ;  Source: a
  %"a.6" = load i8, i8* %"a"
  %".90" = sitofp i8 %"a.6" to float
  %".91" = fadd float %".88", %".90"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: e+d+c+b+a+f
  %".94" = fadd float %".91", %"f.2"
  ;  Source: constintg=e+d+c+b+a+f;
  %".96" = fptosi float %".94" to i32
  store i32 %".96", i32* %"g"
  %".98" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %"g.1")
  %"h" = alloca i32
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: g%12
  ;  Source: constinth=g%12;
  %".105" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%x",h);
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".105", i32 %"h.1")
  %"i" = alloca i32
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  %".112" = mul i32 %"g.3", %"b.7"
  ;  Source: e
  %"e.4" = load i8, i8* %"e"
  %".114" = sext i8 %"e.4" to i32
  %".115" = sdiv i32 %".112", %".114"
  ;  Source: h-g*b/e
  %".117" = sub i32 %"h.2", %".115"
  ;  Source: constinti=h-g*b/e;
  store i32 %".117", i32* %"i"
  %".120" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%x",i);
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".120", i32 %"i.1")
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