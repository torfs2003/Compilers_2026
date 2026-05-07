; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float, i8}
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
  %"load_fermtented" = load float, float* %"gep_fermtented"
  ;  Source: ementaler.fermtented=18.9;
  store float 0x4032e66660000000, float* %"gep_fermtented"
  ;  Source: ementaler.lol
  %"gep_lol" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol" = load i8, i8* %"gep_lol"
  ;  Source: ementaler.lol='l';
  store i8 108, i8* %"gep_lol"
  %"b" = alloca i8
  %"gep_lol.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol.1" = load i8, i8* %"gep_lol.1"
  store i8 %"load_lol.1", i8* %"b"
  %".12" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: ementaler.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: ementaler.fermtented
  %"gep_fermtented.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 1
  %"load_fermtented.1" = load float, float* %"gep_fermtented.1"
  ;  Source: ementaler.lol
  %"gep_lol.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol.2" = load i8, i8* %"gep_lol.2"
  ;  Source: b
  %"b.1" = load i8, i8* %"b"
  ;  Source: printf("%d %f %c %c",ementaler.melk,ementaler.fermtented,ementaler.lol,b);
  %".18" = fpext float %"load_fermtented.1" to double
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"load_melk.1", double %".18", i8 %"load_lol.2", i8 %"b.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"%d %f %c %c\00"