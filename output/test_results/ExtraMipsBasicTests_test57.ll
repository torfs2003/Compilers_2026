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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca [2 x [3 x i32]]
  ;  Source: intx[2][3];
  ;  Source: x
  ;  Source: x[0]
  %"decay_left" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx" = getelementptr [3 x i32], [3 x i32]* %"decay_left", i32 0
  ;  Source: x[0][0]
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr i32, i32* %"decay_left.1", i32 0
  %"array_element" = load i32, i32* %"gep_idx.1"
  ;  Source: x[0][0]=0;
  store i32 0, i32* %"gep_idx.1"
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.2" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.2" = getelementptr [3 x i32], [3 x i32]* %"decay_left.2", i32 0
  ;  Source: x[0][1]
  %"decay_left.3" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr i32, i32* %"decay_left.3", i32 1
  %"array_element.1" = load i32, i32* %"gep_idx.3"
  ;  Source: x[0][1]=1;
  store i32 1, i32* %"gep_idx.3"
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.4" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.4" = getelementptr [3 x i32], [3 x i32]* %"decay_left.4", i32 0
  ;  Source: x[0][2]
  %"decay_left.5" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.4", i32 0, i32 0
  %"gep_idx.5" = getelementptr i32, i32* %"decay_left.5", i32 2
  %"array_element.2" = load i32, i32* %"gep_idx.5"
  ;  Source: x[0][2]=2;
  store i32 2, i32* %"gep_idx.5"
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.6" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.6" = getelementptr [3 x i32], [3 x i32]* %"decay_left.6", i32 1
  ;  Source: x[1][0]
  %"decay_left.7" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.6", i32 0, i32 0
  %"gep_idx.7" = getelementptr i32, i32* %"decay_left.7", i32 0
  %"array_element.3" = load i32, i32* %"gep_idx.7"
  ;  Source: x[1][0]=3;
  store i32 3, i32* %"gep_idx.7"
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.8" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.8" = getelementptr [3 x i32], [3 x i32]* %"decay_left.8", i32 1
  ;  Source: x[1][1]
  %"decay_left.9" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.8", i32 0, i32 0
  %"gep_idx.9" = getelementptr i32, i32* %"decay_left.9", i32 1
  %"array_element.4" = load i32, i32* %"gep_idx.9"
  ;  Source: x[1][1]=4;
  store i32 4, i32* %"gep_idx.9"
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.10" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.10" = getelementptr [3 x i32], [3 x i32]* %"decay_left.10", i32 1
  ;  Source: x[1][2]
  %"decay_left.11" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.10", i32 0, i32 0
  %"gep_idx.11" = getelementptr i32, i32* %"decay_left.11", i32 2
  %"array_element.5" = load i32, i32* %"gep_idx.11"
  ;  Source: x[1][2]=5;
  store i32 5, i32* %"gep_idx.11"
  %".33" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.12" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.12" = getelementptr [3 x i32], [3 x i32]* %"decay_left.12", i32 0
  ;  Source: x[0][0]
  %"decay_left.13" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.12", i32 0, i32 0
  %"gep_idx.13" = getelementptr i32, i32* %"decay_left.13", i32 0
  %"array_element.6" = load i32, i32* %"gep_idx.13"
  ;  Source: printf("%d",x[0][0]);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %"array_element.6")
  %".39" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.14" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.14" = getelementptr [3 x i32], [3 x i32]* %"decay_left.14", i32 0
  ;  Source: x[0][1]
  %"decay_left.15" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.14", i32 0, i32 0
  %"gep_idx.15" = getelementptr i32, i32* %"decay_left.15", i32 1
  %"array_element.7" = load i32, i32* %"gep_idx.15"
  ;  Source: printf("%d",x[0][1]);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"array_element.7")
  %".45" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.16" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.16" = getelementptr [3 x i32], [3 x i32]* %"decay_left.16", i32 0
  ;  Source: x[0][2]
  %"decay_left.17" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.16", i32 0, i32 0
  %"gep_idx.17" = getelementptr i32, i32* %"decay_left.17", i32 2
  %"array_element.8" = load i32, i32* %"gep_idx.17"
  ;  Source: printf("%d",x[0][2]);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %"array_element.8")
  %".51" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.18" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.18" = getelementptr [3 x i32], [3 x i32]* %"decay_left.18", i32 1
  ;  Source: x[1][0]
  %"decay_left.19" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.18", i32 0, i32 0
  %"gep_idx.19" = getelementptr i32, i32* %"decay_left.19", i32 0
  %"array_element.9" = load i32, i32* %"gep_idx.19"
  ;  Source: printf("%d",x[1][0]);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"array_element.9")
  %".57" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.20" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.20" = getelementptr [3 x i32], [3 x i32]* %"decay_left.20", i32 1
  ;  Source: x[1][1]
  %"decay_left.21" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.20", i32 0, i32 0
  %"gep_idx.21" = getelementptr i32, i32* %"decay_left.21", i32 1
  %"array_element.10" = load i32, i32* %"gep_idx.21"
  ;  Source: printf("%d",x[1][1]);
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %"array_element.10")
  %".63" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.22" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.22" = getelementptr [3 x i32], [3 x i32]* %"decay_left.22", i32 1
  ;  Source: x[1][2]
  %"decay_left.23" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.22", i32 0, i32 0
  %"gep_idx.23" = getelementptr i32, i32* %"decay_left.23", i32 2
  %"array_element.11" = load i32, i32* %"gep_idx.23"
  ;  Source: printf("%d",x[1][2]);
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"array_element.11")
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.24" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.24" = getelementptr [3 x i32], [3 x i32]* %"decay_left.24", i32 0
  ;  Source: x[0][2]
  %"decay_left.25" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.24", i32 0, i32 0
  %"gep_idx.25" = getelementptr i32, i32* %"decay_left.25", i32 2
  %"array_element.12" = load i32, i32* %"gep_idx.25"
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.26" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.26" = getelementptr [3 x i32], [3 x i32]* %"decay_left.26", i32 1
  ;  Source: x[1][2]
  %"decay_left.27" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.26", i32 0, i32 0
  %"gep_idx.27" = getelementptr i32, i32* %"decay_left.27", i32 2
  %"array_element.13" = load i32, i32* %"gep_idx.27"
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.28" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.28" = getelementptr [3 x i32], [3 x i32]* %"decay_left.28", i32 1
  ;  Source: x[1][0]
  %"decay_left.29" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.28", i32 0, i32 0
  %"gep_idx.29" = getelementptr i32, i32* %"decay_left.29", i32 0
  %"array_element.14" = load i32, i32* %"gep_idx.29"
  ;  Source: x[1][2]+x[1][0]
  %".79" = add i32 %"array_element.13", %"array_element.14"
  ;  Source: x[0][2]=x[1][2]+x[1][0];
  store i32 %".79", i32* %"gep_idx.25"
  %".82" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.30" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.30" = getelementptr [3 x i32], [3 x i32]* %"decay_left.30", i32 0
  ;  Source: x[0][2]
  %"decay_left.31" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.30", i32 0, i32 0
  %"gep_idx.31" = getelementptr i32, i32* %"decay_left.31", i32 2
  %"array_element.15" = load i32, i32* %"gep_idx.31"
  ;  Source: printf("%d",x[0][2]);
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %"array_element.15")
  %".88" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.32" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.32" = getelementptr [3 x i32], [3 x i32]* %"decay_left.32", i32 1
  ;  Source: x[1][2]
  %"decay_left.33" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.32", i32 0, i32 0
  %"gep_idx.33" = getelementptr i32, i32* %"decay_left.33", i32 2
  %"array_element.16" = load i32, i32* %"gep_idx.33"
  ;  Source: printf("%d",x[1][2]);
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".88", i32 %"array_element.16")
  %".94" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.34" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.34" = getelementptr [3 x i32], [3 x i32]* %"decay_left.34", i32 1
  ;  Source: x[1][0]
  %"decay_left.35" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.34", i32 0, i32 0
  %"gep_idx.35" = getelementptr i32, i32* %"decay_left.35", i32 0
  %"array_element.17" = load i32, i32* %"gep_idx.35"
  ;  Source: printf("%d",x[1][0]);
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %"array_element.17")
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