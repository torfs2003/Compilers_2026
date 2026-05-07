; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %".3" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: printf("%c\n",a);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %"a.1")
  %"b" = alloca i32
  %"a.2" = load i8, i8* %"a"
  %".7" = sext i8 %"a.2" to i32
  store i32 %".7", i32* %"b"
  %".9" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"b.1")
  %"c" = alloca float
  %"b.2" = load i32, i32* %"b"
  %".13" = sitofp i32 %"b.2" to float
  store float %".13", float* %"c"
  %".15" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: (int)c
  %".18" = fptosi float %"c.1" to i32
  ;  Source: printf("%d\n",(int)c);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  %"d" = alloca i32
  %"c.2" = load float, float* %"c"
  %"b.3" = load i32, i32* %"b"
  %".21" = sitofp i32 %"b.3" to float
  %".22" = fadd float %"c.2", %".21"
  %"a.3" = load i8, i8* %"a"
  %".23" = sitofp i8 %"a.3" to float
  %".24" = fadd float %".22", %".23"
  %".25" = fptosi float %".24" to i32
  store i32 %".25", i32* %"d"
  %".27" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d\n",d);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"d.1")
  %"e" = alloca i8
  %"d.2" = load i32, i32* %"d"
  %"c.3" = load float, float* %"c"
  %".31" = sitofp i32 %"d.2" to float
  %".32" = fadd float %".31", %"c.3"
  %"b.4" = load i32, i32* %"b"
  %".33" = sitofp i32 %"b.4" to float
  %".34" = fadd float %".32", %".33"
  %"a.4" = load i8, i8* %"a"
  %".35" = sitofp i8 %"a.4" to float
  %".36" = fadd float %".34", %".35"
  %".37" = fptosi float %".36" to i8
  store i8 %".37", i8* %"e"
  %".39" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf("%c\n",e);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".39", i8 %"e.1")
  %"f" = alloca float
  %"e.2" = load i8, i8* %"e"
  %"d.3" = load i32, i32* %"d"
  %".43" = sext i8 %"e.2" to i32
  %".44" = add i32 %".43", %"d.3"
  %"c.4" = load float, float* %"c"
  %".45" = sitofp i32 %".44" to float
  %".46" = fadd float %".45", %"c.4"
  %"b.5" = load i32, i32* %"b"
  %".47" = sitofp i32 %"b.5" to float
  %".48" = fadd float %".46", %".47"
  %"a.5" = load i8, i8* %"a"
  %".49" = sitofp i8 %"a.5" to float
  %".50" = fadd float %".48", %".49"
  store float %".50", float* %"f"
  %".52" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".55" = fptosi float %"f.1" to i32
  ;  Source: printf("%d\n",(int)f);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".55")
  %"g" = alloca i32
  %"e.3" = load i8, i8* %"e"
  %"d.4" = load i32, i32* %"d"
  %".58" = sext i8 %"e.3" to i32
  %".59" = add i32 %".58", %"d.4"
  %"c.5" = load float, float* %"c"
  %".60" = sitofp i32 %".59" to float
  %".61" = fadd float %".60", %"c.5"
  %"b.6" = load i32, i32* %"b"
  %".62" = sitofp i32 %"b.6" to float
  %".63" = fadd float %".61", %".62"
  %"a.6" = load i8, i8* %"a"
  %".64" = sitofp i8 %"a.6" to float
  %".65" = fadd float %".63", %".64"
  %"f.2" = load float, float* %"f"
  %".66" = fadd float %".65", %"f.2"
  %".67" = fptosi float %".66" to i32
  store i32 %".67", i32* %"g"
  %".69" = bitcast [4 x i8]* @"str.6" to i8*
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: printf("%d\n",g);
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".69", i32 %"g.1")
  %"h" = alloca i32
  %"g.2" = load i32, i32* %"g"
  %".73" = srem i32 %"g.2", 12
  store i32 %".73", i32* %"h"
  %".75" = bitcast [4 x i8]* @"str.7" to i8*
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: printf("%x\n",h);
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %"h.1")
  %"i" = alloca i32
  %"h.2" = load i32, i32* %"h"
  %"g.3" = load i32, i32* %"g"
  %"b.7" = load i32, i32* %"b"
  %".79" = mul i32 %"g.3", %"b.7"
  %"e.4" = load i8, i8* %"e"
  %".80" = sext i8 %"e.4" to i32
  %".81" = sdiv i32 %".79", %".80"
  %".82" = sub i32 %"h.2", %".81"
  store i32 %".82", i32* %"i"
  %".84" = bitcast [4 x i8]* @"str.8" to i8*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: printf("%x\n",i);
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %"i.1")
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