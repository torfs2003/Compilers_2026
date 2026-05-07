; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

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
  %"a" = alloca i32
  ;  Source: inta=9;
  store i32 9, i32* %"a"
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".14" = load i32*, i32** %"ptr"
  %".15" = getelementptr i32, i32* %".14", i32 1
  store i32* %".15", i32** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load i32*, i32** %"ptr"
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
  ;  Source: intis_x=(ptr==&x);
  store i32 %".28", i32* %"is_x"
  %".31" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"is_x.1")
  %"is_y" = alloca i32
  ;  Source: ptr
  %"ptr.4" = load i32*, i32** %"ptr"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: (ptr==&y)
  %".38" = ptrtoint i32* %"ptr.4" to i32
  %".39" = ptrtoint i32* %"y" to i32
  %".40" = icmp eq i32 %".38", %".39"
  %".41" = zext i1 %".40" to i32
  ;  Source: intis_y=(ptr==&y);
  store i32 %".41", i32* %"is_y"
  %".44" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: is_y
  %"is_y.1" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"is_y.1")
  ;  Source: is_y
  %"is_y.2" = load i32, i32* %"is_y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: ptr
  %"ptr.5" = load i32*, i32** %"ptr"
  ;  Source: (&x!=ptr)
  %".52" = ptrtoint i32* %"x" to i32
  %".53" = ptrtoint i32* %"ptr.5" to i32
  %".54" = icmp ne i32 %".52", %".53"
  %".55" = zext i1 %".54" to i32
  ;  Source: is_y=(&x!=ptr);
  store i32 %".55", i32* %"is_y"
  %".58" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: is_y
  %"is_y.3" = load i32, i32* %"is_y"
  ;  Source: printf("%d",is_y);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %"is_y.3")
  %"ptr2" = alloca float*
  ;  Source: float*ptr2=0;
  %".63" = inttoptr i32 0 to float*
  store float* %".63", float** %"ptr2"
  %".65" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: ptr2
  %"ptr2.1" = load float*, float** %"ptr2"
  ;  Source: printf("%d",ptr2);
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".65", float* %"ptr2.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"