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
  %"a" = alloca [4 x i32]
  ;  Source: inta[4]={1,2,3,4};
  %".3" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".9"
  %"sa" = alloca i32*
  ;  Source: a
  ;  Source: int*sa=a;
  %".13" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".13", i32** %"sa"
  %"ia" = alloca i32
  ;  Source: intia=3;
  store i32 3, i32* %"ia"
  %"z" = alloca i32*
  ;  Source: int*z;
  ;  Source: ia
  %"ia.1" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.2" = load i32, i32* %"ia"
  ;  Source: ia+ia;
  %".21" = add i32 %"ia.1", %"ia.2"
  ;  Source: ia
  %"ia.3" = load i32, i32* %"ia"
  ;  Source: sa
  %"sa.1" = load i32*, i32** %"sa"
  ;  Source: ia+sa;
  %".25" = getelementptr i32, i32* %"sa.1", i32 %"ia.3"
  ;  Source: sa
  %"sa.2" = load i32*, i32** %"sa"
  ;  Source: ia
  %"ia.4" = load i32, i32* %"ia"
  ;  Source: sa+ia;
  %".29" = getelementptr i32, i32* %"sa.2", i32 %"ia.4"
  ;  Source: ia
  %"ia.5" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.6" = load i32, i32* %"ia"
  ;  Source: ia-ia;
  ;  Source: sa
  %"sa.3" = load i32*, i32** %"sa"
  ;  Source: ia
  %"ia.7" = load i32, i32* %"ia"
  ;  Source: sa-ia;
  ;  Source: ia
  %"ia.8" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.9" = load i32, i32* %"ia"
  ;  Source: ia*ia;
  %".39" = mul i32 %"ia.8", %"ia.9"
  ;  Source: ia
  %"ia.10" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.11" = load i32, i32* %"ia"
  ;  Source: ia/ia;
  %".43" = sdiv i32 %"ia.10", %"ia.11"
  ;  Source: ia
  %"ia.12" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.13" = load i32, i32* %"ia"
  ;  Source: ia%ia;
  %".47" = srem i32 %"ia.12", %"ia.13"
  ;  Source: return0;
  ret i32 0
}
