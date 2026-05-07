; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32}
%"struct.pointer" = type {%"struct.kaas"*}
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
  %"gouda" = alloca %"struct.kaas"
  ;  Source: structkaasgouda;
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: gouda.melk=8;
  store i32 8, i32* %"gep_melk"
  %"ptr" = alloca %"struct.pointer"
  ;  Source: structpointerptr;
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr"
  ;  Source: gouda
  ;  Source: &gouda
  ;  Source: ptr.kaas_ptr=&gouda;
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"gep_kaas_ptr"
  %"kaas_ptr" = alloca %"struct.kaas"*
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr.1" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.1"
  ;  Source: structkaas*kaas_ptr=ptr.kaas_ptr;
  store %"struct.kaas"* %"load_kaas_ptr.1", %"struct.kaas"** %"kaas_ptr"
  %".15" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: (*kaas_ptr).melk
  %"kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"kaas_ptr"
  %"deref_load" = load %"struct.kaas", %"struct.kaas"* %"kaas_ptr.1"
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"kaas_ptr.1", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: printf("%d",(*kaas_ptr).melk);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"load_melk.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"