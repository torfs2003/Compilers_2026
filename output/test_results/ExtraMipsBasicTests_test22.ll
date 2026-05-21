; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"a"()
{
entry:
  ;  Source: return1;
  ret i32 1
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  %".2" = call i32 @"a"()
  store i32 %".2", i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"b.1")
  %"c" = alloca i32
  store i32 5, i32* %"c"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: 4+b
  %".12" = add i32 4, %"b.2"
  ;  Source: c=4+b;
  store i32 %".12", i32* %"c"
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"