; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"max"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: if(a>b){returna;}else{returnb;}
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".7" = icmp sgt i32 %"a.1", %"b.1"
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"a.2" = load i32, i32* %"a"
  ret i32 %"a.2"
if.end:
  ret i32 0
if.else:
  %"b.2" = load i32, i32* %"b"
  ret i32 %"b.2"
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: max(10,11)
  %".4" = call i32 @"max"(i32 10, i32 11)
  ;  Source: printf("%d\n",max(10,11));
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"