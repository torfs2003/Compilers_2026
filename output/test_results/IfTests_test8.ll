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
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=1;
  store i32 1, i32* %"b"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %".13" = icmp ne i32 %"a.2", 0
  %".14" = icmp ne i32 %"b.2", 0
  %".15" = or i1 %".13", %".14"
  %".16" = zext i1 %".15" to i32
  %"ifcond" = icmp ne i32 %".16", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".18" = bitcast [3 x i8]* @"str" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 1)
  br label %"if.end"
if.end:
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.4" = load i32, i32* %"a"
  %"b.4" = load i32, i32* %"b"
  %".28" = icmp ne i32 %"a.4", 0
  %".29" = icmp ne i32 %"b.4", 0
  %".30" = or i1 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  %"ifcond.1" = icmp ne i32 %".31", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  %".33" = bitcast [3 x i8]* @"str.1" to i8*
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 1)
  br label %"if.end.1"
if.end.1:
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.6" = load i32, i32* %"a"
  %"b.6" = load i32, i32* %"b"
  %".43" = icmp ne i32 %"a.6", 0
  %".44" = icmp ne i32 %"b.6", 0
  %".45" = or i1 %".43", %".44"
  %".46" = zext i1 %".45" to i32
  %"ifcond.2" = icmp ne i32 %".46", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.2:
  %".48" = bitcast [3 x i8]* @"str.2" to i8*
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 1)
  br label %"if.end.2"
if.end.2:
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: if(a||b){printf("%d",1);}
  %"a.8" = load i32, i32* %"a"
  %"b.8" = load i32, i32* %"b"
  %".58" = icmp ne i32 %"a.8", 0
  %".59" = icmp ne i32 %"b.8", 0
  %".60" = or i1 %".58", %".59"
  %".61" = zext i1 %".60" to i32
  %"ifcond.3" = icmp ne i32 %".61", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.end.3"
if.then.3:
  %".63" = bitcast [3 x i8]* @"str.3" to i8*
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 1)
  br label %"if.end.3"
if.end.3:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"