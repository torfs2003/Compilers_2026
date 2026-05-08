; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca [4 x i32]
  %".2" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".8"
  %"sa" = alloca i32*
  %".10" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".10", i32** %"sa"
  %"ia" = alloca i32
  store i32 3, i32* %"ia"
  %"z" = alloca i32*
  ;  Source: ia
  %"ia_load" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia_load.1" = load i32, i32* %"ia"
  ;  Source: ia+ia;
  %".16" = add i32 %"ia_load", %"ia_load.1"
  ;  Source: ia
  %"ia_load.2" = load i32, i32* %"ia"
  ;  Source: sa
  %"sa_load" = load i32*, i32** %"sa"
  ;  Source: ia+sa;
  %".20" = getelementptr i32, i32* %"sa_load", i32 %"ia_load.2"
  ;  Source: sa
  %"sa_load.1" = load i32*, i32** %"sa"
  ;  Source: ia
  %"ia_load.3" = load i32, i32* %"ia"
  ;  Source: sa+ia;
  %".24" = getelementptr i32, i32* %"sa_load.1", i32 %"ia_load.3"
  ;  Source: ia
  %"ia_load.4" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia_load.5" = load i32, i32* %"ia"
  ;  Source: ia-ia;
  %".28" = sub i32 %"ia_load.4", %"ia_load.5"
  ;  Source: ia
  %"ia_load.6" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia_load.7" = load i32, i32* %"ia"
  ;  Source: ia/ia;
  %".32" = sdiv i32 %"ia_load.6", %"ia_load.7"
  ;  Source: ia
  %"ia_load.8" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia_load.9" = load i32, i32* %"ia"
  ;  Source: ia%ia;
  %".36" = srem i32 %"ia_load.8", %"ia_load.9"
  ;  Source: return0;
  ret i32 0
}
