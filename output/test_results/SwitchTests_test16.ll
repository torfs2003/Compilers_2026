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
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: switch(a){case1:b=1;printf("%d",1);case6:printf("%d",6);default:b=3;printf("%d",3);}
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
  br label %"if.end"
if.end:
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",4);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 4)
  ;  Source: return0;
  ret i32 0
if.else:
  %".17" = icmp eq i32 %"a.2", 6
  %".18" = zext i1 %".17" to i32
  %"ifcond.1" = icmp ne i32 %".18", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.then.1:
  %".20" = bitcast [3 x i8]* @"str.1" to i8*
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 6)
  br label %"if.end.1"
if.end.1:
  br label %"if.end"
if.else.1:
  %"b.2" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 3)
  br label %"if.end.1"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"