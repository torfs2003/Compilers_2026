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
  %"number" = alloca i32
  store i32 -55, i32* %"number"
  %"a" = alloca i32
  store i32 1, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: number
  %"number_load" = load i32, i32* %"number"
  ;  Source: number++
  %".7" = load i32, i32* %"number"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"number"
  ;  Source: a=number++;
  store i32 %".7", i32* %"a"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"a_load.1")
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: number
  %"number_load.1" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"number_load.1")
  ;  Source: number
  %"number_load.2" = load i32, i32* %"number"
  ;  Source: number
  %"number_load.3" = load i32, i32* %"number"
  ;  Source: number++
  %".23" = load i32, i32* %"number"
  %".24" = add i32 %".23", 1
  store i32 %".24", i32* %"number"
  ;  Source: number=number++;
  store i32 %".23", i32* %"number"
  %".28" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: number
  %"number_load.4" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"number_load.4")
  %"n" = alloca i32
  %"number_load.5" = load i32, i32* %"number"
  %".32" = load i32, i32* %"number"
  %".33" = add i32 %".32", 1
  store i32 %".33", i32* %"number"
  store i32 %".32", i32* %"n"
  %".36" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: number
  %"number_load.6" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"number_load.6")
  %".40" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: n
  %"n_load" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %"n_load")
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: n
  %"n_load.1" = load i32, i32* %"n"
  ;  Source: ++n
  %".47" = load i32, i32* %"n"
  %".48" = add i32 %".47", 1
  store i32 %".48", i32* %"n"
  ;  Source: a=++n;
  store i32 %".48", i32* %"a"
  %".52" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a
  %"a_load.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %"a_load.3")
  %".56" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: n
  %"n_load.2" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"n_load.2")
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