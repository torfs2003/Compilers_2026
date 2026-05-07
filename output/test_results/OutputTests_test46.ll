; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".15" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 2
  ;  Source: int*end=arr+2;
  %".17" = bitcast [3 x i32]* %".15" to i32*
  store i32* %".17", i32** %"end"
  %"beyond" = alloca i32*
  ;  Source: arr
  ;  Source: arr+3
  %".21" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 3
  ;  Source: int*beyond=arr+3;
  %".23" = bitcast [3 x i32]* %".21" to i32*
  store i32* %".23", i32** %"beyond"
  %".25" = bitcast [17 x i8]* @"str" to i8*
  ;  Source: start
  %"start.1" = load i32*, i32** %"start"
  ;  Source: end
  %"end.1" = load i32*, i32** %"end"
  ;  Source: start<end
  %".29" = ptrtoint i32* %"start.1" to i32
  %".30" = ptrtoint i32* %"end.1" to i32
  %".31" = icmp ult i32 %".29", %".30"
  %".32" = zext i1 %".31" to i32
  ;  Source: printf("start < end: %d\n",start<end);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".32")
  %".35" = bitcast [18 x i8]* @"str.1" to i8*
  ;  Source: end
  %"end.2" = load i32*, i32** %"end"
  ;  Source: beyond
  %"beyond.1" = load i32*, i32** %"beyond"
  ;  Source: end<beyond
  %".39" = ptrtoint i32* %"end.2" to i32
  %".40" = ptrtoint i32* %"beyond.1" to i32
  %".41" = icmp ult i32 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: printf("end < beyond: %d\n",end<beyond);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".42")
  %".45" = bitcast [23 x i8]* @"str.2" to i8*
  ;  Source: beyond
  %"beyond.2" = load i32*, i32** %"beyond"
  ;  Source: arr
  %".48" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 3
  ;  Source: beyond==arr+3
  %".50" = ptrtoint i32* %"beyond.2" to i32
  %".51" = ptrtoint [3 x i32]* %".48" to i32
  %".52" = icmp eq i32 %".50", %".51"
  %".53" = zext i1 %".52" to i32
  ;  Source: printf("beyond == arr + 3: %d\n",beyond==arr+3);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".53")
  %".56" = bitcast [18 x i8]* @"str.3" to i8*
  ;  Source: beyond
  %"beyond.3" = load i32*, i32** %"beyond"
  ;  Source: end
  %"end.3" = load i32*, i32** %"end"
  ;  Source: beyond>end
  %".60" = ptrtoint i32* %"beyond.3" to i32
  %".61" = ptrtoint i32* %"end.3" to i32
  %".62" = icmp ugt i32 %".60", %".61"
  %".63" = zext i1 %".62" to i32
  ;  Source: printf("beyond > end: %d\n",beyond>end);
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".63")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [17 x i8] c"start < end: %d\0a\00"
@"str.1" = internal constant [18 x i8] c"end < beyond: %d\0a\00"
@"str.2" = internal constant [23 x i8] c"beyond == arr + 3: %d\0a\00"
@"str.3" = internal constant [18 x i8] c"beyond > end: %d\0a\00"