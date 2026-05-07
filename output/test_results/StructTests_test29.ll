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
  ;  Source: gouda.melk=3;
  store i32 3, i32* %"gep_melk"
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: ptr
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: gouda
  ;  Source: &gouda
  ;  Source: ptr=&gouda;
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"ptr"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr->melk
  %".12" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".12", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: printf("%d",ptr->melk);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"load_melk.1")
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: (*ptr).melk
  %"ptr.2" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_melk.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ptr.2", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: printf("%d",(*ptr).melk);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"load_melk.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"