; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=1;
  store i32 1, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  %"f" = alloca i32
  ;  Source: intf;
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".23" = icmp ne i32 %"b.2", 0
  %".24" = icmp ne i32 %"c.2", 0
  %".25" = or i1 %".23", %".24"
  %".26" = zext i1 %".25" to i32
  %".27" = icmp eq i32 %".26", 0
  %".28" = zext i1 %".27" to i32
  ;  Source: (a&&!(b||c))
  %".30" = icmp ne i32 %"a.2", 0
  %".31" = icmp ne i32 %".28", 0
  %".32" = and i1 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".33", i32* %"f"
  %".36" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"f.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"