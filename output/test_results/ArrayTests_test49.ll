; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"b" = alloca [2 x i32]
  %".2" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 1
  store i32 2, i32* %".4"
  %"a" = alloca [4 x i32]
  %".6" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".6"
  %".8" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".8"
  %".10" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".10"
  %".12" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".12"
  %"e" = alloca i32
  %"sb" = alloca i32*
  %".14" = bitcast [2 x i32]* %"b" to i32*
  store i32* %".14", i32** %"sb"
  %"sa" = alloca i32*
  %".16" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".16", i32** %"sa"
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: a
  ;  Source: b
  ;  Source: a||b
  %".22" = icmp ne [4 x i32]* %"a", 0
  %".23" = icmp ne [2 x i32]* %"b", 0
  %".24" = or i1 %".22", %".23"
  %".25" = zext i1 %".24" to i32
  ;  Source: e=a||b;
  store i32 %".25", i32* %"e"
  %".28" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e
  %"e_load.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"e_load.1")
  ;  Source: e
  %"e_load.2" = load i32, i32* %"e"
  ;  Source: sb
  %"sb_load" = load i32*, i32** %"sb"
  ;  Source: sa
  %"sa_load" = load i32*, i32** %"sa"
  ;  Source: sb||sa
  %".36" = icmp ne i32* %"sb_load", 0
  %".37" = icmp ne i32* %"sa_load", 0
  %".38" = or i1 %".36", %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: e=sb||sa;
  store i32 %".39", i32* %"e"
  %".42" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e_load.3" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"e_load.3")
  ;  Source: e
  %"e_load.4" = load i32, i32* %"e"
  ;  Source: a
  ;  Source: !a
  %".49" = icmp eq [4 x i32]* %"a", 0
  %".50" = zext i1 %".49" to i32
  ;  Source: e=!a;
  store i32 %".50", i32* %"e"
  %".53" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e_load.5" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %"e_load.5")
  ;  Source: e
  %"e_load.6" = load i32, i32* %"e"
  ;  Source: sb
  %"sb_load.1" = load i32*, i32** %"sb"
  ;  Source: !sb
  %".60" = icmp eq i32* %"sb_load.1", 0
  %".61" = zext i1 %".60" to i32
  ;  Source: e=!sb;
  store i32 %".61", i32* %"e"
  %".64" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: e
  %"e_load.7" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".64", i32 %"e_load.7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"