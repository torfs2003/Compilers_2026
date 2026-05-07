; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define void @"comparePointers"(i32* %".1", i32* %".2")
{
entry:
  %"pa" = alloca i32*
  store i32* %".1", i32** %"pa"
  %"pb" = alloca i32*
  store i32* %".2", i32** %"pb"
  %".6" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: pa
  %"pa.1" = load i32*, i32** %"pa"
  ;  Source: pb
  %"pb.1" = load i32*, i32** %"pb"
  ;  Source: pa<pb
  %".10" = ptrtoint i32* %"pa.1" to i32
  %".11" = ptrtoint i32* %"pb.1" to i32
  %".12" = icmp ult i32 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  ;  Source: printf("%d\n",pa<pb);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".13")
  %".16" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: pa
  %"pa.2" = load i32*, i32** %"pa"
  ;  Source: pb
  %"pb.2" = load i32*, i32** %"pb"
  ;  Source: pa>pb
  %".20" = ptrtoint i32* %"pa.2" to i32
  %".21" = ptrtoint i32* %"pb.2" to i32
  %".22" = icmp ugt i32 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: printf("%d\n",pa>pb);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".23")
  %".26" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: pa
  %"pa.3" = load i32*, i32** %"pa"
  ;  Source: pb
  %"pb.3" = load i32*, i32** %"pb"
  ;  Source: pa==pb
  %".30" = ptrtoint i32* %"pa.3" to i32
  %".31" = ptrtoint i32* %"pb.3" to i32
  %".32" = icmp eq i32 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: printf("%d\n",pa==pb);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".33")
  %".36" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: pa
  %"pa.4" = load i32*, i32** %"pa"
  ;  Source: pb
  %"pb.4" = load i32*, i32** %"pb"
  ;  Source: pa!=pb
  %".40" = ptrtoint i32* %"pa.4" to i32
  %".41" = ptrtoint i32* %"pb.4" to i32
  %".42" = icmp ne i32 %".40", %".41"
  %".43" = zext i1 %".42" to i32
  ;  Source: printf("%d\n",pa!=pb);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".43")
  ret void
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
define i32 @"main"()
{
entry:
  %"array" = alloca [2 x i32]
  ;  Source: intarray[2];
  ;  Source: array
  ;  Source: array[0]
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"array", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: &array[0]
  ;  Source: array
  ;  Source: array[1]
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"array", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: &array[1]
  ;  Source: comparePointers(&array[0],&array[1]);
  call void @"comparePointers"(i32* %"gep_ptr", i32* %"gep_ptr.1")
  ;  Source: return0;
  ret i32 0
}
