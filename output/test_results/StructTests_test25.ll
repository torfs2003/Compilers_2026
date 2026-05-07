; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, i32}
%"struct.kaas2" = type {%"struct.kaas"*, %"struct.kaas"***}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

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
  %".8" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ementaler.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: printf("%d ",ementaler.melk);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"load_melk.1")
  %".12" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ementaler.fermtented
  %"gep_fermtented.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented.1" = load i32, i32* %"gep_fermtented.1"
  ;  Source: printf("%d ",ementaler.fermtented);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"load_fermtented.1")
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: gouda.melk=7;
  store i32 7, i32* %"gep_melk.2"
  ;  Source: gouda.fermtented
  %"gep_fermtented.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_fermtented.2" = load i32, i32* %"gep_fermtented.2"
  ;  Source: gouda.fermtented=9;
  store i32 9, i32* %"gep_fermtented.2"
  %".22" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: gouda.melk
  %"gep_melk.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.3" = load i32, i32* %"gep_melk.3"
  ;  Source: printf("%d ",gouda.melk);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"load_melk.3")
  %".26" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: gouda.fermtented
  %"gep_fermtented.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_fermtented.3" = load i32, i32* %"gep_fermtented.3"
  ;  Source: printf("%d ",gouda.fermtented);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"load_fermtented.3")
  %"gouda_ptr" = alloca %"struct.kaas"*
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"gouda_ptr"
  %".31" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: (*gouda_ptr).melk
  %"gouda_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gouda_ptr"
  %"gep_melk.4" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda_ptr.1", i32 0, i32 0
  %"load_melk.4" = load i32, i32* %"gep_melk.4"
  ;  Source: printf("%d ",(*gouda_ptr).melk);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"load_melk.4")
  ;  Source: return0;
  ret i32 0
}

@"cry" = internal global i32 0
@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [4 x i8] c"%d \00"
@"str.2" = internal constant [4 x i8] c"%d \00"
@"str.3" = internal constant [4 x i8] c"%d \00"
@"str.4" = internal constant [4 x i8] c"%d \00"