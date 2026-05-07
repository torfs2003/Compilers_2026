; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32}
%"struct.pointer" = type {%"struct.kaas"*}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"lol"()
{
entry:
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: gouda.melk=9;
  store i32 9, i32* %"gep_melk"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: printf("%d",gouda.melk);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"load_melk.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: gouda.melk=1;
  store i32 1, i32* %"gep_melk"
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  User Comment: /* This may not thrown a semantic error */
  ;  Source: printf("%d",gouda.melk);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"load_melk.1")
  %"ptr" = alloca %"struct.pointer"
  ;  Source: ptr.kaas_ptr
  %"gep_kaas_ptr" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr"
  ;  Source: gouda
  ;  Source: &gouda
  ;  Source: ptr.kaas_ptr=&gouda;
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"gep_kaas_ptr"
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: (*ptr.kaas_ptr).melk
  %"gep_kaas_ptr.1" = getelementptr inbounds %"struct.pointer", %"struct.pointer"* %"ptr", i32 0, i32 0
  %"load_kaas_ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"gep_kaas_ptr.1"
  %"gep_melk.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"load_kaas_ptr.1", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: printf("%d",(*ptr.kaas_ptr).melk);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"load_melk.2")
  ;  Source: lol();
  %".20" = call i32 @"lol"()
  %".21" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: gouda.melk
  %"gep_melk.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.3" = load i32, i32* %"gep_melk.3"
  ;  Source: printf("%d",gouda.melk);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"load_melk.3")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"