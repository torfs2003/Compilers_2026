; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32}
%"struct.pointer" = type {%"struct.kaas"*}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.kaas"
  ;  Source: structkaasgouda;
  %"beemster" = alloca %"struct.kaas"
  ;  Source: structkaasbeemster;
  ;  Source: beemster.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"beemster", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: beemster.melk=1;
  store i32 1, i32* %"gep_melk"
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: gouda.melk=88;
  store i32 88, i32* %"gep_melk.1"
  %"z" = alloca [2 x %"struct.kaas"]
  ;  Source: gouda
  ;  Source: beemster
  ;  Source: structkaasz[2]={gouda,beemster};
  %".13" = getelementptr [2 x %"struct.kaas"], [2 x %"struct.kaas"]* %"z", i32 0, i32 0
  %".14" = load %"struct.kaas", %"struct.kaas"* %"gouda"
  store %"struct.kaas" %".14", %"struct.kaas"* %".13"
  %".16" = getelementptr [2 x %"struct.kaas"], [2 x %"struct.kaas"]* %"z", i32 0, i32 1
  %".17" = load %"struct.kaas", %"struct.kaas"* %"beemster"
  store %"struct.kaas" %".17", %"struct.kaas"* %".16"
  %".19" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: (z[0]).melk
  %"gep_array" = getelementptr [2 x %"struct.kaas"], [2 x %"struct.kaas"]* %"z", i32 0, i32 0
  %"array_element" = load %"struct.kaas", %"struct.kaas"* %"gep_array"
  %"gep_melk.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gep_array", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: (z[1]).melk
  %"gep_array.1" = getelementptr [2 x %"struct.kaas"], [2 x %"struct.kaas"]* %"z", i32 0, i32 1
  %"array_element.1" = load %"struct.kaas", %"struct.kaas"* %"gep_array.1"
  %"gep_melk.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gep_array.1", i32 0, i32 0
  %"load_melk.3" = load i32, i32* %"gep_melk.3"
  ;  Source: printf("%d %d",(z[0]).melk,(z[1]).melk);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"load_melk.2", i32 %"load_melk.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%d %d\00"