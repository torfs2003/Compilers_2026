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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"number" = alloca i32
  ;  Source: intnumber=-55;
  store i32 -55, i32* %"number"
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: number
  %"number.1" = load i32, i32* %"number"
  ;  Source: number++
  %".9" = load i32, i32* %"number"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"number"
  ;  Source: a=number++;
  store i32 %".9", i32* %"a"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a.2")
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: number
  %"number.2" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"number.2")
  ;  Source: number
  %"number.3" = load i32, i32* %"number"
  ;  Source: number
  %"number.4" = load i32, i32* %"number"
  ;  Source: number++
  %".25" = load i32, i32* %"number"
  %".26" = add i32 %".25", 1
  store i32 %".26", i32* %"number"
  ;  Source: number=number++;
  store i32 %".25", i32* %"number"
  %".30" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: number
  %"number.5" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"number.5")
  %"n" = alloca i32
  ;  Source: number
  %"number.6" = load i32, i32* %"number"
  ;  Source: number++
  %".36" = load i32, i32* %"number"
  %".37" = add i32 %".36", 1
  store i32 %".37", i32* %"number"
  ;  Source: intn=number++;
  store i32 %".36", i32* %"n"
  %".41" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: number
  %"number.7" = load i32, i32* %"number"
  ;  Source: printf("%d",number);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"number.7")
  %".45" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %"n.1")
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: n
  %"n.2" = load i32, i32* %"n"
  ;  Source: ++n
  %".52" = load i32, i32* %"n"
  %".53" = add i32 %".52", 1
  store i32 %".53", i32* %"n"
  ;  Source: a=++n;
  store i32 %".53", i32* %"a"
  %".57" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %"a.4")
  %".61" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: n
  %"n.3" = load i32, i32* %"n"
  ;  Source: printf("%d",n);
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %"n.3")
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