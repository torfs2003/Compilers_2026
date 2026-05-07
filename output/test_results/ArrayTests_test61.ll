; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"result" = alloca [20 x i32]
  ;  Source: intresult[20]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  %".3" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 4
  store i32 5, i32* %".11"
  %".13" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 5
  store i32 6, i32* %".13"
  %".15" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 6
  store i32 7, i32* %".15"
  %".17" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 7
  store i32 8, i32* %".17"
  %".19" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 8
  store i32 9, i32* %".19"
  %".21" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 9
  store i32 10, i32* %".21"
  %".23" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 10
  store i32 11, i32* %".23"
  %".25" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 11
  store i32 12, i32* %".25"
  %".27" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 12
  store i32 13, i32* %".27"
  %".29" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 13
  store i32 14, i32* %".29"
  %".31" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 14
  store i32 15, i32* %".31"
  %".33" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 15
  store i32 16, i32* %".33"
  %".35" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 16
  store i32 17, i32* %".35"
  %".37" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 17
  store i32 18, i32* %".37"
  %".39" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 18
  store i32 19, i32* %".39"
  %".41" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 19
  store i32 20, i32* %".41"
  %"passed" = alloca i32*
  ;  Source: result
  ;  Source: int*passed=result;
  %".45" = bitcast [20 x i32]* %"result" to i32*
  store i32* %".45", i32** %"passed"
  ;  Source: passed
  %"passed.1" = load i32*, i32** %"passed"
  ;  Source: passed++;
  %".49" = load i32*, i32** %"passed"
  %"ptr_incdec" = getelementptr i32, i32* %".49", i32 1
  store i32* %"ptr_incdec", i32** %"passed"
  %".51" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: passed
  %"passed.2" = load i32*, i32** %"passed"
  ;  Source: *passed
  %"deref_load" = load i32, i32* %"passed.2"
  ;  Source: printf("%d",*passed);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"