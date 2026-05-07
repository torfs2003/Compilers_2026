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
  %"a" = alloca [3 x i32]
  ;  Source: inta[3]={1,2,3};
  %".3" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".7"
  %"p" = alloca i32*
  ;  Source: a
  ;  Source: &a
  ;  Source: int*p=&a;
  %".12" = bitcast [3 x i32]* %"a" to i32*
  store i32* %".12", i32** %"p"
  %"q" = alloca i32*
  ;  Source: p
  %"p.1" = load i32*, i32** %"p"
  ;  Source: (p+1)
  %".16" = getelementptr i32, i32* %"p.1", i32 1
  ;  Source: int*q=(p+1);
  store i32* %".16", i32** %"q"
  %"v" = alloca i32
  ;  Source: q
  %"q.1" = load i32*, i32** %"q"
  ;  Source: p
  %"p.2" = load i32*, i32** %"p"
  ;  Source: q-p
  %".22" = ptrtoint i32* %"q.1" to i32
  %".23" = ptrtoint i32* %"p.2" to i32
  %".24" = sub i32 %".22", %".23"
  %".25" = sdiv i32 %".24", 4
  ;  Source: intv=q-p;
  store i32 %".25", i32* %"v"
  %".28" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: v
  %"v.1" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"v.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"