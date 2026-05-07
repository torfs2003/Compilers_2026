; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"k" = alloca [2 x i8]
  ;  Source: chark[2]={'b','b'};
  %".3" = getelementptr [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  store i8 98, i8* %".3"
  %".5" = getelementptr [2 x i8], [2 x i8]* %"k", i32 0, i32 1
  store i8 98, i8* %".5"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  ;  Source: *k
  ;  Source: printf("%c",*k);
  %".11" = getelementptr inbounds [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".7", i8* %".11")
  %".13" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: k
  ;  Source: k
  ;  Source: scanf("%c%c",k,k);
  %".17" = getelementptr inbounds [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %".18" = getelementptr inbounds [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"scanf"(i8* %".13", i8* %".17", i8* %".18")
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  ;  Source: *k
  ;  Source: printf("%c",*k);
  %".24" = getelementptr inbounds [2 x i8], [2 x i8]* %"k", i32 0, i32 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".20", i8* %".24")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [5 x i8] c"%c%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"