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
  %"x" = alloca [22 x i32]
  ;  Source: intx[22];
  %"i" = alloca i32
  ;  Source: inti=1;
  store i32 1, i32* %"i"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=1;
  store i32 1, i32* %"i"
  ;  Source: x
  ;  Source: i
  %"i.2" = load i32, i32* %"i"
  ;  Source: i+2
  %".11" = add i32 %"i.2", 2
  ;  Source: x[i+2]
  %"decay_left" = getelementptr [22 x i32], [22 x i32]* %"x", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 %".11"
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: x[i+2]=1;
  store i32 1, i32* %"gep_ptr"
  %".15" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[3]
  %"decay_left.1" = getelementptr [22 x i32], [22 x i32]* %"x", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 3
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: printf("%d",x[3]);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"