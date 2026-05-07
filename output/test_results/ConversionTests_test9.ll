; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  ;  User Comment: // now points to y
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  User Comment: // now points to y
  ;  Source: ptr--;
  %".19" = load i32*, i32** %"ptr"
  %".20" = getelementptr i32, i32* %".19", i32 -1
  store i32* %".20", i32** %"ptr"
  %"is_x" = alloca i32
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".25" = ptrtoint i32* %"ptr.3" to i32
  %".26" = ptrtoint i32* %"x" to i32
  %".27" = icmp eq i32 %".25", %".26"
  %".28" = zext i1 %".27" to i32
  ;  User Comment: // now points to x
  ;  Source: intis_x=(ptr==&x);
  store i32 %".28", i32* %"is_x"
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".35" = ptrtoint i32* %"ptr.4" to i32
  %".36" = ptrtoint i32* %"y" to i32
  %".37" = icmp eq i32 %".35", %".36"
  %".38" = zext i1 %".37" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".38", i32* %"is_y"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".45" = ptrtoint i32* %"x" to i32
  %".46" = ptrtoint i32* %"ptr.5" to i32
  %".47" = icmp ne i32 %".45", %".46"
  %".48" = zext i1 %".47" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".48", i32* %"is_y"
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".52" = inttoptr i32 0 to float*
  store float* %".52", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".57" = ptrtoint float* %"ptr2.1" to i32
  %".58" = ptrtoint i32* %"ptr.6" to i32
  %".59" = icmp uge i32 %".57", %".58"
  %".60" = zext i1 %".59" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".64" = ptrtoint float* %"ptr2.2" to i32
  %".65" = ptrtoint i32* %"ptr.7" to i32
  %".66" = icmp ule i32 %".64", %".65"
  %".67" = zext i1 %".66" to i32
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".71" = ptrtoint i32* %"ptr.8" to i32
  %".72" = ptrtoint i32* %"x" to i32
  %".73" = icmp ugt i32 %".71", %".72"
  %".74" = zext i1 %".73" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".77" = ptrtoint i32* %"ptr.9" to i32
  %".78" = icmp ult i32 %".77", 32
  %".79" = zext i1 %".78" to i32
  %"num_skip_elements" = alloca i32
  ;  Source: intnum_skip_elements=4;
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".85" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".87" = getelementptr i32, i32* %"ptr.11", i32 %".85"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".87", i32** %"ptr"
  ;  Source: return0;
  ret i32 0
}
