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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca [3 x i32]
  ;  Source: inta[3];
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: a[0]=10;
  store i32 10, i32* %"gep_ptr"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: a[1]=20;
  store i32 20, i32* %"gep_ptr.1"
  ;  Source: a
  ;  Source: a[2]
  %"decay_left.2" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_ptr.2" = getelementptr i32, i32* %"decay_left.2", i32 2
  %"array_element.2" = load i32, i32* %"gep_ptr.2"
  ;  Source: a[2]=30;
  store i32 30, i32* %"gep_ptr.2"
  %"i" = alloca i32
  ;  Source: inti=1;
  store i32 1, i32* %"i"
  ;  Source: while(i<4){printf("%d; ",a[i-1]);i++;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".19" = icmp slt i32 %"i.1", 4
  %".20" = zext i1 %".19" to i32
  %"whilecond" = icmp ne i32 %".20", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".22" = bitcast [5 x i8]* @"str" to i8*
  %"i.2" = load i32, i32* %"i"
  %".23" = sub i32 %"i.2", 1
  %"decay_left.3" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_ptr.3" = getelementptr i32, i32* %"decay_left.3", i32 %".23"
  %"array_element.3" = load i32, i32* %"gep_ptr.3"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"array_element.3")
  %"i.3" = load i32, i32* %"i"
  %".25" = load i32, i32* %"i"
  %".26" = add i32 %".25", 1
  store i32 %".26", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"