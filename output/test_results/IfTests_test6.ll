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
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=3;
  store i32 3, i32* %"a"
  ;  Source: if(a){printf("%d",1);}else{printf("%d",2);}
  %"a_load.1" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a_load.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 1)
  br label %"if.end"
if.end:
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: if(a){printf("%d",1);}else{printf("%d",2);}
  %"a_load.3" = load i32, i32* %"a"
  %"ifcond.1" = icmp ne i32 %"a_load.3", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.else:
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 2)
  br label %"if.end"
if.then.1:
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 1)
  br label %"if.end.1"
if.end.1:
  ;  Source: return0;
  ret i32 0
if.else.1:
  %".22" = bitcast [3 x i8]* @"str.3" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 2)
  br label %"if.end.1"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"