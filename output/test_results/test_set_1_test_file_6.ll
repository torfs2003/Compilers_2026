; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"y" = alloca i32
  store i32 5, i32* %"y"
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  %"is_x" = alloca i32
  %"is_y" = alloca i32
  %"ptr2" = alloca float*
  %".5" = inttoptr i32 0 to float*
  store float* %".5", float** %"ptr2"
  %"num_skip_elements" = alloca i32
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".10" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".10", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".14" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".14", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".20" = ptrtoint i32* %"ptr.3" to i32
  %".21" = ptrtoint i32* %"x" to i32
  %".22" = icmp eq i32 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: is_x=(ptr==&x);
  store i32 %".23", i32* %"is_x"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".30" = ptrtoint i32* %"ptr.4" to i32
  %".31" = ptrtoint i32* %"y" to i32
  %".32" = icmp eq i32 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: is_y=(ptr==&y);
  store i32 %".33", i32* %"is_y"
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".40" = ptrtoint i32* %"x" to i32
  %".41" = ptrtoint i32* %"ptr.5" to i32
  %".42" = icmp ne i32 %".40", %".41"
  %".43" = zext i1 %".42" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".43", i32* %"is_y"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".49" = ptrtoint float* %"ptr2.1" to i32
  %".50" = ptrtoint i32* %"ptr.6" to i32
  %".51" = icmp uge i32 %".49", %".50"
  %".52" = zext i1 %".51" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".56" = ptrtoint float* %"ptr2.2" to i32
  %".57" = ptrtoint i32* %"ptr.7" to i32
  %".58" = icmp ule i32 %".56", %".57"
  %".59" = zext i1 %".58" to i32
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".63" = ptrtoint i32* %"ptr.8" to i32
  %".64" = ptrtoint i32* %"x" to i32
  %".65" = icmp ugt i32 %".63", %".64"
  %".66" = zext i1 %".65" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".69" = ptrtoint i32* %"ptr.9" to i32
  %".70" = icmp ult i32 %".69", 32
  %".71" = zext i1 %".70" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".75" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".77" = getelementptr i32, i32* %"ptr.11", i32 %".75"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".77", i32** %"ptr"
  ret i32 0
}
