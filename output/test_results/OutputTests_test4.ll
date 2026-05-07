; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x.1")
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x--;
  %".9" = load i32, i32* %"x"
  %".10" = sub i32 %".9", 1
  store i32 %".10", i32* %"x"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"x.3")
  %"z" = alloca i32
  %"x.4" = load i32, i32* %"x"
  %".16" = load i32, i32* %"x"
  %".17" = sub i32 %".16", 1
  store i32 %".17", i32* %"x"
  store i32 %".16", i32* %"z"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"z.1")
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: x--
  %".27" = load i32, i32* %"x"
  %".28" = sub i32 %".27", 1
  store i32 %".28", i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z--
  %".32" = load i32, i32* %"z"
  %".33" = sub i32 %".32", 1
  store i32 %".33", i32* %"z"
  ;  Source: x--+z--
  %".36" = add i32 %".27", %".32"
  ;  Source: x=x--+z--;
  store i32 %".36", i32* %"x"
  %".39" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.7" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"x.7")
  ;  Source: x
  %"x.8" = load i32, i32* %"x"
  ;  Source: --x;
  %".45" = load i32, i32* %"x"
  %".46" = sub i32 %".45", 1
  store i32 %".46", i32* %"x"
  %".48" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x.9" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"x.9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"