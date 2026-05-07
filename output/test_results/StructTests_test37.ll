; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.NotTypeSafe" = type {i32, i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"union.NotTypeSafe"
  ;  Source: unionNotTypeSafegouda;
  ;  Source: gouda.as_integer
  %"gep_as_integer" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"load_as_integer" = load i32, i32* %"gep_as_integer"
  ;  Source: gouda.as_integer=5;
  store i32 5, i32* %"gep_as_integer"
  %"q" = alloca i32
  ;  Source: gouda.as_integer
  %"gep_as_integer.1" = getelementptr inbounds %"union.NotTypeSafe", %"union.NotTypeSafe"* %"gouda", i32 0, i32 0
  %"load_as_integer.1" = load i32, i32* %"gep_as_integer.1"
  ;  Source: intq=gouda.as_integer;
  store i32 %"load_as_integer.1", i32* %"q"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: q
  %"q.1" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"q.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"