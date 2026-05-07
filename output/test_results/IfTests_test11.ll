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
  store i32 15, i32* %"a"
  ;  Source: if(a<1000){printf("%d",a);a=6;}else{printf("%d",a);a=8;}
  %"a.1" = load i32, i32* %"a"
  %".4" = icmp slt i32 %"a.1", 1000
  %".5" = zext i1 %".4" to i32
  %"ifcond" = icmp ne i32 %".5", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".7" = bitcast [3 x i8]* @"str" to i8*
  %"a.2" = load i32, i32* %"a"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"a.2")
  %"a.3" = load i32, i32* %"a"
  store i32 6, i32* %"a"
  br label %"if.end"
if.end:
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"a.6")
  ;  Source: return0;
  ret i32 0
if.else:
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  %"a.4" = load i32, i32* %"a"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"a.4")
  %"a.5" = load i32, i32* %"a"
  store i32 8, i32* %"a"
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"