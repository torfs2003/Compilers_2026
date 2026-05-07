; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"a"()
{
entry:
  ;  Source: return0;
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"b.1")
  %"c" = alloca i32
  store i32 5, i32* %"c"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: 4+b
  %".11" = add i32 4, %"b.2"
  ;  Source: c=4+b;
  store i32 %".11", i32* %"c"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"c.2")
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: 4+b
  %".21" = add i32 4, %"b.3"
  ;  Source: c=4+b;
  store i32 %".21", i32* %"c"
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"c.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"