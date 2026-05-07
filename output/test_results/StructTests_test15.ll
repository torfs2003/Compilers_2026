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
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: gouda.melk=8;
  store i32 8, i32* %"gep_melk"
  %"ptr" = alloca %"struct.pointer"
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr"
  ;  Source: gouda
  ;  Source: &gouda
  ;  Source: ptr.kaas_ptr=&gouda;
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"gep_kaas_ptr"
  %"kaas_ptr" = alloca %"struct.kaas"*
  ;  Source: kaas_ptr
  %"kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"kaas_ptr"
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr.1" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.1"
  ;  Source: kaas_ptr=ptr.kaas_ptr;
  store %"struct.kaas"* %"load_kaas_ptr.1", %"struct.kaas"** %"kaas_ptr"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: (*kaas_ptr).melk
  %"kaas_ptr.2" = load %"struct.kaas"*, %"struct.kaas"** %"kaas_ptr"
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"kaas_ptr.2", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: printf("%d",(*kaas_ptr).melk);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"load_melk.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"