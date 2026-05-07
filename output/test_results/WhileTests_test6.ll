; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 0, i32* %"b"
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: while(b<5){printf("%d",1);if(a>5){printf("%d",2);break;}printf("%d",3);a++;}
  br label %"while.cond"
while.cond:
  %"b.1" = load i32, i32* %"b"
  %".6" = icmp slt i32 %"b.1", 5
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".9" = bitcast [3 x i8]* @"str" to i8*
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 1)
  %"a.1" = load i32, i32* %"a"
  %".11" = icmp sgt i32 %"a.1", 5
  %".12" = zext i1 %".11" to i32
  %"ifcond" = icmp ne i32 %".12", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  %".23" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",4);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 4)
  ;  Source: return0;
  ret i32 0
if.then:
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 2)
  br label %"while.end"
if.end:
  %".17" = bitcast [3 x i8]* @"str.2" to i8*
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 3)
  %"a.2" = load i32, i32* %"a"
  %".19" = load i32, i32* %"a"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"a"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"