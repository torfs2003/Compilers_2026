; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x--;
  %".10" = load i32, i32* %"x"
  %".11" = sub i32 %".10", 1
  store i32 %".11", i32* %"x"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"x.3")
  %"z" = alloca i32
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x--
  %".19" = load i32, i32* %"x"
  %".20" = sub i32 %".19", 1
  store i32 %".20", i32* %"x"
  ;  Source: intz=x--;
  store i32 %".19", i32* %"z"
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"z.1")
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: x--
  %".31" = load i32, i32* %"x"
  %".32" = sub i32 %".31", 1
  store i32 %".32", i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z--
  %".36" = load i32, i32* %"z"
  %".37" = sub i32 %".36", 1
  store i32 %".37", i32* %"z"
  ;  Source: x--+z--
  %".40" = add i32 %".31", %".36"
  ;  Source: x=x--+z--;
  store i32 %".40", i32* %"x"
  %".43" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.7" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %"x.7")
  ;  Source: x
  %"x.8" = load i32, i32* %"x"
  ;  Source: --x;
  %".49" = load i32, i32* %"x"
  %".50" = sub i32 %".49", 1
  store i32 %".50", i32* %"x"
  %".52" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x.9" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %"x.9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"