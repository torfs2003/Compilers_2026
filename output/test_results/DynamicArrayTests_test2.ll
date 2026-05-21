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
  %"ptr" = alloca i8*
  %".2" = call i8* @"malloc"(i32 5)
  store i8* %".2", i8** %"ptr"
  ;  Source: ptr
  %"ptr_load" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".6" = getelementptr i8, i8* %"ptr_load", i32 4
  %"deref_load" = load i8, i8* %".6"
  ;  Source: *(ptr+4)='a';
  store i8 97, i8* %".6"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr_load.1" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".12" = getelementptr i8, i8* %"ptr_load.1", i32 4
  ;  Source: *(ptr+4)
  %"deref_load.1" = load i8, i8* %".12"
  ;  Source: printf("%c",*(ptr+4));
  %".15" = sext i8 %"deref_load.1" to i32
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".15")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"