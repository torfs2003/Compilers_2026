; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"arr" = alloca [3 x i32]
  ;  Source: intarr[3]={10,20,30};
  %".3" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 0
  store i32 10, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 1
  store i32 20, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 2
  store i32 30, i32* %".7"
  %"start" = alloca i32*
  ;  Source: arr
  ;  Source: int*start=arr;
  %".11" = bitcast [3 x i32]* %"arr" to i32*
  store i32* %".11", i32** %"start"
  %"end" = alloca i32*
  ;  Source: arr
  ;  Source: arr+2
  %"decay_left" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 0
  %".15" = getelementptr i32, i32* %"decay_left", i32 2
  ;  Source: int*end=arr+2;
  store i32* %".15", i32** %"end"
  %"beyond" = alloca i32*
  ;  Source: arr
  ;  Source: arr+3
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 0
  %".20" = getelementptr i32, i32* %"decay_left.1", i32 3
  ;  Source: int*beyond=arr+3;
  store i32* %".20", i32** %"beyond"
  %".23" = bitcast [17 x i8]* @"str" to i8*
  ;  Source: start
  %"start.1" = load i32*, i32** %"start"
  ;  Source: end
  %"end.1" = load i32*, i32** %"end"
  ;  Source: start<end
  %".27" = ptrtoint i32* %"start.1" to i32
  %".28" = ptrtoint i32* %"end.1" to i32
  %".29" = icmp ult i32 %".27", %".28"
  %".30" = zext i1 %".29" to i32
  ;  Source: printf("start < end: %d\n",start<end);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".30")
  %".33" = bitcast [18 x i8]* @"str.1" to i8*
  ;  Source: end
  %"end.2" = load i32*, i32** %"end"
  ;  Source: beyond
  %"beyond.1" = load i32*, i32** %"beyond"
  ;  Source: end<beyond
  %".37" = ptrtoint i32* %"end.2" to i32
  %".38" = ptrtoint i32* %"beyond.1" to i32
  %".39" = icmp ult i32 %".37", %".38"
  %".40" = zext i1 %".39" to i32
  ;  Source: printf("end < beyond: %d\n",end<beyond);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".40")
  %".43" = bitcast [23 x i8]* @"str.2" to i8*
  ;  Source: beyond
  %"beyond.2" = load i32*, i32** %"beyond"
  ;  Source: arr
  %"decay_left.2" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 0
  %".46" = getelementptr i32, i32* %"decay_left.2", i32 3
  ;  Source: beyond==arr+3
  %".48" = ptrtoint i32* %"beyond.2" to i32
  %".49" = ptrtoint i32* %".46" to i32
  %".50" = icmp eq i32 %".48", %".49"
  %".51" = zext i1 %".50" to i32
  ;  Source: printf("beyond == arr + 3: %d\n",beyond==arr+3);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".51")
  %".54" = bitcast [18 x i8]* @"str.3" to i8*
  ;  Source: beyond
  %"beyond.3" = load i32*, i32** %"beyond"
  ;  Source: end
  %"end.3" = load i32*, i32** %"end"
  ;  Source: beyond>end
  %".58" = ptrtoint i32* %"beyond.3" to i32
  %".59" = ptrtoint i32* %"end.3" to i32
  %".60" = icmp ugt i32 %".58", %".59"
  %".61" = zext i1 %".60" to i32
  ;  Source: printf("beyond > end: %d\n",beyond>end);
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".61")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [17 x i8] c"start < end: %d\0a\00"
@"str.1" = internal constant [18 x i8] c"end < beyond: %d\0a\00"
@"str.2" = internal constant [23 x i8] c"beyond == arr + 3: %d\0a\00"
@"str.3" = internal constant [18 x i8] c"beyond > end: %d\0a\00"