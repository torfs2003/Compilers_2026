; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %"gep_array" = getelementptr [4 x i8], [4 x i8]* %"k", i32 0, i32 1
  %"array_element" = load i8, i8* %"gep_array"
  ;  Source: &k[1]
  ;  Source: char*c=&k[1];
  store i8* %"gep_array", i8** %"c"
  %".16" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  ;  Source: *c
  %"deref_load" = load i8, i8* %"c.1"
  ;  Source: printf("%c",*c);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i8 %"deref_load")
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  ;  Source: (k+2)
  %".24" = getelementptr [4 x i8], [4 x i8]* %"k", i32 2
  ;  Source: *(k+2)
  ;  Source: printf("%c",*(k+2));
  %".27" = getelementptr inbounds [4 x i8], [4 x i8]* %".24", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".21", i8* %".27")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"