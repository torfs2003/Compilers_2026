; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx;
  %"y" = alloca i32
  ;  Source: inty;
  %".4" = bitcast [19 x i8]* @"str" to i8*
  ;  Source: printf("Enter two numbers:");
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".4")
  %".7" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: &y
  ;  Source: scanf("%d%d",&x,&y);
  %".13" = call i32 (i8*, ...) @"scanf"(i8* %".7", i32* %"x", i32* %"y")
  %".14" = bitcast [7 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: printf("%d; %d",x,y);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"x.2", i32 %"y.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [19 x i8] c"Enter two numbers:\00"
@"str.1" = internal constant [5 x i8] c"%d%d\00"
@"str.2" = internal constant [7 x i8] c"%d; %d\00"