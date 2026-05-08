; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"f" = alloca i8*
  %".2" = call i8* @"calloc"(i32 10, i32 4)
  store i8* %".2", i8** %"f"
  ;  Source: f
  %"f_load" = load i8*, i8** %"f"
  ;  Source: (f+9)
  %".6" = getelementptr i8, i8* %"f_load", i32 9
  %"deref_load" = load i8, i8* %".6"
  ;  Source: *(f+9)=5;
  %".8" = trunc i32 5 to i8
  store i8 %".8", i8* %".6"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f_load.1" = load i8*, i8** %"f"
  ;  Source: (f+9)
  %".13" = getelementptr i8, i8* %"f_load.1", i32 9
  ;  Source: *(f+9)
  %"deref_load.1" = load i8, i8* %".13"
  ;  Source: printf("%d",*(f+9));
  %".16" = sext i8 %"deref_load.1" to i32
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".16")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"