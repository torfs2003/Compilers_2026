; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=1;
  store i32 1, i32* %"x"
  %"ptr" = alloca i32*
  store i32* %"x", i32** %"ptr"
  %"is_x" = alloca i32
  %"ptr.1" = load i32*, i32** %"ptr"
  %".7" = ptrtoint i32* %"ptr.1" to i32
  %".8" = ptrtoint i32* %"x" to i32
  %".9" = icmp eq i32 %".7", %".8"
  %".10" = zext i1 %".9" to i32
  store i32 %".10", i32* %"is_x"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: is_x
  %"is_x.1" = load i32, i32* %"is_x"
  ;  Source: printf("%d",is_x);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"is_x.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"