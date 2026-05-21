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
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"b" = alloca i32
  store i32 6, i32* %"b"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=5;
  store i32 5, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=8792432;
  store i32 8792432, i32* %"b"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: gouda.as_integer
  %"gep_as_integer.1" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"load_as_integer.1" = load i32, i32* %"gep_as_integer.1"
  ;  Source: printf("%d",gouda.as_integer);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"load_as_integer.1")
  ;  Source: gouda.as_str
  %"gep_as_str" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"union_cast_as_str" = bitcast i32* %"gep_as_str" to i8**
  %"load_as_str" = load i8*, i8** %"union_cast_as_str"
  ;  Source: gouda.as_str[0]
  %"gep_ptr" = getelementptr i8, i8* %"load_as_str", i32 0
  %"array_element" = load i8, i8* %"gep_ptr"
  ;  Source: gouda.as_str[0]='a';
  store i8 97, i8* %"gep_ptr"
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: gouda.as_str
  %"gep_as_str.1" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"union_cast_as_str.1" = bitcast i32* %"gep_as_str.1" to i8**
  %"load_as_str.1" = load i8*, i8** %"union_cast_as_str.1"
  ;  Source: gouda.as_str[0]
  %"gep_ptr.1" = getelementptr i8, i8* %"load_as_str.1", i32 0
  %"array_element.1" = load i8, i8* %"gep_ptr.1"
  ;  Source: printf("%c",gouda.as_str[0]);
  %".25" = sext i8 %"array_element.1" to i32
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".25")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%c\00"