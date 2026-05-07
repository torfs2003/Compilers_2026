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
  %"nl" = alloca i8
  ;  Source: charnl='\n';
  store i8 10, i8* %"nl"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: printf("%c",nl);
  %".7" = zext i8 %"nl.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"tab" = alloca i8
  ;  Source: chartab='\t';
  store i8 9, i8* %"tab"
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: tab
  %"tab.1" = load i8, i8* %"tab"
  ;  Source: printf("%c",tab);
  %".14" = zext i8 %"tab.1" to i32
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  %"character_null" = alloca i8
  ;  Source: charcharacter_null='\0';
  store i8 0, i8* %"character_null"
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: character_null
  %"character_null.1" = load i8, i8* %"character_null"
  ;  Source: printf("%c",character_null);
  %".21" = zext i8 %"character_null.1" to i32
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"