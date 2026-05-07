; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"z" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x+3
  %".6" = add i32 %"x.1", 3
  ;  Source: intz=x+3;
  store i32 %".6", i32* %"z"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"z.1")
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".16" = mul i32 %"z.2", %"z.3"
  ;  Source: z
  %"z.4" = load i32, i32* %"z"
  %".18" = mul i32 %".16", %"z.4"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: (x+x)
  %".22" = add i32 %"x.3", %"x.4"
  ;  Source: z*z*z*(x+x)
  %".24" = mul i32 %".18", %".22"
  ;  Source: x=z*z*z*(x+x);
  store i32 %".24", i32* %"x"
  %".27" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.5" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"z.5")
  %".31" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"x.5")
  %"f" = alloca float
  ;  Source: floatf=0.986312;
  store float 0x3fef8fde20000000, float* %"f"
  %"f2" = alloca float
  ;  Source: f
  %"f.1" = load float, float* %"f"
  %".38" = fmul float %"f.1", 0x4040800000000000
  ;  Source: f*33.0+2.0
  %".40" = fadd float %".38", 0x4000000000000000
  ;  Source: floatf2=f*33.0+2.0;
  store float %".40", float* %"f2"
  %".43" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".46" = fpext float %"f.2" to double
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", double %".46")
  %".48" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: printf("%f",f2);
  %".51" = fpext float %"f2.1" to double
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", double %".51")
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f2
  %"f2.3" = load float, float* %"f2"
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: f2+f
  %".57" = fadd float %"f2.3", %"f.3"
  ;  Source: f2=f2+f;
  store float %".57", float* %"f2"
  %".60" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f2
  %"f2.4" = load float, float* %"f2"
  ;  Source: printf("%f",f2);
  %".63" = fpext float %"f2.4" to double
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", double %".63")
  %"c" = alloca i8
  ;  Source: charc='a';
  store i8 97, i8* %"c"
  %".67" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".70" = zext i8 %"c.1" to i32
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  %".75" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: c
  %"c.3" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".78" = zext i8 %"c.3" to i32
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%f\00"
@"str.5" = internal constant [3 x i8] c"%f\00"
@"str.6" = internal constant [3 x i8] c"%c\00"
@"str.7" = internal constant [3 x i8] c"%c\00"