; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca [2 x i32]
  ;  Source: intb[2];
  %"a" = alloca [4 x i32]
  ;  Source: inta[4]={1,2,3,4};
  %".4" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".4"
  %".6" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".6"
  %".8" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".8"
  %".10" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".10"
  %"k" = alloca i32*
  ;  Source: a
  ;  Source: int*k=a;
  %".14" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".14", i32** %"k"
  ;  Source: k
  %"k.1" = load i32*, i32** %"k"
  ;  Source: k
  %"k.2" = load i32*, i32** %"k"
  ;  Source: k+2
  %".19" = getelementptr i32, i32* %"k.2", i32 2
  ;  Source: k=k+2;
  store i32* %".19", i32** %"k"
  %".22" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: k
  %"k.3" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k.3"
  ;  Source: printf("%d ",*k);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"deref_load")
  %"e" = alloca i32
  ;  Source: a
  ;  Source: 5==a
  %".29" = ptrtoint [4 x i32]* %"a" to i32
  %".30" = icmp eq i32 5, %".29"
  %".31" = zext i1 %".30" to i32
  ;  Source: inte=5==a;
  store i32 %".31", i32* %"e"
  %"t" = alloca i32
  ;  Source: a
  ;  Source: a!=5
  %".36" = ptrtoint [4 x i32]* %"a" to i32
  %".37" = icmp ne i32 %".36", 5
  %".38" = zext i1 %".37" to i32
  ;  Source: intt=a!=5;
  store i32 %".38", i32* %"t"
  %".41" = bitcast [9 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: t
  %"t.1" = load i32, i32* %"t"
  ;  Source: k
  %"k.4" = load i32*, i32** %"k"
  ;  Source: (8==k)
  %".46" = ptrtoint i32* %"k.4" to i32
  %".47" = icmp eq i32 8, %".46"
  %".48" = zext i1 %".47" to i32
  ;  Source: printf("%d %d %d",e,t,(8==k));
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"e.1", i32 %"t.1", i32 %".48")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [9 x i8] c"%d %d %d\00"