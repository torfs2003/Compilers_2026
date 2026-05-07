; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.Point" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"pt1" = alloca %"struct.Point"
  ;  Source: structPointpt1;
  %"pt2" = alloca %"struct.Point"
  ;  Source: structPointpt2;
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
  ;  Source: pt1.x
  %"gep_x.2" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt1", i32 0, i32 0
  %"load_x.2" = load i32, i32* %"gep_x.2"
  ;  Source: &pt1.x
  ;  Source: int*px1=&pt1.x;
  store i32* %"gep_x.2", i32** %"px1"
  %"py1" = alloca i32*
  ;  Source: pt1.y
  %"gep_y.2" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt1", i32 0, i32 1
  %"load_y.2" = load i32, i32* %"gep_y.2"
  ;  Source: &pt1.y
  ;  Source: int*py1=&pt1.y;
  store i32* %"gep_y.2", i32** %"py1"
  %"px2" = alloca i32*
  ;  Source: pt2.x
  %"gep_x.3" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"pt2", i32 0, i32 0
  %"load_x.3" = load i32, i32* %"gep_x.3"
  ;  Source: &pt2.x
  ;  Source: int*px2=&pt2.x;
  store i32* %"gep_x.3", i32** %"px2"
  %".28" = bitcast [15 x i8]* @"str" to i8*
  ;  Source: px1
  %"px1.1" = load i32*, i32** %"px1"
  ;  Source: py1
  %"py1.1" = load i32*, i32** %"py1"
  ;  Source: px1<py1
  %".32" = ptrtoint i32* %"px1.1" to i32
  %".33" = ptrtoint i32* %"py1.1" to i32
  %".34" = icmp ult i32 %".32", %".33"
  %".35" = zext i1 %".34" to i32
  ;  Source: printf("px1 < py1: %d\n",px1<py1);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".35")
  %".38" = bitcast [16 x i8]* @"str.1" to i8*
  ;  Source: px1
  %"px1.2" = load i32*, i32** %"px1"
  ;  Source: px2
  %"px2.1" = load i32*, i32** %"px2"
  ;  Source: px1==px2
  %".42" = ptrtoint i32* %"px1.2" to i32
  %".43" = ptrtoint i32* %"px2.1" to i32
  %".44" = icmp eq i32 %".42", %".43"
  %".45" = zext i1 %".44" to i32
  ;  Source: printf("px1 == px2: %d\n",px1==px2);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".45")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [15 x i8] c"px1 < py1: %d\0a\00"
@"str.1" = internal constant [16 x i8] c"px1 == px2: %d\0a\00"