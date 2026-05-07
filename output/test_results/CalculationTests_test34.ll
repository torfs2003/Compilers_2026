; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 15, i32* %"a"
  %"x" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".3" = add i32 %"a.1", 50
  %".4" = icmp ne i32 %".3", 0
  %".5" = icmp ne i32 1, 0
  %".6" = or i1 %".4", %".5"
  %".7" = zext i1 %".6" to i32
  store i32 %".7", i32* %"x"
  %"b" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %"x.1" = load i32, i32* %"x"
  %".9" = add i32 %"a.2", %"x.1"
  %".10" = icmp ne i32 %".9", 0
  %".11" = icmp ne i32 0, 0
  %".12" = and i1 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  store i32 %".13", i32* %"b"
  %"c" = alloca i32
  %"a.3" = load i32, i32* %"a"
  %"x.2" = load i32, i32* %"x"
  %".15" = add i32 %"a.3", %"x.2"
  %".16" = icmp ne i32 1, 0
  %".17" = icmp ne i32 %".15", 0
  %".18" = and i1 %".16", %".17"
  %".19" = zext i1 %".18" to i32
  store i32 %".19", i32* %"c"
  %"d" = alloca i32
  %"c.1" = load i32, i32* %"c"
  %".21" = sdiv i32 %"c.1", 80
  %".22" = icmp ne i32 0, 0
  %".23" = icmp ne i32 %".21", 0
  %".24" = or i1 %".22", %".23"
  %".25" = zext i1 %".24" to i32
  store i32 %".25", i32* %"d"
  %".27" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"a.4")
  %".31" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"x.3")
  %".35" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"b.1")
  %".39" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"c.2")
  %".43" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: printf("%d",d);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %"d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"