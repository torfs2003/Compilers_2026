; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.v" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define %"struct.v"* @"hello"()
{
entry:
  %"n" = alloca %"struct.v"*
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"malloc"(i32 %".3")
  %".5" = bitcast i8* %".4" to %"struct.v"*
  store %"struct.v"* %".5", %"struct.v"** %"n"
  ;  Source: n->a
  %".8" = load %"struct.v"*, %"struct.v"** %"n"
  %"gep_a" = getelementptr inbounds %"struct.v", %"struct.v"* %".8", i32 0, i32 0
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: n->a=5;
  store i32 5, i32* %"gep_a"
  ;  Source: returnn;
  %"n.1" = load %"struct.v"*, %"struct.v"** %"n"
  ret %"struct.v"* %"n.1"
}

define i32 @"main"()
{
entry:
  %"b" = alloca %"struct.v"*
  %".2" = call %"struct.v"* @"hello"()
  store %"struct.v"* %".2", %"struct.v"** %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b->a
  %".6" = load %"struct.v"*, %"struct.v"** %"b"
  %"gep_a" = getelementptr inbounds %"struct.v", %"struct.v"* %".6", i32 0, i32 0
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: printf("%d",b->a);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"load_a")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"