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
  ;  Source: intb;
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  ;  Source: switch(a){case1:b=1;break;default:b=3;break;}
  %"a.1" = load i32, i32* %"a"
  switch i32 %"a.1", label %"switch.default" [i32 1, label %"switch.case.1"]
switch.end:
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"b.3")
  ;  Source: return0;
  ret i32 0
switch.case.1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  br label %"switch.end"
switch.default:
  %"b.2" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  br label %"switch.end"
}

@"str" = internal constant [3 x i8] c"%d\00"