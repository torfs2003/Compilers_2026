; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",5+5);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 10)
  %"c" = alloca float
  store float 0x4024000000000000, float* %"c"
  %".6" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: (int)c
  %".9" = fptosi float %"c.1" to i32
  ;  Source: printf("%d; ",(int)c);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".9")
  %".12" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: printf("%d; ",15-5);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 10)
  ;  Source: c
  %"c.2" = load float, float* %"c"
  ;  Source: c=10.5+0.5;
  store float 0x4026000000000000, float* %"c"
  %".18" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.3" = load float, float* %"c"
  ;  Source: (int)c
  %".21" = fptosi float %"c.3" to i32
  ;  Source: printf("%d; ",(int)c);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  %".24" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: printf("%d; ",2*5);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 10)
  ;  Source: c
  %"c.4" = load float, float* %"c"
  ;  Source: c=20.5*5.5;
  store float 0x405c300000000000, float* %"c"
  %".30" = bitcast [5 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.5" = load float, float* %"c"
  ;  Source: (int)c
  %".33" = fptosi float %"c.5" to i32
  ;  Source: printf("%d; ",(int)c);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  %".36" = bitcast [5 x i8]* @"str.6" to i8*
  ;  Source: printf("%d; ",(int)20/2);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 10)
  ;  Source: c
  %"c.6" = load float, float* %"c"
  ;  Source: c=5.0/0.5;
  store float 0x4024000000000000, float* %"c"
  %".42" = bitcast [5 x i8]* @"str.7" to i8*
  ;  Source: c
  %"c.7" = load float, float* %"c"
  ;  Source: (int)c
  %".45" = fptosi float %"c.7" to i32
  ;  Source: printf("%d; ",(int)c);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%d; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [5 x i8] c"%d; \00"
@"str.4" = internal constant [5 x i8] c"%d; \00"
@"str.5" = internal constant [5 x i8] c"%d; \00"
@"str.6" = internal constant [5 x i8] c"%d; \00"
@"str.7" = internal constant [5 x i8] c"%d; \00"