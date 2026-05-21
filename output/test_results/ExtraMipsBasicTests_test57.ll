; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca [2 x [3 x i32]]
  ;  Source: x
  ;  Source: x[0]
  %"gep_array" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][0]
  %"gep_array.1" = getelementptr [3 x i32], [3 x i32]* %"gep_array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array.1"
  ;  Source: x[0][0]=0;
  store i32 0, i32* %"gep_array.1"
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.2" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][1]
  %"gep_array.3" = getelementptr [3 x i32], [3 x i32]* %"gep_array.2", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.3"
  ;  Source: x[0][1]=1;
  store i32 1, i32* %"gep_array.3"
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.4" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][2]
  %"gep_array.5" = getelementptr [3 x i32], [3 x i32]* %"gep_array.4", i32 0, i32 2
  %"array_element.2" = load i32, i32* %"gep_array.5"
  ;  Source: x[0][2]=2;
  store i32 2, i32* %"gep_array.5"
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.6" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][0]
  %"gep_array.7" = getelementptr [3 x i32], [3 x i32]* %"gep_array.6", i32 0, i32 0
  %"array_element.3" = load i32, i32* %"gep_array.7"
  ;  Source: x[1][0]=3;
  store i32 3, i32* %"gep_array.7"
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.8" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][1]
  %"gep_array.9" = getelementptr [3 x i32], [3 x i32]* %"gep_array.8", i32 0, i32 1
  %"array_element.4" = load i32, i32* %"gep_array.9"
  ;  Source: x[1][1]=4;
  store i32 4, i32* %"gep_array.9"
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.10" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][2]
  %"gep_array.11" = getelementptr [3 x i32], [3 x i32]* %"gep_array.10", i32 0, i32 2
  %"array_element.5" = load i32, i32* %"gep_array.11"
  ;  Source: x[1][2]=5;
  store i32 5, i32* %"gep_array.11"
  %".32" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.12" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][0]
  %"gep_array.13" = getelementptr [3 x i32], [3 x i32]* %"gep_array.12", i32 0, i32 0
  %"array_element.6" = load i32, i32* %"gep_array.13"
  ;  Source: printf("%d",x[0][0]);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"array_element.6")
  %".38" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.14" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][1]
  %"gep_array.15" = getelementptr [3 x i32], [3 x i32]* %"gep_array.14", i32 0, i32 1
  %"array_element.7" = load i32, i32* %"gep_array.15"
  ;  Source: printf("%d",x[0][1]);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"array_element.7")
  %".44" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.16" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][2]
  %"gep_array.17" = getelementptr [3 x i32], [3 x i32]* %"gep_array.16", i32 0, i32 2
  %"array_element.8" = load i32, i32* %"gep_array.17"
  ;  Source: printf("%d",x[0][2]);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"array_element.8")
  %".50" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.18" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][0]
  %"gep_array.19" = getelementptr [3 x i32], [3 x i32]* %"gep_array.18", i32 0, i32 0
  %"array_element.9" = load i32, i32* %"gep_array.19"
  ;  Source: printf("%d",x[1][0]);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %"array_element.9")
  %".56" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.20" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][1]
  %"gep_array.21" = getelementptr [3 x i32], [3 x i32]* %"gep_array.20", i32 0, i32 1
  %"array_element.10" = load i32, i32* %"gep_array.21"
  ;  Source: printf("%d",x[1][1]);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"array_element.10")
  %".62" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.22" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][2]
  %"gep_array.23" = getelementptr [3 x i32], [3 x i32]* %"gep_array.22", i32 0, i32 2
  %"array_element.11" = load i32, i32* %"gep_array.23"
  ;  Source: printf("%d",x[1][2]);
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %"array_element.11")
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.24" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][2]
  %"gep_array.25" = getelementptr [3 x i32], [3 x i32]* %"gep_array.24", i32 0, i32 2
  %"array_element.12" = load i32, i32* %"gep_array.25"
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.26" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][2]
  %"gep_array.27" = getelementptr [3 x i32], [3 x i32]* %"gep_array.26", i32 0, i32 2
  %"array_element.13" = load i32, i32* %"gep_array.27"
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.28" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][0]
  %"gep_array.29" = getelementptr [3 x i32], [3 x i32]* %"gep_array.28", i32 0, i32 0
  %"array_element.14" = load i32, i32* %"gep_array.29"
  ;  Source: x[1][2]+x[1][0]
  %".78" = add i32 %"array_element.13", %"array_element.14"
  ;  Source: x[0][2]=x[1][2]+x[1][0];
  store i32 %".78", i32* %"gep_array.25"
  %".81" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.30" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][2]
  %"gep_array.31" = getelementptr [3 x i32], [3 x i32]* %"gep_array.30", i32 0, i32 2
  %"array_element.15" = load i32, i32* %"gep_array.31"
  ;  Source: printf("%d",x[0][2]);
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".81", i32 %"array_element.15")
  %".87" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.32" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][2]
  %"gep_array.33" = getelementptr [3 x i32], [3 x i32]* %"gep_array.32", i32 0, i32 2
  %"array_element.16" = load i32, i32* %"gep_array.33"
  ;  Source: printf("%d",x[1][2]);
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".87", i32 %"array_element.16")
  %".93" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.34" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][0]
  %"gep_array.35" = getelementptr [3 x i32], [3 x i32]* %"gep_array.34", i32 0, i32 0
  %"array_element.17" = load i32, i32* %"gep_array.35"
  ;  Source: printf("%d",x[1][0]);
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".93", i32 %"array_element.17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"