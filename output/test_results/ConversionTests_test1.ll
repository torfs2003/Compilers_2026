; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: (char)5
  %".3" = trunc i32 5 to i8
  ;  Source: intb=(char)5;
  %".5" = sext i8 %".3" to i32
  store i32 %".5", i32* %"b"
  %"a" = alloca float
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: floata=b;
  %".9" = sitofp i32 %"b.1" to float
  store float %".9", float* %"a"
  %"c" = alloca i32
  ;  Source: intc=5.5;
  %".12" = fptosi float 0x4016000000000000 to i32
  store i32 %".12", i32* %"c"
  %"d" = alloca i8
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: (constchar)c
  %".16" = trunc i32 %"c.1" to i8
  ;  Source: constchard=(constchar)c;
  store i8 %".16", i8* %"d"
  %"e" = alloca i8
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: b+3.5
  %".21" = sitofp i32 %"b.2" to float
  %".22" = fadd float %".21", 0x400c000000000000
  ;  Source: chare=b+3.5;
  %".24" = fptosi float %".22" to i8
  store i8 %".24", i8* %"e"
  %"f" = alloca i8
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  %".27" = sext i8 %"e.1" to i32
  ;  Source: (int)e+'a'
  %".29" = sext i8 97 to i32
  %".30" = add i32 %".27", %".29"
  ;  Source: charf=(int)e+'a';
  %".32" = trunc i32 %".30" to i8
  store i8 %".32", i8* %"f"
  ;  Source: return0;
  ret i32 0
}
