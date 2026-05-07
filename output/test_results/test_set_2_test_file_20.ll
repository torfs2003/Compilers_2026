; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca [5 x i8]
  %".2" = bitcast [28 x i8]* @"str" to i8*
  ;  Source: printf("Enter a 5-character string:");
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2")
  %".5" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: a
  ;  Source: &a
  ;  Source: scanf("%5s",&a);
  %".9" = getelementptr inbounds [5 x i8], [5 x i8]* %"a", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"scanf"(i8* %".5", i8* %".9")
  %".11" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  ;  Source: printf("%s",a);
  %".14" = getelementptr inbounds [5 x i8], [5 x i8]* %"a", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".14")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [28 x i8] c"Enter a 5-character string:\00"
@"str.1" = internal constant [4 x i8] c"%5s\00"
@"str.2" = internal constant [3 x i8] c"%s\00"