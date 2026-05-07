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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=0;
  store i32 0, i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=0;
  store i32 0, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=0;
  store i32 0, i32* %"f"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".40" = icmp ne i32 %"b.2", 0
  %".41" = icmp ne i32 %"c.3", 0
  %".42" = or i1 %".40", %".41"
  %".43" = zext i1 %".42" to i32
  ;  Source: (a&&(b||c))
  %".45" = icmp ne i32 %"a.3", 0
  %".46" = icmp ne i32 %".43", 0
  %".47" = and i1 %".45", %".46"
  %".48" = zext i1 %".47" to i32
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".52" = icmp ne i32 %"d.2", 0
  %".53" = icmp ne i32 %"c.4", 0
  %".54" = and i1 %".52", %".53"
  %".55" = zext i1 %".54" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  %".57" = icmp ne i32 %".55", 0
  %".58" = icmp ne i32 %"e.2", 0
  %".59" = and i1 %".57", %".58"
  %".60" = zext i1 %".59" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".62" = icmp ne i32 %".48", 0
  %".63" = icmp ne i32 %".60", 0
  %".64" = or i1 %".62", %".63"
  %".65" = zext i1 %".64" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".65", i32* %"f"
  %".68" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %"f.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"