; ModuleID = "cmm_module"
<<<<<<< HEAD
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

=======
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

>>>>>>> origin/optionals
define i32 @"main"()
{
entry:
  %"number" = alloca i32
  ;  Source: intnumber=-55;
  store i32 -55, i32* %"number"
  ;  Source: number
  %"number.1" = load i32, i32* %"number"
  ;  Source: number++;
  %".6" = load i32, i32* %"number"
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %"number"
  ;  Source: number
  %"number.2" = load i32, i32* %"number"
  ;  Source: number
  %"number.3" = load i32, i32* %"number"
  ;  Source: number++
  %".12" = load i32, i32* %"number"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"number"
  ;  Source: number=number++;
  store i32 %".12", i32* %"number"
  %"n" = alloca i32
  ;  Source: number
  %"number.4" = load i32, i32* %"number"
  ;  Source: number++
  %".19" = load i32, i32* %"number"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"number"
  ;  Source: intn=number++;
  store i32 %".19", i32* %"n"
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: n
  %"n.2" = load i32, i32* %"n"
  ;  Source: n
  %"n.3" = load i32, i32* %"n"
  ;  Source: n++
  %".28" = load i32, i32* %"n"
  %".29" = add i32 %".28", 1
  store i32 %".29", i32* %"n"
  ;  Source: n-n++
  %".32" = sub i32 %"n.2", %".28"
  ;  Source: n=n-n++;
  store i32 %".32", i32* %"n"
  ;  Source: n
  %"n.4" = load i32, i32* %"n"
  ;  Source: ++n;
  %".37" = load i32, i32* %"n"
  %".38" = add i32 %".37", 1
  store i32 %".38", i32* %"n"
  ret i32 0
}
