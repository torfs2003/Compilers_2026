; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.v" = type {i32, i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"c" = alloca %"union.v"*
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"malloc"(i32 %".3")
  %".5" = bitcast i8* %".4" to %"union.v"*
  store %"union.v"* %".5", %"union.v"** %"c"
  ;  Source: c->a
  %".8" = load %"union.v"*, %"union.v"** %"c"
  %"gep_a" = getelementptr inbounds %"union.v", %"union.v"* %".8", i32 0, i32 0
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: c->a=5;
  store i32 5, i32* %"gep_a"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c->a
  %".13" = load %"union.v"*, %"union.v"** %"c"
  %"gep_a.1" = getelementptr inbounds %"union.v", %"union.v"* %".13", i32 0, i32 0
  %"load_a.1" = load i32, i32* %"gep_a.1"
  ;  Source: printf("%d",c->a);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"load_a.1")
  ;  Source: c
  %"c.1" = load %"union.v"*, %"union.v"** %"c"
  ;  Source: free(c);
  %".18" = bitcast %"union.v"* %"c.1" to i8*
  call void @"free"(i8* %".18")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"