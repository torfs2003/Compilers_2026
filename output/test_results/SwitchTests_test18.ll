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
  ;  Source: inta=9;
  store i32 9, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb;
  ;  Source: switch(a){case1:b=1;printf("%d",1);break;case6:printf("%d",6);break;default:b=3;printf("%d",3);case7:{intb=7;printf("%d",b);}}
  %"a.1" = load i32, i32* %"a"
  switch i32 %"a.1", label %"switch.default" [i32 1, label %"switch.case.1" i32 6, label %"switch.case.6" i32 7, label %"switch.case.7"]
switch.end:
  %".22" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",4);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case.1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 1)
  br label %"switch.end"
switch.case.6:
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 6)
  br label %"switch.end"
switch.default:
  %"b.2" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 3)
  br label %"switch.case.7"
switch.case.7:
  store i32 7, i32* %"b"
  %".19" = bitcast [3 x i8]* @"str.3" to i8*
  %"b.3" = load i32, i32* %"b"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"b.3")
  br label %"switch.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"