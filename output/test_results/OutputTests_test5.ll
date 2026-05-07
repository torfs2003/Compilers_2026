; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"number" = alloca i32
  ;  Source: intnumber=-55;
  store i32 -55, i32* %"number"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: number
  %"number.1" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"number.1")
  ;  Source: number
  %"number.2" = load i32, i32* %"number"
  ;  Source: number++;
  %".10" = load i32, i32* %"number"
  %".11" = add i32 %".10", 1
  store i32 %".11", i32* %"number"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: number
  %"number.3" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"number.3")
  ;  Source: number
  %"number.4" = load i32, i32* %"number"
  ;  Source: number
  %"number.5" = load i32, i32* %"number"
  ;  Source: number++
  %".20" = load i32, i32* %"number"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"number"
  ;  Source: number=number++;
  store i32 %".20", i32* %"number"
  %".25" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: number
  %"number.6" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %"number.6")
  %"n" = alloca i32
  ;  Source: number
  %"number.7" = load i32, i32* %"number"
  ;  Source: number++
  %".31" = load i32, i32* %"number"
  %".32" = add i32 %".31", 1
  store i32 %".32", i32* %"number"
  ;  Source: intn=number++;
  store i32 %".31", i32* %"n"
  %".36" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: number
  %"number.8" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"number.8")
  %".40" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %"n.1")
  ;  Source: n
  %"n.2" = load i32, i32* %"n"
  ;  Source: n
  %"n.3" = load i32, i32* %"n"
  ;  Source: n
  %"n.4" = load i32, i32* %"n"
  ;  Source: n++
  %".48" = load i32, i32* %"n"
  %".49" = add i32 %".48", 1
  store i32 %".49", i32* %"n"
  ;  Source: n-n++
  %".52" = sub i32 %"n.3", %".48"
  ;  Source: n=n-n++;
  store i32 %".52", i32* %"n"
  ;  Source: n
  %"n.5" = load i32, i32* %"n"
  ;  Source: ++n;
  %".57" = load i32, i32* %"n"
  %".58" = add i32 %".57", 1
  store i32 %".58", i32* %"n"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"