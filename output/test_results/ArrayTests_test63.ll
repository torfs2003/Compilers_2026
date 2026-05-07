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
  %"c" = alloca [5 x i32]
  ;  Source: intc[5]={1,2,3,4,5};
  %".3" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 4
  store i32 5, i32* %".11"
  ;  Source: c
  ;  Source: c[1]
  %"decay_left" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 1
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: c[1]=0;
  store i32 0, i32* %"gep_ptr"
  %".17" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  ;  Source: c[0]
  %"decay_left.1" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 0
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: printf("%d",c[0]);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"array_element.1")
  %".22" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  ;  Source: c[1]
  %"decay_left.2" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"gep_ptr.2" = getelementptr i32, i32* %"decay_left.2", i32 1
  %"array_element.2" = load i32, i32* %"gep_ptr.2"
  ;  Source: printf("%d",c[1]);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"array_element.2")
  %".27" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  ;  Source: c[2]
  %"decay_left.3" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"gep_ptr.3" = getelementptr i32, i32* %"decay_left.3", i32 2
  %"array_element.3" = load i32, i32* %"gep_ptr.3"
  ;  Source: printf("%d",c[2]);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"array_element.3")
  %".32" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  ;  Source: c[3]
  %"decay_left.4" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"gep_ptr.4" = getelementptr i32, i32* %"decay_left.4", i32 3
  %"array_element.4" = load i32, i32* %"gep_ptr.4"
  ;  Source: printf("%d",c[3]);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"array_element.4")
  %".37" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  ;  Source: c[4]
  %"decay_left.5" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"gep_ptr.5" = getelementptr i32, i32* %"decay_left.5", i32 4
  %"array_element.5" = load i32, i32* %"gep_ptr.5"
  ;  Source: printf("%d",c[4]);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"array_element.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"