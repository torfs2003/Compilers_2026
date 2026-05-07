; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"ementaler" = alloca %"struct.kaas"
  ;  Source: structkaasementaler;
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
  %"gouda" = alloca %"struct.kaas"
  ;  Source: structkaasgouda;
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: gouda.melk=7;
  store i32 7, i32* %"gep_melk.1"
  ;  Source: gouda.fermtented
  %"gep_fermtented.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_fermtented.1" = load i32, i32* %"gep_fermtented.1"
  ;  Source: gouda.fermtented=9;
  store i32 9, i32* %"gep_fermtented.1"
  %".16" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ementaler.melk
  %"gep_melk.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: printf("%d",ementaler.melk);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"load_melk.2")
  %".20" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: ementaler.fermtented
  %"gep_fermtented.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented.2" = load i32, i32* %"gep_fermtented.2"
  ;  Source: printf("%d",ementaler.fermtented);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"load_fermtented.2")
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: gouda.melk
  %"gep_melk.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.3" = load i32, i32* %"gep_melk.3"
  ;  Source: printf("%d",gouda.melk);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"load_melk.3")
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: gouda.fermtented
  %"gep_fermtented.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_fermtented.3" = load i32, i32* %"gep_fermtented.3"
  ;  Source: printf("%d",gouda.fermtented);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"load_fermtented.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"