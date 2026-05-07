; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"z" = alloca i32
  ;  Source: intz;
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x--;
  %".7" = load i32, i32* %"x"
  %".8" = sub i32 %".7", 1
  store i32 %".8", i32* %"x"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x--
  %".13" = load i32, i32* %"x"
  %".14" = sub i32 %".13", 1
  store i32 %".14", i32* %"x"
  ;  Source: z=x--;
  store i32 %".13", i32* %"z"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x--
  %".21" = load i32, i32* %"x"
  %".22" = sub i32 %".21", 1
  store i32 %".22", i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z--
  %".26" = load i32, i32* %"z"
  %".27" = sub i32 %".26", 1
  store i32 %".27", i32* %"z"
  ;  Source: x--+z--
  %".30" = add i32 %".21", %".26"
  ;  Source: x=x--+z--;
  store i32 %".30", i32* %"x"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: --x;
  %".35" = load i32, i32* %"x"
  %".36" = sub i32 %".35", 1
  store i32 %".36", i32* %"x"
  ret i32 0
}
