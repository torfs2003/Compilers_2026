; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=(10+3)*(7-2);
  store i32 65, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=(100/4)%3;
  store i32 1, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=(5<<2)+(8>>1);
  store i32 24, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=~(~10&7);
  store i32 -6, i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=(15|3)^(7&2);
  store i32 13, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=(20>10)&&(5<=7);
  store i32 1, i32* %"f"
  %"g" = alloca i32
  ;  Source: intg=(10==5)||(7!=3);
  store i32 1, i32* %"g"
  %"h" = alloca i32
  ;  Source: inth=!(10>=20);
  store i32 1, i32* %"h"
  %"j" = alloca float
  ;  Source: floatj=(5.5*2.0)/(3.0+1.0);
  store float 0x4006000000000000, float* %"j"
  %"k" = alloca float
  ;  Source: floatk=(7.0+3.0)*(2.5-1.5);
  store float 0x4024000000000000, float* %"k"
  ;  Source: return0;
  ret i32 0
}
