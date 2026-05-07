; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca %"struct.a"
  ;  Source: c.b
  %"gep_b" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 0
  %"load_b" = load i32, i32* %"gep_b"
  ;  Source: c.b=5;
  store i32 5, i32* %"gep_b"
  ;  Source: c.d
  %"gep_d" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 1
  %"load_d" = load i32, i32* %"gep_d"
  ;  Source: c.d=4;
  store i32 4, i32* %"gep_d"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c.b
  %"gep_b.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 0
  %"load_b.1" = load i32, i32* %"gep_b.1"
  ;  Source: printf("%d",c.b);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"load_b.1")
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c.d
  %"gep_d.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"c", i32 0, i32 1
  %"load_d.1" = load i32, i32* %"gep_d.1"
  ;  Source: printf("%d",c.d);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"load_d.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"