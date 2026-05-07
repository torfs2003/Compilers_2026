; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=3;
  store i32 3, i32* %"a"
  ;  Source: if(a){printf("%d",a);}
  %"a.2" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a.2", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".9" = bitcast [3 x i8]* @"str" to i8*
  %"a.3" = load i32, i32* %"a"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"a.3")
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"