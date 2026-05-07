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
  %".19" = icmp eq i32 %"b.2", 0
  %".20" = zext i1 %".19" to i32
  %".21" = icmp ne i32 %"a.2", 0
  %".22" = icmp ne i32 %".20", 0
  %".23" = and i1 %".21", %".22"
  %".24" = zext i1 %".23" to i32
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (a&&!b||c)
  %".27" = icmp ne i32 %".24", 0
  %".28" = icmp ne i32 %"c.2", 0
  %".29" = or i1 %".27", %".28"
  %".30" = zext i1 %".29" to i32
  ;  Source: !(a&&!b||c)
  %".32" = icmp eq i32 %".30", 0
  %".33" = zext i1 %".32" to i32
  ;  Source: intd=!(a&&!b||c);
  store i32 %".33", i32* %"d"
  %".36" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"