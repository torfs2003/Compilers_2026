; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.v" = type {i32, float, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"c" = alloca %"struct.v"*
  ;  Source: sizeof(structv)
  %".3" = getelementptr i32, i32* null, i32 1
  %".4" = ptrtoint i32* %".3" to i32
  ;  Source: malloc(sizeof(structv))
  %".6" = call i8* @"malloc"(i32 %".4")
  ;  Source: structv*c=malloc(sizeof(structv));
  %".8" = bitcast i8* %".6" to %"struct.v"*
  store %"struct.v"* %".8", %"struct.v"** %"c"
  ;  Source: c->a
  %".11" = load %"struct.v"*, %"struct.v"** %"c"
  %"gep_a" = getelementptr inbounds %"struct.v", %"struct.v"* %".11", i32 0, i32 0
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: c->a=5;
  store i32 5, i32* %"gep_a"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c->a
  %".16" = load %"struct.v"*, %"struct.v"** %"c"
  %"gep_a.1" = getelementptr inbounds %"struct.v", %"struct.v"* %".16", i32 0, i32 0
  %"load_a.1" = load i32, i32* %"gep_a.1"
  ;  Source: printf("%d",c->a);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"load_a.1")
  ;  Source: c
  %"c.1" = load %"struct.v"*, %"struct.v"** %"c"
  ;  Source: free(c);
  %".21" = bitcast %"struct.v"* %"c.1" to i8*
  call void @"free"(i8* %".21")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"