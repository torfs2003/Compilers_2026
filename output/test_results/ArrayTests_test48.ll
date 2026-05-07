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
  %".2" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".8"
  %"k" = alloca i32*
  %".10" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".10", i32** %"k"
  ;  Source: k
  %"k.1" = load i32*, i32** %"k"
  ;  Source: k
  %"k.2" = load i32*, i32** %"k"
  ;  Source: k+2
  %".15" = getelementptr i32, i32* %"k.2", i32 2
  ;  Source: k=k+2;
  store i32* %".15", i32** %"k"
  %".18" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: k
  %"k.3" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k.3"
  ;  Source: printf("%d ",*k);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"deref_load")
  %"e" = alloca i32
  %".23" = ptrtoint [4 x i32]* %"a" to i32
  %".24" = icmp eq i32 5, %".23"
  %".25" = zext i1 %".24" to i32
  store i32 %".25", i32* %"e"
  %"t" = alloca i32
  %".27" = ptrtoint [4 x i32]* %"a" to i32
  %".28" = icmp ne i32 %".27", 5
  %".29" = zext i1 %".28" to i32
  store i32 %".29", i32* %"t"
  %"p" = alloca i32
  %"k.4" = load i32*, i32** %"k"
  %".31" = ptrtoint i32* %"k.4" to i32
  %".32" = ptrtoint [4 x i32]* %"a" to i32
  %".33" = icmp ne i32 %".31", %".32"
  %".34" = zext i1 %".33" to i32
  store i32 %".34", i32* %"p"
  %".36" = bitcast [9 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: t
  %"t.1" = load i32, i32* %"t"
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: printf("%d %d %d",e,t,p);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"e.1", i32 %"t.1", i32 %"p.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [9 x i8] c"%d %d %d\00"