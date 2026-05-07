; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
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
  %"i" = alloca i32
  ;  Source: inti=1000;
  store i32 1000, i32* %"i"
  %"a" = alloca i32*
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: &i
  ;  Source: int*a=&i;
  store i32* %"i", i32** %"a"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32*, i32** %"a"
  ;  Source: a<0
  %".11" = ptrtoint i32* %"a.1" to i32
  %".12" = icmp ult i32 %".11", 0
  %".13" = zext i1 %".12" to i32
  ;  Source: printf("%d",a<0);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".13")
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.2" = load i32*, i32** %"a"
  ;  Source: a>0
  %".19" = ptrtoint i32* %"a.2" to i32
  %".20" = icmp ugt i32 %".19", 0
  %".21" = zext i1 %".20" to i32
  ;  Source: printf("%d",a>0);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".21")
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32*, i32** %"a"
  ;  Source: a
  %"a.4" = load i32*, i32** %"a"
  ;  Source: (a+1)
  %".28" = getelementptr i32, i32* %"a.4", i32 1
  ;  Source: a>(a+1)
  %".30" = ptrtoint i32* %"a.3" to i32
  %".31" = ptrtoint i32* %".28" to i32
  %".32" = icmp ugt i32 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: printf("%d",a>(a+1));
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".33")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"