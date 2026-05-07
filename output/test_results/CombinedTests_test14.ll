; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"reverseCount"(i32 %".1")
{
entry:
  %"toSkip" = alloca i32
  store i32 %".1", i32* %"toSkip"
  %"i" = alloca i32
  store i32 10, i32* %"i"
  ;  Source: while(i>=1){if(i!=toSkip){printf("%d\n",i);}i--;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".7" = icmp sge i32 %"i.1", 1
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"toSkip.1" = load i32, i32* %"toSkip"
  %".10" = icmp ne i32 %"i.2", %"toSkip.1"
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ret void
if.then:
  %".13" = bitcast [4 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"i.3")
  br label %"if.end"
if.end:
  %"i.4" = load i32, i32* %"i"
  %".16" = load i32, i32* %"i"
  %".17" = sub i32 %".16", 1
  store i32 %".17", i32* %"i"
  br label %"while.cond"
}

define i32 @"main"()
{
entry:
  %"toSkip" = alloca i32
  store i32 8, i32* %"toSkip"
  ;  Source: toSkip
  %"toSkip.1" = load i32, i32* %"toSkip"
  ;  Source: reverseCount(toSkip);
  call void @"reverseCount"(i32 %"toSkip.1")
  ;  Source: toSkip
  %"toSkip.2" = load i32, i32* %"toSkip"
  ;  Source: toSkip=3;
  store i32 3, i32* %"toSkip"
  ;  Source: toSkip
  %"toSkip.3" = load i32, i32* %"toSkip"
  ;  Source: reverseCount(toSkip);
  call void @"reverseCount"(i32 %"toSkip.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"