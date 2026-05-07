; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=33+69789*(69421/51213+(2231-654));
  store i32 110127075, i32* %"a"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"a.2")
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: a=1+1;
  store i32 2, i32* %"a"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"a.4")
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=0-6985;
  store i32 -6985, i32* %"a"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"a.6")
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=5*63;
  store i32 315, i32* %"a"
  %".27" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"a.8")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=99/3622;
  store i32 0, i32* %"a"
  %".34" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"a.10")
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: a=3>1;
  store i32 1, i32* %"a"
  %".41" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"a.12")
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=3<1;
  store i32 0, i32* %"a"
  %".48" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"a.14")
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: a=8897==45647897;
  store i32 0, i32* %"a"
  %".55" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %"a.16")
  ;  Source: a
  %"a.17" = load i32, i32* %"a"
  ;  Source: a=+487897;
  store i32 487897, i32* %"a"
  %".62" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: a
  %"a.18" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %"a.18")
  ;  Source: a
  %"a.19" = load i32, i32* %"a"
  ;  Source: a=-5;
  store i32 -5, i32* %"a"
  %".69" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: a
  %"a.20" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".69", i32 %"a.20")
  ;  Source: a
  %"a.21" = load i32, i32* %"a"
  ;  Source: a=1&&656;
  store i32 1, i32* %"a"
  %".76" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: a
  %"a.22" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 %"a.22")
  ;  Source: a
  %"a.23" = load i32, i32* %"a"
  ;  Source: a=989||68779;
  store i32 1, i32* %"a"
  %".83" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: a
  %"a.24" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %"a.24")
  ;  Source: a
  %"a.25" = load i32, i32* %"a"
  ;  Source: a=!65465;
  store i32 0, i32* %"a"
  %".90" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: a
  %"a.26" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 %"a.26")
  ;  Source: a
  %"a.27" = load i32, i32* %"a"
  ;  Source: a=1+(3*6)/(1+3);
  store i32 5, i32* %"a"
  %".97" = bitcast [3 x i8]* @"str.13" to i8*
  ;  Source: a
  %"a.28" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".97", i32 %"a.28")
  ;  Source: a
  %"a.29" = load i32, i32* %"a"
  ;  Source: a=1+3+5*(62/3);
  store i32 104, i32* %"a"
  %".104" = bitcast [3 x i8]* @"str.14" to i8*
  ;  Source: a
  %"a.30" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".107" = call i32 (i8*, ...) @"printf"(i8* %".104", i32 %"a.30")
  ;  Source: a
  %"a.31" = load i32, i32* %"a"
  ;  Source: a=5*+9;
  store i32 45, i32* %"a"
  %".111" = bitcast [3 x i8]* @"str.15" to i8*
  ;  Source: a
  %"a.32" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".111", i32 %"a.32")
  ;  Source: a
  %"a.33" = load i32, i32* %"a"
  ;  Source: a=33*-5;
  store i32 -165, i32* %"a"
  %".118" = bitcast [3 x i8]* @"str.16" to i8*
  ;  Source: a
  %"a.34" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".118", i32 %"a.34")
  ;  Source: a
  %"a.35" = load i32, i32* %"a"
  ;  Source: a=((-6))*(((5+32/(6532))));
  store i32 -30, i32* %"a"
  %".125" = bitcast [3 x i8]* @"str.17" to i8*
  ;  Source: a
  %"a.36" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".128" = call i32 (i8*, ...) @"printf"(i8* %".125", i32 %"a.36")
  ;  Source: a
  %"a.37" = load i32, i32* %"a"
  ;  Source: a=1>=3;
  store i32 0, i32* %"a"
  %".132" = bitcast [3 x i8]* @"str.18" to i8*
  ;  Source: a
  %"a.38" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".135" = call i32 (i8*, ...) @"printf"(i8* %".132", i32 %"a.38")
  ;  Source: a
  %"a.39" = load i32, i32* %"a"
  ;  Source: a=695<=44878;
  store i32 1, i32* %"a"
  %".139" = bitcast [3 x i8]* @"str.19" to i8*
  ;  Source: a
  %"a.40" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".142" = call i32 (i8*, ...) @"printf"(i8* %".139", i32 %"a.40")
  ;  Source: a
  %"a.41" = load i32, i32* %"a"
  ;  Source: a=98333!=6565911;
  store i32 1, i32* %"a"
  %".146" = bitcast [3 x i8]* @"str.20" to i8*
  ;  Source: a
  %"a.42" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".149" = call i32 (i8*, ...) @"printf"(i8* %".146", i32 %"a.42")
  ;  Source: a
  %"a.43" = load i32, i32* %"a"
  ;  Source: a=55%963;
  store i32 55, i32* %"a"
  %".153" = bitcast [3 x i8]* @"str.21" to i8*
  ;  Source: a
  %"a.44" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".156" = call i32 (i8*, ...) @"printf"(i8* %".153", i32 %"a.44")
  ;  Source: a
  %"a.45" = load i32, i32* %"a"
  ;  Source: a=45<<4;
  store i32 720, i32* %"a"
  %".160" = bitcast [3 x i8]* @"str.22" to i8*
  ;  Source: a
  %"a.46" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".160", i32 %"a.46")
  ;  Source: a
  %"a.47" = load i32, i32* %"a"
  ;  Source: -33>>-4
  %".166" = ashr i32 -33, -4
  ;  Source: a=-33>>-4;
  store i32 %".166", i32* %"a"
  %".169" = bitcast [3 x i8]* @"str.23" to i8*
  ;  Source: a
  %"a.48" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".172" = call i32 (i8*, ...) @"printf"(i8* %".169", i32 %"a.48")
  ;  Source: a
  %"a.49" = load i32, i32* %"a"
  ;  Source: a=1&8784573;
  store i32 1, i32* %"a"
  %".176" = bitcast [3 x i8]* @"str.24" to i8*
  ;  Source: a
  %"a.50" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".179" = call i32 (i8*, ...) @"printf"(i8* %".176", i32 %"a.50")
  ;  Source: a
  %"a.51" = load i32, i32* %"a"
  ;  Source: a=898|98;
  store i32 994, i32* %"a"
  %".183" = bitcast [3 x i8]* @"str.25" to i8*
  ;  Source: a
  %"a.52" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".183", i32 %"a.52")
  ;  Source: a
  %"a.53" = load i32, i32* %"a"
  ;  Source: a=!-97435345;
  store i32 0, i32* %"a"
  %".190" = bitcast [3 x i8]* @"str.26" to i8*
  ;  Source: a
  %"a.54" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".193" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %"a.54")
  ;  Source: a
  %"a.55" = load i32, i32* %"a"
  ;  Source: a=9787^-9987;
  store i32 -314, i32* %"a"
  %".197" = bitcast [3 x i8]* @"str.27" to i8*
  ;  Source: a
  %"a.56" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".200" = call i32 (i8*, ...) @"printf"(i8* %".197", i32 %"a.56")
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
@"str.27" = internal constant [3 x i8] c"%d\00"