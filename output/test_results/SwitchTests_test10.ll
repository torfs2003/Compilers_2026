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
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: switch(a){case0:case1:b=1;printf("%d",1);break;case6:b=6;printf("%d",6);break;case2:b=2;printf("%d",2);break;default:b=3;printf("%d",3);break;}
  %"a.2" = load i32, i32* %"a"
  switch i32 %"a.2", label %"switch.default" [i32 0, label %"switch.case.0" i32 1, label %"switch.case.1" i32 6, label %"switch.case.6" i32 2, label %"switch.case.2"]
switch.end:
  %".28" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",4);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case.0:
  br label %"switch.case.1"
switch.case.1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 1)
  br label %"switch.end"
switch.case.6:
  %"b.2" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 6)
  br label %"switch.end"
switch.case.2:
  %"b.3" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 2)
  br label %"switch.end"
switch.default:
  %"b.4" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".25" = bitcast [3 x i8]* @"str.3" to i8*
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 3)
  br label %"switch.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"