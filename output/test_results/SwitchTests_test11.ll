; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: switch(a){case0:case1:b=1;printf("%d",1);while(1){break;}case6:b=6;printf("%d",6);break;case2:b=2;printf("%d",2);break;default:b=3;printf("%d",3);break;}
  %"a.2" = load i32, i32* %"a"
  switch i32 %"a.2", label %"switch.default" [i32 0, label %"switch.case.0" i32 1, label %"switch.case.1" i32 6, label %"switch.case.6" i32 2, label %"switch.case.2"]
switch.end:
  %".33" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",4);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case.0:
  br label %"switch.case.1"
switch.case.1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".15" = bitcast [3 x i8]* @"str" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 1)
  br label %"while.cond"
switch.case.6:
  %"b.2" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %".22" = bitcast [3 x i8]* @"str.1" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 6)
  br label %"switch.end"
switch.case.2:
  %"b.3" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %".26" = bitcast [3 x i8]* @"str.2" to i8*
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 2)
  br label %"switch.end"
switch.default:
  %"b.4" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 3)
  br label %"switch.end"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  br label %"while.end"
while.end:
  br label %"switch.case.6"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"