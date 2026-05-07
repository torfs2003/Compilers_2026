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
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=2;
  store i32 2, i32* %"a"
  ;  Source: switch(a){case1:b=1;printf("%d",1);case6:b=6;printf("%d",6);case2:b=2;printf("%d",2);break;default:b=3;printf("%d",3);break;}
  %"a.2" = load i32, i32* %"a"
  switch i32 %"a.2", label %"switch.default" [i32 1, label %"switch.case.1" i32 6, label %"switch.case.6" i32 2, label %"switch.case.2"]
switch.end:
  %".27" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",4);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case.1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 1)
  br label %"switch.case.6"
switch.case.6:
  %"b.2" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 6)
  br label %"switch.case.2"
switch.case.2:
  %"b.3" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 2)
  br label %"switch.end"
switch.default:
  %"b.4" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".24" = bitcast [3 x i8]* @"str.3" to i8*
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 3)
  br label %"switch.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"