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
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  %"f" = alloca i32
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  %".13" = icmp eq i32 %"b_load.1", 0
  %".14" = zext i1 %".13" to i32
  ;  Source: (a||!b)
  %".16" = icmp ne i32 %"a_load.1", 0
  %".17" = icmp ne i32 %".14", 0
  %".18" = or i1 %".16", %".17"
  %".19" = zext i1 %".18" to i32
  ;  Source: f=(a||!b);
  store i32 %".19", i32* %"f"
  %".22" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f_load.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"f_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"