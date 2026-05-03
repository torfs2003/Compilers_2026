; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: if('a'==3){printf("never executed");}
  %".3" = icmp eq i8 97, 3
  %".4" = zext i1 %".3" to i32
  %"ifcond" = icmp ne i32 %".4", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".6" = bitcast [15 x i8]* @"str" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  br label %"if.end"
if.end:
  %".9" = bitcast [15 x i8]* @"str.1" to i8*
  ;  Source: printf("never executed");
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".9")
  %".12" = bitcast [9 x i8]* @"str.2" to i8*
  ;  Source: printf("executed");
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".12")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [15 x i8] c"never executed\00"
@"str.1" = internal constant [15 x i8] c"never executed\00"
@"str.2" = internal constant [9 x i8] c"executed\00"