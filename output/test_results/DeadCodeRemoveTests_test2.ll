; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: while(1){inta=0;if(a%2==1){continue;intc=0;if(a>4){printf("%d",1);}}printf("%d",a);if(a>10){if(a>4){printf("%d",2);break;printf("%d",3);}else{printf("%d",3);}}a++;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"a.1" = load i32, i32* %"a"
  %".6" = srem i32 %"a.1", 2
  %".7" = icmp eq i32 %".6", 1
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",1);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 1)
  ;  Source: return0;
  ret i32 0
if.then:
  br label %"while.cond"
if.end:
  %".11" = bitcast [3 x i8]* @"str" to i8*
  %"a.2" = load i32, i32* %"a"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"a.2")
  %"a.3" = load i32, i32* %"a"
  %".13" = icmp sgt i32 %"a.3", 10
  %".14" = zext i1 %".13" to i32
  %"ifcond.1" = icmp ne i32 %".14", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  %"a.4" = load i32, i32* %"a"
  %".16" = icmp sgt i32 %"a.4", 4
  %".17" = zext i1 %".16" to i32
  %"ifcond.2" = icmp ne i32 %".17", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else"
if.end.1:
  %"a.5" = load i32, i32* %"a"
  %".26" = load i32, i32* %"a"
  %".27" = add i32 %".26", 1
  store i32 %".27", i32* %"a"
  br label %"while.cond"
if.then.2:
  %".19" = bitcast [3 x i8]* @"str.1" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 2)
  br label %"while.end"
if.end.2:
  br label %"if.end.1"
if.else:
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 3)
  br label %"if.end.2"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"