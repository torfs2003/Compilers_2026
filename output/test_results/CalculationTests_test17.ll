; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: printf("%c",a);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %"a.1")
  %"b" = alloca i32
  %"a.2" = load i8, i8* %"a"
  %".7" = sext i8 %"a.2" to i32
  store i32 %".7", i32* %"b"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"b.1")
  %"c" = alloca float
  %"b.2" = load i32, i32* %"b"
  %".13" = sitofp i32 %"b.2" to float
  store float %".13", float* %"c"
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: printf("%f",c);
  %".18" = fpext float %"c.1" to double
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", double %".18")
  %"d" = alloca i32
  %"c.2" = load float, float* %"c"
  %"b.3" = load i32, i32* %"b"
  %".20" = sitofp i32 %"b.3" to float
  %".21" = fadd float %"c.2", %".20"
  %"a.3" = load i8, i8* %"a"
  %".22" = sitofp i8 %"a.3" to float
  %".23" = fadd float %".21", %".22"
  %".24" = fptosi float %".23" to i32
  store i32 %".24", i32* %"d"
  %".26" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"d.1")
  %"e" = alloca i8
  %"d.2" = load i32, i32* %"d"
  %"c.3" = load float, float* %"c"
  %".30" = sitofp i32 %"d.2" to float
  %".31" = fadd float %".30", %"c.3"
  %"b.4" = load i32, i32* %"b"
  %".32" = sitofp i32 %"b.4" to float
  %".33" = fadd float %".31", %".32"
  %"a.4" = load i8, i8* %"a"
  %".34" = sitofp i8 %"a.4" to float
  %".35" = fadd float %".33", %".34"
  %".36" = fptosi float %".35" to i8
  store i8 %".36", i8* %"e"
  %".38" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf("%c",e);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".38", i8 %"e.1")
  %"f" = alloca float
  %"e.2" = load i8, i8* %"e"
  %"d.3" = load i32, i32* %"d"
  %".42" = sext i8 %"e.2" to i32
  %".43" = add i32 %".42", %"d.3"
  %"c.4" = load float, float* %"c"
  %".44" = sitofp i32 %".43" to float
  %".45" = fadd float %".44", %"c.4"
  %"b.5" = load i32, i32* %"b"
  %".46" = sitofp i32 %"b.5" to float
  %".47" = fadd float %".45", %".46"
  %"a.5" = load i8, i8* %"a"
  %".48" = sitofp i8 %"a.5" to float
  %".49" = fadd float %".47", %".48"
  store float %".49", float* %"f"
  %".51" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".54" = fpext float %"f.1" to double
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", double %".54")
  %"g" = alloca i32
  %"e.3" = load i8, i8* %"e"
  %"d.4" = load i32, i32* %"d"
  %".56" = sext i8 %"e.3" to i32
  %".57" = add i32 %".56", %"d.4"
  %"c.5" = load float, float* %"c"
  %".58" = sitofp i32 %".57" to float
  %".59" = fadd float %".58", %"c.5"
  %"b.6" = load i32, i32* %"b"
  %".60" = sitofp i32 %"b.6" to float
  %".61" = fadd float %".59", %".60"
  %"a.6" = load i8, i8* %"a"
  %".62" = sitofp i8 %"a.6" to float
  %".63" = fadd float %".61", %".62"
  %"f.2" = load float, float* %"f"
  %".64" = fadd float %".63", %"f.2"
  %".65" = fptosi float %".64" to i32
  store i32 %".65", i32* %"g"
  %".67" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %"g.1")
  %"h" = alloca i32
  %"g.2" = load i32, i32* %"g"
  %".71" = srem i32 %"g.2", 12
  store i32 %".71", i32* %"h"
  %".73" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%x",h);
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %"h.1")
  %"i" = alloca i32
  %"h.2" = load i32, i32* %"h"
  %"g.3" = load i32, i32* %"g"
  %"b.7" = load i32, i32* %"b"
  %".77" = mul i32 %"g.3", %"b.7"
  %"e.4" = load i8, i8* %"e"
  %".78" = sext i8 %"e.4" to i32
  %".79" = sdiv i32 %".77", %".78"
  %".80" = sub i32 %"h.2", %".79"
  store i32 %".80", i32* %"i"
  %".82" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%x",i);
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %"i.1")
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