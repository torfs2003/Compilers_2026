; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 53, i8* %"a"
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: a='\0';
  store i8 0, i8* %"a"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: a=='\0'
  %".9" = icmp eq i8 %"a.2", 0
  %".10" = zext i1 %".9" to i32
  ;  Source: printf("%d",a=='\0');
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".10")
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: a!='\0'
  %".16" = icmp ne i8 %"a.3", 0
  %".17" = zext i1 %".16" to i32
  ;  Source: printf("%d",a!='\0');
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"