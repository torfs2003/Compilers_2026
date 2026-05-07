; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

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
  %".22" = getelementptr i32, i32* %".21", i32 1
  store i32* %".22", i32** %"ptr"
  ;  Source: ptr
  %"ptr.3" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".26" = load i32*, i32** %"ptr"
  %".27" = getelementptr i32, i32* %".26", i32 -1
  store i32* %".27", i32** %"ptr"
  %"is_x" = alloca i32
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: (ptr==&x)
  %".32" = ptrtoint i32* %"ptr.4" to i32
  %".33" = ptrtoint i32* %"x" to i32
  %".34" = icmp eq i32 %".32", %".33"
  %".35" = zext i1 %".34" to i32
  ;  Source: intis_x=(ptr==&x);
  store i32 %".35", i32* %"is_x"
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".41" = ptrtoint i32* %"ptr.5" to i32
  %".42" = ptrtoint i32* %"y" to i32
  %".43" = icmp eq i32 %".41", %".42"
  %".44" = zext i1 %".43" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".44", i32* %"is_y"
  %".47" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %"is_y.1")
  %".51" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"is_x.1")
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.6" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".59" = ptrtoint i32* %"x" to i32
  %".60" = ptrtoint i32* %"ptr.6" to i32
  %".61" = icmp ne i32 %".59", %".60"
  %".62" = zext i1 %".61" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".62", i32* %"is_y"
  %".65" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: is_y
  %"is_y.3" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %"is_y.3")
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".70" = inttoptr i32 0 to float*
  store float* %".70", float** %"ptr2"
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.7" = load i32*, i32** %"ptr"
  ;  Source: ptr2>=ptr;
  %".75" = ptrtoint float* %"ptr2.1" to i32
  %".76" = ptrtoint i32* %"ptr.7" to i32
  %".77" = icmp uge i32 %".75", %".76"
  %".78" = zext i1 %".77" to i32
  ;  Source: ptr2
  %"ptr2.2" = load float*, float** %"ptr2"
  ;  Source: ptr
  %"ptr.8" = load i32*, i32** %"ptr"
  ;  Source: ptr2<=ptr;
  %".82" = ptrtoint float* %"ptr2.2" to i32
  %".83" = ptrtoint i32* %"ptr.8" to i32
  %".84" = icmp ule i32 %".82", %".83"
  %".85" = zext i1 %".84" to i32
  ;  Source: ptr
  %"ptr.9" = load i32*, i32** %"ptr"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: ptr>&x;
  %".89" = ptrtoint i32* %"ptr.9" to i32
  %".90" = ptrtoint i32* %"x" to i32
  %".91" = icmp ugt i32 %".89", %".90"
  %".92" = zext i1 %".91" to i32
  ;  Source: ptr
  %"ptr.10" = load i32*, i32** %"ptr"
  ;  Source: ptr<32;
  %".95" = ptrtoint i32* %"ptr.10" to i32
  %".96" = icmp ult i32 %".95", 32
  %".97" = zext i1 %".96" to i32
  %"num_skip_elements" = alloca i32
  ;  Source: intnum_skip_elements=4;
  store i32 4, i32* %"num_skip_elements"
  ;  Source: ptr
  %"ptr.11" = load i32*, i32** %"ptr"
  ;  Source: ptr
  %"ptr.12" = load i32*, i32** %"ptr"
  ;  Source: num_skip_elements
  %"num_skip_elements.1" = load i32, i32* %"num_skip_elements"
  %".103" = mul i32 4, %"num_skip_elements.1"
  ;  Source: ptr+4*num_skip_elements
  %".105" = getelementptr i32, i32* %"ptr.12", i32 %".103"
  ;  Source: ptr=ptr+4*num_skip_elements;
  store i32* %".105", i32** %"ptr"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"