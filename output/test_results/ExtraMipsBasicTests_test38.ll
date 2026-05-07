; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

%"struct.a" = type {[20 x i32], i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"c" = alloca %"struct.a"
  ;  Source: structac;
  ;  Source: c.d
  %"gep_d" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 1
  %"load_d" = load i32, i32* %"gep_d"
  ;  Source: c.d=5;
  store i32 5, i32* %"gep_d"
  %"e" = alloca %"struct.a"*
  ;  Source: c
  ;  Source: &c
  ;  Source: structa*e=&c;
  store %"struct.a"* %"c", %"struct.a"** %"e"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e->d
  %".12" = load %"struct.a"*, %"struct.a"** %"e"
  %"gep_d.1" = getelementptr inbounds %"struct.a", %"struct.a"* %".12", i32 0, i32 1
  %"load_d.1" = load i32, i32* %"gep_d.1"
  ;  Source: printf("%d",e->d);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"load_d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"