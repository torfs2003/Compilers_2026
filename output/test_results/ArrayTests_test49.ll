; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

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
  %".29" = icmp ne i32* %"decay_left", null
  %".30" = icmp ne i32* %"decay_right", null
  %".31" = or i1 %".29", %".30"
  %".32" = zext i1 %".31" to i32
  ;  Source: e=a||b;
  store i32 %".32", i32* %"e"
  %".35" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"e.2")
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: sb
  %"sb.1" = load i32*, i32** %"sb"
  ;  Source: sa
  %"sa.1" = load i32*, i32** %"sa"
  ;  Source: sb||sa
  %".43" = icmp ne i32* %"sb.1", null
  %".44" = icmp ne i32* %"sa.1", null
  %".45" = or i1 %".43", %".44"
  %".46" = zext i1 %".45" to i32
  ;  Source: e=sb||sa;
  store i32 %".46", i32* %"e"
  %".49" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"e.4")
  ;  Source: e
  %"e.5" = load i32, i32* %"e"
  ;  Source: a
  ;  Source: !a
  %"unary_decay" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  %".56" = icmp eq i32* %"unary_decay", null
  %".57" = zext i1 %".56" to i32
  ;  Source: e=!a;
  store i32 %".57", i32* %"e"
  %".60" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: e
  %"e.6" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %"e.6")
  ;  Source: e
  %"e.7" = load i32, i32* %"e"
  ;  Source: sb
  %"sb.2" = load i32*, i32** %"sb"
  ;  Source: !sb
  %".67" = icmp eq i32* %"sb.2", null
  %".68" = zext i1 %".67" to i32
  ;  Source: e=!sb;
  store i32 %".68", i32* %"e"
  %".71" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".71", i32 %"e.8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"