; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.Point" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"pt1" = alloca %"struct.Point"
  %"pt2" = alloca %"struct.Point"
  ;  Source: pt1.x
  %"gep_x" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt1", i32 0, i32 0
  %"load_x" = load i32, i32* %"gep_x"
  ;  Source: pt1.x=1;
  store i32 1, i32* %"gep_x"
  ;  Source: pt1.y
  %"gep_y" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt1", i32 0, i32 1
  %"load_y" = load i32, i32* %"gep_y"
  ;  Source: pt1.y=2;
  store i32 2, i32* %"gep_y"
  ;  Source: pt2.x
  %"gep_x.1" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt2", i32 0, i32 0
  %"load_x.1" = load i32, i32* %"gep_x.1"
  ;  Source: pt2.x=3;
  store i32 3, i32* %"gep_x.1"
  ;  Source: pt2.y
  %"gep_y.1" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt2", i32 0, i32 1
  %"load_y.1" = load i32, i32* %"gep_y.1"
  ;  Source: pt2.y=4;
  store i32 4, i32* %"gep_y.1"
  %"px1" = alloca i32*
  %"gep_x.2" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt1", i32 0, i32 0
  %"load_x.2" = load i32, i32* %"gep_x.2"
  store i32* %"gep_x.2", i32** %"px1"
  %"py1" = alloca i32*
  %"gep_y.2" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt1", i32 0, i32 1
  %"load_y.2" = load i32, i32* %"gep_y.2"
  store i32* %"gep_y.2", i32** %"py1"
  %"px2" = alloca i32*
  %"gep_x.3" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt2", i32 0, i32 0
  %"load_x.3" = load i32, i32* %"gep_x.3"
  store i32* %"gep_x.3", i32** %"px2"
  %".17" = bitcast [15 x i8]* @"str" to i8*
  ;  Source: px1
  %"px1_load" = load i32*, i32** %"px1"
  ;  Source: py1
  %"py1_load" = load i32*, i32** %"py1"
  ;  Source: px1<py1
  %".21" = ptrtoint i32* %"px1_load" to i32
  %".22" = ptrtoint i32* %"py1_load" to i32
  %".23" = icmp ult i32 %".21", %".22"
  %".24" = zext i1 %".23" to i32
  ;  Source: printf("px1 < py1: %d\n",px1<py1);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".24")
  %".27" = bitcast [16 x i8]* @"str.1" to i8*
  ;  Source: px1
  %"px1_load.1" = load i32*, i32** %"px1"
  ;  Source: px2
  %"px2_load" = load i32*, i32** %"px2"
  ;  Source: px1==px2
  %".31" = ptrtoint i32* %"px1_load.1" to i32
  %".32" = ptrtoint i32* %"px2_load" to i32
  %".33" = icmp eq i32 %".31", %".32"
  %".34" = zext i1 %".33" to i32
  ;  Source: printf("px1 == px2: %d\n",px1==px2);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".34")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [15 x i8] c"px1 < py1: %d\0a\00"
@"str.1" = internal constant [16 x i8] c"px1 == px2: %d\0a\00"