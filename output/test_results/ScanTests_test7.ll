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
  %"s" = alloca i32
  ;  Source: ints=0;
  store i32 0, i32* %"s"
  %"k" = alloca i32*
  ;  Source: s
  %"s.1" = load i32, i32* %"s"
  ;  Source: &s
  ;  Source: int*k=&s;
  store i32* %"s", i32** %"k"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: s
  %"s.2" = load i32, i32* %"s"
  ;  Source: printf("%d",s);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"s.2")
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.1" = load i32*, i32** %"k"
  ;  Source: scanf("%d",k);
  %".15" = call i32 (i8*, ...) @"scanf"(i8* %".12", i32* %"k.1")
  %".16" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: s
  %"s.3" = load i32, i32* %"s"
  ;  Source: printf("%d",s);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"s.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"