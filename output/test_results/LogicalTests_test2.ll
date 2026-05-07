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
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=5;
  store i32 5, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=9;
  store i32 9, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c=6;
  store i32 6, i32* %"c"
  %"d" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %".14" = icmp ne i32 %"a.2", 0
  %".15" = icmp ne i32 %"b.2", 0
  %".16" = and i1 %".14", %".15"
  %".17" = zext i1 %".16" to i32
  %"c.2" = load i32, i32* %"c"
  %".18" = icmp ne i32 %".17", 0
  %".19" = icmp ne i32 %"c.2", 0
  %".20" = or i1 %".18", %".19"
  %".21" = zext i1 %".20" to i32
  store i32 %".21", i32* %"d"
  %".23" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"