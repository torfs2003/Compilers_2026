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
  ;  Source: if(x<5){}
  %"x.1" = load i32, i32* %"x"
  %".5" = icmp slt i32 %"x.1", 5
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  br label %"if.end"
if.end:
  ;  Source: if(x>=5){}else{}
  %"x.2" = load i32, i32* %"x"
  %".10" = icmp sge i32 %"x.2", 5
  %".11" = zext i1 %".10" to i32
  %"ifcond.1" = icmp ne i32 %".11", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else"
if.then.1:
  br label %"if.end.1"
if.end.1:
  ;  Source: if(x==5&&1){if(x!=4){}elseif(1){}}
  %"x.3" = load i32, i32* %"x"
  %".16" = icmp eq i32 %"x.3", 5
  %".17" = zext i1 %".16" to i32
  %".18" = icmp ne i32 %".17", 0
  %".19" = icmp ne i32 1, 0
  %".20" = and i1 %".18", %".19"
  %".21" = zext i1 %".20" to i32
  %"ifcond.2" = icmp ne i32 %".21", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.else:
  br label %"if.end.1"
if.then.2:
  %"x.4" = load i32, i32* %"x"
  %".23" = icmp ne i32 %"x.4", 4
  %".24" = zext i1 %".23" to i32
  %"ifcond.3" = icmp ne i32 %".24", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.1"
if.end.2:
  ;  Source: if(x++){}else{}
  %"x.5" = load i32, i32* %"x"
  %".30" = load i32, i32* %"x"
  %".31" = add i32 %".30", 1
  store i32 %".31", i32* %"x"
  %"ifcond.4" = icmp ne i32 %".30", 0
  br i1 %"ifcond.4", label %"if.then.4", label %"if.else.2"
if.then.3:
  br label %"if.end.3"
if.end.3:
  br label %"if.end.2"
if.else.1:
  br label %"if.end.3"
if.then.4:
  br label %"if.end.4"
if.end.4:
  %".36" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"x.6")
  ;  Source: return0;
  ret i32 0
if.else.2:
  br label %"if.end.4"
}

@"str" = internal constant [3 x i8] c"%d\00"