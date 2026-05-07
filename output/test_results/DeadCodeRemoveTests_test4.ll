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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: while(a<5){a++;intc=0;if(a>4){intq=0;continue;if(a>5){intz=0;}}if(a<3){if(a==3){while(a<5){break;intw=0;}}break;}}
  br label %"while.cond"
while.cond:
  %"a.1" = load i32, i32* %"a"
  %".6" = icmp slt i32 %"a.1", 5
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.2" = load i32, i32* %"a"
  %".9" = load i32, i32* %"a"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"a"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"a.3" = load i32, i32* %"a"
  %".13" = icmp sgt i32 %"a.3", 4
  %".14" = zext i1 %".13" to i32
  %"ifcond" = icmp ne i32 %".14", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"q" = alloca i32
  store i32 0, i32* %"q"
  br label %"while.cond"
if.end:
  %"a.4" = load i32, i32* %"a"
  %".18" = icmp slt i32 %"a.4", 3
  %".19" = zext i1 %".18" to i32
  %"ifcond.1" = icmp ne i32 %".19", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  %"a.5" = load i32, i32* %"a"
  %".21" = icmp eq i32 %"a.5", 3
  %".22" = zext i1 %".21" to i32
  %"ifcond.2" = icmp ne i32 %".22", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.end.1:
  br label %"while.cond"
if.then.2:
  br label %"while.cond.1"
if.end.2:
  br label %"while.end"
while.cond.1:
  %"a.6" = load i32, i32* %"a"
  %".25" = icmp slt i32 %"a.6", 5
  %".26" = zext i1 %".25" to i32
  %"whilecond.1" = icmp ne i32 %".26", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  br label %"while.end.1"
while.end.1:
  br label %"if.end.2"
}
