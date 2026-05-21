; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.a" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca %"union.a"
  ;  Source: c.b
  %"gep_b" = getelementptr inbounds %"union.a", %"union.a"* %"c", i32 0, i32 0
  %"union_cast_b" = bitcast i32* %"gep_b" to i32**
  %"load_b" = load i32*, i32** %"union_cast_b"
  ;  Source: c.b[2]
  %"gep_ptr" = getelementptr i32, i32* %"load_b", i32 2
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: c.b[2]=5;
  store i32 5, i32* %"gep_ptr"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c.b
  %"gep_b.1" = getelementptr inbounds %"union.a", %"union.a"* %"c", i32 0, i32 0
  %"union_cast_b.1" = bitcast i32* %"gep_b.1" to i32**
  %"load_b.1" = load i32*, i32** %"union_cast_b.1"
  ;  Source: c.b[2]
  %"gep_ptr.1" = getelementptr i32, i32* %"load_b.1", i32 2
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: printf("%d",c.b[2]);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"