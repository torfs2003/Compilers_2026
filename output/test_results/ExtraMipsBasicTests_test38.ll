; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {i32*, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca %"struct.a"
  ;  Source: c.d
  %"gep_d" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 1
  %"load_d" = load i32, i32* %"gep_d"
  ;  Source: c.d=5;
  store i32 5, i32* %"gep_d"
  %"e" = alloca %"struct.a"*
  store %"struct.a"* %"c", %"struct.a"** %"e"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e->d
  %".8" = load %"struct.a"*, %"struct.a"** %"e"
  %"gep_d.1" = getelementptr inbounds %"struct.a", %"struct.a"* %".8", i32 0, i32 1
  %"load_d.1" = load i32, i32* %"gep_d.1"
  ;  Source: printf("%d",e->d);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"load_d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"