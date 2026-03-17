; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: charnl='\n';
  %"nl" = alloca i8
  store i8 10, i8* %"nl"
  ;  Source: chartab='\t';
  %"tab" = alloca i8
  store i8 9, i8* %"tab"
  ;  Source: charcharacter_null='\0';
  %"character_null" = alloca i8
  store i8 0, i8* %"character_null"
  ret i32 0
}
