; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"appel" = alloca i32
  %"character" = alloca i32
  %".2" = sext i8 99 to i32
  store i32 %".2", i32* %"character"
  %"p" = alloca i32
  %"character_load" = load i32, i32* %"character"
  store i32 %"character_load", i32* %"p"
  ;  User Comment: //beer > 3; // Use the identifier beer,  not the typedef beer!
  ;  User Comment: //cry
  ;  User Comment: //cry2
  ;  Source: return0;
  ret i32 0
}
