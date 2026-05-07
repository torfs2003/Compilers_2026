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
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d ",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  %".9" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: *ptr
  %"deref_load" = load i32, i32* %"ptr.1"
  ;  Source: printf("%d ",*ptr);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"deref_load")
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".16" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".16", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".20" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".20", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  %".22" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: *ptr
  %"deref_load.1" = load i32, i32* %"ptr.4"
  ;  Source: printf("%d ",*ptr);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"deref_load.1")
  %"is_x" = alloca i32
  %"ptr.5" = load i32*, i32** %"ptr"
  %".27" = ptrtoint i32* %"ptr.5" to i32
  %".28" = ptrtoint i32* %"x" to i32
  %".29" = icmp eq i32 %".27", %".28"
  %".30" = zext i1 %".29" to i32
  store i32 %".30", i32* %"is_x"
  %"is_y" = alloca i32
  %"ptr.6" = load i32*, i32** %"ptr"
  %".32" = ptrtoint i32* %"ptr.6" to i32
  %".33" = ptrtoint i32* %"y" to i32
  %".34" = icmp eq i32 %".32", %".33"
  %".35" = zext i1 %".34" to i32
  store i32 %".35", i32* %"is_y"
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".41" = ptrtoint i32* %"x" to i32
  %".42" = ptrtoint i32* %"ptr.7" to i32
  %".43" = icmp ne i32 %".41", %".42"
  %".44" = zext i1 %".43" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".44", i32* %"is_y"
  %"ptr2" = alloca float*
  %".47" = inttoptr i32 0 to float*
  store float* %".47", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".52" = ptrtoint float* %"ptr2.1" to i32
  %".53" = ptrtoint i32* %"ptr.8" to i32
  %".54" = icmp uge i32 %".52", %".53"
  %".55" = zext i1 %".54" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".59" = ptrtoint float* %"ptr2.2" to i32
  %".60" = ptrtoint i32* %"ptr.9" to i32
  %".61" = icmp ule i32 %".59", %".60"
  %".62" = zext i1 %".61" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".66" = ptrtoint i32* %"ptr.10" to i32
  %".67" = ptrtoint i32* %"x" to i32
  %".68" = icmp ugt i32 %".66", %".67"
  %".69" = zext i1 %".68" to i32
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".72" = ptrtoint i32* %"ptr.11" to i32
  %".73" = icmp ult i32 %".72", 32
  %".74" = zext i1 %".73" to i32
  %"num_skip_elements" = alloca i32
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.12" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.13" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".79" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".81" = getelementptr i32, i32* %"ptr.13", i32 %".79"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".81", i32** %"ptr"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [4 x i8] c"%d \00"
@"str.2" = internal constant [4 x i8] c"%d \00"