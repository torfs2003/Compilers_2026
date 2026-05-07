; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"xp" = alloca i32*
  store i32* %"x", i32** %"xp"
  %"xpp" = alloca i32**
  store i32** %"xp", i32*** %"xpp"
  %".5" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: xp
  %"xp.1" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load" = load i32, i32* %"xp.1"
  ;  Source: xpp
  %"xpp.1" = load i32**, i32*** %"xpp"
  %"deref_load.1" = load i32*, i32** %"xpp.1"
  ;  Source: **xpp
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%d; %d; %d",x,*xp,**xpp);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"x.1", i32 %"deref_load", i32 %"deref_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %d; %d\00"