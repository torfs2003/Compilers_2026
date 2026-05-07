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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"number" = alloca i32
  ;  Source: intnumber=-55;
  store i32 -55, i32* %"number"
  %"n" = alloca i32
  ;  Source: intn;
  ;  Source: number
  %"number.1" = load i32, i32* %"number"
  ;  Source: number++;
  %".7" = load i32, i32* %"number"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"number"
  ;  Source: number
  %"number.2" = load i32, i32* %"number"
  ;  Source: number
  %"number.3" = load i32, i32* %"number"
  ;  Source: number++
  %".13" = load i32, i32* %"number"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"number"
  ;  Source: number=number++;
  store i32 %".13", i32* %"number"
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: number
  %"number.4" = load i32, i32* %"number"
  ;  Source: number++
  %".21" = load i32, i32* %"number"
  %".22" = add i32 %".21", 1
  store i32 %".22", i32* %"number"
  ;  Source: n=number++;
  store i32 %".21", i32* %"n"
  ;  Source: n
  %"n.2" = load i32, i32* %"n"
  ;  Source: n
  %"n.3" = load i32, i32* %"n"
  ;  Source: n
  %"n.4" = load i32, i32* %"n"
  ;  Source: n++
  %".30" = load i32, i32* %"n"
  %".31" = add i32 %".30", 1
  store i32 %".31", i32* %"n"
  ;  Source: n-n++
  %".34" = sub i32 %"n.3", %".30"
  ;  Source: n=n-n++;
  store i32 %".34", i32* %"n"
  ;  Source: n
  %"n.5" = load i32, i32* %"n"
  ;  Source: ++n;
  %".39" = load i32, i32* %"n"
  %".40" = add i32 %".39", 1
  store i32 %".40", i32* %"n"
  ret i32 0
}
