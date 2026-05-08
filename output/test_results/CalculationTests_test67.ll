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
  %"a" = alloca i32
  store i32 6, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=6;
  store i32 6, i32* %"a"
  %"b" = alloca i32
  store i32 2, i32* %"b"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=2;
  store i32 2, i32* %"b"
  %"c" = alloca i32
  %"a_load.1" = load i32, i32* %"a"
  %"b_load.1" = load i32, i32* %"b"
  %".10" = add i32 %"a_load.1", %"b_load.1"
  store i32 %".10", i32* %"c"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"c_load")
  %"d" = alloca i32
  %"a_load.2" = load i32, i32* %"a"
  %"b_load.2" = load i32, i32* %"b"
  %".16" = sub i32 %"a_load.2", %"b_load.2"
  store i32 %".16", i32* %"d"
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: d
  %"d_load" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"d_load")
  %"e" = alloca i32
  %"a_load.3" = load i32, i32* %"a"
  %"b_load.3" = load i32, i32* %"b"
  %".22" = mul i32 %"a_load.3", %"b_load.3"
  store i32 %".22", i32* %"e"
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"e_load")
  %"f" = alloca i32
  %"a_load.4" = load i32, i32* %"a"
  %"b_load.4" = load i32, i32* %"b"
  %".28" = sdiv i32 %"a_load.4", %"b_load.4"
  store i32 %".28", i32* %"f"
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"f_load")
  %"g" = alloca i32
  %"a_load.5" = load i32, i32* %"a"
  %"b_load.5" = load i32, i32* %"b"
  %".34" = icmp eq i32 %"a_load.5", %"b_load.5"
  %".35" = zext i1 %".34" to i32
  store i32 %".35", i32* %"g"
  %".37" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g_load" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"g_load")
  %"h" = alloca i32
  %"a_load.6" = load i32, i32* %"a"
  %"b_load.6" = load i32, i32* %"b"
  %".41" = icmp slt i32 %"a_load.6", %"b_load.6"
  %".42" = zext i1 %".41" to i32
  store i32 %".42", i32* %"h"
  %".44" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h_load" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"h_load")
  %"i" = alloca i32
  %"a_load.7" = load i32, i32* %"a"
  %"b_load.7" = load i32, i32* %"b"
  %".48" = icmp sgt i32 %"a_load.7", %"b_load.7"
  %".49" = zext i1 %".48" to i32
  store i32 %".49", i32* %"i"
  %".51" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"i_load")
  %"j" = alloca i32
  %"a_load.8" = load i32, i32* %"a"
  %"b_load.8" = load i32, i32* %"b"
  %".55" = icmp ne i32 %"a_load.8", %"b_load.8"
  %".56" = zext i1 %".55" to i32
  store i32 %".56", i32* %"j"
  %".58" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: j
  %"j_load" = load i32, i32* %"j"
  ;  Source: printf("%d",j);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %"j_load")
  %"k" = alloca i32
  %"a_load.9" = load i32, i32* %"a"
  %"b_load.9" = load i32, i32* %"b"
  %".62" = icmp sle i32 %"a_load.9", %"b_load.9"
  %".63" = zext i1 %".62" to i32
  store i32 %".63", i32* %"k"
  %".65" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: k
  %"k_load" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %"k_load")
  %"l" = alloca i32
  %"a_load.10" = load i32, i32* %"a"
  %"b_load.10" = load i32, i32* %"b"
  %".69" = icmp sge i32 %"a_load.10", %"b_load.10"
  %".70" = zext i1 %".69" to i32
  store i32 %".70", i32* %"l"
  %".72" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: l
  %"l_load" = load i32, i32* %"l"
  ;  Source: printf("%d",l);
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %"l_load")
  %"m" = alloca i32
  %"a_load.11" = load i32, i32* %"a"
  %"b_load.11" = load i32, i32* %"b"
  %".76" = srem i32 %"a_load.11", %"b_load.11"
  store i32 %".76", i32* %"m"
  %".78" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: m
  %"m_load" = load i32, i32* %"m"
  ;  Source: printf("%d",m);
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %"m_load")
  %"n" = alloca i32
  %"a_load.12" = load i32, i32* %"a"
  %"b_load.12" = load i32, i32* %"b"
  %".82" = shl i32 %"a_load.12", %"b_load.12"
  store i32 %".82", i32* %"n"
  %".84" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: n
  %"n_load" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %"n_load")
  %"o" = alloca i32
  %"a_load.13" = load i32, i32* %"a"
  %"b_load.13" = load i32, i32* %"b"
  %".88" = ashr i32 %"a_load.13", %"b_load.13"
  store i32 %".88", i32* %"o"
  %".90" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: printf("%d",0);
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 0)
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