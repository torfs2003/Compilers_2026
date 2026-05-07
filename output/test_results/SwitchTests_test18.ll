; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=9;
  store i32 9, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb;
  ;  Source: switch(a){case1:b=1;printf("%d",1);break;case6:printf("%d",6);break;default:b=3;printf("%d",3);case7:{intb=7;printf("%d",b);}}
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",4);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 4)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"