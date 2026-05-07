; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=1;
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=2;
  store i32 2, i32* %"y"
  ;  Source: if(x==y){charz='a';printf("%c",z);}else{intz=5;printf("%d",z);}
  %"x.1" = load i32, i32* %"x"
  %"y.1" = load i32, i32* %"y"
  %".7" = icmp eq i32 %"x.1", %"y.1"
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"z" = alloca i8
  store i8 97, i8* %"z"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  %"z.1" = load i8, i8* %"z"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i8 %"z.1")
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
if.else:
  %".14" = trunc i32 5 to i8
  store i8 %".14", i8* %"z"
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  %"z.2" = load i8, i8* %"z"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i8 %"z.2")
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%d\00"