; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: a==b
  %".8" = icmp eq i32 %"a.1", %"b.1"
  %".9" = zext i1 %".8" to i32
  ;  Source: printf("%d",a==b);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".9")
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: a!=b
  %".16" = icmp ne i32 %"a.2", %"b.2"
  %".17" = zext i1 %".16" to i32
  ;  Source: printf("%d",a!=b);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".17")
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: a==b
  %".27" = icmp eq i32 %"a.3", %"b.4"
  %".28" = zext i1 %".27" to i32
  ;  Source: printf("%d",a==b);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".28")
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: a!=b
  %".35" = icmp ne i32 %"a.4", %"b.5"
  %".36" = zext i1 %".35" to i32
  ;  Source: printf("%d",a!=b);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".36")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"