; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {%"struct.a"*, i32}
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
  %"v" = alloca %"struct.a"*
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"malloc"(i32 %".3")
  %".5" = bitcast i8* %".4" to %"struct.a"*
  store %"struct.a"* %".5", %"struct.a"** %"v"
  %"w" = alloca %"struct.a"*
  %".7" = getelementptr i32, i32* null, i32 1
  %".8" = ptrtoint i32* %".7" to i32
  %".9" = call i8* @"malloc"(i32 %".8")
  %".10" = bitcast i8* %".9" to %"struct.a"*
  store %"struct.a"* %".10", %"struct.a"** %"w"
  ;  Source: w->v
  %".13" = load %"struct.a"*, %"struct.a"** %"w"
  %"gep_v" = getelementptr inbounds %"struct.a", %"struct.a"* %".13", i32 0, i32 1
  %"load_v" = load i32, i32* %"gep_v"
  ;  Source: w->v=5;
  store i32 5, i32* %"gep_v"
  ;  Source: v->b
  %".17" = load %"struct.a"*, %"struct.a"** %"v"
  %"gep_b" = getelementptr inbounds %"struct.a", %"struct.a"* %".17", i32 0, i32 0
  %"load_b" = load %"struct.a"*, %"struct.a"** %"gep_b"
  ;  Source: w
  %"w.1" = load %"struct.a"*, %"struct.a"** %"w"
  ;  Source: v->b=w;
  store %"struct.a"* %"w.1", %"struct.a"** %"gep_b"
  %".21" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: w->v
  %".23" = load %"struct.a"*, %"struct.a"** %"w"
  %"gep_v.1" = getelementptr inbounds %"struct.a", %"struct.a"* %".23", i32 0, i32 1
  %"load_v.1" = load i32, i32* %"gep_v.1"
  ;  Source: printf("%d",w->v);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"load_v.1")
  %".26" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: v->b->v
  %".28" = load %"struct.a"*, %"struct.a"** %"v"
  %"gep_b.1" = getelementptr inbounds %"struct.a", %"struct.a"* %".28", i32 0, i32 0
  %"load_b.1" = load %"struct.a"*, %"struct.a"** %"gep_b.1"
  %".29" = load %"struct.a"*, %"struct.a"** %"gep_b.1"
  %"gep_v.2" = getelementptr inbounds %"struct.a", %"struct.a"* %".29", i32 0, i32 1
  %"load_v.2" = load i32, i32* %"gep_v.2"
  ;  Source: printf("%d",v->b->v);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"load_v.2")
  ;  Source: v
  %"v.1" = load %"struct.a"*, %"struct.a"** %"v"
  ;  Source: (char*)v
  %".34" = bitcast %"struct.a"* %"v.1" to i8*
  ;  Source: free((char*)v);
  call void @"free"(i8* %".34")
  ;  Source: w
  %"w.2" = load %"struct.a"*, %"struct.a"** %"w"
  ;  Source: (char*)w
  %".39" = bitcast %"struct.a"* %"w.2" to i8*
  ;  Source: free((char*)w);
  call void @"free"(i8* %".39")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"