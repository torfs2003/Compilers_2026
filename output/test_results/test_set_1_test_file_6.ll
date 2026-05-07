; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

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
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".12" = load i32*, i32** %"ptr"
  %".13" = getelementptr i32, i32* %".12", i32 1
  store i32* %".13", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".17" = load i32*, i32** %"ptr"
  %".18" = getelementptr i32, i32* %".17", i32 -1
  store i32* %".18", i32** %"ptr"
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
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".32" = ptrtoint i32* %"ptr.4" to i32
  %".33" = ptrtoint i32* %"y" to i32
  %".34" = icmp eq i32 %".32", %".33"
  %".35" = zext i1 %".34" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".35", i32* %"is_y"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".42" = ptrtoint i32* %"x" to i32
  %".43" = ptrtoint i32* %"ptr.5" to i32
  %".44" = icmp ne i32 %".42", %".43"
  %".45" = zext i1 %".44" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".45", i32* %"is_y"
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".49" = inttoptr i32 0 to float*
  store float* %".49", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".54" = ptrtoint float* %"ptr2.1" to i32
  %".55" = ptrtoint i32* %"ptr.6" to i32
  %".56" = icmp uge i32 %".54", %".55"
  %".57" = zext i1 %".56" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".61" = ptrtoint float* %"ptr2.2" to i32
  %".62" = ptrtoint i32* %"ptr.7" to i32
  %".63" = icmp ule i32 %".61", %".62"
  %".64" = zext i1 %".63" to i32
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".68" = ptrtoint i32* %"ptr.8" to i32
  %".69" = ptrtoint i32* %"x" to i32
  %".70" = icmp ugt i32 %".68", %".69"
  %".71" = zext i1 %".70" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".74" = ptrtoint i32* %"ptr.9" to i32
  %".75" = icmp ult i32 %".74", 32
  %".76" = zext i1 %".75" to i32
  %"num_skip_elements" = alloca i32
  ;  Source: intnum_skip_elements=4;
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".82" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".84" = getelementptr i32, i32* %"ptr.11", i32 %".82"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".84", i32** %"ptr"
  ret i32 0
}
