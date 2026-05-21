; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.mapEntry" = type {i8*, i32}
%"struct.map" = type {%"struct.mapEntry"*, i32}
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
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"malloc"(i32 %".3")
  %".5" = bitcast i8* %".4" to %"struct.map"*
  store %"struct.map"* %".5", %"struct.map"** %"m"
  ;  Source: m->size
  %".8" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".8", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  ;  Source: m->size=0;
  store i32 0, i32* %"gep_size"
  ;  Source: returnm;
  %"m_load" = load %"struct.map"*, %"struct.map"** %"m"
  ret %"struct.map"* %"m_load"
}

define i32 @"main"()
{
entry:
  %"m" = alloca %"struct.map"*
  %".2" = call %"struct.map"* @"create_map"()
  store %"struct.map"* %".2", %"struct.map"** %"m"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: m->size
  %".6" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".6", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  ;  Source: printf("%d",m->size);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"load_size")
  ;  Source: m
  %"m_load" = load %"struct.map"*, %"struct.map"** %"m"
  ;  Source: free(m);
  %".11" = bitcast %"struct.map"* %"m_load" to i8*
  call void @"free"(i8* %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"