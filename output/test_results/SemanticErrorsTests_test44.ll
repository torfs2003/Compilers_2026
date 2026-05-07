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
  %"k" = alloca [2 x i32]
  ;  Source: intk[2]={1,2};
  %".3" = getelementptr [2 x i32], [2 x i32]* %"k", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [2 x i32], [2 x i32]* %"k", i32 0, i32 1
  store i32 2, i32* %".5"
  %"s" = alloca [2 x i32]
  ;  Source: ints[2]={3,4};
  %".8" = getelementptr [2 x i32], [2 x i32]* %"s", i32 0, i32 0
  store i32 3, i32* %".8"
  %".10" = getelementptr [2 x i32], [2 x i32]* %"s", i32 0, i32 1
  store i32 4, i32* %".10"
  %"a" = alloca i32
  ;  Source: s
  ;  Source: s[2]
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"s", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 2
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: k
  ;  Source: k[2]
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"k", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 2
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: s[2]+k[2]
  %".17" = add i32 %"array_element", %"array_element.1"
  ;  Source: inta=s[2]+k[2];
  store i32 %".17", i32* %"a"
  ;  User Comment: //int* a = s + k;
  ;  Source: return0;
  ret i32 0
}
