; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float, i8}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

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
  %"load_fermtented" = load float, float* %"gep_fermtented"
  ;  Source: ementaler.fermtented=18.9;
  store float 0x4032e66660000000, float* %"gep_fermtented"
  ;  Source: ementaler.lol
  %"gep_lol" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol" = load i8, i8* %"gep_lol"
  ;  Source: ementaler.lol='l';
  store i8 108, i8* %"gep_lol"
  %".12" = bitcast [9 x i8]* @"str" to i8*
  ;  Source: ementaler.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: ementaler.fermtented
  %"gep_fermtented.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented.1" = load float, float* %"gep_fermtented.1"
  ;  Source: ementaler.lol
  %"gep_lol.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol.1" = load i8, i8* %"gep_lol.1"
  ;  Source: printf("%d %f %c",ementaler.melk,ementaler.fermtented,ementaler.lol);
  %".17" = fpext float %"load_fermtented.1" to double
  %".18" = zext i8 %"load_lol.1" to i32
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"load_melk.1", double %".17", i32 %".18")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [9 x i8] c"%d %f %c\00"