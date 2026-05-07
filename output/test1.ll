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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"ptr" = alloca i8*
  ;  Source: malloc(5)
  %".3" = call i8* @"malloc"(i32 5)
  ;  Source: (char*)malloc(5)
  %".5" = ptrtoint i8* %".3" to i8
  ;  Source: char*ptr=(char*)malloc(5);
  %".7" = inttoptr i8 %".5" to i8*
  store i8* %".7", i8** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".11" = getelementptr i8, i8* %"ptr.1", i32 4
  %"deref_load" = load i8, i8* %".11"
  ;  Source: *(ptr+4)='a';
  store i8 97, i8* %".11"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr.2" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".17" = getelementptr i8, i8* %"ptr.2", i32 4
  ;  Source: *(ptr+4)
  %"deref_load.1" = load i8, i8* %".17"
  ;  Source: printf("%c",*(ptr+4));
  %".20" = zext i8 %"deref_load.1" to i32
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".20")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"