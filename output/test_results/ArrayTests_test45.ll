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
  ;  Source: intx=9;
  store i32 9, i32* %"x"
  %"a" = alloca [2 x i32]
  ;  Source: inta[2];
  %".5" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",-(-9));
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 9)
  %".8" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: ++x
  %".11" = load i32, i32* %"x"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"x"
  ;  Source: printf("%d; ",++x);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".12")
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_idx" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_idx"
  ;  Source: a[0]=15;
  store i32 15, i32* %"gep_idx"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_idx.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_idx.1"
  ;  Source: a[1]=12;
  store i32 12, i32* %"gep_idx.1"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x=12;
  store i32 12, i32* %"x"
  %".27" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: a
  ;  Source: (a[1])
  %"decay_left.2" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_idx.2" = getelementptr i32, i32* %"decay_left.2", i32 1
  %"array_element.2" = load i32, i32* %"gep_idx.2"
  ;  Source: --(a[1])
  %".31" = load i32, i32* %"gep_idx.2"
  %".32" = sub i32 %".31", 1
  store i32 %".32", i32* %"gep_idx.2"
  ;  Source: printf("%d; ",--(a[1]));
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".32")
  %".36" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x++
  %".39" = load i32, i32* %"x"
  %".40" = add i32 %".39", 1
  store i32 %".40", i32* %"x"
  ;  Source: printf("%d; ",x++);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %".44" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"x.4")
  ;  Source: a
  ;  Source: a[0]
  %"decay_left.3" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_idx.3" = getelementptr i32, i32* %"decay_left.3", i32 0
  %"array_element.3" = load i32, i32* %"gep_idx.3"
  ;  Source: a[0]--;
  %".51" = load i32, i32* %"gep_idx.3"
  %".52" = sub i32 %".51", 1
  store i32 %".52", i32* %"gep_idx.3"
  %".54" = bitcast [5 x i8]* @"str.5" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left.4" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_idx.4" = getelementptr i32, i32* %"decay_left.4", i32 0
  %"array_element.4" = load i32, i32* %"gep_idx.4"
  ;  Source: printf("%d; ",a[0]);
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %"array_element.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%d; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [5 x i8] c"%d; \00"
@"str.4" = internal constant [5 x i8] c"%d; \00"
@"str.5" = internal constant [5 x i8] c"%d; \00"