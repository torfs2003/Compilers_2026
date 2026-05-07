; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: chara='a';
  store i8 97, i8* %"a"
  %"b" = alloca i8
  ;  Source: charb=5;
  %".5" = trunc i32 5 to i8
  store i8 %".5", i8* %"b"
  %"c" = alloca i8
  ;  Source: charc=4.2;
  %".8" = fptosi float 0x4010ccccc0000000 to i8
  store i8 %".8", i8* %"c"
  %"d" = alloca i32
  ;  Source: intd='a';
  %".11" = sext i8 97 to i32
  store i32 %".11", i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=5;
  store i32 5, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=4.2;
  %".16" = fptosi float 0x4010ccccc0000000 to i32
  store i32 %".16", i32* %"f"
  %"g" = alloca float
  ;  Source: floatg='a';
  %".19" = sitofp i8 97 to float
  store float %".19", float* %"g"
  %"h" = alloca float
  ;  Source: floath=5;
  %".22" = sitofp i32 5 to float
  store float %".22", float* %"h"
  %"i" = alloca float
  ;  Source: floati=4.2;
  store float 0x4010ccccc0000000, float* %"i"
  %"j" = alloca float
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: e+6.5
  %".28" = sitofp i32 %"e.1" to float
  %".29" = fadd float %".28", 0x401a000000000000
  ;  Source: floatj=e+6.5;
  store float %".29", float* %"j"
  ;  Source: return0;
  ret i32 0
}
