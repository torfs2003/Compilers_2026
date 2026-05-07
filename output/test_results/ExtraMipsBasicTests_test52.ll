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
  %"c" = alloca [3 x i8]
  ;  Source: charc[3]={'a','b','c'};
  %".3" = getelementptr [3 x i8], [3 x i8]* %"c", i32 0, i32 0
  store i8 97, i8* %".3"
  %".5" = getelementptr [3 x i8], [3 x i8]* %"c", i32 0, i32 1
  store i8 98, i8* %".5"
  %".7" = getelementptr [3 x i8], [3 x i8]* %"c", i32 0, i32 2
  store i8 99, i8* %".7"
  %"d" = alloca i8*
  ;  Source: c
  ;  Source: char*d=c;
  %".11" = bitcast [3 x i8]* %"c" to i8*
  store i8* %".11", i8** %"d"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: d
  %"d.1" = load i8*, i8** %"d"
  ;  Source: *d
  %"deref_load" = load i8, i8* %"d.1"
  ;  Source: printf("%c",*d);
  %".17" = zext i8 %"deref_load" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  %".19" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: d
  %"d.2" = load i8*, i8** %"d"
  ;  Source: (d+1)
  %".22" = getelementptr i8, i8* %"d.2", i32 1
  ;  Source: *(d+1)
  %"deref_load.1" = load i8, i8* %".22"
  ;  Source: printf("%c",*(d+1));
  %".25" = zext i8 %"deref_load.1" to i32
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".25")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"