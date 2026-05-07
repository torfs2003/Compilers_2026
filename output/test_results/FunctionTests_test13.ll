; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define void @"greet"(i8 %".1")
{
entry:
  %"name" = alloca i8
  store i8 %".1", i8* %"name"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  %".5" = bitcast [18 x i8]* @"str.1" to i8*
  ;  Source: printf("%s","Hello, Professor ");
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %".5")
  %".8" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: name
  %"name.1" = load i8, i8* %"name"
  ;  Source: printf("%c",name);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i8 %"name.1")
  ret void
}

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 120, i8* %"a"
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: greet(a);
  call void @"greet"(i8 %"a.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%s\00"
@"str.1" = internal constant [18 x i8] c"Hello, Professor \00"
@"str.2" = internal constant [3 x i8] c"%c\00"
define void @"hey"()
{
entry:
  %"y" = alloca i32
  ret void
}
