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
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  %"f" = alloca i32
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: (a||b)
  %".14" = icmp ne i32 %"a.2", 0
  %".15" = icmp ne i32 %"b.2", 0
  %".16" = or i1 %".14", %".15"
  %".17" = zext i1 %".16" to i32
  ;  Source: !(a||b)
  %".19" = icmp eq i32 %".17", 0
  %".20" = zext i1 %".19" to i32
  ;  Source: f=!(a||b);
  store i32 %".20", i32* %"f"
  %".23" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"f.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"