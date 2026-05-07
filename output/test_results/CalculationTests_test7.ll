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
  %"a" = alloca i32
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
  %".10" = load i32, i32* %"x"
  %".11" = sub i32 %".10", 1
  store i32 %".11", i32* %"x"
  ;  Source: a=x--;
  store i32 %".10", i32* %"a"
  %".15" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"a.3")
  %"z" = alloca i32
  %"x.2" = load i32, i32* %"x"
  %".19" = load i32, i32* %"x"
  %".20" = sub i32 %".19", 1
  store i32 %".20", i32* %"x"
  store i32 %".19", i32* %"z"
  %".23" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"z.1")
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x--
  %".30" = load i32, i32* %"x"
  %".31" = sub i32 %".30", 1
  store i32 %".31", i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z--
  %".35" = load i32, i32* %"z"
  %".36" = sub i32 %".35", 1
  store i32 %".36", i32* %"z"
  ;  Source: x--+z--
  %".39" = add i32 %".30", %".35"
  ;  Source: x=x--+z--;
  store i32 %".39", i32* %"x"
  %".42" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"x.5")
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: --x
  %".49" = load i32, i32* %"x"
  %".50" = sub i32 %".49", 1
  store i32 %".50", i32* %"x"
  ;  Source: a=--x;
  store i32 %".50", i32* %"a"
  %".54" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %"a.5")
  %".58" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x.7" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %"x.7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"