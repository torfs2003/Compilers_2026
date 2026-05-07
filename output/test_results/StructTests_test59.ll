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
  ;  Source: perier.has_nemo
  %"gep_has_nemo" = getelementptr inbounds %"struct.water", %"struct.water"* %"perier", i32 0, i32 0
  %"load_has_nemo" = load i32, i32* %"gep_has_nemo"
  ;  Source: perier.has_nemo=0;
  store i32 0, i32* %"gep_has_nemo"
  %"spa" = alloca %"struct.water"
  ;  Source: spa.has_nemo
  %"gep_has_nemo.1" = getelementptr inbounds %"struct.water", %"struct.water"* %"spa", i32 0, i32 0
  %"load_has_nemo.1" = load i32, i32* %"gep_has_nemo.1"
  ;  Source: spa.has_nemo=0;
  store i32 0, i32* %"gep_has_nemo.1"
  %"sea" = alloca %"struct.water"
  ;  Source: sea.has_nemo
  %"gep_has_nemo.2" = getelementptr inbounds %"struct.water", %"struct.water"* %"sea", i32 0, i32 0
  %"load_has_nemo.2" = load i32, i32* %"gep_has_nemo.2"
  ;  Source: sea.has_nemo=1;
  store i32 1, i32* %"gep_has_nemo.2"
  %"boo" = alloca %"struct.bottle"
  ;  Source: boo.perier
  %"gep_perier" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 0
  ;  Source: perier
  ;  Source: boo.perier=perier;
  %".14" = load %"struct.water", %"struct.water"* %"perier"
  store %"struct.water" %".14", %"struct.water"* %"gep_perier"
  ;  Source: boo.spa
  %"gep_spa" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 1
  ;  Source: spa
  ;  Source: boo.spa=spa;
  %".19" = load %"struct.water", %"struct.water"* %"spa"
  store %"struct.water" %".19", %"struct.water"* %"gep_spa"
  ;  Source: boo.sea
  %"gep_sea" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 2
  ;  Source: sea
  ;  Source: boo.sea=sea;
  %".24" = load %"struct.water", %"struct.water"* %"sea"
  store %"struct.water" %".24", %"struct.water"* %"gep_sea"
  %".26" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: boo.sea.has_nemo
  %"gep_sea.1" = getelementptr inbounds %"struct.bottle", %"struct.bottle"* %"boo", i32 0, i32 2
  %"gep_has_nemo.3" = getelementptr inbounds %"struct.water", %"struct.water"* %"gep_sea.1", i32 0, i32 0
  %"load_has_nemo.3" = load i32, i32* %"gep_has_nemo.3"
  ;  Source: printf("%d",boo.sea.has_nemo);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"load_has_nemo.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"