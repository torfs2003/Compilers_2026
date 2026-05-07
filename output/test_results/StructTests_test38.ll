; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.NotTypeSafe" = type {i32, i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"union.NotTypeSafe"
  ;  Source: gouda.as_integer
  %"gep_as_integer" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"load_as_integer" = load i32, i32* %"gep_as_integer"
  ;  Source: gouda.as_integer=5;
  store i32 5, i32* %"gep_as_integer"
  ;  Source: gouda.as_str
  %"gep_as_str" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"union_cast_as_str" = bitcast i32* %"gep_as_str" to i8**
  %"load_as_str" = load i8*, i8** %"union_cast_as_str"
  ;  Source: gouda.as_str[0]
  %"gep_ptr" = getelementptr i8, i8* %"load_as_str", i32 0
  %"array_element" = load i8, i8* %"gep_ptr"
  ;  Source: gouda.as_str[0]='a';
  store i8 97, i8* %"gep_ptr"
  %"q" = alloca i32
  %"gep_as_integer.1" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"load_as_integer.1" = load i32, i32* %"gep_as_integer.1"
  store i32 %"load_as_integer.1", i32* %"q"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: q
  %"q.1" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"q.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"