; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 9, i32* %"x"
  %"a" = alloca [2 x i32]
  %".3" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",-(-9));
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 9)
  %".6" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: ++x
  %".9" = load i32, i32* %"x"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"x"
  ;  Source: printf("%d; ",++x);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".10")
  ;  Source: a
  ;  Source: a[0]
  %"gep_array" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: a[0]=15;
  store i32 15, i32* %"gep_array"
  ;  Source: a
  ;  Source: a[1]
  %"gep_array.1" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: a[1]=12;
  store i32 12, i32* %"gep_array.1"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x=12;
  store i32 12, i32* %"x"
  %".25" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: a
  ;  Source: a[1]
  %"gep_array.2" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 1
  %"array_element.2" = load i32, i32* %"gep_array.2"
  ;  Source: --a[1]
  %".29" = load i32, i32* %"gep_array.2"
  %".30" = sub i32 %".29", 1
  store i32 %".30", i32* %"gep_array.2"
  ;  Source: printf("%d; ",--a[1]);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".30")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%d; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"