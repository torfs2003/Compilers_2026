; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

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
