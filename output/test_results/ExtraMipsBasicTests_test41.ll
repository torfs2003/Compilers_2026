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
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  %"c" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %".10" = icmp ne i32 %"a.2", 0
  %".11" = icmp ne i32 %"b.2", 0
  %".12" = and i1 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  store i32 %".13", i32* %"c"
  %".15" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"