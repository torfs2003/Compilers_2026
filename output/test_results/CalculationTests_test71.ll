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
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x_load")
  %"y" = alloca i32
  store i32 0, i32* %"y"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: printf("%d",y);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"y_load")
  %"z" = alloca i32
  %"x_load.1" = load i32, i32* %"x"
  %"y_load.1" = load i32, i32* %"y"
  %".12" = icmp ne i32 %"x_load.1", 0
  %".13" = icmp ne i32 %"y_load.1", 0
  %".14" = and i1 %".12", %".13"
  %".15" = zext i1 %".14" to i32
  store i32 %".15", i32* %"z"
  %".17" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"z_load")
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %".22" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: printf("%c",a);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"a_load")
  %"b" = alloca i32
  store i32 4, i32* %"b"
  %".27" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: printf("%c",b);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"b_load")
  %"c" = alloca i32
  store i32 1, i32* %"c"
  %"boo" = alloca i32
  %"y_load.2" = load i32, i32* %"y"
  %"z_load.1" = load i32, i32* %"z"
  %".32" = mul i32 %"y_load.2", %"z_load.1"
  %".33" = mul i32 %".32", 57809
  store i32 %".33", i32* %"boo"
  %".35" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: boo
  %"boo_load" = load i32, i32* %"boo"
  ;  Source: printf("%d",boo);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"boo_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%d\00"