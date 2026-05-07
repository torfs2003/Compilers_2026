; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=9;
  store i32 9, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=6;
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
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".19" = icmp ne i32 %"a.2", 0
  %".20" = icmp ne i32 %"b.2", 0
  %".21" = and i1 %".19", %".20"
  %".22" = zext i1 %".21" to i32
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (a&&b||c)
  %".25" = icmp ne i32 %".22", 0
  %".26" = icmp ne i32 %"c.2", 0
  %".27" = or i1 %".25", %".26"
  %".28" = zext i1 %".27" to i32
  ;  Source: intd=(a&&b||c);
  store i32 %".28", i32* %"d"
  %".31" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"