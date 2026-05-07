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
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: number
  %"number.1" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"number.1")
  ;  Source: number
  %"number.2" = load i32, i32* %"number"
  ;  Source: number++;
  %".9" = load i32, i32* %"number"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"number"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: number
  %"number.3" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"number.3")
  ;  Source: number
  %"number.4" = load i32, i32* %"number"
  ;  Source: number
  %"number.5" = load i32, i32* %"number"
  ;  Source: number++
  %".19" = load i32, i32* %"number"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"number"
  ;  Source: number=number++;
  store i32 %".19", i32* %"number"
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: number
  %"number.6" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"number.6")
  %"n" = alloca i32
  %"number.7" = load i32, i32* %"number"
  %".28" = load i32, i32* %"number"
  %".29" = add i32 %".28", 1
  store i32 %".29", i32* %"number"
  store i32 %".28", i32* %"n"
  %".32" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: number
  %"number.8" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"number.8")
  %".36" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"n.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"