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
  %"c" = alloca i8*
  ;  Source: malloc(5)
  %".3" = call i8* @"malloc"(i32 5)
  ;  Source: char*c=malloc(5);
  store i8* %".3", i8** %"c"
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  %"deref_load" = load i8, i8* %"c.1"
  ;  Source: *c='a';
  store i8 97, i8* %"c.1"
  ;  Source: c
  %"c.2" = load i8*, i8** %"c"
  ;  Source: (c+1)
  %".11" = getelementptr i8, i8* %"c.2", i32 1
  %"deref_load.1" = load i8, i8* %".11"
  ;  Source: *(c+1)='b';
  store i8 98, i8* %".11"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.3" = load i8*, i8** %"c"
  ;  Source: *c
  %"deref_load.2" = load i8, i8* %"c.3"
  ;  Source: printf("%c",*c);
  %".18" = zext i8 %"deref_load.2" to i32
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".18")
  %".20" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.4" = load i8*, i8** %"c"
  ;  Source: (c+1)
  %".23" = getelementptr i8, i8* %"c.4", i32 1
  ;  Source: *(c+1)
  %"deref_load.3" = load i8, i8* %".23"
  ;  Source: printf("%c",*(c+1));
  %".26" = zext i8 %"deref_load.3" to i32
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".26")
  ;  Source: c
  %"c.5" = load i8*, i8** %"c"
  ;  Source: free(c);
  call void @"free"(i8* %"c.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"