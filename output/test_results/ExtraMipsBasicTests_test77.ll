; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca i8*
  %".2" = bitcast [5 x i8]* @"str" to i8*
  store i8* %".2", i8** %"c"
  %".4" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  ;  Source: *c
  %"deref_load" = load i8, i8* %"c.1"
  ;  Source: printf("%c",*c);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %"deref_load")
  %".9" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.2" = load i8*, i8** %"c"
  ;  Source: (c+1)
  %".12" = getelementptr i8, i8* %"c.2", i32 1
  ;  Source: *(c+1)
  %"deref_load.1" = load i8, i8* %".12"
  ;  Source: printf("%c",*(c+1));
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"llla\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"