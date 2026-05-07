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
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=2;
  store i32 2, i32* %"a"
  ;  Source: switch(a){case1:b=1;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",1);case6:b=6;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",6);case2:b=2;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",2);break;default:b=3;switch(b){case1:printf("%d",11);break;case6:printf("%d",66);case2:printf("%d",22);break;default:printf("%d",33);break;}printf("%d",3);break;}
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",4);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 4)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"