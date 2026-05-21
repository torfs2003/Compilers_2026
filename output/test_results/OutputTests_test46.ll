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
  store [3 x i32] zeroinitializer, [3 x i32]* %"arr"
  %".3" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 0
  store i32 10, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 1
  store i32 20, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 0, i32 2
  store i32 30, i32* %".7"
  %"start" = alloca i32*
  %".9" = bitcast [3 x i32]* %"arr" to i32*
  store i32* %".9", i32** %"start"
  %"end" = alloca i32*
  %".11" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 2
  %".12" = bitcast [3 x i32]* %".11" to i32*
  store i32* %".12", i32** %"end"
  %"beyond" = alloca i32*
  %".14" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 3
  %".15" = bitcast [3 x i32]* %".14" to i32*
  store i32* %".15", i32** %"beyond"
  %".17" = bitcast [17 x i8]* @"str" to i8*
  ;  Source: start
  %"start_load" = load i32*, i32** %"start"
  ;  Source: end
  %"end_load" = load i32*, i32** %"end"
  ;  Source: start<end
  %".21" = ptrtoint i32* %"start_load" to i32
  %".22" = ptrtoint i32* %"end_load" to i32
  %".23" = icmp ult i32 %".21", %".22"
  %".24" = zext i1 %".23" to i32
  ;  Source: printf("start < end: %d\n",start<end);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".24")
  %".27" = bitcast [18 x i8]* @"str.1" to i8*
  ;  Source: end
  %"end_load.1" = load i32*, i32** %"end"
  ;  Source: beyond
  %"beyond_load" = load i32*, i32** %"beyond"
  ;  Source: end<beyond
  %".31" = ptrtoint i32* %"end_load.1" to i32
  %".32" = ptrtoint i32* %"beyond_load" to i32
  %".33" = icmp ult i32 %".31", %".32"
  %".34" = zext i1 %".33" to i32
  ;  Source: printf("end < beyond: %d\n",end<beyond);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".34")
  %".37" = bitcast [23 x i8]* @"str.2" to i8*
  ;  Source: beyond
  %"beyond_load.1" = load i32*, i32** %"beyond"
  ;  Source: arr
  %".40" = getelementptr [3 x i32], [3 x i32]* %"arr", i32 3
  ;  Source: beyond==arr+3
  %".42" = ptrtoint i32* %"beyond_load.1" to i32
  %".43" = ptrtoint [3 x i32]* %".40" to i32
  %".44" = icmp eq i32 %".42", %".43"
  %".45" = zext i1 %".44" to i32
  ;  Source: printf("beyond == arr + 3: %d\n",beyond==arr+3);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".45")
  %".48" = bitcast [18 x i8]* @"str.3" to i8*
  ;  Source: beyond
  %"beyond_load.2" = load i32*, i32** %"beyond"
  ;  Source: end
  %"end_load.2" = load i32*, i32** %"end"
  ;  Source: beyond>end
  %".52" = ptrtoint i32* %"beyond_load.2" to i32
  %".53" = ptrtoint i32* %"end_load.2" to i32
  %".54" = icmp ugt i32 %".52", %".53"
  %".55" = zext i1 %".54" to i32
  ;  Source: printf("beyond > end: %d\n",beyond>end);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".55")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [17 x i8] c"start < end: %d\0a\00"
@"str.1" = internal constant [18 x i8] c"end < beyond: %d\0a\00"
@"str.2" = internal constant [23 x i8] c"beyond == arr + 3: %d\0a\00"
@"str.3" = internal constant [18 x i8] c"beyond > end: %d\0a\00"