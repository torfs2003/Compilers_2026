; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  %"i" = alloca i32
  store i32 3, i32* %"i"
  %"count" = alloca i32
  %"c" = alloca i32
  %".3" = bitcast [44 x i8]* @"str" to i8*
  ;  Source: printf("Enter the number of prime numbers required\n");
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3")
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: n=5;
  store i32 5, i32* %"n"
  ;  Source: if(n>=1){printf("First %d prime numbers are :\n",n);printf("2\n");}
  %"n.2" = load i32, i32* %"n"
  %".10" = icmp sge i32 %"n.2", 1
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".13" = bitcast [30 x i8]* @"str.1" to i8*
  %"n.3" = load i32, i32* %"n"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"n.3")
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
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
  %".23" = icmp sle i32 %"count.2", %"n.4"
  %".24" = zext i1 %".23" to i32
  %"whilecond" = icmp ne i32 %".24", 0
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
  %".28" = sub i32 %"i.1", 1
  %".29" = icmp sle i32 %"c.2", %".28"
  %".30" = zext i1 %".29" to i32
  %"whilecond.1" = icmp ne i32 %".30", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i32, i32* %"i"
  %"c.3" = load i32, i32* %"c"
  %".32" = srem i32 %"i.2", %"c.3"
  %".33" = icmp eq i32 %".32", 0
  %".34" = zext i1 %".33" to i32
  %"ifcond.1" = icmp ne i32 %".34", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
while.end.1:
  %"c.5" = load i32, i32* %"c"
  %"i.3" = load i32, i32* %"i"
  %".41" = icmp eq i32 %"c.5", %"i.3"
  %".42" = zext i1 %".41" to i32
  %"ifcond.2" = icmp ne i32 %".42", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.1:
  br label %"while.end.1"
if.end.1:
  %"c.4" = load i32, i32* %"c"
  %".37" = load i32, i32* %"c"
  %".38" = add i32 %".37", 1
  store i32 %".38", i32* %"c"
  br label %"while.cond.1"
if.then.2:
  %".44" = bitcast [4 x i8]* @"str.3" to i8*
  %"i.4" = load i32, i32* %"i"
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"i.4")
  %"count.3" = load i32, i32* %"count"
  %".46" = load i32, i32* %"count"
  %".47" = add i32 %".46", 1
  store i32 %".47", i32* %"count"
  br label %"if.end.2"
if.end.2:
  %"i.5" = load i32, i32* %"i"
  %".50" = load i32, i32* %"i"
  %".51" = add i32 %".50", 1
  store i32 %".51", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [44 x i8] c"Enter the number of prime numbers required\0a\00"
@"str.1" = internal constant [30 x i8] c"First %d prime numbers are :\0a\00"
@"str.2" = internal constant [3 x i8] c"2\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"