; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %".2" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",5+5);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 10)
  %"c" = alloca float
  ;  Source: floatc=4.5+5.5;
  store float 0x4024000000000000, float* %"c"
  %".7" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: (int)c
  %".10" = fptosi float %"c.1" to i32
  ;  Source: printf("%d; ",(int)c);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  %".13" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: printf("%d; ",15-5);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 10)
  ;  Source: c
  %"c.2" = load float, float* %"c"
  ;  Source: c=10.5+0.5;
  store float 0x4026000000000000, float* %"c"
  %".19" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.3" = load float, float* %"c"
  ;  Source: (int)c
  %".22" = fptosi float %"c.3" to i32
  ;  Source: printf("%d; ",(int)c);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  %".25" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: printf("%d; ",2*5);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 10)
  ;  Source: c
  %"c.4" = load float, float* %"c"
  ;  Source: c=20.5*5.5;
  store float 0x405c300000000000, float* %"c"
  %".31" = bitcast [5 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.5" = load float, float* %"c"
  ;  Source: (int)c
  %".34" = fptosi float %"c.5" to i32
  ;  Source: printf("%d; ",(int)c);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".37" = bitcast [5 x i8]* @"str.6" to i8*
  ;  Source: printf("%d; ",(int)20/2);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 10)
  ;  Source: c
  %"c.6" = load float, float* %"c"
  ;  Source: c=5.0/0.5;
  store float 0x4024000000000000, float* %"c"
  %".43" = bitcast [5 x i8]* @"str.7" to i8*
  ;  Source: c
  %"c.7" = load float, float* %"c"
  ;  Source: (int)c
  %".46" = fptosi float %"c.7" to i32
  ;  Source: printf("%d; ",(int)c);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
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