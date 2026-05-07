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

define i32 @"printthings"(i8* %".1")
{
entry:
  %"z" = alloca i8*
  store i8* %".1", i8** %"z"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load i8*, i8** %"z"
  ;  Source: printf("%s",z);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %"z.1")
  ;  Source: return5;
  ret i32 5
}

@"str" = internal constant [3 x i8] c"%s\00"
define i32 @"main"()
{
entry:
  %".2" = bitcast [6 x i8]* @"str.1" to i8*
  ;  Source: printthings("jajaj");
  %".4" = call i32 @"printthings"(i8* %".2")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [6 x i8] c"jajaj\00"