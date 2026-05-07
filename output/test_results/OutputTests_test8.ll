; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca float
  store float 0x3fdea7ac80000000, float* %"x"
  %"y" = alloca float
  store float 0x4154f0cac0000000, float* %"y"
  %"f" = alloca float
  store float 0x4099d80000000000, float* %"f"
  %"z" = alloca float
  store float              0x0, float* %"z"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: (int)z
  %".9" = fptosi float %"z.1" to i32
  ;  Source: printf("%d",(int)z);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".9")
  ;  Source: z
  %"z.2" = load float, float* %"z"
  ;  Source: z=-565.21547;
  store float 0xc081a9b940000000, float* %"z"
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load float, float* %"x"
  ;  Source: (int)x
  %".18" = fptosi float %"x.1" to i32
  ;  Source: printf("%d",(int)x);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: (int)y
  %".24" = fptosi float %"y.1" to i32
  ;  Source: printf("%d",(int)y);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  %".27" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".30" = fptosi float %"f.1" to i32
  ;  Source: printf("%d",(int)f);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".30")
  %".33" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: z
  %"z.3" = load float, float* %"z"
  ;  Source: (int)z
  %".36" = fptosi float %"z.3" to i32
  ;  Source: printf("%d",(int)z);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"