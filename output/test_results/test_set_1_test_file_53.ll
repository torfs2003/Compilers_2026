; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  ;  User Comment: // line 1
  ;  Source: charc='\n';
  %"c" = alloca i8
  store i8 10, i8* %"c"
  ;  Source: floatf=33.1;
  %"f" = alloca float
  store float 0x40408cccc0000000, float* %"f"
  ;  User Comment: // another line
  ;  User Comment: /////// some documentation
  ;  User Comment: /////////////////////////////////////
  ;  User Comment: // abcdef 123 //////////
  ;  Source: floatfinal_line=33.99895;
  %"final_line" = alloca float
  store float 0x4040ffdda0000000, float* %"final_line"
  ret i32 0
}
