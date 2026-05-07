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
  %"a" = alloca i32
  ;  Source: inta=3;
  store i32 3, i32* %"a"
  %"b" = alloca i8*
  %".4" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: char*b="hello";
  store i8* %".4", i8** %"b"
  %"c" = alloca i32
  ;  Source: intc=255;
  store i32 255, i32* %"c"
  %"d" = alloca float
  ;  Source: floatd=3.14;
  store float 0x40091eb860000000, float* %"d"
  %"e" = alloca i8
  ;  Source: chare='c';
  store i8 99, i8* %"e"
  %".13" = bitcast [24 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i8*, i8** %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: (int)d
  %".19" = fptosi float %"d.1" to i32
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: printf(" %d \n %s \n %x \n %d \n %c",a,b,c,(int)d,e);
  %".22" = zext i8 %"e.1" to i32
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"a.1", i8* %"b.1", i32 %"c.1", i32 %".19", i32 %".22")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"hello\00"
@"str.1" = internal constant [24 x i8] c" %d \0a %s \0a %x \0a %d \0a %c\00"