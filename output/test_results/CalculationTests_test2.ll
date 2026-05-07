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
  ;  Source: a=1326549+215492154;
  store i32 216818703, i32* %"a"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"a.4")
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=548416;
  store i32 548416, i32* %"a"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"a.6")
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=3-6;
  store i32 -3, i32* %"a"
  %".27" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"a.8")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=-9899563254;
  store i32 -1309628662, i32* %"a"
  %".34" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"a.10")
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: a=+998315;
  store i32 998315, i32* %"a"
  %".41" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"a.12")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"