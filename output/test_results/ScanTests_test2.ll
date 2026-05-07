; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"p" = alloca i32
  %".2" = fptosi float 0x40091eb860000000 to i32
  store i32 %".2", i32* %"p"
  %"q" = alloca i32*
  store i32* %"p", i32** %"q"
  %"s" = alloca i32*
  %"q.1" = load i32*, i32** %"q"
  store i32* %"q.1", i32** %"s"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: s
  %"s.1" = load i32*, i32** %"s"
  ;  Source: scanf("%d",s);
  %".9" = call i32 (i8*, ...) @"scanf"(i8* %".6", i32** %"s")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: s
  %"s.2" = load i32*, i32** %"s"
  ;  Source: *s
  %"deref_load" = load i32, i32* %"s.2"
  ;  Source: printf("%d",*s);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"deref_load")
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: printf("%d",p);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"p.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"