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
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  ;  Source: if(x<5){printf("Something went wrong");/* Should not print */}else{printf("Hello world!\n");/* Should print */}
  %"x.1" = load i32, i32* %"x"
  %".5" = icmp slt i32 %"x.1", 5
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".8" = bitcast [21 x i8]* @"str" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8")
  br label %"if.end"
if.end:
  ;  Source: if(x==5&&1){if(x==5){printf("Hello world!\n");/* Should print */}else{printf("Something went wrong");/* Should not print */}}
  %"x.2" = load i32, i32* %"x"
  %".15" = icmp eq i32 %"x.2", 5
  %".16" = zext i1 %".15" to i32
  %".17" = icmp ne i32 %".16", 0
  %".18" = icmp ne i32 1, 0
  %".19" = and i1 %".17", %".18"
  %".20" = zext i1 %".19" to i32
  %"ifcond.1" = icmp ne i32 %".20", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.else:
  %".11" = bitcast [14 x i8]* @"str.1" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  br label %"if.end"
if.then.1:
  %"x.3" = load i32, i32* %"x"
  %".22" = icmp eq i32 %"x.3", 5
  %".23" = zext i1 %".22" to i32
  %"ifcond.2" = icmp ne i32 %".23", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.else.1"
if.end.1:
  ;  Source: return0;
  ret i32 0
if.then.2:
  %".25" = bitcast [14 x i8]* @"str.2" to i8*
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25")
  br label %"if.end.2"
if.end.2:
  br label %"if.end.1"
if.else.1:
  %".28" = bitcast [21 x i8]* @"str.3" to i8*
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28")
  br label %"if.end.2"
}

@"str" = internal constant [21 x i8] c"Something went wrong\00"
@"str.1" = internal constant [14 x i8] c"Hello world!\0a\00"
@"str.2" = internal constant [14 x i8] c"Hello world!\0a\00"
@"str.3" = internal constant [21 x i8] c"Something went wrong\00"