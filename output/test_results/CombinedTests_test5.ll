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
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=1
  store i32 1, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %"n_load" = load i32, i32* %"n"
  %".10" = icmp sle i32 %"i_load.1", %"n_load"
  %".11" = zext i1 %".10" to i32
  %"whilecond" = icmp ne i32 %".11", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"j_load" = load i32, i32* %"j"
  store i32 1, i32* %"j"
  br label %"while.cond.1"
while.end:
  ;  Source: i
  %"i_load.5" = load i32, i32* %"i"
  ;  Source: i=1
  store i32 1, i32* %"i"
  br label %"while.cond.2"
while.cond.1:
  %"j_load.1" = load i32, i32* %"j"
  %"n_load.1" = load i32, i32* %"n"
  %".15" = mul i32 2, %"n_load.1"
  %".16" = icmp sle i32 %"j_load.1", %".15"
  %".17" = zext i1 %".16" to i32
  %"whilecond.1" = icmp ne i32 %".17", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i_load.2" = load i32, i32* %"i"
  %"n_load.2" = load i32, i32* %"n"
  %"j_load.2" = load i32, i32* %"j"
  %".19" = sub i32 %"n_load.2", %"j_load.2"
  %".20" = add i32 %".19", 1
  %".21" = icmp sgt i32 %"i_load.2", %".20"
  %".22" = zext i1 %".21" to i32
  %"ifcond" = icmp ne i32 %".22", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end.1:
  %".48" = bitcast [4 x i8]* @"str.4" to i8*
  %"space_load.2" = load i8, i8* %"space"
  %".49" = sext i8 %"space_load.2" to i32
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".49")
  %"i_load.4" = load i32, i32* %"i"
  %".51" = load i32, i32* %"i"
  %".52" = add i32 %".51", 1
  store i32 %".52", i32* %"i"
  br label %"while.cond"
if.then:
  %".24" = bitcast [3 x i8]* @"str" to i8*
  %"space_load" = load i8, i8* %"space"
  %".25" = sext i8 %"space_load" to i32
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".25")
  br label %"if.end"
if.end:
  %"i_load.3" = load i32, i32* %"i"
  %"n_load.3" = load i32, i32* %"n"
  %".32" = add i32 %"i_load.3", %"n_load.3"
  %"j_load.3" = load i32, i32* %"j"
  %".33" = icmp sgt i32 %".32", %"j_load.3"
  %".34" = zext i1 %".33" to i32
  %"ifcond.1" = icmp ne i32 %".34", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.else:
  %".28" = bitcast [3 x i8]* @"str.1" to i8*
  %"star_load" = load i8, i8* %"star"
  %".29" = sext i8 %"star_load" to i32
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".29")
  br label %"if.end"
if.then.1:
  %".36" = bitcast [3 x i8]* @"str.2" to i8*
  %"space_load.1" = load i8, i8* %"space"
  %".37" = sext i8 %"space_load.1" to i32
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".37")
  br label %"if.end.1"
if.end.1:
  %"j_load.4" = load i32, i32* %"j"
  %".44" = load i32, i32* %"j"
  %".45" = add i32 %".44", 1
  store i32 %".45", i32* %"j"
  br label %"while.cond.1"
if.else.1:
  %".40" = bitcast [3 x i8]* @"str.3" to i8*
  %"star_load.1" = load i8, i8* %"star"
  %".41" = sext i8 %"star_load.1" to i32
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".41")
  br label %"if.end.1"
while.cond.2:
  %"i_load.6" = load i32, i32* %"i"
  %"n_load.4" = load i32, i32* %"n"
  %".59" = icmp sle i32 %"i_load.6", %"n_load.4"
  %".60" = zext i1 %".59" to i32
  %"whilecond.2" = icmp ne i32 %".60", 0
  br i1 %"whilecond.2", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"j_load.5" = load i32, i32* %"j"
  store i32 1, i32* %"j"
  br label %"while.cond.3"
while.end.2:
  ret void
while.cond.3:
  %"j_load.6" = load i32, i32* %"j"
  %"n_load.5" = load i32, i32* %"n"
  %".64" = mul i32 2, %"n_load.5"
  %".65" = icmp sle i32 %"j_load.6", %".64"
  %".66" = zext i1 %".65" to i32
  %"whilecond.3" = icmp ne i32 %".66", 0
  br i1 %"whilecond.3", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"i_load.7" = load i32, i32* %"i"
  %"j_load.7" = load i32, i32* %"j"
  %".68" = icmp slt i32 %"i_load.7", %"j_load.7"
  %".69" = zext i1 %".68" to i32
  %"ifcond.2" = icmp ne i32 %".69", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.2"
while.end.3:
  %".96" = bitcast [4 x i8]* @"str.9" to i8*
  %"space_load.5" = load i8, i8* %"space"
  %".97" = sext i8 %"space_load.5" to i32
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".96", i32 %".97")
  %"i_load.9" = load i32, i32* %"i"
  %".99" = load i32, i32* %"i"
  %".100" = add i32 %".99", 1
  store i32 %".100", i32* %"i"
  br label %"while.cond.2"
if.then.2:
  %".71" = bitcast [3 x i8]* @"str.5" to i8*
  %"space_load.3" = load i8, i8* %"space"
  %".72" = sext i8 %"space_load.3" to i32
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".71", i32 %".72")
  br label %"if.end.2"
if.end.2:
  %"i_load.8" = load i32, i32* %"i"
  %"n_load.6" = load i32, i32* %"n"
  %".79" = mul i32 2, %"n_load.6"
  %"j_load.8" = load i32, i32* %"j"
  %".80" = sub i32 %".79", %"j_load.8"
  %".81" = icmp sle i32 %"i_load.8", %".80"
  %".82" = zext i1 %".81" to i32
  %"ifcond.3" = icmp ne i32 %".82", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.3"
if.else.2:
  %".75" = bitcast [3 x i8]* @"str.6" to i8*
  %"star_load.2" = load i8, i8* %"star"
  %".76" = sext i8 %"star_load.2" to i32
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".76")
  br label %"if.end.2"
if.then.3:
  %".84" = bitcast [3 x i8]* @"str.7" to i8*
  %"space_load.4" = load i8, i8* %"space"
  %".85" = sext i8 %"space_load.4" to i32
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %".85")
  br label %"if.end.3"
if.end.3:
  %"j_load.9" = load i32, i32* %"j"
  %".92" = load i32, i32* %"j"
  %".93" = add i32 %".92", 1
  store i32 %".93", i32* %"j"
  br label %"while.cond.3"
if.else.3:
  %".88" = bitcast [3 x i8]* @"str.8" to i8*
  %"star_load.3" = load i8, i8* %"star"
  %".89" = sext i8 %"star_load.3" to i32
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".88", i32 %".89")
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