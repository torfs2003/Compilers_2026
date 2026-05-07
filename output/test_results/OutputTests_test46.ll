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
  %"arr" = alloca [3 x i32]
  %".2" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 0
  store i32 10, i32* %".2"
  %".4" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 1
  store i32 20, i32* %".4"
  %".6" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 2
  store i32 30, i32* %".6"
  %"start" = alloca i32*
  %".8" = bitcast [3 x i32]* %"arr" to i32*
  store i32* %".8", i32** %"start"
  %"end" = alloca i32*
  %".10" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 2
  %".11" = bitcast [3 x i32]* %".10" to i32*
  store i32* %".11", i32** %"end"
  %"beyond" = alloca i32*
  %".13" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 3
  %".14" = bitcast [3 x i32]* %".13" to i32*
  store i32* %".14", i32** %"beyond"
  %".16" = bitcast [17 x i8]* @"str" to i8*
  ;  Source: start
  %"start.1" = load i32*, i32** %"start"
  ;  Source: end
  %"end.1" = load i32*, i32** %"end"
  ;  Source: start<end
  %".20" = ptrtoint i32* %"start.1" to i32
  %".21" = ptrtoint i32* %"end.1" to i32
  %".22" = icmp ult i32 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: printf("start < end: %d\n",start<end);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".23")
  %".26" = bitcast [18 x i8]* @"str.1" to i8*
  ;  Source: end
  %"end.2" = load i32*, i32** %"end"
  ;  Source: beyond
  %"beyond.1" = load i32*, i32** %"beyond"
  ;  Source: end<beyond
  %".30" = ptrtoint i32* %"end.2" to i32
  %".31" = ptrtoint i32* %"beyond.1" to i32
  %".32" = icmp ult i32 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: printf("end < beyond: %d\n",end<beyond);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".33")
  %".36" = bitcast [23 x i8]* @"str.2" to i8*
  ;  Source: beyond
  %"beyond.2" = load i32*, i32** %"beyond"
  ;  Source: arr
  %".39" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 3
  ;  Source: beyond==arr+3
  %".41" = ptrtoint i32* %"beyond.2" to i32
  %".42" = ptrtoint [3 x i32]* %".39" to i32
  %".43" = icmp eq i32 %".41", %".42"
  %".44" = zext i1 %".43" to i32
  ;  Source: printf("beyond == arr + 3: %d\n",beyond==arr+3);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".44")
  %".47" = bitcast [18 x i8]* @"str.3" to i8*
  ;  Source: beyond
  %"beyond.3" = load i32*, i32** %"beyond"
  ;  Source: end
  %"end.3" = load i32*, i32** %"end"
  ;  Source: beyond>end
  %".51" = ptrtoint i32* %"beyond.3" to i32
  %".52" = ptrtoint i32* %"end.3" to i32
  %".53" = icmp ugt i32 %".51", %".52"
  %".54" = zext i1 %".53" to i32
  ;  Source: printf("beyond > end: %d\n",beyond>end);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".54")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [17 x i8] c"start < end: %d\0a\00"
@"str.1" = internal constant [18 x i8] c"end < beyond: %d\0a\00"
@"str.2" = internal constant [23 x i8] c"beyond == arr + 3: %d\0a\00"
@"str.3" = internal constant [18 x i8] c"beyond > end: %d\0a\00"