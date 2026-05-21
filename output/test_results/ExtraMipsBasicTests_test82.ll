; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"equal"(i8* %".1", i8* %".2")
{
entry:
  %"a" = alloca i8*
  store i8* %".1", i8** %"a"
  %"b" = alloca i8*
  store i8* %".2", i8** %"b"
  %"index" = alloca i32
  store i32 0, i32* %"index"
  ;  Source: while(1){chara_char=*(a+index);charb_char=*(b+index);if(a_char=='\0'&&b_char=='\0'){return1;}if(a_char=='\0'||b_char=='\0'){return0;}if(a_char!=b_char){return0;}index++;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a_char" = alloca i8
  %"a.1" = load i8*, i8** %"a"
  %"index.1" = load i32, i32* %"index"
  %".10" = getelementptr i8, i8* %"a.1", i32 %"index.1"
  %"deref_load" = load i8, i8* %".10"
  store i8 %"deref_load", i8* %"a_char"
  %"b_char" = alloca i8
  %"b.1" = load i8*, i8** %"b"
  %"index.2" = load i32, i32* %"index"
  %".12" = getelementptr i8, i8* %"b.1", i32 %"index.2"
  %"deref_load.1" = load i8, i8* %".12"
  store i8 %"deref_load.1", i8* %"b_char"
  %"a_char.1" = load i8, i8* %"a_char"
  %".14" = icmp eq i8 %"a_char.1", 0
  %".15" = zext i1 %".14" to i32
  %"b_char.1" = load i8, i8* %"b_char"
  %".16" = icmp eq i8 %"b_char.1", 0
  %".17" = zext i1 %".16" to i32
  %".18" = icmp ne i32 %".15", 0
  %".19" = icmp ne i32 %".17", 0
  %".20" = and i1 %".18", %".19"
  %".21" = zext i1 %".20" to i32
  %"ifcond" = icmp ne i32 %".21", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ret i32 0
if.then:
  ret i32 1
if.end:
  %"a_char.2" = load i8, i8* %"a_char"
  %".24" = icmp eq i8 %"a_char.2", 0
  %".25" = zext i1 %".24" to i32
  %"b_char.2" = load i8, i8* %"b_char"
  %".26" = icmp eq i8 %"b_char.2", 0
  %".27" = zext i1 %".26" to i32
  %".28" = icmp ne i32 %".25", 0
  %".29" = icmp ne i32 %".27", 0
  %".30" = or i1 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  %"ifcond.1" = icmp ne i32 %".31", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  ret i32 0
if.end.1:
  %"a_char.3" = load i8, i8* %"a_char"
  %"b_char.3" = load i8, i8* %"b_char"
  %".34" = icmp ne i8 %"a_char.3", %"b_char.3"
  %".35" = zext i1 %".34" to i32
  %"ifcond.2" = icmp ne i32 %".35", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.2:
  ret i32 0
if.end.2:
  %"index.3" = load i32, i32* %"index"
  %".38" = load i32, i32* %"index"
  %".39" = add i32 %".38", 1
  store i32 %".39", i32* %"index"
  br label %"while.cond"
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = bitcast [4 x i8]* @"str.1" to i8*
  %".4" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: equal("aaa","aa")
  %".6" = call i32 @"equal"(i8* %".3", i8* %".4")
  ;  Source: printf("%d",equal("aaa","aa"));
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".6")
  %".9" = bitcast [3 x i8]* @"str.3" to i8*
  %".10" = bitcast [4 x i8]* @"str.4" to i8*
  %".11" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: equal("aaa","abb")
  %".13" = call i32 @"equal"(i8* %".10", i8* %".11")
  ;  Source: printf("%d",equal("aaa","abb"));
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".13")
  %".16" = bitcast [3 x i8]* @"str.6" to i8*
  %".17" = bitcast [4 x i8]* @"str.7" to i8*
  %".18" = bitcast [4 x i8]* @"str.8" to i8*
  ;  Source: equal("aaa","aaa")
  %".20" = call i32 @"equal"(i8* %".17", i8* %".18")
  ;  Source: printf("%d",equal("aaa","aaa"));
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".20")
  %".23" = bitcast [3 x i8]* @"str.9" to i8*
  %".24" = bitcast [4 x i8]* @"str.10" to i8*
  %".25" = bitcast [1 x i8]* @"str.11" to i8*
  ;  Source: equal("aaa","")
  %".27" = call i32 @"equal"(i8* %".24", i8* %".25")
  ;  Source: printf("%d",equal("aaa",""));
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".27")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [4 x i8] c"aaa\00"
@"str.2" = internal constant [3 x i8] c"aa\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [4 x i8] c"aaa\00"
@"str.5" = internal constant [4 x i8] c"abb\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [4 x i8] c"aaa\00"
@"str.8" = internal constant [4 x i8] c"aaa\00"
@"str.9" = internal constant [3 x i8] c"%d\00"
@"str.10" = internal constant [4 x i8] c"aaa\00"
@"str.11" = internal constant [1 x i8] c"\00"