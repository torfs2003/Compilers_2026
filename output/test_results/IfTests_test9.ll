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
  ;  Source: if(a&&b){printf("%d",1);}elseif(a||b){printf("%d",2);}else{printf("%d",3);}
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %".13" = icmp ne i32 %"a.2", 0
  %".14" = icmp ne i32 %"b.2", 0
  %".15" = and i1 %".13", %".14"
  %".16" = zext i1 %".15" to i32
  %"ifcond" = icmp ne i32 %".16", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".18" = bitcast [3 x i8]* @"str" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 1)
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
if.else:
  %"a.3" = load i32, i32* %"a"
  %"b.3" = load i32, i32* %"b"
  %".21" = icmp ne i32 %"a.3", 0
  %".22" = icmp ne i32 %"b.3", 0
  %".23" = or i1 %".21", %".22"
  %".24" = zext i1 %".23" to i32
  %"ifcond.1" = icmp ne i32 %".24", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.then.1:
  %".26" = bitcast [3 x i8]* @"str.1" to i8*
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 2)
  br label %"if.end.1"
if.end.1:
  br label %"if.end"
if.else.1:
  %".29" = bitcast [3 x i8]* @"str.2" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 3)
  br label %"if.end.1"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"