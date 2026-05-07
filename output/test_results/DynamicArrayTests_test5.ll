; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"f" = alloca i8*
  ;  Source: calloc(10,4)
  %".3" = call i8* @"calloc"(i32 10, i32 4)
  ;  Source: (char*)calloc(10,4)
  ;  Source: char*f=(char*)calloc(10,4);
  store i8* %".3", i8** %"f"
  ;  Source: f
  %"f.1" = load i8*, i8** %"f"
  ;  Source: (f+9)
  %".9" = getelementptr i8, i8* %"f.1", i32 9
  %"deref_load" = load i8, i8* %".9"
  ;  Source: *(f+9)=5;
  %".11" = trunc i32 5 to i8
  store i8 %".11", i8* %".9"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i8*, i8** %"f"
  ;  Source: (f+9)
  %".16" = getelementptr i8, i8* %"f.2", i32 9
  ;  Source: *(f+9)
  %"deref_load.1" = load i8, i8* %".16"
  ;  Source: printf("%d",*(f+9));
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".13", i8 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"