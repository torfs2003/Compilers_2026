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
  ;  Source: a=654*(15486-(15000+486));
  store i32 0, i32* %"a"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a.4")
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=1&&(1||0);
  store i32 1, i32* %"a"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"a.6")
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=0&&(1&&1);
  store i32 0, i32* %"a"
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"a.8")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=0||(0*3);
  store i32 0, i32* %"a"
  %".35" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"a.10")
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: a=1&&(!(1+0));
  store i32 0, i32* %"a"
  %".42" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"a.12")
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=12+(98721+36265/456)*(0+1687);
  store i32 166675612, i32* %"a"
  %".49" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"a.14")
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: a=12+(98721*0+36265/456)*(0);
  store i32 12, i32* %"a"
  %".56" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"a.16")
  ;  Source: a
  %"a.17" = load i32, i32* %"a"
  ;  Source: a=(12321>(9656+3));
  store i32 1, i32* %"a"
  %".63" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: a
  %"a.18" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"a.18")
  ;  Source: a
  %"a.19" = load i32, i32* %"a"
  ;  Source: a=(125154<(54>-65));
  store i32 0, i32* %"a"
  %".70" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: a
  %"a.20" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %"a.20")
  ;  Source: a
  %"a.21" = load i32, i32* %"a"
  ;  Source: a=987842121>=212;
  store i32 1, i32* %"a"
  %".77" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: a
  %"a.22" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".77", i32 %"a.22")
  ;  Source: a
  %"a.23" = load i32, i32* %"a"
  ;  Source: a=-6549<=(2189+63);
  store i32 1, i32* %"a"
  %".84" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: a
  %"a.24" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %"a.24")
  ;  Source: a
  %"a.25" = load i32, i32* %"a"
  ;  Source: a=0>=(-564654);
  store i32 1, i32* %"a"
  %".91" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: a
  %"a.26" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %"a.26")
  ;  Source: a
  %"a.27" = load i32, i32* %"a"
  ;  Source: a=540!=58973;
  store i32 1, i32* %"a"
  %".98" = bitcast [3 x i8]* @"str.13" to i8*
  ;  Source: a
  %"a.28" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %"a.28")
  ;  Source: a
  %"a.29" = load i32, i32* %"a"
  ;  Source: a=-5!=-5;
  store i32 0, i32* %"a"
  %".105" = bitcast [3 x i8]* @"str.14" to i8*
  ;  Source: a
  %"a.30" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".105", i32 %"a.30")
  ;  Source: a
  %"a.31" = load i32, i32* %"a"
  ;  Source: a=(-5*20)!=((-4*25));
  store i32 0, i32* %"a"
  %".112" = bitcast [3 x i8]* @"str.15" to i8*
  ;  Source: a
  %"a.32" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".112", i32 %"a.32")
  ;  Source: a
  %"a.33" = load i32, i32* %"a"
  ;  Source: a=9%10;
  store i32 9, i32* %"a"
  %".119" = bitcast [3 x i8]* @"str.16" to i8*
  ;  Source: a
  %"a.34" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".119", i32 %"a.34")
  ;  Source: a
  %"a.35" = load i32, i32* %"a"
  ;  Source: a=19%10;
  store i32 9, i32* %"a"
  %".126" = bitcast [3 x i8]* @"str.17" to i8*
  ;  Source: a
  %"a.36" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".126", i32 %"a.36")
  ;  Source: a
  %"a.37" = load i32, i32* %"a"
  ;  Source: a=8971%8;
  store i32 3, i32* %"a"
  %".133" = bitcast [3 x i8]* @"str.18" to i8*
  ;  Source: a
  %"a.38" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".136" = call i32 (i8*, ...) @"printf"(i8* %".133", i32 %"a.38")
  ;  Source: a
  %"a.39" = load i32, i32* %"a"
  ;  Source: a=1024<<4;
  store i32 16384, i32* %"a"
  %".140" = bitcast [3 x i8]* @"str.19" to i8*
  ;  Source: a
  %"a.40" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".143" = call i32 (i8*, ...) @"printf"(i8* %".140", i32 %"a.40")
  ;  Source: a
  %"a.41" = load i32, i32* %"a"
  ;  Source: a=2048>>3;
  store i32 256, i32* %"a"
  %".147" = bitcast [3 x i8]* @"str.20" to i8*
  ;  Source: a
  %"a.42" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".147", i32 %"a.42")
  ;  Source: a
  %"a.43" = load i32, i32* %"a"
  ;  Source: 2048>>-3
  %".153" = ashr i32 2048, -3
  ;  Source: a=2048>>-3;
  store i32 %".153", i32* %"a"
  %".156" = bitcast [3 x i8]* @"str.21" to i8*
  ;  Source: a
  %"a.44" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".156", i32 %"a.44")
  ;  Source: a
  %"a.45" = load i32, i32* %"a"
  ;  Source: a=23423^7345345;
  store i32 7360446, i32* %"a"
  %".163" = bitcast [3 x i8]* @"str.22" to i8*
  ;  Source: a
  %"a.46" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".166" = call i32 (i8*, ...) @"printf"(i8* %".163", i32 %"a.46")
  ;  Source: a
  %"a.47" = load i32, i32* %"a"
  ;  Source: a=843&-86;
  store i32 778, i32* %"a"
  %".170" = bitcast [3 x i8]* @"str.23" to i8*
  ;  Source: a
  %"a.48" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".173" = call i32 (i8*, ...) @"printf"(i8* %".170", i32 %"a.48")
  ;  Source: a
  %"a.49" = load i32, i32* %"a"
  ;  Source: a=954|976;
  store i32 1018, i32* %"a"
  %".177" = bitcast [3 x i8]* @"str.24" to i8*
  ;  Source: a
  %"a.50" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".177", i32 %"a.50")
  ;  Source: a
  %"a.51" = load i32, i32* %"a"
  ;  Source: a=!9736;
  store i32 0, i32* %"a"
  %".184" = bitcast [3 x i8]* @"str.25" to i8*
  ;  Source: a
  %"a.52" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".187" = call i32 (i8*, ...) @"printf"(i8* %".184", i32 %"a.52")
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