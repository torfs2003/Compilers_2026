; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.cheese" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.cheese"
  ;  Source: structcheesegouda;
  ;  Source: gouda.milk
  %"gep_milk" = getelementptr inbounds %"struct.cheese", %"struct.cheese"* %"gouda", i32 0, i32 0
  %"load_milk" = load i32, i32* %"gep_milk"
  ;  Source: gouda.milk=3;
  store i32 3, i32* %"gep_milk"
  %"gouda_ptr" = alloca %"struct.cheese"*
  ;  Source: sizeof(structcheese)
  %".7" = getelementptr i32, i32* null, i32 1
  %".8" = ptrtoint i32* %".7" to i32
  ;  Source: malloc(sizeof(structcheese))
  %".10" = call i8* @"malloc"(i32 %".8")
  ;  Source: (structcheese*)malloc(sizeof(structcheese))
  %".12" = bitcast i8* %".10" to %"struct.cheese"*
  ;  Source: structcheese*gouda_ptr=(structcheese*)malloc(sizeof(structcheese));
  store %"struct.cheese"* %".12", %"struct.cheese"** %"gouda_ptr"
  ;  Source: gouda_ptr
  %"gouda_ptr.1" = load %"struct.cheese"*, %"struct.cheese"** %"gouda_ptr"
  ;  Source: gouda_ptr
  %"gouda_ptr.2" = load %"struct.cheese"*, %"struct.cheese"** %"gouda_ptr"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  ;  Source: sizeof(structcheese)*2
  %".20" = mul i32 %".18", 2
  ;  Source: realloc(gouda_ptr,sizeof(structcheese)*2)
  %".22" = bitcast %"struct.cheese"* %"gouda_ptr.2" to i8*
  %".23" = call i8* @"realloc"(i8* %".22", i32 %".20")
  ;  Source: (structcheese*)realloc(gouda_ptr,sizeof(structcheese)*2)
  %".25" = bitcast i8* %".23" to %"struct.cheese"*
  ;  Source: gouda_ptr=(structcheese*)realloc(gouda_ptr,sizeof(structcheese)*2);
  store %"struct.cheese"* %".25", %"struct.cheese"** %"gouda_ptr"
  ;  Source: gouda_ptr
  %"gouda_ptr.3" = load %"struct.cheese"*, %"struct.cheese"** %"gouda_ptr"
  ;  Source: free(gouda_ptr);
  %".30" = bitcast %"struct.cheese"* %"gouda_ptr.3" to i8*
  call void @"free"(i8* %".30")
  ;  Source: return0;
  ret i32 0
}
