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
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x+3
  %".10" = add i32 %"x.2", 3
  ;  Source: intz=x+3;
  store i32 %".10", i32* %"z"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"z.1")
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".20" = mul i32 %"z.2", %"z.3"
  ;  Source: z
  %"z.4" = load i32, i32* %"z"
  %".22" = mul i32 %".20", %"z.4"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: (x+x)
  %".26" = add i32 %"x.4", %"x.5"
  ;  Source: z*z*z*(x+x)
  %".28" = mul i32 %".22", %".26"
  ;  Source: x=z*z*z*(x+x);
  store i32 %".28", i32* %"x"
  %".31" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"x.6")
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
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: (int)f2
  %".46" = fptosi float %"f2.1" to i32
  ;  Source: printf("%d",(int)f2);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f2
  %"f2.3" = load float, float* %"f2"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f2+f
  %".53" = fadd float %"f2.3", %"f.2"
  ;  Source: f2=f2+f;
  store float %".53", float* %"f2"
  %".56" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f2
  %"f2.4" = load float, float* %"f2"
  ;  Source: (int)f2
  %".59" = fptosi float %"f2.4" to i32
  ;  Source: printf("%d",(int)f2);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  %"c" = alloca i8
  ;  Source: charc='a';
  store i8 97, i8* %"c"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  %".67" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".70" = zext i8 %"c.2" to i32
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%c\00"