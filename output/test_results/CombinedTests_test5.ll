; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".48" = bitcast [4 x i8]* @"str.4" to i8*
  %"space.3" = load i8, i8* %"space"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", i8 %"space.3")
  %"i.5" = load i32, i32* %"i"
  %".50" = load i32, i32* %"i"
  %".51" = add i32 %".50", 1
  store i32 %".51", i32* %"i"
  br label %"while.cond"
if.then:
  %".28" = bitcast [3 x i8]* @"str" to i8*
  %"space.1" = load i8, i8* %"space"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", i8 %"space.1")
  br label %"if.end"
if.end:
  %"i.4" = load i32, i32* %"i"
  %"n.4" = load i32, i32* %"n"
  %".34" = add i32 %"i.4", %"n.4"
  %"j.4" = load i32, i32* %"j"
  %".35" = icmp sgt i32 %".34", %"j.4"
  %".36" = zext i1 %".35" to i32
  %"ifcond.1" = icmp ne i32 %".36", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.else:
  %".31" = bitcast [3 x i8]* @"str.1" to i8*
  %"star.1" = load i8, i8* %"star"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", i8 %"star.1")
  br label %"if.end"
if.then.1:
  %".38" = bitcast [3 x i8]* @"str.2" to i8*
  %"space.2" = load i8, i8* %"space"
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", i8 %"space.2")
  br label %"if.end.1"
if.end.1:
  %"j.5" = load i32, i32* %"j"
  %".44" = load i32, i32* %"j"
  %".45" = add i32 %".44", 1
  store i32 %".45", i32* %"j"
  br label %"while.cond.1"
if.else.1:
  %".41" = bitcast [3 x i8]* @"str.3" to i8*
  %"star.2" = load i8, i8* %"star"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".41", i8 %"star.2")
  br label %"if.end.1"
while.cond.2:
  %"i.7" = load i32, i32* %"i"
  %"n.5" = load i32, i32* %"n"
  %".58" = icmp sle i32 %"i.7", %"n.5"
  %".59" = zext i1 %".58" to i32
  %"whilecond.2" = icmp ne i32 %".59", 0
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
  %".63" = mul i32 2, %"n.6"
  %".64" = icmp sle i32 %"j.7", %".63"
  %".65" = zext i1 %".64" to i32
  %"whilecond.3" = icmp ne i32 %".65", 0
  br i1 %"whilecond.3", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"i.8" = load i32, i32* %"i"
  %"j.8" = load i32, i32* %"j"
  %".67" = icmp slt i32 %"i.8", %"j.8"
  %".68" = zext i1 %".67" to i32
  %"ifcond.2" = icmp ne i32 %".68", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.2"
while.end.3:
  %".91" = bitcast [4 x i8]* @"str.9" to i8*
  %"space.6" = load i8, i8* %"space"
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".91", i8 %"space.6")
  %"i.10" = load i32, i32* %"i"
  %".93" = load i32, i32* %"i"
  %".94" = add i32 %".93", 1
  store i32 %".94", i32* %"i"
  br label %"while.cond.2"
if.then.2:
  %".70" = bitcast [3 x i8]* @"str.5" to i8*
  %"space.4" = load i8, i8* %"space"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70", i8 %"space.4")
  br label %"if.end.2"
if.end.2:
  %"i.9" = load i32, i32* %"i"
  %"n.7" = load i32, i32* %"n"
  %".76" = mul i32 2, %"n.7"
  %"j.9" = load i32, i32* %"j"
  %".77" = sub i32 %".76", %"j.9"
  %".78" = icmp sle i32 %"i.9", %".77"
  %".79" = zext i1 %".78" to i32
  %"ifcond.3" = icmp ne i32 %".79", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.3"
if.else.2:
  %".73" = bitcast [3 x i8]* @"str.6" to i8*
  %"star.3" = load i8, i8* %"star"
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".73", i8 %"star.3")
  br label %"if.end.2"
if.then.3:
  %".81" = bitcast [3 x i8]* @"str.7" to i8*
  %"space.5" = load i8, i8* %"space"
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".81", i8 %"space.5")
  br label %"if.end.3"
if.end.3:
  %"j.10" = load i32, i32* %"j"
  %".87" = load i32, i32* %"j"
  %".88" = add i32 %".87", 1
  store i32 %".88", i32* %"j"
  br label %"while.cond.3"
if.else.3:
  %".84" = bitcast [3 x i8]* @"str.8" to i8*
  %"star.4" = load i8, i8* %"star"
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".84", i8 %"star.4")
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
