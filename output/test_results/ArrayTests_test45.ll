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
  %"x" = alloca i32
  store i32 9, i32* %"x"
  %"a" = alloca [2 x i32]
  %".3" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",-(-9));
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 9)
  %".6" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
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
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: x=12;
  store i32 12, i32* %"x"
  %".25" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: a
  ;  Source: (a[1])
  %"gep_array.2" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 1
  %"array_element.2" = load i32, i32* %"gep_array.2"
  ;  Source: --(a[1])
  %".29" = load i32, i32* %"gep_array.2"
  %".30" = sub i32 %".29", 1
  store i32 %".30", i32* %"gep_array.2"
  ;  Source: printf("%d; ",--(a[1]));
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".30")
  %".34" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x"
  ;  Source: x++
  %".37" = load i32, i32* %"x"
  %".38" = add i32 %".37", 1
  store i32 %".38", i32* %"x"
  ;  Source: printf("%d; ",x++);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".37")
  %".42" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x_load.3" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"x_load.3")
  ;  Source: a
  ;  Source: a[0]
  %"gep_array.3" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"array_element.3" = load i32, i32* %"gep_array.3"
  ;  Source: a[0]--;
  %".49" = load i32, i32* %"gep_array.3"
  %".50" = sub i32 %".49", 1
  store i32 %".50", i32* %"gep_array.3"
  %".52" = bitcast [5 x i8]* @"str.5" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"gep_array.4" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"array_element.4" = load i32, i32* %"gep_array.4"
  ;  Source: printf("%d; ",a[0]);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %"array_element.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%d; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [5 x i8] c"%d; \00"
@"str.4" = internal constant [5 x i8] c"%d; \00"
@"str.5" = internal constant [5 x i8] c"%d; \00"