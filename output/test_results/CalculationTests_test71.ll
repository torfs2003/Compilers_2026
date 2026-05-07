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
  %"x" = alloca i32
  ;  Source: boolx=1;
  store i32 1, i32* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %"y" = alloca i32
  ;  Source: booly=0;
  store i32 0, i32* %"y"
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%d",y);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"y.1")
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: x&&y
  %".17" = icmp ne i32 %"x.2", 0
  %".18" = icmp ne i32 %"y.2", 0
  %".19" = and i1 %".17", %".18"
  %".20" = zext i1 %".19" to i32
  ;  Source: intz=x&&y;
  store i32 %".20", i32* %"z"
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"z.1")
  %"a" = alloca i32
  ;  Source: appela=5;
  store i32 5, i32* %"a"
  %".29" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%c",a);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"a.1")
  %"b" = alloca i32
  ;  Source: peerb=4;
  store i32 4, i32* %"b"
  %".35" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%c",b);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"b.1")
  %"c" = alloca i32
  ;  Source: Cboolc=1;
  store i32 1, i32* %"c"
  %"boo" = alloca i32
  ;  Source: y
  %"y.3" = load i32, i32* %"y"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  %".43" = mul i32 %"y.3", %"z.2"
  ;  Source: y*z*57809
  %".45" = mul i32 %".43", 57809
  ;  Source: boolboo=y*z*57809;
  store i32 %".45", i32* %"boo"
  %".48" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: boo
  %"boo.1" = load i32, i32* %"boo"
  ;  Source: printf("%d",boo);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"boo.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%d\00"