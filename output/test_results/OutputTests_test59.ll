; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=50;
  store i32 50, i32* %"a"
  %"b" = alloca i32
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a+10
  %".6" = add i32 %"a.1", 10
  ;  Source: intb=a+10;
  store i32 %".6", i32* %"b"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: a+20
  %".11" = add i32 %"a.2", 20
  ;  Source: intb=a+20;
  store i32 %".11", i32* %"b"
  %".14" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"b.1")
  %".18" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: printf("%d\n",b);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"b.2")
  %".22" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d\n",a);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"a.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"