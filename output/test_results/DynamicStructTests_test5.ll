; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.mapEntry" = type {i8*, i32}
%"struct.map" = type {%"struct.mapEntry"*, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define void @"addEntry"(%"struct.map"* %".1", i8* %".2", i32 %".3")
{
entry:
  %"map" = alloca %"struct.map"*
  store %"struct.map"* %".1", %"struct.map"** %"map"
  %"key" = alloca i8*
  store i8* %".2", i8** %"key"
  %"value" = alloca i32
  store i32 %".3", i32* %"value"
  ret void
}

define %"struct.map"* @"create_map"()
{
entry:
  %"m" = alloca %"struct.map"*
  ;  Source: sizeof(structmap)
  %".3" = getelementptr i32, i32* null, i32 1
  %".4" = ptrtoint i32* %".3" to i32
  ;  Source: malloc(sizeof(structmap))
  %".6" = call i8* @"malloc"(i32 %".4")
  ;  Source: structmap*m=malloc(sizeof(structmap));
  %".8" = bitcast i8* %".6" to %"struct.map"*
  store %"struct.map"* %".8", %"struct.map"** %"m"
  ;  Source: m->size
  %".11" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".11", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  ;  Source: m->size=0;
  store i32 0, i32* %"gep_size"
  ;  Source: returnm;
  %"m.1" = load %"struct.map"*, %"struct.map"** %"m"
  ret %"struct.map"* %"m.1"
}

define i32 @"main"()
{
entry:
  %"m" = alloca %"struct.map"*
  ;  Source: create_map()
  %".3" = call %"struct.map"* @"create_map"()
  ;  Source: structmap*m=create_map();
  store %"struct.map"* %".3", %"struct.map"** %"m"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: m->size
  %".8" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".8", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  ;  Source: printf("%d",m->size);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"load_size")
  ;  Source: m
  %"m.1" = load %"struct.map"*, %"struct.map"** %"m"
  ;  Source: free(m);
  %".13" = bitcast %"struct.map"* %"m.1" to i8*
  call void @"free"(i8* %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"