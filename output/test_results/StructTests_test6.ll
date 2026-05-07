; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"ementaler" = alloca %"struct.kaas"
  ;  Source: ementaler.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: ementaler.melk=1;
  store i32 1, i32* %"gep_melk"
  ;  Source: ementaler.fermtented
  %"gep_fermtented" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented" = load i32, i32* %"gep_fermtented"
  ;  Source: ementaler.fermtented=18;
  store i32 18, i32* %"gep_fermtented"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ementaler.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: printf("%d",ementaler.melk);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"load_melk.1")
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: ementaler.fermtented
  %"gep_fermtented.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented.1" = load i32, i32* %"gep_fermtented.1"
  ;  Source: printf("%d",ementaler.fermtented);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"load_fermtented.1")
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: gouda.melk=2;
  store i32 2, i32* %"gep_melk.2"
  ;  Source: gouda.fermtented
  %"gep_fermtented.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_fermtented.2" = load i32, i32* %"gep_fermtented.2"
  ;  Source: gouda.fermtented=7;
  store i32 7, i32* %"gep_fermtented.2"
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: gouda.melk
  %"gep_melk.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.3" = load i32, i32* %"gep_melk.3"
  ;  Source: printf("%d",gouda.melk);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"load_melk.3")
  %".26" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: gouda.fermtented
  %"gep_fermtented.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_fermtented.3" = load i32, i32* %"gep_fermtented.3"
  ;  Source: printf("%d",gouda.fermtented);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"load_fermtented.3")
  %".30" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: ementaler.melk
  %"gep_melk.4" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk.4" = load i32, i32* %"gep_melk.4"
  ;  Source: printf("%d",ementaler.melk);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"load_melk.4")
  %".34" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: ementaler.fermtented
  %"gep_fermtented.4" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented.4" = load i32, i32* %"gep_fermtented.4"
  ;  Source: printf("%d",ementaler.fermtented);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"load_fermtented.4")
  %"gouda_ptr" = alloca %"struct.kaas"*
  store %"struct.kaas"* %"ementaler", %"struct.kaas"** %"gouda_ptr"
  %".39" = bitcast [6 x i8]* @"str.6" to i8*
  ;  Source: (*gouda_ptr).melk
  %"gouda_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gouda_ptr"
  %"gep_melk.5" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda_ptr.1", i32 0, i32 0
  %"load_melk.5" = load i32, i32* %"gep_melk.5"
  ;  Source: printf("%d   ",(*gouda_ptr).melk);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"load_melk.5")
  %"a" = alloca i32
  %"gouda_ptr.2" = load %"struct.kaas"*, %"struct.kaas"** %"gouda_ptr"
  %"gep_melk.6" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda_ptr.2", i32 0, i32 0
  %"load_melk.6" = load i32, i32* %"gep_melk.6"
  %".43" = sitofp i32 %"load_melk.6" to float
  %".44" = fmul float %".43", 0x400b9999a0000000
  %".45" = sitofp i32 36 to float
  %".46" = fcmp one float %".44",              0x0
  %".47" = fcmp one float %".45",              0x0
  %".48" = or i1 %".46", %".47"
  %".49" = zext i1 %".48" to i32
  store i32 %".49", i32* %"a"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [6 x i8] c"%d   \00"