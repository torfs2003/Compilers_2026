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
  store i32 0, i32* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x_load")
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x_load.1")
  %"x.1" = alloca i32
  store i32 1, i32* %"x.1"
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x.1"
  ;  Source: printf("%d",x);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"x_load.2")
  ;  Source: if(x){printf("%d",x);intx=2;printf("%d",x);}
  %"x_load.3" = load i32, i32* %"x.1"
  %"ifcond" = icmp ne i32 %"x_load.3", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".18" = bitcast [3 x i8]* @"str.3" to i8*
  %"x_load.4" = load i32, i32* %"x.1"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"x_load.4")
  store i32 2, i32* %"x.1"
  %".21" = bitcast [3 x i8]* @"str.4" to i8*
  %"x_load.5" = load i32, i32* %"x.1"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"x_load.5")
  br label %"if.end"
if.end:
  %".24" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: x
  %"x_load.6" = load i32, i32* %"x.1"
  ;  Source: printf("%d",x);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"x_load.6")
  %".28" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: x
  %"x_load.7" = load i32, i32* %"x.1"
  ;  Source: printf("%d",x);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"x_load.7")
  ;  Source: while(x){continue;}
  br label %"while.cond"
while.cond:
  %"x_load.8" = load i32, i32* %"x.1"
  %"whilecond" = icmp ne i32 %"x_load.8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  br label %"while.cond"
while.end:
  %".36" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: x
  %"x_load.9" = load i32, i32* %"x.1"
  ;  Source: printf("%d",x);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"x_load.9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"