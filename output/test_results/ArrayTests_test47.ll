; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"b" = alloca [2 x i32]
  %"a" = alloca [4 x i32]
  store [4 x i32] zeroinitializer, [4 x i32]* %"a"
  %".3" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".9"
  %"k" = alloca i32*
  %".11" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".11", i32** %"k"
  ;  Source: k
  %"k_load" = load i32*, i32** %"k"
  ;  Source: k
  %"k_load.1" = load i32*, i32** %"k"
  ;  Source: k+2
  %".16" = getelementptr i32, i32* %"k_load.1", i32 2
  ;  Source: k=k+2;
  store i32* %".16", i32** %"k"
  %".19" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load.2" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k_load.2"
  ;  Source: printf("%d ",*k);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"deref_load")
  %"e" = alloca i32
  %".24" = ptrtoint [4 x i32]* %"a" to i32
  %".25" = icmp eq i32 5, %".24"
  %".26" = zext i1 %".25" to i32
  store i32 %".26", i32* %"e"
  %"t" = alloca i32
  %".28" = ptrtoint [4 x i32]* %"a" to i32
  %".29" = icmp ne i32 %".28", 5
  %".30" = zext i1 %".29" to i32
  store i32 %".30", i32* %"t"
  %".32" = bitcast [9 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: t
  %"t_load" = load i32, i32* %"t"
  ;  Source: k
  %"k_load.3" = load i32*, i32** %"k"
  ;  Source: (8==k)
  %".37" = ptrtoint i32* %"k_load.3" to i32
  %".38" = icmp eq i32 8, %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: printf("%d %d %d",e,t,(8==k));
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"e_load", i32 %"t_load", i32 %".39")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [9 x i8] c"%d %d %d\00"