; ModuleID = "cmm_module"
target datalayout = ""

%"struct.Point" = type {i32, i32}
%"struct.Rectangle" = type {%"struct.Point", %"struct.Point", i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"rect" = alloca %"struct.Rectangle"
  ;  Source: structRectanglerect;
  ;  User Comment: /* Waardes toewijzen via geneste member access (a.b.c) */
  ;  Source: rect.top_left.x
  %"gep_top_left" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 0
  %"gep_x" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_top_left", i32 0, i32 0
  %"load_x" = load i32, i32* %"gep_x"
  ;  User Comment: /* Waardes toewijzen via geneste member access (a.b.c) */
  ;  Source: rect.top_left.x=0;
  store i32 0, i32* %"gep_x"
  ;  Source: rect.top_left.y
  %"gep_top_left.1" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 0
  %"gep_y" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_top_left.1", i32 0, i32 1
  %"load_y" = load i32, i32* %"gep_y"
  ;  Source: rect.top_left.y=10;
  store i32 10, i32* %"gep_y"
  ;  Source: rect.bottom_right.x
  %"gep_bottom_right" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 1
  %"gep_x.1" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_bottom_right", i32 0, i32 0
  %"load_x.1" = load i32, i32* %"gep_x.1"
  ;  Source: rect.bottom_right.x=20;
  store i32 20, i32* %"gep_x.1"
  ;  Source: rect.bottom_right.y
  %"gep_bottom_right.1" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 1
  %"gep_y.1" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_bottom_right.1", i32 0, i32 1
  %"load_y.1" = load i32, i32* %"gep_y.1"
  ;  Source: rect.bottom_right.y=0;
  store i32 0, i32* %"gep_y.1"
  ;  User Comment: /* Berekening maken met de geneste waardes */
  ;  Source: rect.area
  %"gep_area" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 2
  %"load_area" = load i32, i32* %"gep_area"
  ;  Source: rect.bottom_right.x
  %"gep_bottom_right.2" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 1
  %"gep_x.2" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_bottom_right.2", i32 0, i32 0
  %"load_x.2" = load i32, i32* %"gep_x.2"
  ;  Source: rect.top_left.x
  %"gep_top_left.2" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 0
  %"gep_x.3" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_top_left.2", i32 0, i32 0
  %"load_x.3" = load i32, i32* %"gep_x.3"
  ;  Source: (rect.bottom_right.x-rect.top_left.x)
  %".22" = sub i32 %"load_x.2", %"load_x.3"
  ;  Source: rect.top_left.y
  %"gep_top_left.3" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 0
  %"gep_y.2" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_top_left.3", i32 0, i32 1
  %"load_y.2" = load i32, i32* %"gep_y.2"
  ;  Source: rect.bottom_right.y
  %"gep_bottom_right.3" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 1
  %"gep_y.3" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_bottom_right.3", i32 0, i32 1
  %"load_y.3" = load i32, i32* %"gep_y.3"
  ;  Source: (rect.top_left.y-rect.bottom_right.y)
  %".26" = sub i32 %"load_y.2", %"load_y.3"
  ;  Source: (rect.bottom_right.x-rect.top_left.x)*(rect.top_left.y-rect.bottom_right.y)
  %".28" = mul i32 %".22", %".26"
  ;  User Comment: /* Berekening maken met de geneste waardes */
  ;  Source: rect.area=(rect.bottom_right.x-rect.top_left.x)*(rect.top_left.y-rect.bottom_right.y);
  store i32 %".28", i32* %"gep_area"
  %".32" = bitcast [20 x i8]* @"str" to i8*
  ;  Source: rect.top_left.x
  %"gep_top_left.4" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 0
  %"gep_x.4" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_top_left.4", i32 0, i32 0
  %"load_x.4" = load i32, i32* %"gep_x.4"
  ;  Source: rect.top_left.y
  %"gep_top_left.5" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 0
  %"gep_y.4" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_top_left.5", i32 0, i32 1
  %"load_y.4" = load i32, i32* %"gep_y.4"
  ;  User Comment: /* Printen om te verifi�ren dat LLVM de juiste geheugenadressen pakt */
  ;  Source: printf("Top Left: (%d, %d)\n",rect.top_left.x,rect.top_left.y);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"load_x.4", i32 %"load_y.4")
  %".38" = bitcast [24 x i8]* @"str.1" to i8*
  ;  Source: rect.bottom_right.x
  %"gep_bottom_right.4" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 1
  %"gep_x.5" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_bottom_right.4", i32 0, i32 0
  %"load_x.5" = load i32, i32* %"gep_x.5"
  ;  Source: rect.bottom_right.y
  %"gep_bottom_right.5" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 1
  %"gep_y.5" = getelementptr inbounds %"struct.Point", %"struct.Point"* %"gep_bottom_right.5", i32 0, i32 1
  %"load_y.5" = load i32, i32* %"gep_y.5"
  ;  Source: printf("Bottom Right: (%d, %d)\n",rect.bottom_right.x,rect.bottom_right.y);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"load_x.5", i32 %"load_y.5")
  %".43" = bitcast [10 x i8]* @"str.2" to i8*
  ;  Source: rect.area
  %"gep_area.1" = getelementptr inbounds %"struct.Rectangle", %"struct.Rectangle"* %"rect", i32 0, i32 2
  %"load_area.1" = load i32, i32* %"gep_area.1"
  ;  Source: printf("Area: %d\n",rect.area);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %"load_area.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [20 x i8] c"Top Left: (%d, %d)\0a\00"
@"str.1" = internal constant [24 x i8] c"Bottom Right: (%d, %d)\0a\00"
@"str.2" = internal constant [10 x i8] c"Area: %d\0a\00"