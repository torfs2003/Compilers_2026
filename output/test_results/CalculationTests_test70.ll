; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca float
  store float 0x4014000000000000, float* %"a"
  %".3" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: (int)a
  %".6" = fptosi float %"a.1" to i32
  ;  Source: printf("%d\n",(int)a);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %".10" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"b.1")
  %"c" = alloca i8
  store i8 101, i8* %"c"
  %".15" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c\n",c);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i8 %"c.1")
  %"d" = alloca float
  store float 0x4024051ec0000000, float* %"d"
  %".20" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: (int)d
  %".23" = fptosi float %"d.1" to i32
  ;  Source: printf("%d\n",(int)d);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  %"e" = alloca i32
  store i32 2, i32* %"e"
  %".27" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d\n",e);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"e.1")
  %"f" = alloca i8
  store i8 98, i8* %"f"
  %".32" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c\n",c);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i8 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%c\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
@"str.4" = internal constant [4 x i8] c"%d\0a\00"
@"str.5" = internal constant [4 x i8] c"%c\0a\00"