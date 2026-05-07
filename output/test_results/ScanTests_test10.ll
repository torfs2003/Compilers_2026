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
  %"n" = alloca i32
  ;  Source: intn;
  %"count" = alloca i32
  ;  Source: intcount;
  %"c" = alloca i32
  ;  Source: intc;
  %"i" = alloca i32
  ;  Source: inti=3;
  store i32 3, i32* %"i"
  %".7" = bitcast [44 x i8]* @"str" to i8*
  ;  Source: printf("Enter the number of prime numbers required\n");
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".7")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: &n
  ;  Source: scanf("%d",&n);
  %".14" = call i32 (i8*, ...) @"scanf"(i8* %".10", i32* %"n")
  ;  Source: if(n>=1){printf("First %d prime numbers are :\n",n);printf("2\n");}
  %"n.2" = load i32, i32* %"n"
  %".16" = icmp sge i32 %"n.2", 1
  %".17" = zext i1 %".16" to i32
  %"ifcond" = icmp ne i32 %".17", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".19" = bitcast [30 x i8]* @"str.2" to i8*
  %"n.3" = load i32, i32* %"n"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"n.3")
  %".21" = bitcast [3 x i8]* @"str.3" to i8*
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21")
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
  %".29" = icmp sle i32 %"count.2", %"n.4"
  %".30" = zext i1 %".29" to i32
  %"whilecond" = icmp ne i32 %".30", 0
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
  %".34" = sub i32 %"i.1", 1
  %".35" = icmp sle i32 %"c.2", %".34"
  %".36" = zext i1 %".35" to i32
  %"whilecond.1" = icmp ne i32 %".36", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i32, i32* %"i"
  %"c.3" = load i32, i32* %"c"
  %".38" = srem i32 %"i.2", %"c.3"
  %".39" = icmp eq i32 %".38", 0
  %".40" = zext i1 %".39" to i32
  %"ifcond.1" = icmp ne i32 %".40", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
while.end.1:
  %"c.5" = load i32, i32* %"c"
  %"i.3" = load i32, i32* %"i"
  %".47" = icmp eq i32 %"c.5", %"i.3"
  %".48" = zext i1 %".47" to i32
  %"ifcond.2" = icmp ne i32 %".48", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.1:
  br label %"while.end.1"
if.end.1:
  %"c.4" = load i32, i32* %"c"
  %".43" = load i32, i32* %"c"
  %".44" = add i32 %".43", 1
  store i32 %".44", i32* %"c"
  br label %"while.cond.1"
if.then.2:
  %".50" = bitcast [4 x i8]* @"str.4" to i8*
  %"i.4" = load i32, i32* %"i"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %"i.4")
  %"count.3" = load i32, i32* %"count"
  %".52" = load i32, i32* %"count"
  %".53" = add i32 %".52", 1
  store i32 %".53", i32* %"count"
  br label %"if.end.2"
if.end.2:
  %"i.5" = load i32, i32* %"i"
  %".56" = load i32, i32* %"i"
  %".57" = add i32 %".56", 1
  store i32 %".57", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [44 x i8] c"Enter the number of prime numbers required\0a\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [30 x i8] c"First %d prime numbers are :\0a\00"
@"str.3" = internal constant [3 x i8] c"2\0a\00"
@"str.4" = internal constant [4 x i8] c"%d\0a\00"