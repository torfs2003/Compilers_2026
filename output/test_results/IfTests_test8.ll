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
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=1;
  store i32 1, i32* %"b"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %".13" = or i32 %"a.2", %"b.2"
  %"ifcond" = icmp ne i32 %".13", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".15" = bitcast [3 x i8]* @"str" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 1)
  br label %"if.end"
if.end:
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.4" = load i32, i32* %"a"
  %"b.4" = load i32, i32* %"b"
  %".25" = or i32 %"a.4", %"b.4"
  %"ifcond.1" = icmp ne i32 %".25", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  %".27" = bitcast [3 x i8]* @"str.1" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 1)
  br label %"if.end.1"
if.end.1:
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.6" = load i32, i32* %"a"
  %"b.6" = load i32, i32* %"b"
  %".37" = or i32 %"a.6", %"b.6"
  %"ifcond.2" = icmp ne i32 %".37", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.2:
  %".39" = bitcast [3 x i8]* @"str.2" to i8*
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 1)
  br label %"if.end.2"
if.end.2:
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.8" = load i32, i32* %"a"
  %"b.8" = load i32, i32* %"b"
  %".49" = or i32 %"a.8", %"b.8"
  %"ifcond.3" = icmp ne i32 %".49", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.end.3"
if.then.3:
  %".51" = bitcast [3 x i8]* @"str.3" to i8*
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 1)
  br label %"if.end.3"
if.end.3:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"