; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=5*(3/10+9/10);
  store i32 0, i32* %"x"
  %"y" = alloca float
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  %".5" = mul i32 %"x.1", 2
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: (2+1*2/3+x)
  %".8" = add i32 2, %"x.2"
  %".9" = sdiv i32 %".5", %".8"
  ;  Source: x*2/(2+1*2/3+x)+8*(8/4)
  %".11" = add i32 %".9", 16
  ;  Source: floaty=x*2/(2+1*2/3+x)+8*(8/4);
  %".13" = sitofp i32 %".11" to float
  store float %".13", float* %"y"
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: y
  %"y.2" = load float, float* %"y"
  ;  Source: x+y
  %".19" = sitofp i32 %"x.3" to float
  %".20" = fadd float %".19", %"y.2"
  ;  Source: y=x+y;
  store float %".20", float* %"y"
  %"z" = alloca i32
  ;  Source: intz;
  %"flt_ptr" = alloca float*
  ;  Source: y
  %"y.3" = load float, float* %"y"
  ;  Source: &y
  ;  Source: float*flt_ptr=&y;
  store float* %"y", float** %"flt_ptr"
  %"ch" = alloca i8
  ;  Source: charch='x';
  store i8 120, i8* %"ch"
  %"ptr_to_int" = alloca i32*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: constint*ptr_to_int=&z;
  store i32* %"z", i32** %"ptr_to_int"
  ;  Source: ptr_to_int
  %"ptr_to_int.1" = load i32*, i32** %"ptr_to_int"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: ptr_to_int=&x;
  store i32* %"x", i32** %"ptr_to_int"
  ;  Source: ptr_to_int
  %"ptr_to_int.2" = load i32*, i32** %"ptr_to_int"
  %"deref_load" = load i32, i32* %"ptr_to_int.2"
  ;  User Comment: // this is allowed. The pointer now points to variable x
  ;  Source: *ptr_to_int=33;
  store i32 33, i32* %"ptr_to_int.2"
  ;  User Comment: // this is NOT allowed!
  ;  Source: return0;
  ret i32 0
}
