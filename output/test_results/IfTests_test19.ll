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
  store i32 1, i32* %"x"
  %"y" = alloca i32
  store i32 2, i32* %"y"
  ;  Source: if(x==y){charz='a';printf("%c",z);}else{intz=5;printf("%d",z);}
  %"x_load" = load i32, i32* %"x"
  %"y_load" = load i32, i32* %"y"
  %".5" = icmp eq i32 %"x_load", %"y_load"
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"z" = alloca i8
  store i8 97, i8* %"z"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  %"z_load" = load i8, i8* %"z"
  %".10" = sext i8 %"z_load" to i32
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".10")
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
if.else:
  %".13" = trunc i32 5 to i8
  store i8 %".13", i8* %"z"
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  %"z_load.1" = load i8, i8* %"z"
  %".16" = sext i8 %"z_load.1" to i32
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".16")
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%d\00"