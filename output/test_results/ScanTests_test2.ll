; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"p" = alloca i32
  ;  Source: constintp=3.14;
  %".3" = fptosi float 0x40091eb860000000 to i32
  store i32 %".3", i32* %"p"
  %"q" = alloca i32*
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: &p
  ;  Source: int*q=&p;
  store i32* %"p", i32** %"q"
  %"s" = alloca i32*
  ;  Source: q
  %"q.1" = load i32*, i32** %"q"
  ;  Source: constint*s=q;
  store i32* %"q.1", i32** %"s"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: s
  %"s.1" = load i32*, i32** %"s"
  ;  Source: scanf("%d",s);
  %".15" = call i32 (i8*, ...) @"scanf"(i8* %".12", i32* %"s.1")
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: s
  %"s.2" = load i32*, i32** %"s"
  ;  Source: *s
  %"deref_load" = load i32, i32* %"s.2"
  ;  Source: printf("%d",*s);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"deref_load")
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.2" = load i32, i32* %"p"
  ;  Source: printf("%d",p);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"p.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"