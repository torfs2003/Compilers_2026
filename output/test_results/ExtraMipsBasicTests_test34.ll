; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

%"struct.a" = type {i32}
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
  %"c" = alloca %"struct.a"
  ;  Source: structac;
  ;  Source: c.b
  %"gep_b" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 0
  %"load_b" = load i32, i32* %"gep_b"
  ;  Source: c.b=4;
  store i32 4, i32* %"gep_b"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c.b
  %"gep_b.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 0
  %"load_b.1" = load i32, i32* %"gep_b.1"
  ;  Source: printf("%d",c.b);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"load_b.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"