; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"name"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ;  Source: if(a==0){returna;}
  %"a.1" = load i32, i32* %"a"
  %".5" = icmp eq i32 %"a.1", 0
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"a.2" = load i32, i32* %"a"
  ret i32 %"a.2"
if.end:
  ;  Source: returna;
  %"a.3" = load i32, i32* %"a"
  ret i32 %"a.3"
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %".3" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: name(5)
  %".5" = call i32 @"name"(i32 5)
  ;  Source: printf("%d\n",name(5));
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"