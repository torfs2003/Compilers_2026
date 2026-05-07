; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {[20 x i32], i32}
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
  %"c" = alloca %"struct.a"
  ;  Source: structac;
  ;  Source: c.d
  %"gep_d" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 1
  %"load_d" = load i32, i32* %"gep_d"
  ;  Source: c.d=5;
  store i32 5, i32* %"gep_d"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c.d
  %"gep_d.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 1
  %"load_d.1" = load i32, i32* %"gep_d.1"
  ;  Source: printf("%d",c.d);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"load_d.1")
  ;  Source: c.b
  %"gep_b" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 0
  %"union_cast_b" = bitcast [20 x i32]* %"gep_b" to i32**
  %"load_b" = load i32*, i32** %"union_cast_b"
  ;  Source: c.b[2]
  %"gep_ptr" = getelementptr i32, i32* %"load_b", i32 2
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: c.b[2]=5;
  store i32 5, i32* %"gep_ptr"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c.b
  %"gep_b.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 0
  %"union_cast_b.1" = bitcast [20 x i32]* %"gep_b.1" to i32**
  %"load_b.1" = load i32*, i32** %"union_cast_b.1"
  ;  Source: c.b[2]
  %"gep_ptr.1" = getelementptr i32, i32* %"load_b.1", i32 2
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: printf("%d",c.b[2]);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"