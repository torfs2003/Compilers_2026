; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca [22 x i32]
  ;  Source: intx[22];
  %"i" = alloca i32
  ;  Source: inti=1;
  store i32 1, i32* %"i"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=1;
  store i32 1, i32* %"i"
  ;  Source: x
  ;  Source: i
  %"i.2" = load i32, i32* %"i"
  ;  Source: i+2
  %".11" = add i32 %"i.2", 2
  ;  Source: x[i+2]
  %"gep_array" = getelementptr [22 x i32], [22 x i32]* %"x", i32 0, i32 %".11"
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: x[i+2]=1;
  store i32 1, i32* %"gep_array"
  %".15" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[3]
  %"gep_array.1" = getelementptr [22 x i32], [22 x i32]* %"x", i32 0, i32 3
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: printf("%d",x[3]);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"