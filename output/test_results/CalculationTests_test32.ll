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
  store i32 59, i32* %"a"
  %"c" = alloca i32
  %"a_load" = load i32, i32* %"a"
  %".3" = add i32 63, %"a_load"
  store i32 %".3", i32* %"c"
  %"d" = alloca i32
  store i32 40, i32* %"d"
  %"e" = alloca i32
  store i32 16, i32* %"e"
  %"f" = alloca i32
  store i32 4, i32* %"f"
  %"g" = alloca i32
  store i32 0, i32* %"g"
  %"h" = alloca i32
  store i32 7, i32* %"h"
  %"i" = alloca i32
  store i32 7, i32* %"i"
  %"j" = alloca i32
  store i32 -43, i32* %"j"
  %"k" = alloca i32
  store i32 32, i32* %"k"
  %"l" = alloca i32
  store i32 2, i32* %"l"
  %"m" = alloca i32
  store i32 1, i32* %"m"
  %"n" = alloca i32
  store i32 1, i32* %"n"
  %"o" = alloca i32
  store i32 1, i32* %"o"
  %"p" = alloca i32
  store i32 0, i32* %"p"
  %"q" = alloca i32
  store i32 32, i32* %"q"
  %"r" = alloca i32
  store i32 2, i32* %"r"
  %"s" = alloca i32
  store i32 4, i32* %"s"
  %"t" = alloca i32
  store i32 7, i32* %"t"
  %"u" = alloca i32
  store i32 -479, i32* %"u"
  %"v" = alloca i32
  store i32 64, i32* %"v"
  %"w" = alloca i32
  store i32 2, i32* %"w"
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %"y" = alloca i32
  store i32 1, i32* %"y"
  %"z" = alloca i32
  store i32 1, i32* %"z"
  %"sofa" = alloca i32
  store i32 -2657055290, i32* %"sofa"
  %"appel" = alloca i32
  store i32 -2112454934, i32* %"appel"
  %".30" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"a_load.1")
  %".34" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"c_load")
  %".38" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: d
  %"d_load" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"d_load")
  %".42" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"e_load")
  %".46" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %"f_load")
  %".50" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: g
  %"g_load" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %"g_load")
  %".54" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: h
  %"h_load" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %"h_load")
  %".58" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %"i_load")
  %".62" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: j
  %"j_load" = load i32, i32* %"j"
  ;  Source: printf("%d",j);
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %"j_load")
  %".66" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: k
  %"k_load" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %"k_load")
  %".70" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: l
  %"l_load" = load i32, i32* %"l"
  ;  Source: printf("%d",l);
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %"l_load")
  %".74" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: m
  %"m_load" = load i32, i32* %"m"
  ;  Source: printf("%d",m);
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %"m_load")
  %".78" = bitcast [3 x i8]* @"str.12" to i8*
  ;  Source: n
  %"n_load" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %"n_load")
  %".82" = bitcast [3 x i8]* @"str.13" to i8*
  ;  Source: o
  %"o_load" = load i32, i32* %"o"
  ;  Source: printf("%d",o);
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %"o_load")
  %".86" = bitcast [3 x i8]* @"str.14" to i8*
  ;  Source: p
  %"p_load" = load i32, i32* %"p"
  ;  Source: printf("%d",p);
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %"p_load")
  %".90" = bitcast [3 x i8]* @"str.15" to i8*
  ;  Source: q
  %"q_load" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 %"q_load")
  %".94" = bitcast [3 x i8]* @"str.16" to i8*
  ;  Source: r
  %"r_load" = load i32, i32* %"r"
  ;  Source: printf("%d",r);
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %"r_load")
  %".98" = bitcast [3 x i8]* @"str.17" to i8*
  ;  Source: s
  %"s_load" = load i32, i32* %"s"
  ;  Source: printf("%d",s);
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %"s_load")
  %".102" = bitcast [3 x i8]* @"str.18" to i8*
  ;  Source: t
  %"t_load" = load i32, i32* %"t"
  ;  Source: printf("%d",t);
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %"t_load")
  %".106" = bitcast [3 x i8]* @"str.19" to i8*
  ;  Source: u
  %"u_load" = load i32, i32* %"u"
  ;  Source: printf("%d",u);
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".106", i32 %"u_load")
  %".110" = bitcast [3 x i8]* @"str.20" to i8*
  ;  Source: v
  %"v_load" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".110", i32 %"v_load")
  %".114" = bitcast [3 x i8]* @"str.21" to i8*
  ;  Source: w
  %"w_load" = load i32, i32* %"w"
  ;  Source: printf("%d",w);
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".114", i32 %"w_load")
  %".118" = bitcast [3 x i8]* @"str.22" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".118", i32 %"x_load")
  %".122" = bitcast [3 x i8]* @"str.23" to i8*
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: printf("%d",y);
  %".125" = call i32 (i8*, ...) @"printf"(i8* %".122", i32 %"y_load")
  %".126" = bitcast [3 x i8]* @"str.24" to i8*
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".126", i32 %"z_load")
  %".130" = bitcast [3 x i8]* @"str.25" to i8*
  ;  Source: sofa
  %"sofa_load" = load i32, i32* %"sofa"
  ;  Source: printf("%d",sofa);
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".130", i32 %"sofa_load")
  %".134" = bitcast [3 x i8]* @"str.26" to i8*
  ;  Source: appel
  %"appel_load" = load i32, i32* %"appel"
  ;  Source: printf("%d",appel);
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".134", i32 %"appel_load")
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