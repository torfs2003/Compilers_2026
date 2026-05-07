; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.cheese" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.cheese"
  ;  Source: gouda.milk
  %"gep_milk" = getelementptr inbounds %"struct.cheese", %"struct.cheese"* %"gouda", i32 0, i32 0
  %"load_milk" = load i32, i32* %"gep_milk"
  ;  Source: gouda.milk=3;
  store i32 3, i32* %"gep_milk"
  %"c" = alloca i8*
  %".5" = bitcast [7 x i8]* @"str" to i8*
  store i8* %".5", i8** %"c"
  %"gouda_ptr" = alloca %"struct.cheese"*
  %"c.1" = load i8*, i8** %"c"
  %".7" = bitcast i8* %"c.1" to %"struct.cheese"*
  store %"struct.cheese"* %".7", %"struct.cheese"** %"gouda_ptr"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"wdwdwd\00"