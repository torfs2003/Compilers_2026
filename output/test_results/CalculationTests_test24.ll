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
  %".6" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d ",x);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"x.1")
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  %".14" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: *ptr
  %"deref_load" = load i32, i32* %"ptr.1"
  ;  Source: printf("%d ",*ptr);
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
  %".27" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: *ptr
  %"deref_load.1" = load i32, i32* %"ptr.4"
  ;  Source: printf("%d ",*ptr);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"deref_load.1")
  %"is_x" = alloca i32
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".35" = ptrtoint i32* %"ptr.5" to i32
  %".36" = ptrtoint i32* %"x" to i32
  %".37" = icmp eq i32 %".35", %".36"
  %".38" = zext i1 %".37" to i32
  ;  Source: intis_x=(ptr==&x);
  store i32 %".38", i32* %"is_x"
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".44" = ptrtoint i32* %"ptr.6" to i32
  %".45" = ptrtoint i32* %"y" to i32
  %".46" = icmp eq i32 %".44", %".45"
  %".47" = zext i1 %".46" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".47", i32* %"is_y"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".54" = ptrtoint i32* %"x" to i32
  %".55" = ptrtoint i32* %"ptr.7" to i32
  %".56" = icmp ne i32 %".54", %".55"
  %".57" = zext i1 %".56" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".57", i32* %"is_y"
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".61" = inttoptr i32 0 to float*
  store float* %".61", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".66" = ptrtoint float* %"ptr2.1" to i32
  %".67" = ptrtoint i32* %"ptr.8" to i32
  %".68" = icmp uge i32 %".66", %".67"
  %".69" = zext i1 %".68" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".73" = ptrtoint float* %"ptr2.2" to i32
  %".74" = ptrtoint i32* %"ptr.9" to i32
  %".75" = icmp ule i32 %".73", %".74"
  %".76" = zext i1 %".75" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".80" = ptrtoint i32* %"ptr.10" to i32
  %".81" = ptrtoint i32* %"x" to i32
  %".82" = icmp ugt i32 %".80", %".81"
  %".83" = zext i1 %".82" to i32
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".86" = ptrtoint i32* %"ptr.11" to i32
  %".87" = icmp ult i32 %".86", 32
  %".88" = zext i1 %".87" to i32
  %"num_skip_elements" = alloca i32
  ;  Source: intnum_skip_elements=4;
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.12" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.13" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".94" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".96" = getelementptr i32, i32* %"ptr.13", i32 %".94"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".96", i32** %"ptr"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [4 x i8] c"%d \00"
@"str.2" = internal constant [4 x i8] c"%d \00"