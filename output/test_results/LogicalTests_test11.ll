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
  %"f" = alloca i32
  ;  Source: intf;
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".16" = icmp eq i32 %"b.2", 0
  %".17" = zext i1 %".16" to i32
  ;  Source: (a||!b)
  %".19" = icmp ne i32 %"a.2", 0
  %".20" = icmp ne i32 %".17", 0
  %".21" = or i1 %".19", %".20"
  %".22" = zext i1 %".21" to i32
  ;  Source: f=(a||!b);
  store i32 %".22", i32* %"f"
  %".25" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %"f.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"