; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"y" = alloca i32
  store i32 5, i32* %"y"
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".7" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".7", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  User Comment: // now points to y
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  User Comment: // now points to y
  ;  Source: ptr--;
  %".13" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".13", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  %"is_x" = alloca i32
  %"ptr.3" = load i32*, i32** %"ptr"
  %".15" = ptrtoint i32* %"ptr.3" to i32
  %".16" = ptrtoint i32* %"x" to i32
  %".17" = icmp eq i32 %".15", %".16"
  %".18" = zext i1 %".17" to i32
  store i32 %".18", i32* %"is_x"
  %"is_y" = alloca i32
  %"ptr.4" = load i32*, i32** %"ptr"
  %".20" = ptrtoint i32* %"ptr.4" to i32
  %".21" = ptrtoint i32* %"y" to i32
  %".22" = icmp eq i32 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  store i32 %".23", i32* %"is_y"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".29" = ptrtoint i32* %"x" to i32
  %".30" = ptrtoint i32* %"ptr.5" to i32
  %".31" = icmp ne i32 %".29", %".30"
  %".32" = zext i1 %".31" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".32", i32* %"is_y"
  %"ptr2" = alloca float*
  %".35" = inttoptr i32 0 to float*
  store float* %".35", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".40" = ptrtoint float* %"ptr2.1" to i32
  %".41" = ptrtoint i32* %"ptr.6" to i32
  %".42" = icmp uge i32 %".40", %".41"
  %".43" = zext i1 %".42" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".47" = ptrtoint float* %"ptr2.2" to i32
  %".48" = ptrtoint i32* %"ptr.7" to i32
  %".49" = icmp ule i32 %".47", %".48"
  %".50" = zext i1 %".49" to i32
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".54" = ptrtoint i32* %"ptr.8" to i32
  %".55" = ptrtoint i32* %"x" to i32
  %".56" = icmp ugt i32 %".54", %".55"
  %".57" = zext i1 %".56" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".60" = ptrtoint i32* %"ptr.9" to i32
  %".61" = icmp ult i32 %".60", 32
  %".62" = zext i1 %".61" to i32
  %"num_skip_elements" = alloca i32
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".67" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".69" = getelementptr i32, i32* %"ptr.11", i32 %".67"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".69", i32** %"ptr"
  ;  Source: return0;
  ret i32 0
}
