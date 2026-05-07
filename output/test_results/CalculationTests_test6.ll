; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=4;
  store i32 4, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=5;
  store i32 5, i32* %"y"
  %"a" = alloca i32
  ;  Source: inta=9;
  store i32 9, i32* %"a"
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".14" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".14", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".18" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".18", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  %"is_x" = alloca i32
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".23" = ptrtoint i32* %"ptr.3" to i32
  %".24" = ptrtoint i32* %"x" to i32
  %".25" = icmp eq i32 %".23", %".24"
  %".26" = zext i1 %".25" to i32
  ;  Source: intis_x=(ptr==&x);
  store i32 %".26", i32* %"is_x"
  %".29" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"is_x.1")
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".36" = ptrtoint i32* %"ptr.4" to i32
  %".37" = ptrtoint i32* %"y" to i32
  %".38" = icmp eq i32 %".36", %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".39", i32* %"is_y"
  %".42" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"is_y.1")
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".50" = ptrtoint i32* %"x" to i32
  %".51" = ptrtoint i32* %"ptr.5" to i32
  %".52" = icmp ne i32 %".50", %".51"
  %".53" = zext i1 %".52" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".53", i32* %"is_y"
  %".56" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: is_y
  %"is_y.3" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"is_y.3")
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".61" = inttoptr i32 0 to float*
  store float* %".61", float** %"ptr2"
  %".63" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: printf("%d",ptr2);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", float* %"ptr2.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"