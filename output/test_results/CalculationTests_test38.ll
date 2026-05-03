; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca [4 x i32]
  ;  Source: inta[4]={1,2,3,4};
  %".3" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".9"
  %"sa" = alloca i32*
  ;  Source: a
  ;  Source: int*sa=a;
  %".13" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".13", i32** %"sa"
  ;  Source: a
  ;  Source: ~a;
  %".17" = xor [4 x i32]* %"a", -1
  ;  User Comment: //~sa;
  ;  Source: return0;
  ret i32 0
}
