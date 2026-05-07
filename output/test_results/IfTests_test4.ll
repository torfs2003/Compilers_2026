; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"r" = alloca i32
  ;  Source: intr=5;
  store i32 5, i32* %"r"
  ;  Source: if(r){printf("%d",r);inta=0;printf("%d",a);if(6){intc=0;printf("%d",c);}intq=0;printf("%d",q);}
  %"r.1" = load i32, i32* %"r"
  %"ifcond" = icmp ne i32 %"r.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".6" = bitcast [3 x i8]* @"str" to i8*
  %"r.2" = load i32, i32* %"r"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"r.2")
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  %"a.1" = load i32, i32* %"a"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"a.1")
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  %"c.1" = load i32, i32* %"c"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"c.1")
  %"q" = alloca i32
  store i32 0, i32* %"q"
  %".15" = bitcast [3 x i8]* @"str.3" to i8*
  %"q.1" = load i32, i32* %"q"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"q.1")
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"