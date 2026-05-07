; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"b" = alloca i32
  store i32 0, i32* %"b"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"d" = alloca i32
  store i32 0, i32* %"d"
  %"e" = alloca i32
  store i32 0, i32* %"e"
  %"f" = alloca i32
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
  %".34" = icmp ne i32 %"b.2", 0
  %".35" = icmp ne i32 %"c.3", 0
  %".36" = or i1 %".34", %".35"
  %".37" = zext i1 %".36" to i32
  ;  Source: (a&&(b||c))
  %".39" = icmp ne i32 %"a.3", 0
  %".40" = icmp ne i32 %".37", 0
  %".41" = and i1 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".46" = icmp ne i32 %"d.2", 0
  %".47" = icmp ne i32 %"c.4", 0
  %".48" = and i1 %".46", %".47"
  %".49" = zext i1 %".48" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  %".51" = icmp ne i32 %".49", 0
  %".52" = icmp ne i32 %"e.2", 0
  %".53" = and i1 %".51", %".52"
  %".54" = zext i1 %".53" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".56" = icmp ne i32 %".42", 0
  %".57" = icmp ne i32 %".54", 0
  %".58" = or i1 %".56", %".57"
  %".59" = zext i1 %".58" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".59", i32* %"f"
  %".62" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %"f.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"