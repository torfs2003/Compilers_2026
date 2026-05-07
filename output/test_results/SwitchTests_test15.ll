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
  ;  Source: a=3;
  store i32 3, i32* %"a"
  ;  Source: switch(a){case1:b=1;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",1);case6:b=6;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",6);case2:b=2;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",2);break;default:b=3;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",3);break;}
  %"a.2" = load i32, i32* %"a"
  switch i32 %"a.2", label %"switch.default" [i32 1, label %"switch.case.1" i32 6, label %"switch.case.6" i32 2, label %"switch.case.2"]
switch.end:
  %".79" = bitcast [3 x i8]* @"str.20" to i8*
  ;  Source: printf("%d",4);
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case.1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %"b.2" = load i32, i32* %"b"
  switch i32 %"b.2", label %"switch.default.1" [i32 1, label %"switch.case.1.1" i32 6, label %"switch.case.6.1" i32 2, label %"switch.case.2.1"]
switch.case.6:
  %"b.3" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %"b.4" = load i32, i32* %"b"
  switch i32 %"b.4", label %"switch.default.2" [i32 1, label %"switch.case.1.2" i32 6, label %"switch.case.6.2" i32 2, label %"switch.case.2.2"]
switch.case.2:
  %"b.5" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %"b.6" = load i32, i32* %"b"
  switch i32 %"b.6", label %"switch.default.3" [i32 1, label %"switch.case.1.3" i32 6, label %"switch.case.6.3" i32 2, label %"switch.case.2.3"]
switch.default:
  %"b.7" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %"b.8" = load i32, i32* %"b"
  switch i32 %"b.8", label %"switch.default.4" [i32 1, label %"switch.case.1.4" i32 6, label %"switch.case.6.4" i32 2, label %"switch.case.2.4"]
switch.end.1:
  %".25" = bitcast [3 x i8]* @"str.4" to i8*
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 1)
  br label %"switch.case.6"
switch.case.1.1:
  %".13" = bitcast [3 x i8]* @"str" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 11)
  br label %"switch.end.1"
switch.case.6.1:
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 66)
  br label %"switch.case.2.1"
switch.case.2.1:
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 22)
  br label %"switch.end.1"
switch.default.1:
  %".22" = bitcast [3 x i8]* @"str.3" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 33)
  br label %"switch.end.1"
switch.end.2:
  %".42" = bitcast [3 x i8]* @"str.9" to i8*
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 6)
  br label %"switch.case.2"
switch.case.1.2:
  %".30" = bitcast [3 x i8]* @"str.5" to i8*
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 11)
  br label %"switch.end.2"
switch.case.6.2:
  %".33" = bitcast [3 x i8]* @"str.6" to i8*
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 66)
  br label %"switch.case.2.2"
switch.case.2.2:
  %".36" = bitcast [3 x i8]* @"str.7" to i8*
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 22)
  br label %"switch.end.2"
switch.default.2:
  %".39" = bitcast [3 x i8]* @"str.8" to i8*
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 33)
  br label %"switch.end.2"
switch.end.3:
  %".59" = bitcast [3 x i8]* @"str.14" to i8*
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".59", i32 2)
  br label %"switch.end"
switch.case.1.3:
  %".47" = bitcast [3 x i8]* @"str.10" to i8*
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 11)
  br label %"switch.end.3"
switch.case.6.3:
  %".50" = bitcast [3 x i8]* @"str.11" to i8*
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 66)
  br label %"switch.case.2.3"
switch.case.2.3:
  %".53" = bitcast [3 x i8]* @"str.12" to i8*
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 22)
  br label %"switch.end.3"
switch.default.3:
  %".56" = bitcast [3 x i8]* @"str.13" to i8*
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 33)
  br label %"switch.end.3"
switch.end.4:
  %".76" = bitcast [3 x i8]* @"str.19" to i8*
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 3)
  br label %"switch.end"
switch.case.1.4:
  %".64" = bitcast [3 x i8]* @"str.15" to i8*
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".64", i32 11)
  br label %"switch.end.4"
switch.case.6.4:
  %".67" = bitcast [3 x i8]* @"str.16" to i8*
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 66)
  br label %"switch.case.2.4"
switch.case.2.4:
  %".70" = bitcast [3 x i8]* @"str.17" to i8*
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 22)
  br label %"switch.end.4"
switch.default.4:
  %".73" = bitcast [3 x i8]* @"str.18" to i8*
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 33)
  br label %"switch.end.4"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"
@"str.9" = internal constant [3 x i8] c"%d\00"
@"str.10" = internal constant [3 x i8] c"%d\00"
@"str.11" = internal constant [3 x i8] c"%d\00"
@"str.12" = internal constant [3 x i8] c"%d\00"
@"str.13" = internal constant [3 x i8] c"%d\00"
@"str.14" = internal constant [3 x i8] c"%d\00"
@"str.15" = internal constant [3 x i8] c"%d\00"
@"str.16" = internal constant [3 x i8] c"%d\00"
@"str.17" = internal constant [3 x i8] c"%d\00"
@"str.18" = internal constant [3 x i8] c"%d\00"
@"str.19" = internal constant [3 x i8] c"%d\00"
@"str.20" = internal constant [3 x i8] c"%d\00"