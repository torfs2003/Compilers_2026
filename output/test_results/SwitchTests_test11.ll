; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: switch(a){case0:case1:b=1;printf("%d",1);while(1){break;}case6:b=6;printf("%d",6);break;case2:b=2;printf("%d",2);break;default:b=3;printf("%d",3);break;}
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",4);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 4)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"