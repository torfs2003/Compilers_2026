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
  %"x" = alloca [2 x i8]
  ;  Source: charx[2]={'a','b'};
  %".3" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  store i8 97, i8* %".3"
  %".5" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 1
  store i8 98, i8* %".5"
  %"c" = alloca i8*
  ;  Source: x
  ;  Source: char*c=x;
  %".9" = bitcast [2 x i8]* %"x" to i8*
  store i8* %".9", i8** %"c"
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  %"deref_load" = load i8, i8* %"c.1"
  ;  Source: *c='c';
  store i8 99, i8* %"c.1"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.2" = load i8*, i8** %"c"
  ;  Source: *c
  %"deref_load.1" = load i8, i8* %"c.2"
  ;  Source: printf("%c",*c);
  %".18" = zext i8 %"deref_load.1" to i32
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".18")
  %".20" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  %"gep_ptr" = getelementptr i8, i8* %"decay_left", i32 0
  %"array_element" = load i8, i8* %"gep_ptr"
  ;  Source: printf("%c",x[0]);
  %".24" = zext i8 %"array_element" to i32
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".24")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"