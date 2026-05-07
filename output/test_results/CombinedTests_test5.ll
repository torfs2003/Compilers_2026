; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"pattern"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  %"i" = alloca i32
  %"j" = alloca i32
  %"space" = alloca i8
  store i8 32, i8* %"space"
  %"star" = alloca i8
  store i8 42, i8* %"star"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=1
  store i32 1, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".10" = icmp sle i32 %"i.2", %"n.1"
  %".11" = zext i1 %".10" to i32
  %"whilecond" = icmp ne i32 %".11", 0
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
  %".15" = mul i32 2, %"n.2"
  %".16" = icmp sle i32 %"j.2", %".15"
  %".17" = zext i1 %".16" to i32
  %"whilecond.1" = icmp ne i32 %".17", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.3" = load i32, i32* %"i"
  %"n.3" = load i32, i32* %"n"
  %"j.3" = load i32, i32* %"j"
  %".19" = sub i32 %"n.3", %"j.3"
  %".20" = add i32 %".19", 1
  %".21" = icmp sgt i32 %"i.3", %".20"
  %".22" = zext i1 %".21" to i32
  %"ifcond" = icmp ne i32 %".22", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end.1:
  %".44" = bitcast [4 x i8]* @"str.4" to i8*
  %"space.3" = load i8, i8* %"space"
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", i8 %"space.3")
  %"i.5" = load i32, i32* %"i"
  %".46" = load i32, i32* %"i"
  %".47" = add i32 %".46", 1
  store i32 %".47", i32* %"i"
  br label %"while.cond"
if.then:
  %".24" = bitcast [3 x i8]* @"str" to i8*
  %"space.1" = load i8, i8* %"space"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i8 %"space.1")
  br label %"if.end"
if.end:
  %"i.4" = load i32, i32* %"i"
  %"n.4" = load i32, i32* %"n"
  %".30" = add i32 %"i.4", %"n.4"
  %"j.4" = load i32, i32* %"j"
  %".31" = icmp sgt i32 %".30", %"j.4"
  %".32" = zext i1 %".31" to i32
  %"ifcond.1" = icmp ne i32 %".32", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.else:
  %".27" = bitcast [3 x i8]* @"str.1" to i8*
  %"star.1" = load i8, i8* %"star"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i8 %"star.1")
  br label %"if.end"
if.then.1:
  %".34" = bitcast [3 x i8]* @"str.2" to i8*
  %"space.2" = load i8, i8* %"space"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i8 %"space.2")
  br label %"if.end.1"
if.end.1:
  %"j.5" = load i32, i32* %"j"
  %".40" = load i32, i32* %"j"
  %".41" = add i32 %".40", 1
  store i32 %".41", i32* %"j"
  br label %"while.cond.1"
if.else.1:
  %".37" = bitcast [3 x i8]* @"str.3" to i8*
  %"star.2" = load i8, i8* %"star"
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".37", i8 %"star.2")
  br label %"if.end.1"
while.cond.2:
  %"i.7" = load i32, i32* %"i"
  %"n.5" = load i32, i32* %"n"
  %".54" = icmp sle i32 %"i.7", %"n.5"
  %".55" = zext i1 %".54" to i32
  %"whilecond.2" = icmp ne i32 %".55", 0
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
  %".59" = mul i32 2, %"n.6"
  %".60" = icmp sle i32 %"j.7", %".59"
  %".61" = zext i1 %".60" to i32
  %"whilecond.3" = icmp ne i32 %".61", 0
  br i1 %"whilecond.3", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"i.8" = load i32, i32* %"i"
  %"j.8" = load i32, i32* %"j"
  %".63" = icmp slt i32 %"i.8", %"j.8"
  %".64" = zext i1 %".63" to i32
  %"ifcond.2" = icmp ne i32 %".64", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.2"
while.end.3:
  %".87" = bitcast [4 x i8]* @"str.9" to i8*
  %"space.6" = load i8, i8* %"space"
  %".88" = call i32 (i8*, ...) @"printf"(i8* %".87", i8 %"space.6")
  %"i.10" = load i32, i32* %"i"
  %".89" = load i32, i32* %"i"
  %".90" = add i32 %".89", 1
  store i32 %".90", i32* %"i"
  br label %"while.cond.2"
if.then.2:
  %".66" = bitcast [3 x i8]* @"str.5" to i8*
  %"space.4" = load i8, i8* %"space"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66", i8 %"space.4")
  br label %"if.end.2"
if.end.2:
  %"i.9" = load i32, i32* %"i"
  %"n.7" = load i32, i32* %"n"
  %".72" = mul i32 2, %"n.7"
  %"j.9" = load i32, i32* %"j"
  %".73" = sub i32 %".72", %"j.9"
  %".74" = icmp sle i32 %"i.9", %".73"
  %".75" = zext i1 %".74" to i32
  %"ifcond.3" = icmp ne i32 %".75", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.3"
if.else.2:
  %".69" = bitcast [3 x i8]* @"str.6" to i8*
  %"star.3" = load i8, i8* %"star"
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".69", i8 %"star.3")
  br label %"if.end.2"
if.then.3:
  %".77" = bitcast [3 x i8]* @"str.7" to i8*
  %"space.5" = load i8, i8* %"space"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".77", i8 %"space.5")
  br label %"if.end.3"
if.end.3:
  %"j.10" = load i32, i32* %"j"
  %".83" = load i32, i32* %"j"
  %".84" = add i32 %".83", 1
  store i32 %".84", i32* %"j"
  br label %"while.cond.3"
if.else.3:
  %".80" = bitcast [3 x i8]* @"str.8" to i8*
  %"star.4" = load i8, i8* %"star"
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".80", i8 %"star.4")
  br label %"if.end.3"
}

define i32 @"main"()
{
entry:
  ;  Source: pattern(7);
  call void @"pattern"(i32 7)
  ;  Source: return0;
  ret i32 0
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