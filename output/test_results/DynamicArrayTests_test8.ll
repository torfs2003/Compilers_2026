; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.v" = type {i32, float}
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
  %"c" = alloca %"struct.v"*
  %".2" = call i8* @"malloc"(i32 200)
  %".3" = bitcast i8* %".2" to %"struct.v"*
  store %"struct.v"* %".3", %"struct.v"** %"c"
  ;  Source: c->a
  %".6" = load %"struct.v"*, %"struct.v"** %"c"
  %"gep_a" = getelementptr inbounds %"struct.v", %"struct.v"* %".6", i32 0, i32 0
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: c->a=5;
  store i32 5, i32* %"gep_a"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c->a
  %".11" = load %"struct.v"*, %"struct.v"** %"c"
  %"gep_a.1" = getelementptr inbounds %"struct.v", %"struct.v"* %".11", i32 0, i32 0
  %"load_a.1" = load i32, i32* %"gep_a.1"
  ;  Source: printf("%d",c->a);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"load_a.1")
  ;  Source: c
  %"c_load" = load %"struct.v"*, %"struct.v"** %"c"
  ;  Source: free(c);
  %".16" = bitcast %"struct.v"* %"c_load" to i8*
  call void @"free"(i8* %".16")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"