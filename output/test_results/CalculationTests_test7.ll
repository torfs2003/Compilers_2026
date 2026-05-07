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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x--
  %".12" = load i32, i32* %"x"
  %".13" = sub i32 %".12", 1
  store i32 %".13", i32* %"x"
  ;  Source: a=x--;
  store i32 %".12", i32* %"a"
  %".17" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"a.3")
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x--
  %".23" = load i32, i32* %"x"
  %".24" = sub i32 %".23", 1
  store i32 %".24", i32* %"x"
  ;  Source: intz=x--;
  store i32 %".23", i32* %"z"
  %".28" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"z.1")
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x--
  %".35" = load i32, i32* %"x"
  %".36" = sub i32 %".35", 1
  store i32 %".36", i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z--
  %".40" = load i32, i32* %"z"
  %".41" = sub i32 %".40", 1
  store i32 %".41", i32* %"z"
  ;  Source: x--+z--
  %".44" = add i32 %".35", %".40"
  ;  Source: x=x--+z--;
  store i32 %".44", i32* %"x"
  %".47" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %"x.5")
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: --x
  %".54" = load i32, i32* %"x"
  %".55" = sub i32 %".54", 1
  store i32 %".55", i32* %"x"
  ;  Source: a=--x;
  store i32 %".55", i32* %"a"
  %".59" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".59", i32 %"a.5")
  %".63" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x.7" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"x.7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"