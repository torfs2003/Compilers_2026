; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.a" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"v" = alloca %"union.a"*
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"malloc"(i32 %".3")
  %".5" = bitcast i8* %".4" to %"union.a"*
  store %"union.a"* %".5", %"union.a"** %"v"
  %"w" = alloca %"union.a"*
  %".7" = getelementptr i32, i32* null, i32 1
  %".8" = ptrtoint i32* %".7" to i32
  %".9" = call i8* @"malloc"(i32 %".8")
  %".10" = bitcast i8* %".9" to %"union.a"*
  store %"union.a"* %".10", %"union.a"** %"w"
  ;  Source: w->v
  %".13" = load %"union.a"*, %"union.a"** %"w"
  %"gep_v" = getelementptr inbounds %"union.a", %"union.a"* %".13", i32 0, i32 0
  %"load_v" = load i32, i32* %"gep_v"
  ;  Source: w->v=5;
  store i32 5, i32* %"gep_v"
  ;  Source: v->b
  %".17" = load %"union.a"*, %"union.a"** %"v"
  %"gep_b" = getelementptr inbounds %"union.a", %"union.a"* %".17", i32 0, i32 0
  %"union_cast_b" = bitcast i32* %"gep_b" to %"union.a"**
  %"load_b" = load %"union.a"*, %"union.a"** %"union_cast_b"
  ;  Source: w
  %"w_load" = load %"union.a"*, %"union.a"** %"w"
  ;  Source: v->b=w;
  store %"union.a"* %"w_load", %"union.a"** %"union_cast_b"
  %".21" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: w->v
  %".23" = load %"union.a"*, %"union.a"** %"w"
  %"gep_v.1" = getelementptr inbounds %"union.a", %"union.a"* %".23", i32 0, i32 0
  %"load_v.1" = load i32, i32* %"gep_v.1"
  ;  Source: printf("%d",w->v);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"load_v.1")
  %".26" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: v->b->v
  %".28" = load %"union.a"*, %"union.a"** %"v"
  %"gep_b.1" = getelementptr inbounds %"union.a", %"union.a"* %".28", i32 0, i32 0
  %"union_cast_b.1" = bitcast i32* %"gep_b.1" to %"union.a"**
  %"load_b.1" = load %"union.a"*, %"union.a"** %"union_cast_b.1"
  %".29" = load %"union.a"*, %"union.a"** %"union_cast_b.1"
  %"gep_v.2" = getelementptr inbounds %"union.a", %"union.a"* %".29", i32 0, i32 0
  %"load_v.2" = load i32, i32* %"gep_v.2"
  ;  Source: printf("%d",v->b->v);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"load_v.2")
  ;  Source: v
  %"v_load" = load %"union.a"*, %"union.a"** %"v"
  ;  Source: (char*)v
  %".34" = bitcast %"union.a"* %"v_load" to i8*
  ;  Source: free((char*)v);
  call void @"free"(i8* %".34")
  ;  Source: w
  %"w_load.1" = load %"union.a"*, %"union.a"** %"w"
  ;  Source: (char*)w
  %".39" = bitcast %"union.a"* %"w_load.1" to i8*
  ;  Source: free((char*)w);
  call void @"free"(i8* %".39")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"