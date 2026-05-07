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
  %"nl" = alloca i8
  ;  Source: charnl='\n';
  store i8 10, i8* %"nl"
  %"tab" = alloca i8
  ;  Source: chartab='\t';
  store i8 9, i8* %"tab"
  %"character_null" = alloca i8
  ;  Source: charcharacter_null='\0';
  store i8 0, i8* %"character_null"
  ret i32 0
}
