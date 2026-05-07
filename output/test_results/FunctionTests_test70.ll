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
  %"x" = alloca i32
  ;  Source: intx=0;
  store i32 0, i32* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.2")
  ;  Source: intx=1;
  store i32 1, i32* %"x"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"x.3")
  ;  Source: if(x){printf("%d",x);intx=2;printf("%d",x);}
  %"x.4" = load i32, i32* %"x"
  %"ifcond" = icmp ne i32 %"x.4", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".20" = bitcast [3 x i8]* @"str.3" to i8*
  %"x.5" = load i32, i32* %"x"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"x.5")
  store i32 2, i32* %"x"
  %".23" = bitcast [3 x i8]* @"str.4" to i8*
  %"x.6" = load i32, i32* %"x"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"x.6")
  br label %"if.end"
if.end:
  %".26" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: x
  %"x.7" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"x.7")
  %".30" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: x
  %"x.8" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"x.8")
  ;  Source: while(x){continue;}
  br label %"while.cond"
while.cond:
  %"x.9" = load i32, i32* %"x"
  %"whilecond" = icmp ne i32 %"x.9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  br label %"while.cond"
while.end:
  %".38" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: x
  %"x.10" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"x.10")
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