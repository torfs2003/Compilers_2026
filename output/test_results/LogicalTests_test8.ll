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
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".34" = or i32 %"b.2", %"c.2"
  %".35" = icmp eq i32 %".34", 0
  %".36" = zext i1 %".35" to i32
  ;  Source: (a&&!(b||c))
  %".38" = and i32 %"a.2", %".36"
  ;  Source: f=(a&&!(b||c));
  store i32 %".38", i32* %"f"
  %".41" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"f.2")
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f.3" = load i32, i32* %"f"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".53" = or i32 %"b.4", %"c.3"
  %".54" = icmp eq i32 %".53", 0
  %".55" = zext i1 %".54" to i32
  ;  Source: (a&&!(b||c))
  %".57" = and i32 %"a.3", %".55"
  ;  Source: f=(a&&!(b||c));
  store i32 %".57", i32* %"f"
  %".60" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %"f.4")
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".72" = or i32 %"b.5", %"c.4"
  %".73" = icmp eq i32 %".72", 0
  %".74" = zext i1 %".73" to i32
  ;  Source: (a&&!(b||c))
  %".76" = and i32 %"a.5", %".74"
  ;  Source: f=(a&&!(b||c));
  store i32 %".76", i32* %"f"
  %".79" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %"f.6")
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".91" = or i32 %"b.7", %"c.5"
  %".92" = icmp eq i32 %".91", 0
  %".93" = zext i1 %".92" to i32
  ;  Source: (a&&!(b||c))
  %".95" = and i32 %"a.6", %".93"
  ;  Source: f=(a&&!(b||c));
  store i32 %".95", i32* %"f"
  %".98" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %"f.8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"