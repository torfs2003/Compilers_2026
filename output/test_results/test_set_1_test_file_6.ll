; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  %"is_x" = alloca i32
  ;  Source: intis_x;
  %"is_y" = alloca i32
  ;  Source: intis_y;
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".13" = inttoptr i32 0 to float*
  store float* %".13", float** %"ptr2"
  %"num_skip_elements" = alloca i32
  ;  Source: intnum_skip_elements=4;
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".19" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".19", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".23" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".23", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".29" = ptrtoint i32* %"ptr.3" to i32
  %".30" = ptrtoint i32* %"x" to i32
  %".31" = icmp eq i32 %".29", %".30"
  %".32" = zext i1 %".31" to i32
  ;  Source: is_x=(ptr==&x);
  store i32 %".32", i32* %"is_x"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".39" = ptrtoint i32* %"ptr.4" to i32
  %".40" = ptrtoint i32* %"y" to i32
  %".41" = icmp eq i32 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: is_y=(ptr==&y);
  store i32 %".42", i32* %"is_y"
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".49" = ptrtoint i32* %"x" to i32
  %".50" = ptrtoint i32* %"ptr.5" to i32
  %".51" = icmp ne i32 %".49", %".50"
  %".52" = zext i1 %".51" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".52", i32* %"is_y"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".58" = ptrtoint float* %"ptr2.1" to i32
  %".59" = ptrtoint i32* %"ptr.6" to i32
  %".60" = icmp uge i32 %".58", %".59"
  %".61" = zext i1 %".60" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".65" = ptrtoint float* %"ptr2.2" to i32
  %".66" = ptrtoint i32* %"ptr.7" to i32
  %".67" = icmp ule i32 %".65", %".66"
  %".68" = zext i1 %".67" to i32
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".72" = ptrtoint i32* %"ptr.8" to i32
  %".73" = ptrtoint i32* %"x" to i32
  %".74" = icmp ugt i32 %".72", %".73"
  %".75" = zext i1 %".74" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".78" = ptrtoint i32* %"ptr.9" to i32
  %".79" = icmp ult i32 %".78", 32
  %".80" = zext i1 %".79" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".84" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".86" = getelementptr i32, i32* %"ptr.11", i32 %".84"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".86", i32** %"ptr"
  ret i32 0
}
