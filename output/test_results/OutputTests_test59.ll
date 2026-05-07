; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 50, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".3" = add i32 %"a.1", 10
  store i32 %".3", i32* %"b"
  %"b.1" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %".5" = add i32 %"a.2", 20
  store i32 %".5", i32* %"b.1"
  %".7" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: b
  %"b.2" = load i32, i32* %"b.1"
  ;  Source: printf("%d\n",b);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"b.2")
  %".11" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.3" = load i32, i32* %"b.1"
  ;  Source: printf("%d\n",b);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"b.3")
  %".15" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d\n",a);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"a.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"