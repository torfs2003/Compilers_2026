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
  ;  Source: printf("%c",a);
  %".5" = sext i8 97 to i32
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".5")
  %"b" = alloca i32
  %".7" = sext i8 97 to i32
  store i32 %".7", i32* %"b"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",b);
  %".11" = sext i8 97 to i32
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".11")
  %"c" = alloca float
  %".13" = sitofp i8 97 to float
  store float %".13", float* %"c"
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%f",c);
  %".17" = sext i8 97 to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".17")
  %"d" = alloca i32
  %".19" = add i8 97, 97
  %".20" = add i8 %".19", 97
  %".21" = sext i8 %".20" to i32
  store i32 %".21", i32* %"d"
  %".23" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  ;  Source: printf("%d",d);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".21")
  %"e" = alloca i8
  %".27" = sext i8 97 to i32
  %".28" = add i32 %".21", %".27"
  %".29" = sext i8 97 to i32
  %".30" = add i32 %".28", %".29"
  %".31" = sext i8 97 to i32
  %".32" = add i32 %".30", %".31"
  %".33" = trunc i32 %".32" to i8
  store i8 %".33", i8* %"e"
  %".35" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  ;  Source: printf("%c",e);
  %".38" = sext i8 %".33" to i32
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  %"f" = alloca float
  %".40" = sext i8 %".33" to i32
  %".41" = add i32 %".40", %".21"
  %".42" = sext i8 97 to i32
  %".43" = add i32 %".41", %".42"
  %".44" = sext i8 97 to i32
  %".45" = add i32 %".43", %".44"
  %".46" = sext i8 97 to i32
  %".47" = add i32 %".45", %".46"
  %".48" = sitofp i32 %".47" to float
  store float %".48", float* %"f"
  %".50" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  ;  Source: printf("%f",f);
  %".53" = fpext float %".48" to double
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", double %".53")
  %"g" = alloca i32
  %".55" = sext i8 %".33" to i32
  %".56" = add i32 %".55", %".21"
  %".57" = sext i8 97 to i32
  %".58" = add i32 %".56", %".57"
  %".59" = sext i8 97 to i32
  %".60" = add i32 %".58", %".59"
  %".61" = sext i8 97 to i32
  %".62" = add i32 %".60", %".61"
  %".63" = sitofp i32 %".62" to float
  %".64" = fadd float %".63", %".48"
  %".65" = fptosi float %".64" to i32
  store i32 %".65", i32* %"g"
  %".67" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: g
  ;  Source: printf("%d",g);
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".65")
  %"h" = alloca i32
  %".71" = srem i32 %".65", 12
  store i32 %".71", i32* %"h"
  %".73" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: h
  ;  Source: printf("%x",h);
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %".71")
  %"i" = alloca i32
  %".77" = sext i8 97 to i32
  %".78" = mul i32 %".65", %".77"
  %".79" = sext i8 %".33" to i32
  %".80" = sdiv i32 %".78", %".79"
  %".81" = sub i32 %".71", %".80"
  store i32 %".81", i32* %"i"
  %".83" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: i
  ;  Source: printf("%x",i);
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".81")
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