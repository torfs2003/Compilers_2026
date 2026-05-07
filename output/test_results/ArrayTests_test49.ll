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
  %"b" = alloca [2 x i32]
  ;  Source: intb[2]={1,2};
  %".3" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 1
  store i32 2, i32* %".5"
  %"a" = alloca [4 x i32]
  ;  Source: inta[4]={1,2,3,4};
  %".8" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".8"
  %".10" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".10"
  %".12" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".12"
  %".14" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".14"
  %"e" = alloca i32
  ;  Source: inte;
  %"sb" = alloca i32*
  ;  Source: b
  ;  Source: int*sb=b;
  %".19" = bitcast [2 x i32]* %"b" to i32*
  store i32* %".19", i32** %"sb"
  %"sa" = alloca i32*
  ;  Source: a
  ;  Source: int*sa=a;
  %".23" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".23", i32** %"sa"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: a
  ;  Source: b
  ;  Source: a||b
  %"decay_left" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  %"decay_right" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 0
  %".29" = ptrtoint i32* %"decay_left" to i32
  %".30" = ptrtoint i32* %"decay_right" to i32
  %".31" = icmp ne i32 %".29", 0
  %".32" = icmp ne i32 %".30", 0
  %".33" = or i1 %".31", %".32"
  %".34" = zext i1 %".33" to i32
  ;  Source: e=a||b;
  store i32 %".34", i32* %"e"
  %".37" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"e.2")
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: sb
  %"sb.1" = load i32*, i32** %"sb"
  ;  Source: sa
  %"sa.1" = load i32*, i32** %"sa"
  ;  Source: sb||sa
  %".45" = ptrtoint i32* %"sb.1" to i32
  %".46" = ptrtoint i32* %"sa.1" to i32
  %".47" = icmp ne i32 %".45", 0
  %".48" = icmp ne i32 %".46", 0
  %".49" = or i1 %".47", %".48"
  %".50" = zext i1 %".49" to i32
  ;  Source: e=sb||sa;
  store i32 %".50", i32* %"e"
  %".53" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %"e.4")
  ;  Source: e
  %"e.5" = load i32, i32* %"e"
  ;  Source: a
  ;  Source: !a
  %"unary_decay" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  %".60" = icmp eq i32* %"unary_decay", null
  %".61" = zext i1 %".60" to i32
  ;  Source: e=!a;
  store i32 %".61", i32* %"e"
  %".64" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e.6" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".64", i32 %"e.6")
  ;  Source: e
  %"e.7" = load i32, i32* %"e"
  ;  Source: sb
  %"sb.2" = load i32*, i32** %"sb"
  ;  Source: !sb
  %".71" = icmp eq i32* %"sb.2", null
  %".72" = zext i1 %".71" to i32
  ;  Source: e=!sb;
  store i32 %".72", i32* %"e"
  %".75" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %"e.8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"