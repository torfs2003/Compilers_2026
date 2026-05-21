; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i8}
%"struct.pointer" = type {%"struct.kaas"*}
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
  ;  Source: ementaler.lol
  %"gep_lol" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_lol" = load i8, i8* %"gep_lol"
  ;  Source: ementaler.lol='l';
  store i8 108, i8* %"gep_lol"
  %"ptr" = alloca %"struct.pointer"
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr"
  ;  Source: ementaler
  ;  Source: &ementaler
  ;  Source: ptr.kaas_ptr=&ementaler;
  store %"struct.kaas"* %"ementaler", %"struct.kaas"** %"gep_kaas_ptr"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: (*ptr.kaas_ptr).lol
  %"gep_kaas_ptr.1" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.1"
  %"gep_lol.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"load_kaas_ptr.1", i32 0, i32 0
  %"load_lol.1" = load i8, i8* %"gep_lol.1"
  ;  Source: printf("%c",(*ptr.kaas_ptr).lol);
  %".13" = sext i8 %"load_lol.1" to i32
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"