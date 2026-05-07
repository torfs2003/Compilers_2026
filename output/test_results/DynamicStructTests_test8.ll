; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {%"struct.a"*, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"v" = alloca %"struct.a"*
  ;  Source: sizeof(structa)
  %".3" = getelementptr i32, i32* null, i32 1
  %".4" = ptrtoint i32* %".3" to i32
  ;  Source: malloc(sizeof(structa))
  %".6" = call i8* @"malloc"(i32 %".4")
  ;  Source: (structa*)malloc(sizeof(structa))
  %".8" = bitcast i8* %".6" to %"struct.a"*
  ;  Source: structa*v=(structa*)malloc(sizeof(structa));
  store %"struct.a"* %".8", %"struct.a"** %"v"
  %"w" = alloca %"struct.a"*
  ;  Source: sizeof(structa)
  %".12" = getelementptr i32, i32* null, i32 1
  %".13" = ptrtoint i32* %".12" to i32
  ;  Source: malloc(sizeof(structa))
  %".15" = call i8* @"malloc"(i32 %".13")
  ;  Source: (structa*)malloc(sizeof(structa))
  %".17" = bitcast i8* %".15" to %"struct.a"*
  ;  Source: structa*w=(structa*)malloc(sizeof(structa));
  store %"struct.a"* %".17", %"struct.a"** %"w"
  ;  Source: w->v
  %".21" = load %"struct.a"*, %"struct.a"** %"w"
  %"gep_v" = getelementptr inbounds %"struct.a", %"struct.a"* %".21", i32 0, i32 1
  %"load_v" = load i32, i32* %"gep_v"
  ;  Source: w->v=5;
  store i32 5, i32* %"gep_v"
  ;  Source: v->b
  %".25" = load %"struct.a"*, %"struct.a"** %"v"
  %"gep_b" = getelementptr inbounds %"struct.a", %"struct.a"* %".25", i32 0, i32 0
  %"load_b" = load %"struct.a"*, %"struct.a"** %"gep_b"
  ;  Source: w
  %"w.1" = load %"struct.a"*, %"struct.a"** %"w"
  ;  Source: v->b=w;
  store %"struct.a"* %"w.1", %"struct.a"** %"gep_b"
  %".29" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: w->v
  %".31" = load %"struct.a"*, %"struct.a"** %"w"
  %"gep_v.1" = getelementptr inbounds %"struct.a", %"struct.a"* %".31", i32 0, i32 1
  %"load_v.1" = load i32, i32* %"gep_v.1"
  ;  Source: printf("%d",w->v);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"load_v.1")
  %".34" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: v->b->v
  %".36" = load %"struct.a"*, %"struct.a"** %"v"
  %"gep_b.1" = getelementptr inbounds %"struct.a", %"struct.a"* %".36", i32 0, i32 0
  %"load_b.1" = load %"struct.a"*, %"struct.a"** %"gep_b.1"
  %".37" = load %"struct.a"*, %"struct.a"** %"gep_b.1"
  %"gep_v.2" = getelementptr inbounds %"struct.a", %"struct.a"* %".37", i32 0, i32 1
  %"load_v.2" = load i32, i32* %"gep_v.2"
  ;  Source: printf("%d",v->b->v);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"load_v.2")
  ;  Source: v
  %"v.1" = load %"struct.a"*, %"struct.a"** %"v"
  ;  Source: (char*)v
  %".42" = bitcast %"struct.a"* %"v.1" to i8*
  ;  Source: free((char*)v);
  call void @"free"(i8* %".42")
  ;  Source: w
  %"w.2" = load %"struct.a"*, %"struct.a"** %"w"
  ;  Source: (char*)w
  %".47" = bitcast %"struct.a"* %"w.2" to i8*
  ;  Source: free((char*)w);
  call void @"free"(i8* %".47")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"