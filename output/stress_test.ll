; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"struct.Persoon" = type {i32, i8}
define i32 @"main"()
{
entry:
  %"p" = alloca %"struct.Persoon"
  ;  User Comment: // 1. EERST alle declaraties
  ;  Source: structPersoonp;
  %"pointer" = alloca i32*
  ;  Source: leeftijd*pointer;
  ;  User Comment: // <-- Verplaatst naar de top!
  ;  User Comment: // 2. DAN pas de uitvoerende statements
  ;  Source: p.jaren
  %"gep_jaren" = getelementptr inbounds %"struct.Persoon", %"struct.Persoon"* %"p", i32 0, i32 0
  %"load_jaren" = load i32, i32* %"gep_jaren"
  ;  User Comment: // <-- Verplaatst naar de top!
  ;  User Comment: // 2. DAN pas de uitvoerende statements
  ;  Source: p.jaren=20;
  store i32 20, i32* %"gep_jaren"
  ;  Source: return0;
  ret i32 0
}
