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
  %"k" = alloca [2 x i8]
  %".2" = getelementptr [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  store i8 98, i8* %".2"
  %".4" = getelementptr [2 x i8], [2 x i8]* %"k", i32 0, i32 1
  store i8 98, i8* %".4"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  ;  Source: *k
  %"array_deref" = getelementptr [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %"deref_load" = load i8, i8* %"array_deref"
  ;  Source: printf("%c",*k);
  %".10" = sext i8 %"deref_load" to i32
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".10")
  %".12" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: k
  ;  Source: k
  ;  Source: scanf("%c%c",k,k);
  %".16" = getelementptr inbounds [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %".17" = getelementptr inbounds [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"scanf"(i8* %".12", i8* %".16", i8* %".17")
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  ;  Source: *k
  %"array_deref.1" = getelementptr [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %"deref_load.1" = load i8, i8* %"array_deref.1"
  ;  Source: printf("%c",*k);
  %".23" = sext i8 %"deref_load.1" to i32
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".23")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [5 x i8] c"%c%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"