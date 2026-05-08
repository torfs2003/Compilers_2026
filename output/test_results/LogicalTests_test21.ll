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
  store i32 0, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  store i32 5, i32* %"b"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=5;
  store i32 5, i32* %"b"
  %"c" = alloca i32
  store i32 3, i32* %"c"
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: c=3;
  store i32 3, i32* %"c"
  %"d" = alloca i32
  %"a_load.1" = load i32, i32* %"a"
  %"b_load.1" = load i32, i32* %"b"
  %".14" = icmp ne i32 %"a_load.1", 0
  %".15" = icmp ne i32 %"b_load.1", 0
  %".16" = or i1 %".14", %".15"
  %".17" = zext i1 %".16" to i32
  %"c_load.1" = load i32, i32* %"c"
  %".18" = icmp ne i32 %".17", 0
  %".19" = icmp ne i32 %"c_load.1", 0
  %".20" = and i1 %".18", %".19"
  %".21" = zext i1 %".20" to i32
  store i32 %".21", i32* %"d"
  %".23" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d_load" = load i32, i32* %"d"
  ;  User Comment: /*Explain using CFG*/
  ;  Source: printf("%d",d);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"d_load")
  %"e" = alloca i32
  %"a_load.2" = load i32, i32* %"a"
  %".28" = icmp eq i32 %"a_load.2", 0
  %".29" = zext i1 %".28" to i32
  store i32 %".29", i32* %"e"
  %".31" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"e_load")
  %"f" = alloca i32
  %"a_load.3" = load i32, i32* %"a"
  %"b_load.2" = load i32, i32* %"b"
  %".35" = and i32 %"a_load.3", %"b_load.2"
  store i32 %".35", i32* %"f"
  %".37" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"f_load")
  %"g" = alloca i32
  %"a_load.4" = load i32, i32* %"a"
  %"b_load.3" = load i32, i32* %"b"
  %".41" = or i32 %"a_load.4", %"b_load.3"
  store i32 %".41", i32* %"g"
  %".43" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: g
  %"g_load" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %"g_load")
  %"h" = alloca i32
  %"a_load.5" = load i32, i32* %"a"
  %"b_load.4" = load i32, i32* %"b"
  %".47" = xor i32 %"a_load.5", %"b_load.4"
  store i32 %".47", i32* %"h"
  %".49" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: h
  %"h_load" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"h_load")
  %"i" = alloca i32
  %"a_load.6" = load i32, i32* %"a"
  %".53" = xor i32 %"a_load.6", -1
  store i32 %".53", i32* %"i"
  %".55" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %"i_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"