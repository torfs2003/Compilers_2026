; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  ;  Source: floata=15.1;
  store float 0x402e333340000000, float* %"a"
  %"b" = alloca i32
  %".4" = sub i8 48, 100
  ;  Source: '0'-'d'-'d'
  %".6" = sub i8 %".4", 100
  ;  Source: intb='0'-'d'-'d';
  %".8" = sext i8 %".6" to i32
  store i32 %".8", i32* %"b"
  %"c" = alloca float
  ;  Source: 15.1*'a'
  %".11" = sitofp i8 97 to float
  %".12" = fmul float 0x402e333340000000, %".11"
  ;  Source: floatc=15.1*'a';
  store float %".12", float* %"c"
  %"d" = alloca i8
  ;  Source: chard=50.1+5;
  %".16" = fptosi float 0x404b8cccc0000000 to i8
  store i8 %".16", i8* %"d"
  %"e" = alloca i8
  ;  Source: 'e'/'a'
  %".19" = sdiv i8 101, 97
  ;  Source: chare='e'/'a';
  store i8 %".19", i8* %"e"
  %"f1" = alloca i8
  %".22" = sitofp i8 120 to float
  %".23" = fadd float 0x40e63900c0000000, %".22"
  ;  Source: 45435+77.02262+'x'+0.0*8
  %".25" = fadd float %".23",              0x0
  ;  Source: charf1=45435+77.02262+'x'+0.0*8;
  %".27" = fptosi float %".25" to i8
  store i8 %".27", i8* %"f1"
  %"f" = alloca i32
  ;  Source: intf=15%4;
  store i32 3, i32* %"f"
  %"g" = alloca i32
  ;  Source: intg=2<<3;
  store i32 16, i32* %"g"
  %"h" = alloca i32
  ;  Source: inth=16>>2;
  store i32 4, i32* %"h"
  %"i" = alloca i32
  ;  Source: inti=5&3;
  store i32 1, i32* %"i"
  %"j" = alloca i32
  ;  Source: intj=5|3;
  store i32 7, i32* %"j"
  %"k" = alloca i32
  ;  Source: intk=~5;
  store i32 -6, i32* %"k"
  %"l" = alloca i32
  ;  Source: intl=5^3;
  store i32 6, i32* %"l"
  %"m" = alloca i32
  ;  Source: intm=7&&0;
  store i32 0, i32* %"m"
  %"n" = alloca i32
  ;  Source: intn=5||0;
  store i32 1, i32* %"n"
  %"o" = alloca i32
  ;  Source: into=!1;
  store i32 0, i32* %"o"
  %"p" = alloca float
  ;  Source: floatp=10.5+3.75;
  store float 0x402c800000000000, float* %"p"
  %"q" = alloca float
  ;  Source: floatq=15.6*2.0;
  store float 0x403f333340000000, float* %"q"
  %"r" = alloca float
  ;  Source: floatr=20.0/4.0;
  store float 0x4014000000000000, float* %"r"
  %"x" = alloca float
  ;  Source: floatx=555.0+445;
  store float 0x408f400000000000, float* %"x"
  ;  Source: return0;
  ret i32 0
}
