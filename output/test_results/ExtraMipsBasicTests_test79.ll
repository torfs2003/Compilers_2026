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
  %"a" = alloca i32*
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"calloc"(i32 5, i32 %".3")
  %".5" = bitcast i8* %".4" to i32*
  store i32* %".5", i32** %"a"
  ;  Source: a
  %"a.1" = load i32*, i32** %"a"
  %"deref_load" = load i32, i32* %"a.1"
  ;  Source: *a=5;
  store i32 5, i32* %"a.1"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i32*, i32** %"a"
  ;  Source: *a
  %"deref_load.1" = load i32, i32* %"a.2"
  ;  Source: printf("%d",*a);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"deref_load.1")
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.3" = load i32*, i32** %"a"
  ;  Source: (a+4)
  %".18" = getelementptr i32, i32* %"a.3", i32 4
  ;  Source: *(a+4)
  %"deref_load.2" = load i32, i32* %".18"
  ;  Source: printf("%d",*(a+4));
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"deref_load.2")
  ;  Source: a
  %"a.4" = load i32*, i32** %"a"
  ;  Source: (a+4)
  %".24" = getelementptr i32, i32* %"a.4", i32 4
  %"deref_load.3" = load i32, i32* %".24"
  ;  Source: *(a+4)=6;
  store i32 6, i32* %".24"
  %".27" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.5" = load i32*, i32** %"a"
  ;  Source: (a+4)
  %".30" = getelementptr i32, i32* %"a.5", i32 4
  ;  Source: *(a+4)
  %"deref_load.4" = load i32, i32* %".30"
  ;  Source: printf("%d",*(a+4));
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"deref_load.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"