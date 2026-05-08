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
  store i32 5, i32* %"a"
  %"b" = alloca i32
  store i32 9, i32* %"b"
  %"c" = alloca i32
  store i32 6, i32* %"c"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=5;
  store i32 5, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=9;
  store i32 9, i32* %"b"
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: c=6;
  store i32 6, i32* %"c"
  %"d" = alloca i32
  %"a_load.1" = load i32, i32* %"a"
  %"b_load.1" = load i32, i32* %"b"
  %".14" = icmp eq i32 %"b_load.1", 0
  %".15" = zext i1 %".14" to i32
  %".16" = icmp ne i32 %"a_load.1", 0
  %".17" = icmp ne i32 %".15", 0
  %".18" = and i1 %".16", %".17"
  %".19" = zext i1 %".18" to i32
  %"c_load.1" = load i32, i32* %"c"
  %".20" = icmp ne i32 %".19", 0
  %".21" = icmp ne i32 %"c_load.1", 0
  %".22" = or i1 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  %".24" = icmp eq i32 %".23", 0
  %".25" = zext i1 %".24" to i32
  store i32 %".25", i32* %"d"
  %".27" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d_load" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"d_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"