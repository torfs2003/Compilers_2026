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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca [2 x i32]
  ;  Source: inta[2]={0,1};
  %".3" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  store i32 0, i32* %".3"
  %".5" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 1
  store i32 1, i32* %".5"
  ;  Source: a
  ;  Source: (a+1)
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %".9" = getelementptr i32, i32* %"decay_left", i32 1
  %"deref_load" = load i32, i32* %".9"
  ;  Source: *(a+1)=5;
  store i32 5, i32* %".9"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: (a+1)
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %".15" = getelementptr i32, i32* %"decay_left.1", i32 1
  ;  Source: *(a+1)
  %"deref_load.1" = load i32, i32* %".15"
  ;  Source: printf("%d",*(a+1));
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"