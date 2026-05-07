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

define void @"pattern"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"i" = alloca i32
  ;  Source: inti;
  %"j" = alloca i32
  ;  Source: intj;
  %"space" = alloca i8
  ;  Source: charspace=' ';
  store i8 32, i8* %"space"
  %"star" = alloca i8
  ;  Source: charstar='*';
  store i8 42, i8* %"star"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=1
  store i32 1, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".14" = icmp sle i32 %"i.2", %"n.1"
  %".15" = zext i1 %".14" to i32
  %"whilecond" = icmp ne i32 %".15", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"j.1" = load i32, i32* %"j"
  store i32 1, i32* %"j"
  br label %"while.cond.1"
while.end:
  ;  Source: i
  %"i.6" = load i32, i32* %"i"
  ;  Source: i=1
  store i32 1, i32* %"i"
  br label %"while.cond.2"
while.cond.1:
  %"j.2" = load i32, i32* %"j"
  %"n.2" = load i32, i32* %"n"
  %".19" = mul i32 2, %"n.2"
  %".20" = icmp sle i32 %"j.2", %".19"
  %".21" = zext i1 %".20" to i32
  %"whilecond.1" = icmp ne i32 %".21", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.3" = load i32, i32* %"i"
  %"n.3" = load i32, i32* %"n"
  %"j.3" = load i32, i32* %"j"
  %".23" = sub i32 %"n.3", %"j.3"
  %".24" = add i32 %".23", 1
  %".25" = icmp sgt i32 %"i.3", %".24"
  %".26" = zext i1 %".25" to i32
  %"ifcond" = icmp ne i32 %".26", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end.1:
  %".52" = bitcast [4 x i8]* @"str.4" to i8*
  %"space.3" = load i8, i8* %"space"
  %".53" = zext i8 %"space.3" to i32
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".53")
  %"i.5" = load i32, i32* %"i"
  %".55" = load i32, i32* %"i"
  %".56" = add i32 %".55", 1
  store i32 %".56", i32* %"i"
  br label %"while.cond"
if.then:
  %".28" = bitcast [3 x i8]* @"str" to i8*
  %"space.1" = load i8, i8* %"space"
  %".29" = zext i8 %"space.1" to i32
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".29")
  br label %"if.end"
if.end:
  %"i.4" = load i32, i32* %"i"
  %"n.4" = load i32, i32* %"n"
  %".36" = add i32 %"i.4", %"n.4"
  %"j.4" = load i32, i32* %"j"
  %".37" = icmp sgt i32 %".36", %"j.4"
  %".38" = zext i1 %".37" to i32
  %"ifcond.1" = icmp ne i32 %".38", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.else:
  %".32" = bitcast [3 x i8]* @"str.1" to i8*
  %"star.1" = load i8, i8* %"star"
  %".33" = zext i8 %"star.1" to i32
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".33")
  br label %"if.end"
if.then.1:
  %".40" = bitcast [3 x i8]* @"str.2" to i8*
  %"space.2" = load i8, i8* %"space"
  %".41" = zext i8 %"space.2" to i32
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".41")
  br label %"if.end.1"
if.end.1:
  %"j.5" = load i32, i32* %"j"
  %".48" = load i32, i32* %"j"
  %".49" = add i32 %".48", 1
  store i32 %".49", i32* %"j"
  br label %"while.cond.1"
if.else.1:
  %".44" = bitcast [3 x i8]* @"str.3" to i8*
  %"star.2" = load i8, i8* %"star"
  %".45" = zext i8 %"star.2" to i32
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".45")
  br label %"if.end.1"
while.cond.2:
  %"i.7" = load i32, i32* %"i"
  %"n.5" = load i32, i32* %"n"
  %".63" = icmp sle i32 %"i.7", %"n.5"
  %".64" = zext i1 %".63" to i32
  %"whilecond.2" = icmp ne i32 %".64", 0
  br i1 %"whilecond.2", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"j.6" = load i32, i32* %"j"
  store i32 1, i32* %"j"
  br label %"while.cond.3"
while.end.2:
  ret void
while.cond.3:
  %"j.7" = load i32, i32* %"j"
  %"n.6" = load i32, i32* %"n"
  %".68" = mul i32 2, %"n.6"
  %".69" = icmp sle i32 %"j.7", %".68"
  %".70" = zext i1 %".69" to i32
  %"whilecond.3" = icmp ne i32 %".70", 0
  br i1 %"whilecond.3", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"i.8" = load i32, i32* %"i"
  %"j.8" = load i32, i32* %"j"
  %".72" = icmp slt i32 %"i.8", %"j.8"
  %".73" = zext i1 %".72" to i32
  %"ifcond.2" = icmp ne i32 %".73", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.2"
while.end.3:
  %".100" = bitcast [4 x i8]* @"str.9" to i8*
  %"space.6" = load i8, i8* %"space"
  %".101" = zext i8 %"space.6" to i32
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".100", i32 %".101")
  %"i.10" = load i32, i32* %"i"
  %".103" = load i32, i32* %"i"
  %".104" = add i32 %".103", 1
  store i32 %".104", i32* %"i"
  br label %"while.cond.2"
if.then.2:
  %".75" = bitcast [3 x i8]* @"str.5" to i8*
  %"space.4" = load i8, i8* %"space"
  %".76" = zext i8 %"space.4" to i32
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".76")
  br label %"if.end.2"
if.end.2:
  %"i.9" = load i32, i32* %"i"
  %"n.7" = load i32, i32* %"n"
  %".83" = mul i32 2, %"n.7"
  %"j.9" = load i32, i32* %"j"
  %".84" = sub i32 %".83", %"j.9"
  %".85" = icmp sle i32 %"i.9", %".84"
  %".86" = zext i1 %".85" to i32
  %"ifcond.3" = icmp ne i32 %".86", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.3"
if.else.2:
  %".79" = bitcast [3 x i8]* @"str.6" to i8*
  %"star.3" = load i8, i8* %"star"
  %".80" = zext i8 %"star.3" to i32
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %".80")
  br label %"if.end.2"
if.then.3:
  %".88" = bitcast [3 x i8]* @"str.7" to i8*
  %"space.5" = load i8, i8* %"space"
  %".89" = zext i8 %"space.5" to i32
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".88", i32 %".89")
  br label %"if.end.3"
if.end.3:
  %"j.10" = load i32, i32* %"j"
  %".96" = load i32, i32* %"j"
  %".97" = add i32 %".96", 1
  store i32 %".97", i32* %"j"
  br label %"while.cond.3"
if.else.3:
  %".92" = bitcast [3 x i8]* @"str.8" to i8*
  %"star.4" = load i8, i8* %"star"
  %".93" = zext i8 %"star.4" to i32
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %".93")
  br label %"if.end.3"
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [4 x i8] c"%c\0a\00"
@"str.5" = internal constant [3 x i8] c"%c\00"
@"str.6" = internal constant [3 x i8] c"%c\00"
@"str.7" = internal constant [3 x i8] c"%c\00"
@"str.8" = internal constant [3 x i8] c"%c\00"
@"str.9" = internal constant [4 x i8] c"%c\0a\00"
define i32 @"main"()
{
entry:
  ;  Source: pattern(7);
  call void @"pattern"(i32 7)
  ;  Source: return0;
  ret i32 0
}
