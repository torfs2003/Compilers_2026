; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 0, i32* %"x"
  %"xp" = alloca i32*
  store i32* %"x", i32** %"xp"
  ;  Source: xp
  %"xp.1" = load i32*, i32** %"xp"
  %"deref_load" = load i32, i32* %"xp.1"
  ;  Source: *xp=10;
  store i32 10, i32* %"xp.1"
  %".7" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"x.1")
  %".11" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: xp
  %"xp.2" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load.1" = load i32, i32* %"xp.2"
  ;  Source: printf("%d\n",*xp);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"deref_load.1")
  ;  Source: xp
  %"xp.3" = load i32*, i32** %"xp"
  ;  Source: (*xp)
  %"deref_load.2" = load i32, i32* %"xp.3"
  ;  Source: (*xp)++;
  %".19" = load i32, i32* %"xp.3"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"xp.3"
  %".22" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: printf("%d; ",x);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"x.2")
  %".26" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: xp
  %"xp.4" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load.3" = load i32, i32* %"xp.4"
  ;  Source: printf("%d\n",*xp);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"deref_load.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"