; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: while(b<5){printf("%d",1);if(a>5){printf("%d",2);break;}printf("%d",3);a++;}
  br label %"while.cond"
while.cond:
  %"b.1" = load i32, i32* %"b"
  %".8" = icmp slt i32 %"b.1", 5
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".11" = bitcast [3 x i8]* @"str" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 1)
  %"a.1" = load i32, i32* %"a"
  %".13" = icmp sgt i32 %"a.1", 5
  %".14" = zext i1 %".13" to i32
  %"ifcond" = icmp ne i32 %".14", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  %".25" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",4);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 4)
  ;  Source: return0;
  ret i32 0
if.then:
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 2)
  br label %"while.end"
if.end:
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 3)
  %"a.2" = load i32, i32* %"a"
  %".21" = load i32, i32* %"a"
  %".22" = add i32 %".21", 1
  store i32 %".22", i32* %"a"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"