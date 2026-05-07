; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  store i32 1000, i32* %"i"
  %"a" = alloca i32*
  store i32* %"i", i32** %"a"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32*, i32** %"a"
  ;  Source: a<0
  %".7" = ptrtoint i32* %"a.1" to i32
  %".8" = icmp ult i32 %".7", 0
  %".9" = zext i1 %".8" to i32
  ;  Source: printf("%d",a<0);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".9")
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.2" = load i32*, i32** %"a"
  ;  Source: a>0
  %".15" = ptrtoint i32* %"a.2" to i32
  %".16" = icmp ugt i32 %".15", 0
  %".17" = zext i1 %".16" to i32
  ;  Source: printf("%d",a>0);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".17")
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32*, i32** %"a"
  ;  Source: a
  %"a.4" = load i32*, i32** %"a"
  ;  Source: (a+1)
  %".24" = getelementptr i32, i32* %"a.4", i32 1
  ;  Source: a>(a+1)
  %".26" = ptrtoint i32* %"a.3" to i32
  %".27" = ptrtoint i32* %".24" to i32
  %".28" = icmp ugt i32 %".26", %".27"
  %".29" = zext i1 %".28" to i32
  ;  Source: printf("%d",a>(a+1));
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".29")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"