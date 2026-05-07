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

@"x" = internal global i32 10
define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x" = load i32, i32* @"x"
  ;  Source: printf("%d;",x);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %"x")
  ;  Source: intx=20;
  store i32 20, i32* @"x"
  %".8" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* @"x"
  ;  Source: printf("%d;",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.1")
  ;  Source: x
  %"x.2" = load i32, i32* @"x"
  ;  Source: x=30;
  store i32 30, i32* @"x"
  %".15" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* @"x"
  ;  Source: printf("%d;",x);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"x.3")
  ;  Source: intx=40;
  store i32 40, i32* @"x"
  %".21" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.4" = load i32, i32* @"x"
  ;  Source: printf("%d;",x);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"x.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d;\00"
@"str.1" = internal constant [4 x i8] c"%d;\00"
@"str.2" = internal constant [4 x i8] c"%d;\00"
@"str.3" = internal constant [4 x i8] c"%d;\00"