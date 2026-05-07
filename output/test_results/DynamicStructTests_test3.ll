; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.cheese" = type {i32}
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
  %"gouda" = alloca %"struct.cheese"
  ;  Source: gouda.milk
  %"gep_milk" = getelementptr inbounds %"struct.cheese", %"struct.cheese"* %"gouda", i32 0, i32 0
  %"load_milk" = load i32, i32* %"gep_milk"
  ;  Source: gouda.milk=3;
  store i32 3, i32* %"gep_milk"
  %"gouda_ptr" = alloca %"struct.cheese"*
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = call i8* @"malloc"(i32 %".6")
  %".8" = bitcast i8* %".7" to %"struct.cheese"*
  store %"struct.cheese"* %".8", %"struct.cheese"** %"gouda_ptr"
  ;  Source: gouda_ptr
  %"gouda_ptr.1" = load %"struct.cheese"*, %"struct.cheese"** %"gouda_ptr"
  ;  Source: gouda_ptr
  %"gouda_ptr.2" = load %"struct.cheese"*, %"struct.cheese"** %"gouda_ptr"
  %".12" = getelementptr i32, i32* null, i32 1
  %".13" = ptrtoint i32* %".12" to i32
  ;  Source: sizeof(structcheese)*2
  %".15" = mul i32 %".13", 2
  ;  Source: realloc(gouda_ptr,sizeof(structcheese)*2)
  %".17" = bitcast %"struct.cheese"* %"gouda_ptr.2" to i8*
  %".18" = call i8* @"realloc"(i8* %".17", i32 %".15")
  ;  Source: (structcheese*)realloc(gouda_ptr,sizeof(structcheese)*2)
  %".20" = bitcast i8* %".18" to %"struct.cheese"*
  ;  Source: gouda_ptr=(structcheese*)realloc(gouda_ptr,sizeof(structcheese)*2);
  store %"struct.cheese"* %".20", %"struct.cheese"** %"gouda_ptr"
  ;  Source: gouda_ptr
  %"gouda_ptr.3" = load %"struct.cheese"*, %"struct.cheese"** %"gouda_ptr"
  ;  Source: free(gouda_ptr);
  %".25" = bitcast %"struct.cheese"* %"gouda_ptr.3" to i8*
  call void @"free"(i8* %".25")
  ;  Source: return0;
  ret i32 0
}
