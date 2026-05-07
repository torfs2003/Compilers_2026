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
  %"ptr" = alloca i8*
  %".2" = call i8* @"malloc"(i32 5)
  store i8* %".2", i8** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".6" = getelementptr i8, i8* %"ptr.1", i32 4
  %"deref_load" = load i8, i8* %".6"
  ;  Source: *(ptr+4)='a';
  store i8 97, i8* %".6"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr.2" = load i8*, i8** %"ptr"
  ;  Source: (ptr+4)
  %".12" = getelementptr i8, i8* %"ptr.2", i32 4
  ;  Source: *(ptr+4)
  %"deref_load.1" = load i8, i8* %".12"
  ;  Source: printf("%c",*(ptr+4));
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"