; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  %"c" = alloca i32
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
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".19" = icmp ne i32 %"b.2", 0
  %".20" = icmp ne i32 %"c.2", 0
  %".21" = or i1 %".19", %".20"
  %".22" = zext i1 %".21" to i32
  %".23" = icmp eq i32 %".22", 0
  %".24" = zext i1 %".23" to i32
  ;  Source: (a&&!(b||c))
  %".26" = icmp ne i32 %"a.2", 0
  %".27" = icmp ne i32 %".24", 0
  %".28" = and i1 %".26", %".27"
  %".29" = zext i1 %".28" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".29", i32* %"f"
  %".32" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"f.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"