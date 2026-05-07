; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"line_of_code" = alloca i32
  ;  User Comment: /*
  ;  User Comment: * This is a comment
  ;  User Comment: *
  ;  User Comment: */
  ;  Source: intline_of_code=5;
  store i32 5, i32* %"line_of_code"
  %"f" = alloca float
  ;  User Comment: /**
  ;  User Comment: * Another Comment
  ;  User Comment: ***** /
  ;  User Comment: /**
  ;  User Comment: *
  ;  User Comment: *
  ;  User Comment: **/
  ;  Source: floatf=45;
  %".16" = sitofp i32 45 to float
  store float %".16", float* %"f"
  %"c" = alloca i8
  ;  User Comment: /* /// ** ** // // //  */
  ;  Source: charc='b';
  store i8 98, i8* %"c"
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  ret i32 0
}
