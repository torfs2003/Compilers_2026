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
  %"x" = alloca i8
  ;  Source: charx='x';
  store i8 120, i8* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: printf("%c",x);
  %".7" = zext i8 %"x.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"dot" = alloca i8
  ;  Source: chardot='.';
  store i8 46, i8* %"dot"
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: dot
  %"dot.1" = load i8, i8* %"dot"
  ;  Source: printf("%c",dot);
  %".14" = zext i8 %"dot.1" to i32
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  %"nl" = alloca i8
  ;  Source: charnl='\n';
  store i8 10, i8* %"nl"
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: printf("%c",nl);
  %".21" = zext i8 %"nl.1" to i32
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  %"tab" = alloca i8
  ;  Source: chartab='\t';
  store i8 9, i8* %"tab"
  %".25" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: tab
  %"tab.1" = load i8, i8* %"tab"
  ;  Source: printf("%c",tab);
  %".28" = zext i8 %"tab.1" to i32
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  %"character_null" = alloca i8
  ;  Source: charcharacter_null='\0';
  store i8 0, i8* %"character_null"
  %".32" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: character_null
  %"character_null.1" = load i8, i8* %"character_null"
  ;  Source: printf("%c",character_null);
  %".35" = zext i8 %"character_null.1" to i32
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"