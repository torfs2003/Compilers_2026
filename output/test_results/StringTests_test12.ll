; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"z" = alloca [2 x i8]
  ;  Source: z
  ;  Source: z[0]
  %"gep_array" = getelementptr [2 x i8], [2 x i8]* %"z", i32 0, i32 0
  %"array_element" = load i8, i8* %"gep_array"
  ;  Source: z[0]='O';
  store i8 79, i8* %"gep_array"
  ;  Source: z
  ;  Source: z[1]
  %"gep_array.1" = getelementptr [2 x i8], [2 x i8]* %"z", i32 0, i32 1
  %"array_element.1" = load i8, i8* %"gep_array.1"
  %".8" = bitcast [2 x i8]* @"str" to i8*
  ;  Source: z[1]="Y";
  %".10" = ptrtoint i8* %".8" to i8
  store i8 %".10", i8* %"gep_array.1"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  ;  Source: z[0]
  %"gep_array.2" = getelementptr [2 x i8], [2 x i8]* %"z", i32 0, i32 0
  %"array_element.2" = load i8, i8* %"gep_array.2"
  ;  Source: printf("%c",z[0]);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i8 %"array_element.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [2 x i8] c"Y\00"
@"str.1" = internal constant [3 x i8] c"%c\00"