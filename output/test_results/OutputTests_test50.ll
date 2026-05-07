; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"num" = alloca i32
  ;  Source: constintnum=10;
  store i32 10, i32* %"num"
  %"ptr" = alloca i32*
  ;  Source: num
  %"num.1" = load i32, i32* %"num"
  ;  Source: &num
  ;  Source: constint*ptr=&num;
  store i32* %"num", i32** %"ptr"
  %"nonConstPtr" = alloca i32*
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: (int*)ptr
  ;  Source: int*nonConstPtr=(int*)ptr;
  store i32* %"ptr.1", i32** %"nonConstPtr"
  ;  Source: nonConstPtr
  %"nonConstPtr.1" = load i32*, i32** %"nonConstPtr"
  %"deref_load" = load i32, i32* %"nonConstPtr.1"
  ;  Source: *nonConstPtr=20;
  store i32 20, i32* %"nonConstPtr.1"
  %".15" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: num
  %"num.2" = load i32, i32* %"num"
  ;  Source: printf("%d\n",num);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"num.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"