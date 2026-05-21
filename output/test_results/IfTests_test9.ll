; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: if(a&&b){printf("%d",1);}elseif(a||b){printf("%d",2);}else{printf("%d",3);}
  %"a_load.1" = load i32, i32* %"a"
  %"b_load.1" = load i32, i32* %"b"
  %".11" = icmp ne i32 %"a_load.1", 0
  %".12" = icmp ne i32 %"b_load.1", 0
  %".13" = and i1 %".11", %".12"
  %".14" = zext i1 %".13" to i32
  %"ifcond" = icmp ne i32 %".14", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".16" = bitcast [3 x i8]* @"str" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 1)
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
if.else:
  %"a_load.2" = load i32, i32* %"a"
  %"b_load.2" = load i32, i32* %"b"
  %".19" = icmp ne i32 %"a_load.2", 0
  %".20" = icmp ne i32 %"b_load.2", 0
  %".21" = or i1 %".19", %".20"
  %".22" = zext i1 %".21" to i32
  %"ifcond.1" = icmp ne i32 %".22", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.then.1:
  %".24" = bitcast [3 x i8]* @"str.1" to i8*
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 2)
  br label %"if.end.1"
if.end.1:
  br label %"if.end"
if.else.1:
  %".27" = bitcast [3 x i8]* @"str.2" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 3)
  br label %"if.end.1"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"