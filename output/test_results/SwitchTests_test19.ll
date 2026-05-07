; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb;
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  ;  Source: switch(a){case1:b=1;break;default:b=3;break;}
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"b.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"