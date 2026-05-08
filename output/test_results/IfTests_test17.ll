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
  %"x" = alloca i32
  store i32 5, i32* %"x"
  ;  Source: if(x<5){printf("Something went wrong");/* Should not print */}else{printf("Hello world!\n");/* Should print */}
  %"x_load" = load i32, i32* %"x"
  %".4" = icmp slt i32 %"x_load", 5
  %".5" = zext i1 %".4" to i32
  %"ifcond" = icmp ne i32 %".5", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".7" = bitcast [21 x i8]* @"str" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  br label %"if.end"
if.end:
  ;  Source: if(x==5&&1){if(x==5){printf("Hello world!\n");/* Should print */}else{printf("Something went wrong");/* Should not print */}}
  %"x_load.1" = load i32, i32* %"x"
  %".14" = icmp eq i32 %"x_load.1", 5
  %".15" = zext i1 %".14" to i32
  %".16" = icmp ne i32 %".15", 0
  %".17" = icmp ne i32 1, 0
  %".18" = and i1 %".16", %".17"
  %".19" = zext i1 %".18" to i32
  %"ifcond.1" = icmp ne i32 %".19", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.else:
  %".10" = bitcast [14 x i8]* @"str.1" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  br label %"if.end"
if.then.1:
  %"x_load.2" = load i32, i32* %"x"
  %".21" = icmp eq i32 %"x_load.2", 5
  %".22" = zext i1 %".21" to i32
  %"ifcond.2" = icmp ne i32 %".22", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.1"
if.end.1:
  ;  Source: return0;
  ret i32 0
if.then.2:
  %".24" = bitcast [14 x i8]* @"str.2" to i8*
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24")
  br label %"if.end.2"
if.end.2:
  br label %"if.end.1"
if.else.1:
  %".27" = bitcast [21 x i8]* @"str.3" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27")
  br label %"if.end.2"
}

@"str" = internal constant [21 x i8] c"Something went wrong\00"
@"str.1" = internal constant [14 x i8] c"Hello world!\0a\00"
@"str.2" = internal constant [14 x i8] c"Hello world!\0a\00"
@"str.3" = internal constant [21 x i8] c"Something went wrong\00"