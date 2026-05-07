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
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"x.1")
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: *ptr
  %"deref_load" = load i32, i32* %"ptr.1"
  ;  Source: printf("%d",*ptr);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load")
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".21" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".21", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".25" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".25", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  %"is_x" = alloca i32
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".30" = ptrtoint i32* %"ptr.4" to i32
  %".31" = ptrtoint i32* %"x" to i32
  %".32" = icmp eq i32 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: intis_x=(ptr==&x);
  store i32 %".33", i32* %"is_x"
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".39" = ptrtoint i32* %"ptr.5" to i32
  %".40" = ptrtoint i32* %"y" to i32
  %".41" = icmp eq i32 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".42", i32* %"is_y"
  %".45" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %"is_y.1")
  %".49" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"is_x.1")
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".57" = ptrtoint i32* %"x" to i32
  %".58" = ptrtoint i32* %"ptr.6" to i32
  %".59" = icmp ne i32 %".57", %".58"
  %".60" = zext i1 %".59" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".60", i32* %"is_y"
  %".63" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: is_y
  %"is_y.3" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"is_y.3")
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".68" = inttoptr i32 0 to float*
  store float* %".68", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".73" = ptrtoint float* %"ptr2.1" to i32
  %".74" = ptrtoint i32* %"ptr.7" to i32
  %".75" = icmp uge i32 %".73", %".74"
  %".76" = zext i1 %".75" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".80" = ptrtoint float* %"ptr2.2" to i32
  %".81" = ptrtoint i32* %"ptr.8" to i32
  %".82" = icmp ule i32 %".80", %".81"
  %".83" = zext i1 %".82" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".87" = ptrtoint i32* %"ptr.9" to i32
  %".88" = ptrtoint i32* %"x" to i32
  %".89" = icmp ugt i32 %".87", %".88"
  %".90" = zext i1 %".89" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".93" = ptrtoint i32* %"ptr.10" to i32
  %".94" = icmp ult i32 %".93", 32
  %".95" = zext i1 %".94" to i32
  %"num_skip_elements" = alloca i32
  ;  Source: intnum_skip_elements=4;
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.12" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".101" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".103" = getelementptr i32, i32* %"ptr.12", i32 %".101"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".103", i32** %"ptr"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"