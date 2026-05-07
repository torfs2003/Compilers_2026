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
  %"ptr" = alloca i32*
  %".2" = call i8* @"malloc"(i32 20)
  %".3" = bitcast i8* %".2" to i32*
  store i32* %".3", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: (ptr+3)
  %".7" = getelementptr i32, i32* %"ptr.1", i32 3
  %"deref_load" = load i32, i32* %".7"
  ;  Source: *(ptr+3)=1;
  store i32 1, i32* %".7"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: (ptr+3)
  %".13" = getelementptr i32, i32* %"ptr.2", i32 3
  ;  Source: *(ptr+3)
  %"deref_load.1" = load i32, i32* %".13"
  ;  Source: printf("%c",*(ptr+3));
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"