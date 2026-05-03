; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=33+69789*(69421/51213+(2231-654));
  store i32 110127075, i32* %"a"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"a.2")
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: a=1+1;
  store i32 2, i32* %"a"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a.4")
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=0-6985;
  store i32 -6985, i32* %"a"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"a.6")
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=5*63;
  store i32 315, i32* %"a"
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"a.8")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=99/3622;
  store i32 0, i32* %"a"
  %".35" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"a.10")
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: a=3>1;
  store i32 1, i32* %"a"
  %".42" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"a.12")
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=3<1;
  store i32 0, i32* %"a"
  %".49" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"a.14")
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: a=8897==45647897;
  store i32 0, i32* %"a"
  %".56" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"a.16")
  ;  Source: a
  %"a.17" = load i32, i32* %"a"
  ;  Source: a=+487897;
  store i32 487897, i32* %"a"
  %".63" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: a
  %"a.18" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"a.18")
  ;  Source: a
  %"a.19" = load i32, i32* %"a"
  ;  Source: a=-5;
  store i32 -5, i32* %"a"
  %".70" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: a
  %"a.20" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %"a.20")
  ;  Source: a
  %"a.21" = load i32, i32* %"a"
  ;  Source: a=1&&656;
  store i32 1, i32* %"a"
  %".77" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: a
  %"a.22" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".77", i32 %"a.22")
  ;  Source: a
  %"a.23" = load i32, i32* %"a"
  ;  Source: a=989||68779;
  store i32 1, i32* %"a"
  %".84" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: a
  %"a.24" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %"a.24")
  ;  Source: a
  %"a.25" = load i32, i32* %"a"
  ;  Source: a=!65465;
  store i32 0, i32* %"a"
  %".91" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: a
  %"a.26" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %"a.26")
  ;  Source: a
  %"a.27" = load i32, i32* %"a"
  ;  Source: a=1+(3*6)/(1+3);
  store i32 5, i32* %"a"
  %".98" = bitcast [3 x i8]* @"str.13" to i8*
  ;  Source: a
  %"a.28" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %"a.28")
  ;  Source: a
  %"a.29" = load i32, i32* %"a"
  ;  Source: a=1+3+5*(62/3);
  store i32 104, i32* %"a"
  %".105" = bitcast [3 x i8]* @"str.14" to i8*
  ;  Source: a
  %"a.30" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".105", i32 %"a.30")
  ;  Source: a
  %"a.31" = load i32, i32* %"a"
  ;  Source: a=5*+9;
  store i32 45, i32* %"a"
  %".112" = bitcast [3 x i8]* @"str.15" to i8*
  ;  Source: a
  %"a.32" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".112", i32 %"a.32")
  ;  Source: a
  %"a.33" = load i32, i32* %"a"
  ;  Source: a=33*-5;
  store i32 -165, i32* %"a"
  %".119" = bitcast [3 x i8]* @"str.16" to i8*
  ;  Source: a
  %"a.34" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".119", i32 %"a.34")
  ;  Source: a
  %"a.35" = load i32, i32* %"a"
  ;  Source: a=((-6))*(((5+32/(6532))));
  store i32 -30, i32* %"a"
  %".126" = bitcast [3 x i8]* @"str.17" to i8*
  ;  Source: a
  %"a.36" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".126", i32 %"a.36")
  ;  Source: a
  %"a.37" = load i32, i32* %"a"
  ;  Source: a=1>=3;
  store i32 0, i32* %"a"
  %".133" = bitcast [3 x i8]* @"str.18" to i8*
  ;  Source: a
  %"a.38" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".136" = call i32 (i8*, ...) @"printf"(i8* %".133", i32 %"a.38")
  ;  Source: a
  %"a.39" = load i32, i32* %"a"
  ;  Source: a=695<=44878;
  store i32 1, i32* %"a"
  %".140" = bitcast [3 x i8]* @"str.19" to i8*
  ;  Source: a
  %"a.40" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".143" = call i32 (i8*, ...) @"printf"(i8* %".140", i32 %"a.40")
  ;  Source: a
  %"a.41" = load i32, i32* %"a"
  ;  Source: a=98333!=6565911;
  store i32 1, i32* %"a"
  %".147" = bitcast [3 x i8]* @"str.20" to i8*
  ;  Source: a
  %"a.42" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".147", i32 %"a.42")
  ;  Source: a
  %"a.43" = load i32, i32* %"a"
  ;  Source: a=55%963;
  store i32 55, i32* %"a"
  %".154" = bitcast [3 x i8]* @"str.21" to i8*
  ;  Source: a
  %"a.44" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".157" = call i32 (i8*, ...) @"printf"(i8* %".154", i32 %"a.44")
  ;  Source: a
  %"a.45" = load i32, i32* %"a"
  ;  Source: a=45<<4;
  store i32 720, i32* %"a"
  %".161" = bitcast [3 x i8]* @"str.22" to i8*
  ;  Source: a
  %"a.46" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".164" = call i32 (i8*, ...) @"printf"(i8* %".161", i32 %"a.46")
  ;  Source: a
  %"a.47" = load i32, i32* %"a"
  ;  Source: -33>>-4
  %".167" = ashr i32 -33, -4
  ;  Source: a=-33>>-4;
  store i32 %".167", i32* %"a"
  %".170" = bitcast [3 x i8]* @"str.23" to i8*
  ;  Source: a
  %"a.48" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".173" = call i32 (i8*, ...) @"printf"(i8* %".170", i32 %"a.48")
  ;  Source: a
  %"a.49" = load i32, i32* %"a"
  ;  Source: a=1&8784573;
  store i32 1, i32* %"a"
  %".177" = bitcast [3 x i8]* @"str.24" to i8*
  ;  Source: a
  %"a.50" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".177", i32 %"a.50")
  ;  Source: a
  %"a.51" = load i32, i32* %"a"
  ;  Source: a=898|98;
  store i32 994, i32* %"a"
  %".184" = bitcast [3 x i8]* @"str.25" to i8*
  ;  Source: a
  %"a.52" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".187" = call i32 (i8*, ...) @"printf"(i8* %".184", i32 %"a.52")
  ;  Source: a
  %"a.53" = load i32, i32* %"a"
  ;  Source: a=!-97435345;
  store i32 0, i32* %"a"
  %".191" = bitcast [3 x i8]* @"str.26" to i8*
  ;  Source: a
  %"a.54" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".194" = call i32 (i8*, ...) @"printf"(i8* %".191", i32 %"a.54")
  ;  Source: a
  %"a.55" = load i32, i32* %"a"
  ;  Source: a=9787^-9987;
  store i32 -314, i32* %"a"
  %".198" = bitcast [3 x i8]* @"str.27" to i8*
  ;  Source: a
  %"a.56" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".201" = call i32 (i8*, ...) @"printf"(i8* %".198", i32 %"a.56")
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