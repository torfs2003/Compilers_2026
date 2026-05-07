; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"array" = alloca [3 x i32]
  ;  Source: intarray[3]={0,1,2};
  %".3" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  store i32 0, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  store i32 1, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 2
  store i32 2, i32* %".7"
  %"array_ptr" = alloca i32*
  ;  Source: array
  ;  Source: array[0]
  %"gep_array" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: &array[0]
  ;  Source: int*array_ptr=&array[0];
  store i32* %"gep_array", i32** %"array_ptr"
  %"a" = alloca i32
  ;  Source: array_ptr
  %"array_ptr.1" = load i32*, i32** %"array_ptr"
  ;  Source: (array_ptr+2)
  %".16" = getelementptr i32, i32* %"array_ptr.1", i32 2
  ;  Source: *(array_ptr+2)
  %"deref_load" = load i32, i32* %".16"
  ;  Source: inta=*(array_ptr+2);
  store i32 %"deref_load", i32* %"a"
  %".20" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"a.1")
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: array_ptr
  %"array_ptr.2" = load i32*, i32** %"array_ptr"
  ;  Source: (array_ptr++)
  %".27" = load i32*, i32** %"array_ptr"
  %"ptr_incdec" = getelementptr i32, i32* %".27", i32 1
  store i32* %"ptr_incdec", i32** %"array_ptr"
  ;  Source: *(array_ptr++)
  %"deref_load.1" = load i32, i32* %".27"
  ;  Source: a=*(array_ptr++);
  store i32 %"deref_load.1", i32* %"a"
  %".32" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"a.3")
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: array_ptr
  %"array_ptr.3" = load i32*, i32** %"array_ptr"
  ;  Source: (array_ptr-1)
  %".39" = sub i32 0, 1
  %".40" = getelementptr i32, i32* %"array_ptr.3", i32 %".39"
  ;  Source: *(array_ptr-1)
  %"deref_load.2" = load i32, i32* %".40"
  ;  Source: a=*(array_ptr-1);
  store i32 %"deref_load.2", i32* %"a"
  %".44" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"a.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"