; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float, i8, i8*}
%"struct.pointer" = type {%"struct.kaas"*}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"ementaler" = alloca %"struct.kaas"
  ;  Source: ementaler.lol
  %"gep_lol" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol" = load i8, i8* %"gep_lol"
  ;  Source: ementaler.lol='l';
  store i8 108, i8* %"gep_lol"
  ;  Source: ementaler.zeta
  %"gep_zeta" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 3
  %"load_zeta" = load i8*, i8** %"gep_zeta"
  ;  Source: (ementaler.lol)
  %"gep_lol.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 2
  %"load_lol.1" = load i8, i8* %"gep_lol.1"
  ;  Source: &(ementaler.lol)
  ;  Source: ementaler.zeta=&(ementaler.lol);
  store i8* %"gep_lol.1", i8** %"gep_zeta"
  %"ptr" = alloca %"struct.pointer"
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr"
  ;  Source: ementaler
  ;  Source: &ementaler
  ;  Source: ptr.kaas_ptr=&ementaler;
  store %"struct.kaas"* %"ementaler", %"struct.kaas"** %"gep_kaas_ptr"
  %".15" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: (*ptr.kaas_ptr).lol
  %"gep_kaas_ptr.1" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.1"
  %"gep_lol.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"load_kaas_ptr.1", i32 0, i32 2
  %"load_lol.2" = load i8, i8* %"gep_lol.2"
  ;  Source: (*ptr.kaas_ptr).zeta
  %"gep_kaas_ptr.2" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.2" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.2"
  %"gep_zeta.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"load_kaas_ptr.2", i32 0, i32 3
  %"load_zeta.1" = load i8*, i8** %"gep_zeta.1"
  ;  Source: *(*ptr.kaas_ptr).zeta
  %"deref_load" = load i8, i8* %"load_zeta.1"
  ;  Source: printf("%c %c",(*ptr.kaas_ptr).lol,*(*ptr.kaas_ptr).zeta);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".15", i8 %"load_lol.2", i8 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%c %c\00"