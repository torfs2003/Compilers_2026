; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

%"struct.kaas" = type {i8}
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
  %"ementaler" = alloca %"struct.kaas"
  ;  Source: structkaasementaler;
  ;  Source: ementaler.lol
  %"gep_lol" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_lol" = load i8, i8* %"gep_lol"
  ;  Source: ementaler.lol='l';
  store i8 108, i8* %"gep_lol"
  %"ptr" = alloca %"struct.pointer"
  ;  Source: structpointerptr;
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr"
  ;  Source: ementaler
  ;  Source: &ementaler
  ;  Source: ptr.kaas_ptr=&ementaler;
  store %"struct.kaas"* %"ementaler", %"struct.kaas"** %"gep_kaas_ptr"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: (*ptr.kaas_ptr).lol
  %"gep_kaas_ptr.1" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.1"
  %"deref_load" = load %"struct.kaas", %"struct.kaas"* %"load_kaas_ptr.1"
  %"gep_lol.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"load_kaas_ptr.1", i32 0, i32 0
  %"load_lol.1" = load i8, i8* %"gep_lol.1"
  ;  Source: printf("%c",(*ptr.kaas_ptr).lol);
  %".15" = zext i8 %"load_lol.1" to i32
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"