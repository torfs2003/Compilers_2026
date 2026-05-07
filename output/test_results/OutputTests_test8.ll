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
  %"x" = alloca float
  ;  Source: floatx=0.478984;
  store float 0x3fdea7ac80000000, float* %"x"
  %"y" = alloca float
  ;  Source: floaty=5489451.245847;
  store float 0x4154f0cac0000000, float* %"y"
  %"f" = alloca float
  ;  Source: floatf=1654.0000;
  store float 0x4099d80000000000, float* %"f"
  %"z" = alloca float
  ;  Source: floatz=0000.00000;
  store float              0x0, float* %"z"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: (int)z
  %".13" = fptosi float %"z.1" to i32
  ;  Source: printf("%d",(int)z);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ;  Source: z
  %"z.2" = load float, float* %"z"
  ;  Source: z=-565.21547;
  store float 0xc081a9b940000000, float* %"z"
  %".19" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load float, float* %"x"
  ;  Source: (int)x
  %".22" = fptosi float %"x.1" to i32
  ;  Source: printf("%d",(int)x);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  %".25" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: (int)y
  %".28" = fptosi float %"y.1" to i32
  ;  Source: printf("%d",(int)y);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".34" = fptosi float %"f.1" to i32
  ;  Source: printf("%d",(int)f);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".37" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: z
  %"z.3" = load float, float* %"z"
  ;  Source: (int)z
  %".40" = fptosi float %"z.3" to i32
  ;  Source: printf("%d",(int)z);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"