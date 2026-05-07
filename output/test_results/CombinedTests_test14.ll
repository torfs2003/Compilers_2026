; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define void @"reverseCount"(i32 %".1")
{
entry:
  %"toSkip" = alloca i32
  store i32 %".1", i32* %"toSkip"
  %"i" = alloca i32
  ;  Source: inti=10;
  store i32 10, i32* %"i"
  ;  Source: while(i>=1){if(i!=toSkip){printf("%d\n",i);}i--;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".8" = icmp sge i32 %"i.1", 1
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"toSkip.1" = load i32, i32* %"toSkip"
  %".11" = icmp ne i32 %"i.2", %"toSkip.1"
  %".12" = zext i1 %".11" to i32
  %"ifcond" = icmp ne i32 %".12", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ret void
if.then:
  %".14" = bitcast [4 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"i.3")
  br label %"if.end"
if.end:
  %"i.4" = load i32, i32* %"i"
  %".17" = load i32, i32* %"i"
  %".18" = sub i32 %".17", 1
  store i32 %".18", i32* %"i"
  br label %"while.cond"
}

define i32 @"main"()
{
entry:
  %"toSkip" = alloca i32
  ;  Source: inttoSkip=8;
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