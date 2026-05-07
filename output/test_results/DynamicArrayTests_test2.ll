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
  %"ptr" = alloca i8*
  ;  Source: malloc(5)
  %".3" = call i8* @"malloc"(i32 5)
  ;  Source: (char*)malloc(5)
  ;  Source: char*ptr=(char*)malloc(5);
  store i8* %".3", i8** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".9" = getelementptr i8, i8* %"ptr.1", i32 4
  %"deref_load" = load i8, i8* %".9"
  ;  Source: *(ptr+4)='a';
  store i8 97, i8* %".9"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr.2" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".15" = getelementptr i8, i8* %"ptr.2", i32 4
  ;  Source: *(ptr+4)
  %"deref_load.1" = load i8, i8* %".15"
  ;  Source: printf("%c",*(ptr+4));
  %".18" = zext i8 %"deref_load.1" to i32
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".18")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"