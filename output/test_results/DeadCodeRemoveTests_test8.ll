; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: if('a'==3){printf("never executed");}
  %".3" = sext i8 97 to i32
  %".4" = icmp eq i32 %".3", 3
  %".5" = zext i1 %".4" to i32
  %"ifcond" = icmp ne i32 %".5", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".7" = bitcast [15 x i8]* @"str" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  br label %"if.end"
if.end:
  %".10" = bitcast [15 x i8]* @"str.1" to i8*
  ;  Source: printf("never executed");
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10")
  %".13" = bitcast [9 x i8]* @"str.2" to i8*
  ;  Source: printf("executed");
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [15 x i8] c"never executed\00"
@"str.1" = internal constant [15 x i8] c"never executed\00"
@"str.2" = internal constant [9 x i8] c"executed\00"