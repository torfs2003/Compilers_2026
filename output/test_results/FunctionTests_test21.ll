; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"name"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"name" = alloca i32
  store i32 0, i32* %"name"
  %".5" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: name
  %"name_load" = load i32, i32* %"name"
  ;  Source: printf("%d\n",name);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"name_load")
  ;  Source: return;
  ret void
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 5, i32* %"b"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: name(b);
  call void @"name"(i32 %"b_load")
  %".6" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"b_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"