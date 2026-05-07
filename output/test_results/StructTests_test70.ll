; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.water" = type {i32}
%"struct.bottle" = type {%"struct.water", %"struct.water", %"struct.water"}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"perier" = alloca %"struct.water"
  ;  Source: structwaterperier;
  ;  Source: perier.has_nemo
  %"gep_has_nemo" = getelementptr inbounds %"struct.water", %"struct.water"* %"perier", i32 0, i32 0
  %"load_has_nemo" = load i32, i32* %"gep_has_nemo"
  ;  Source: perier.has_nemo=0;
  store i32 0, i32* %"gep_has_nemo"
  %"spa" = alloca %"struct.water"
  ;  Source: structwaterspa;
  ;  Source: spa.has_nemo
  %"gep_has_nemo.1" = getelementptr inbounds %"struct.water", %"struct.water"* %"spa", i32 0, i32 0
  %"load_has_nemo.1" = load i32, i32* %"gep_has_nemo.1"
  ;  Source: spa.has_nemo=0;
  store i32 0, i32* %"gep_has_nemo.1"
  %"sea" = alloca %"struct.water"
  ;  Source: structwatersea;
  ;  Source: sea.has_nemo
  %"gep_has_nemo.2" = getelementptr inbounds %"struct.water", %"struct.water"* %"sea", i32 0, i32 0
  %"load_has_nemo.2" = load i32, i32* %"gep_has_nemo.2"
  ;  Source: sea.has_nemo=1;
  store i32 1, i32* %"gep_has_nemo.2"
  %"boo" = alloca %"struct.bottle"
  ;  Source: structbottleboo;
  ;  Source: boo.perier
  %"gep_perier" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 0
  ;  Source: perier
  ;  Source: boo.perier=perier;
  %".18" = load %"struct.water", %"struct.water"* %"perier"
  store %"struct.water" %".18", %"struct.water"* %"gep_perier"
  ;  Source: boo.spa
  %"gep_spa" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 1
  ;  Source: spa
  ;  Source: boo.spa=spa;
  %".23" = load %"struct.water", %"struct.water"* %"spa"
  store %"struct.water" %".23", %"struct.water"* %"gep_spa"
  ;  Source: boo.sea
  %"gep_sea" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 2
  ;  Source: sea
  ;  Source: boo.sea=sea;
  %".28" = load %"struct.water", %"struct.water"* %"sea"
  store %"struct.water" %".28", %"struct.water"* %"gep_sea"
  %".30" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: boo.sea.has_nemo
  %"gep_sea.1" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 2
  %"gep_has_nemo.3" = getelementptr inbounds %"struct.water", %"struct.water"* %"gep_sea.1", i32 0, i32 0
  %"load_has_nemo.3" = load i32, i32* %"gep_has_nemo.3"
  ;  Source: printf("%d",boo.sea.has_nemo);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"load_has_nemo.3")
  %".34" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: boo.spa.has_nemo
  %"gep_spa.1" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 1
  %"gep_has_nemo.4" = getelementptr inbounds %"struct.water", %"struct.water"* %"gep_spa.1", i32 0, i32 0
  %"load_has_nemo.4" = load i32, i32* %"gep_has_nemo.4"
  ;  Source: printf("%d",boo.spa.has_nemo);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"load_has_nemo.4")
  %".38" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: boo.perier.has_nemo
  %"gep_perier.1" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 0
  %"gep_has_nemo.5" = getelementptr inbounds %"struct.water", %"struct.water"* %"gep_perier.1", i32 0, i32 0
  %"load_has_nemo.5" = load i32, i32* %"gep_has_nemo.5"
  ;  Source: printf("%d",boo.perier.has_nemo);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"load_has_nemo.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"