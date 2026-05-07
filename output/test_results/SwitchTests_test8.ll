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
  ;  Source: a=200;
  store i32 200, i32* %"a"
  ;  Source: switch(a){default:b=3;printf("%d",3);case1:b=1;printf("%d",1);if(a<3){printf("%d",7);}case6:b=6;printf("%d",6);case2:b=2;printf("%d",2);}
  %"a.2" = load i32, i32* %"a"
  %".10" = icmp eq i32 %"a.2", 1
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 1)
  %"a.3" = load i32, i32* %"a"
  %".16" = icmp slt i32 %"a.3", 3
  %".17" = zext i1 %".16" to i32
  %"ifcond.1" = icmp ne i32 %".17", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.end:
  %".43" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: printf("%d",4);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 4)
  ;  Source: return0;
  ret i32 0
if.else:
  %".23" = icmp eq i32 %"a.2", 6
  %".24" = zext i1 %".23" to i32
  %"ifcond.2" = icmp ne i32 %".24", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.1"
if.then.1:
  %".19" = bitcast [3 x i8]* @"str.1" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 7)
  br label %"if.end.1"
if.end.1:
  br label %"if.end"
if.then.2:
  %"b.2" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %".27" = bitcast [3 x i8]* @"str.2" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 6)
  br label %"if.end.2"
if.end.2:
  br label %"if.end"
if.else.1:
  %".30" = icmp eq i32 %"a.2", 2
  %".31" = zext i1 %".30" to i32
  %"ifcond.3" = icmp ne i32 %".31", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.2"
if.then.3:
  %"b.3" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %".34" = bitcast [3 x i8]* @"str.3" to i8*
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 2)
  br label %"if.end.3"
if.end.3:
  br label %"if.end.2"
if.else.2:
  %"b.4" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".38" = bitcast [3 x i8]* @"str.4" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 3)
  br label %"if.end.3"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"