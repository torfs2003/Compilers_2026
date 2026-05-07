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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  ;  Source: intn;
  %"i" = alloca i32
  ;  Source: inti=3;
  store i32 3, i32* %"i"
  %"count" = alloca i32
  ;  Source: intcount;
  %"c" = alloca i32
  ;  Source: intc;
  %".7" = bitcast [44 x i8]* @"str" to i8*
  ;  Source: printf("Enter the number of prime numbers required\n");
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".7")
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: n=5;
  store i32 5, i32* %"n"
  ;  Source: if(n>=1){printf("First %d prime numbers are :\n",n);printf("2\n");}
  %"n.2" = load i32, i32* %"n"
  %".14" = icmp sge i32 %"n.2", 1
  %".15" = zext i1 %".14" to i32
  %"ifcond" = icmp ne i32 %".15", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".17" = bitcast [30 x i8]* @"str.1" to i8*
  %"n.3" = load i32, i32* %"n"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"n.3")
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19")
  br label %"if.end"
if.end:
  ;  Source: count
  %"count.1" = load i32, i32* %"count"
  ;  Source: count=2;
  store i32 2, i32* %"count"
  ;  Source: while(count<=n){c=2;while(c<=i-1){if(i%c==0){break;}c++;}if(c==i){printf("%d\n",i);count++;}i++;}
  br label %"while.cond"
while.cond:
  %"count.2" = load i32, i32* %"count"
  %"n.4" = load i32, i32* %"n"
  %".27" = icmp sle i32 %"count.2", %"n.4"
  %".28" = zext i1 %".27" to i32
  %"whilecond" = icmp ne i32 %".28", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"c.1" = load i32, i32* %"c"
  store i32 2, i32* %"c"
  br label %"while.cond.1"
while.end:
  ;  Source: return0;
  ret i32 0
while.cond.1:
  %"c.2" = load i32, i32* %"c"
  %"i.1" = load i32, i32* %"i"
  %".32" = sub i32 %"i.1", 1
  %".33" = icmp sle i32 %"c.2", %".32"
  %".34" = zext i1 %".33" to i32
  %"whilecond.1" = icmp ne i32 %".34", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i32, i32* %"i"
  %"c.3" = load i32, i32* %"c"
  %".36" = srem i32 %"i.2", %"c.3"
  %".37" = icmp eq i32 %".36", 0
  %".38" = zext i1 %".37" to i32
  %"ifcond.1" = icmp ne i32 %".38", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
while.end.1:
  %"c.5" = load i32, i32* %"c"
  %"i.3" = load i32, i32* %"i"
  %".45" = icmp eq i32 %"c.5", %"i.3"
  %".46" = zext i1 %".45" to i32
  %"ifcond.2" = icmp ne i32 %".46", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.1:
  br label %"while.end.1"
if.end.1:
  %"c.4" = load i32, i32* %"c"
  %".41" = load i32, i32* %"c"
  %".42" = add i32 %".41", 1
  store i32 %".42", i32* %"c"
  br label %"while.cond.1"
if.then.2:
  %".48" = bitcast [4 x i8]* @"str.3" to i8*
  %"i.4" = load i32, i32* %"i"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"i.4")
  %"count.3" = load i32, i32* %"count"
  %".50" = load i32, i32* %"count"
  %".51" = add i32 %".50", 1
  store i32 %".51", i32* %"count"
  br label %"if.end.2"
if.end.2:
  %"i.5" = load i32, i32* %"i"
  %".54" = load i32, i32* %"i"
  %".55" = add i32 %".54", 1
  store i32 %".55", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [44 x i8] c"Enter the number of prime numbers required\0a\00"
@"str.1" = internal constant [30 x i8] c"First %d prime numbers are :\0a\00"
@"str.2" = internal constant [3 x i8] c"2\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"