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

define void @"f"()
{
entry:
  %".2" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: printf("Hello ");
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2")
  ;  Source: return;
  ret void
}

define void @"g"()
{
entry:
  %".2" = bitcast [7 x i8]* @"str.1" to i8*
  ;  Source: printf("World\n");
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2")
  ;  Source: f();
  call void @"f"()
  %".7" = bitcast [7 x i8]* @"str.2" to i8*
  ;  Source: printf("World\n");
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".7")
  ret void
}

@"str" = internal constant [7 x i8] c"Hello \00"
@"str.1" = internal constant [7 x i8] c"World\0a\00"
@"str.2" = internal constant [7 x i8] c"World\0a\00"
define i32 @"main"()
{
entry:
  ;  User Comment: /* Should print "hello world" twice */
  ;  Source: f();
  call void @"f"()
  ;  Source: g();
  call void @"g"()
  ;  Source: return0;
  ret i32 0
}
