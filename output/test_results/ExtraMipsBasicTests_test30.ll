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
  %"a" = alloca [2 x i32]
  ;  Source: inta[2]={'a','b'};
  %".3" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %".4" = sext i8 97 to i32
  store i32 %".4", i32* %".3"
  %".6" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 1
  %".7" = sext i8 98 to i32
  store i32 %".7", i32* %".6"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: printf("%c",a[0]);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"array_element")
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: printf("%c",a[1]);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"