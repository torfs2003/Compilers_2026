; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: chara=10;
  %".3" = trunc i32 10 to i8
  store i8 %".3", i8* %"a"
  %"b" = alloca i8
  ;  Source: charb=245;
  %".6" = trunc i32 245 to i8
  store i8 %".6", i8* %"b"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: b
  %"b.1" = load i8, i8* %"b"
  ;  Source: a<b
  %".12" = icmp slt i8 %"a.1", %"b.1"
  %".13" = zext i1 %".12" to i32
  ;  Source: printf("%d",a<b);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"