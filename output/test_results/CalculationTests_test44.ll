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
  store i32 0, i32* %"ia"
  store i32 3, i32* %"ia"
  %"z" = alloca i32*
  ;  Source: ia
  %"ia.1" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.2" = load i32, i32* %"ia"
  ;  Source: ia+ia;
  %".17" = add i32 %"ia.1", %"ia.2"
  ;  Source: ia
  %"ia.3" = load i32, i32* %"ia"
  ;  Source: sa
  %"sa.1" = load i32*, i32** %"sa"
  ;  Source: ia+sa;
  %".21" = getelementptr i32, i32* %"sa.1", i32 %"ia.3"
  ;  Source: sa
  %"sa.2" = load i32*, i32** %"sa"
  ;  Source: ia
  %"ia.4" = load i32, i32* %"ia"
  ;  Source: sa+ia;
  %".25" = getelementptr i32, i32* %"sa.2", i32 %"ia.4"
  ;  Source: ia
  %"ia.5" = load i32, i32* %"ia"
  ;  Source: ia
  %"ia.6" = load i32, i32* %"ia"
  ;  Source: ia-ia;
  %".29" = sub i32 %"ia.5", %"ia.6"
  %"ia.7" = alloca i32*
  %"b" = alloca i32
  store i32 0, i32* %"b"
  %"sa.3" = load i32*, i32** %"sa"
  %"ia.8" = load i32*, i32** %"ia.7"
  %".31" = mul i32* %"sa.3", %"ia.8"
  %".32" = ptrtoint i32* %".31" to i32
  store i32 %".32", i32* %"b"
  ;  User Comment: // Not allowed OK
  ;  Source: ia
  %"ia.9" = load i32*, i32** %"ia.7"
  ;  Source: ia
  %"ia.10" = load i32*, i32** %"ia.7"
  ;  User Comment: // Not allowed OK
  ;  Source: ia/ia;
  %".39" = sdiv i32* %"ia.9", %"ia.10"
  ;  User Comment: //ia / sa; // Not allowed OK
  ;  User Comment: //sa / ia; // Not allowed OK
  ;  Source: ia
  %"ia.11" = load i32*, i32** %"ia.7"
  ;  Source: ia
  %"ia.12" = load i32*, i32** %"ia.7"
  ;  User Comment: //ia / sa; // Not allowed OK
  ;  User Comment: //sa / ia; // Not allowed OK
  ;  Source: ia%ia;
  %".47" = srem i32* %"ia.11", %"ia.12"
  ;  User Comment: //ia % sa; // Not allowed OK
  ;  User Comment: //sa % ia; // Not allowed OK
  ;  Source: return0;
  ret i32 0
}
