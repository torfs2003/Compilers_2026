; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
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
  %".12" = bitcast [3 x i8]* @"str" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 1)
  %"x" = alloca i32
  store i32 0, i32* %"x"
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  %"x.1" = load i32, i32* %"x"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"x.1")
  br label %"if.end"
if.end:
  %"b.3" = load i32, i32* %"b"
  %".24" = icmp eq i32 %"b.3", 0
  %".25" = zext i1 %".24" to i32
  %"ifcond.1" = icmp ne i32 %".25", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.else:
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 2)
  store i32 1, i32* %"x"
  %".21" = bitcast [3 x i8]* @"str.3" to i8*
  %"x.2" = load i32, i32* %"x"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"x.2")
  br label %"if.end"
if.then.1:
  %".27" = bitcast [3 x i8]* @"str.4" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 4)
  %"y" = alloca i32
  store i32 1, i32* %"y"
  %".30" = bitcast [3 x i8]* @"str.5" to i8*
  %"y.1" = load i32, i32* %"y"
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"y.1")
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