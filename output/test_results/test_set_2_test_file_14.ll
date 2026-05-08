; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"f"(i32* %".1")
{
entry:
  %"a" = alloca i32*
  store i32* %".1", i32** %"a"
  ;  Source: a
  %"a_load" = load i32*, i32** %"a"
  ;  Source: (*a)
  %"deref_load" = load i32, i32* %"a_load"
  ;  Source: (*a)++;
  %".7" = load i32, i32* %"a_load"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"a_load"
  ret void
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 0, i32* %"x"
  %"xp" = alloca i32*
  store i32* %"x", i32** %"xp"
  ;  Source: xp
  %"xp_load" = load i32*, i32** %"xp"
  %"deref_load" = load i32, i32* %"xp_load"
  ;  Source: *xp=42;
  store i32 42, i32* %"xp_load"
  %".7" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x_load")
  %".11" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: xp
  %"xp_load.1" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load.1" = load i32, i32* %"xp_load.1"
  ;  Source: printf("%d\n",*xp);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"deref_load.1")
  ;  Source: xp
  %"xp_load.2" = load i32*, i32** %"xp"
  ;  Source: (*xp)
  %"deref_load.2" = load i32, i32* %"xp_load.2"
  ;  Source: (*xp)++;
  %".19" = load i32, i32* %"xp_load.2"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"xp_load.2"
  %".22" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"x_load.1")
  %".26" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: xp
  %"xp_load.3" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load.3" = load i32, i32* %"xp_load.3"
  ;  Source: printf("%d\n",*xp);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"deref_load.3")
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: f(&x);
  call void @"f"(i32* %"x")
  %".35" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x_load.3" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"x_load.3")
  %".39" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: xp
  %"xp_load.4" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load.4" = load i32, i32* %"xp_load.4"
  ;  Source: printf("%d\n",*xp);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"deref_load.4")
  ;  Source: xp
  %"xp_load.5" = load i32*, i32** %"xp"
  ;  Source: f(xp);
  call void @"f"(i32* %"xp_load.5")
  %".47" = bitcast [5 x i8]* @"str.6" to i8*
  ;  Source: x
  %"x_load.4" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %"x_load.4")
  %".51" = bitcast [4 x i8]* @"str.7" to i8*
  ;  Source: xp
  %"xp_load.6" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load.5" = load i32, i32* %"xp_load.6"
  ;  Source: printf("%d\n",*xp);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"deref_load.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
@"str.4" = internal constant [5 x i8] c"%d; \00"
@"str.5" = internal constant [4 x i8] c"%d\0a\00"
@"str.6" = internal constant [5 x i8] c"%d; \00"
@"str.7" = internal constant [4 x i8] c"%d\0a\00"