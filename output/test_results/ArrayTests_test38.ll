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
  %"k" = alloca [4 x i8]
  ;  Source: chark[4]={'l','o','c','k'};
  %".3" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 0
  store i8 108, i8* %".3"
  %".5" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 1
  store i8 111, i8* %".5"
  %".7" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 2
  store i8 99, i8* %".7"
  %".9" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 3
  store i8 107, i8* %".9"
  %"c" = alloca i8*
  ;  Source: k
  ;  Source: k[1]
  %"decay_left" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 0
  %"gep_ptr" = getelementptr i8, i8* %"decay_left", i32 1
  %"array_element" = load i8, i8* %"gep_ptr"
  ;  Source: &k[1]
  ;  Source: char*c=&k[1];
  store i8* %"gep_ptr", i8** %"c"
  %".16" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  ;  Source: *c
  %"deref_load" = load i8, i8* %"c.1"
  ;  Source: printf("%c",*c);
  %".20" = zext i8 %"deref_load" to i32
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".20")
  ;  Source: k
  ;  Source: k+3;
  %"decay_left.1" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 0
  %".24" = getelementptr i8, i8* %"decay_left.1", i32 3
  %".25" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  ;  Source: (k+2)
  %"decay_left.2" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 0
  %".28" = getelementptr i8, i8* %"decay_left.2", i32 2
  ;  Source: *(k+2)
  %"deref_load.1" = load i8, i8* %".28"
  ;  Source: printf("%c",*(k+2));
  %".31" = zext i8 %"deref_load.1" to i32
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".31")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"