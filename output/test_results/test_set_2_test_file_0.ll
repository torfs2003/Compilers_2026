; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  %".2" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",5+5);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 10)
  %".5" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: printf("%f; ",4.5+5.5);
  %".7" = fpext float 0x4024000000000000 to double
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".7")
  %".9" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: printf("%d; ",15-5);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 10)
  %".12" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: printf("%f; ",10.5-0.5);
  %".14" = fpext float 0x4024000000000000 to double
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", double %".14")
  %".16" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: printf("%d; ",2*5);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 10)
  %".19" = bitcast [5 x i8]* @"str.5" to i8*
  ;  Source: printf("%f; ",20.0*0.5);
  %".21" = fpext float 0x4024000000000000 to double
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".19", double %".21")
  %".23" = bitcast [5 x i8]* @"str.6" to i8*
  ;  Source: printf("%d; ",20/2);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 10)
  %".26" = bitcast [5 x i8]* @"str.7" to i8*
  ;  Source: printf("%f; ",5.0/0.5);
  %".28" = fpext float 0x4024000000000000 to double
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", double %".28")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%f; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [5 x i8] c"%f; \00"
@"str.4" = internal constant [5 x i8] c"%d; \00"
@"str.5" = internal constant [5 x i8] c"%f; \00"
@"str.6" = internal constant [5 x i8] c"%d; \00"
@"str.7" = internal constant [5 x i8] c"%f; \00"