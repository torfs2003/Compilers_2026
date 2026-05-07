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
  %"z" = alloca [2 x i8]
  ;  Source: charz[2];
  ;  Source: z
  ;  Source: z[0]
  %"decay_left" = getelementptr [2 x i8], [2 x i8]* %"z", i32 0, i32 0
  %"gep_ptr" = getelementptr i8, i8* %"decay_left", i32 0
  %"array_element" = load i8, i8* %"gep_ptr"
  ;  Source: z[0]='O';
  store i8 79, i8* %"gep_ptr"
  ;  Source: z
  ;  Source: z[1]
  %"decay_left.1" = getelementptr [2 x i8], [2 x i8]* %"z", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i8, i8* %"decay_left.1", i32 1
  %"array_element.1" = load i8, i8* %"gep_ptr.1"
  %".9" = bitcast [2 x i8]* @"str" to i8*
  ;  Source: z[1]="Y";
  %".11" = ptrtoint i8* %".9" to i8
  store i8 %".11", i8* %"gep_ptr.1"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  ;  Source: z[0]
  %"decay_left.2" = getelementptr [2 x i8], [2 x i8]* %"z", i32 0, i32 0
  %"gep_ptr.2" = getelementptr i8, i8* %"decay_left.2", i32 0
  %"array_element.2" = load i8, i8* %"gep_ptr.2"
  ;  Source: printf("%c",z[0]);
  %".17" = zext i8 %"array_element.2" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [2 x i8] c"Y\00"
@"str.1" = internal constant [3 x i8] c"%c\00"