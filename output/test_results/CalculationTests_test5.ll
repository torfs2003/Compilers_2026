; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: x=1;
  store i32 1, i32* %"x"
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  ;  Source: ptr
  %"ptr_load" = load i32*, i32** %"ptr"
  ;  Source: ptr++;
  %".9" = load i32*, i32** %"ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".9", i32 1
  store i32* %"ptr_incdec", i32** %"ptr"
  ;  Source: ptr
  %"ptr_load.1" = load i32*, i32** %"ptr"
  ;  Source: ptr--;
  %".13" = load i32*, i32** %"ptr"
  %"ptr_incdec.1" = getelementptr i32, i32* %".13", i32 -1
  store i32* %"ptr_incdec.1", i32** %"ptr"
  %"is_x" = alloca i32
  %"ptr_load.2" = load i32*, i32** %"ptr"
  %".15" = ptrtoint i32* %"ptr_load.2" to i32
  %".16" = ptrtoint i32* %"x" to i32
  %".17" = icmp eq i32 %".15", %".16"
  %".18" = zext i1 %".17" to i32
  store i32 %".18", i32* %"is_x"
  %".20" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: is_x
  %"is_x_load" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"is_x_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"