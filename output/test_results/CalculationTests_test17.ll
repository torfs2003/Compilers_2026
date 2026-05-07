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
  ;  Source: constchara='a';
  store i8 97, i8* %"a"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: printf("%c\n",a);
  %".7" = zext i8 %"a.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"b" = alloca i32
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: constintb=a;
  %".11" = sext i8 %"a.2" to i32
  store i32 %".11", i32* %"b"
  %".13" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"b.1")
  %"c" = alloca float
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: constfloatc=b;
  %".19" = sitofp i32 %"b.2" to float
  store float %".19", float* %"c"
  %".21" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: (int)c
  %".24" = fptosi float %"c.1" to i32
  ;  Source: printf("%d\n",(int)c);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  %"d" = alloca i32
  ;  Source: c
  %"c.2" = load float, float* %"c"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".29" = sitofp i32 %"b.3" to float
  %".30" = fadd float %"c.2", %".29"
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: c+b+a
  %".33" = sitofp i8 %"a.3" to float
  %".34" = fadd float %".30", %".33"
  ;  Source: constintd=c+b+a;
  %".36" = fptosi float %".34" to i32
  store i32 %".36", i32* %"d"
  %".38" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d\n",d);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"d.1")
  %"e" = alloca i8
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.3" = load float, float* %"c"
  %".44" = sitofp i32 %"d.2" to float
  %".45" = fadd float %".44", %"c.3"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  %".47" = sitofp i32 %"b.4" to float
  %".48" = fadd float %".45", %".47"
  ;  Source: a
  %"a.4" = load i8, i8* %"a"
  ;  Source: d+c+b+a
  %".51" = sitofp i8 %"a.4" to float
  %".52" = fadd float %".48", %".51"
  ;  Source: constchare=d+c+b+a;
  %".54" = fptosi float %".52" to i8
  store i8 %".54", i8* %"e"
  %".56" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf("%c\n",e);
  %".59" = zext i8 %"e.1" to i32
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  %"f" = alloca float
  ;  Source: e
  %"e.2" = load i8, i8* %"e"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".63" = sext i8 %"e.2" to i32
  %".64" = add i32 %".63", %"d.3"
  ;  Source: c
  %"c.4" = load float, float* %"c"
  %".66" = sitofp i32 %".64" to float
  %".67" = fadd float %".66", %"c.4"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".69" = sitofp i32 %"b.5" to float
  %".70" = fadd float %".67", %".69"
  ;  Source: a
  %"a.5" = load i8, i8* %"a"
  ;  Source: e+d+c+b+a
  %".73" = sitofp i8 %"a.5" to float
  %".74" = fadd float %".70", %".73"
  ;  Source: constfloatf=e+d+c+b+a;
  store float %".74", float* %"f"
  %".77" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".80" = fptosi float %"f.1" to i32
  ;  Source: printf("%d\n",(int)f);
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".77", i32 %".80")
  %"g" = alloca i32
  ;  Source: e
  %"e.3" = load i8, i8* %"e"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".85" = sext i8 %"e.3" to i32
  %".86" = add i32 %".85", %"d.4"
  ;  Source: c
  %"c.5" = load float, float* %"c"
  %".88" = sitofp i32 %".86" to float
  %".89" = fadd float %".88", %"c.5"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".91" = sitofp i32 %"b.6" to float
  %".92" = fadd float %".89", %".91"
  ;  Source: a
  %"a.6" = load i8, i8* %"a"
  %".94" = sitofp i8 %"a.6" to float
  %".95" = fadd float %".92", %".94"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: e+d+c+b+a+f
  %".98" = fadd float %".95", %"f.2"
  ;  Source: constintg=e+d+c+b+a+f;
  %".100" = fptosi float %".98" to i32
  store i32 %".100", i32* %"g"
  %".102" = bitcast [4 x i8]* @"str.6" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d\n",g);
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %"g.1")
  %"h" = alloca i32
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: g%12
  %".108" = srem i32 %"g.2", 12
  ;  Source: constinth=g%12;
  store i32 %".108", i32* %"h"
  %".111" = bitcast [4 x i8]* @"str.7" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%x\n",h);
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".111", i32 %"h.1")
  %"i" = alloca i32
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  %".118" = mul i32 %"g.3", %"b.7"
  ;  Source: e
  %"e.4" = load i8, i8* %"e"
  %".120" = sext i8 %"e.4" to i32
  %".121" = sdiv i32 %".118", %".120"
  ;  Source: h-g*b/e
  %".123" = sub i32 %"h.2", %".121"
  ;  Source: constinti=h-g*b/e;
  store i32 %".123", i32* %"i"
  %".126" = bitcast [4 x i8]* @"str.8" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%x\n",i);
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".126", i32 %"i.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%c\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
@"str.4" = internal constant [4 x i8] c"%c\0a\00"
@"str.5" = internal constant [4 x i8] c"%d\0a\00"
@"str.6" = internal constant [4 x i8] c"%d\0a\00"
@"str.7" = internal constant [4 x i8] c"%x\0a\00"
@"str.8" = internal constant [4 x i8] c"%x\0a\00"