; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
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
  %".20" = add i32* %".19", 1
  store i32* %".20", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".24" = load i32*, i32** %"ptr"
  %".25" = sub i32* %".24", 1
  store i32* %".25", i32** %"ptr"
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".31" = ptrtoint i32* %"ptr.3" to i32
  %".32" = ptrtoint i32* %"x" to i32
  %".33" = icmp eq i32 %".31", %".32"
  %".34" = zext i1 %".33" to i32
  ;  Source: is_x=(ptr==&x);
  store i32 %".34", i32* %"is_x"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".41" = ptrtoint i32* %"ptr.4" to i32
  %".42" = ptrtoint i32* %"y" to i32
  %".43" = icmp eq i32 %".41", %".42"
  %".44" = zext i1 %".43" to i32
  ;  Source: is_y=(ptr==&y);
  store i32 %".44", i32* %"is_y"
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".51" = ptrtoint i32* %"x" to i32
  %".52" = ptrtoint i32* %"ptr.5" to i32
  %".53" = icmp ne i32 %".51", %".52"
  %".54" = zext i1 %".53" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".54", i32* %"is_y"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".60" = ptrtoint float* %"ptr2.1" to i32
  %".61" = ptrtoint i32* %"ptr.6" to i32
  %".62" = icmp uge i32 %".60", %".61"
  %".63" = zext i1 %".62" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".67" = ptrtoint float* %"ptr2.2" to i32
  %".68" = ptrtoint i32* %"ptr.7" to i32
  %".69" = icmp ule i32 %".67", %".68"
  %".70" = zext i1 %".69" to i32
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".74" = ptrtoint i32* %"ptr.8" to i32
  %".75" = ptrtoint i32* %"x" to i32
  %".76" = icmp ugt i32 %".74", %".75"
  %".77" = zext i1 %".76" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".80" = ptrtoint i32* %"ptr.9" to i32
  %".81" = icmp ult i32 %".80", 32
  %".82" = zext i1 %".81" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".86" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".88" = getelementptr i32, i32* %"ptr.11", i32 %".86"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".88", i32** %"ptr"
  ret i32 0
}
