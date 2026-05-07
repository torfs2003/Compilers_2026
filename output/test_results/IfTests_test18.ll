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
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: if(b){printf("%d",1);intx=0;printf("%d",x);}else{printf("%d",2);intx=1;printf("%d",x);}
  %"b.2" = load i32, i32* %"b"
  %"ifcond" = icmp ne i32 %"b.2", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".14" = bitcast [3 x i8]* @"str" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 1)
  %"x" = alloca i32
  store i32 0, i32* %"x"
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  %"x.1" = load i32, i32* %"x"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"x.1")
  br label %"if.end"
if.end:
  %"b.3" = load i32, i32* %"b"
  %".26" = icmp eq i32 %"b.3", 0
  %".27" = zext i1 %".26" to i32
  %"ifcond.1" = icmp ne i32 %".27", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.else:
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 2)
  store i32 1, i32* %"x"
  %".23" = bitcast [3 x i8]* @"str.3" to i8*
  %"x.2" = load i32, i32* %"x"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"x.2")
  br label %"if.end"
if.then.1:
  %".29" = bitcast [3 x i8]* @"str.4" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 4)
  %"y" = alloca i32
  store i32 1, i32* %"y"
  %".32" = bitcast [3 x i8]* @"str.5" to i8*
  %"y.1" = load i32, i32* %"y"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"y.1")
  br label %"if.end.1"
if.end.1:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"