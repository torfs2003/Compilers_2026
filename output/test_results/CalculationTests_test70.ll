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
  %"a" = alloca float
  ;  Source: floata=5.0;
  store float 0x4014000000000000, float* %"a"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: (int)a
  %".7" = fptosi float %"a.1" to i32
  ;  Source: printf("%d\n",(int)a);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %".12" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"b.1")
  %"c" = alloca i8
  ;  Source: charc='e';
  store i8 101, i8* %"c"
  %".18" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c\n",c);
  %".21" = zext i8 %"c.1" to i32
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  %"d" = alloca float
  ;  Source: constfloatd=10.01;
  store float 0x4024051ec0000000, float* %"d"
  %".25" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: (int)d
  %".28" = fptosi float %"d.1" to i32
  ;  Source: printf("%d\n",(int)d);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  %"e" = alloca i32
  ;  Source: constinte=2;
  store i32 2, i32* %"e"
  %".33" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d\n",e);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %"e.1")
  %"f" = alloca i8
  ;  Source: constcharf='b';
  store i8 98, i8* %"f"
  %".39" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c\n",c);
  %".42" = zext i8 %"c.2" to i32
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%c\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
@"str.4" = internal constant [4 x i8] c"%d\0a\00"
@"str.5" = internal constant [4 x i8] c"%c\0a\00"