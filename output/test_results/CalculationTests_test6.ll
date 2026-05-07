; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"y" = alloca i32
  store i32 5, i32* %"y"
  %"a" = alloca i32
  store i32 9, i32* %"a"
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".8" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".8", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".12" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".12", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  %"is_x" = alloca i32
  %"ptr.3" = load i32*, i32** %"ptr"
  %".14" = ptrtoint i32* %"ptr.3" to i32
  %".15" = ptrtoint i32* %"x" to i32
  %".16" = icmp eq i32 %".14", %".15"
  %".17" = zext i1 %".16" to i32
  store i32 %".17", i32* %"is_x"
  %".19" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"is_x.1")
  %"is_y" = alloca i32
  %"ptr.4" = load i32*, i32** %"ptr"
  %".23" = ptrtoint i32* %"ptr.4" to i32
  %".24" = ptrtoint i32* %"y" to i32
  %".25" = icmp eq i32 %".23", %".24"
  %".26" = zext i1 %".25" to i32
  store i32 %".26", i32* %"is_y"
  %".28" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"is_y.1")
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".36" = ptrtoint i32* %"x" to i32
  %".37" = ptrtoint i32* %"ptr.5" to i32
  %".38" = icmp ne i32 %".36", %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".39", i32* %"is_y"
  %".42" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: is_y
  %"is_y.3" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"is_y.3")
  %"ptr2" = alloca float*
  %".46" = inttoptr i32 0 to float*
  store float* %".46", float** %"ptr2"
  %".48" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: printf("%d",ptr2);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", float* %"ptr2.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"