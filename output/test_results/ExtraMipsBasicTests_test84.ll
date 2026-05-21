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
  %"a" = alloca [3 x i32]
  ;  Source: inta[3]={1,2,3};
  %".3" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".7"
  %"p" = alloca i32*
  ;  Source: a
  ;  Source: &a
  ;  Source: int*p=&a;
  %".12" = bitcast [3 x i32]* %"a" to i32*
  store i32* %".12", i32** %"p"
  %"q" = alloca i32*
  ;  Source: p
  %"p.1" = load i32*, i32** %"p"
  ;  Source: (p+1)
  %".16" = getelementptr i32, i32* %"p.1", i32 1
  ;  Source: int*q=(p+1);
  store i32* %".16", i32** %"q"
  %"v" = alloca i32
  ;  Source: q
  %"q.1" = load i32*, i32** %"q"
  ;  Source: p
  %"p.2" = load i32*, i32** %"p"
  ;  Source: q-p
  %".22" = ptrtoint i32* %"q.1" to i32
  %".23" = ptrtoint i32* %"p.2" to i32
  %".24" = sub i32 %".22", %".23"
  %".25" = sdiv i32 %".24", 4
  ;  Source: intv=q-p;
  store i32 %".25", i32* %"v"
  %".28" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: v
  %"v.1" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"v.1")
  %".32" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.3" = load i32*, i32** %"p"
  ;  Source: q
  %"q.2" = load i32*, i32** %"q"
  ;  Source: p<q
  %".36" = ptrtoint i32* %"p.3" to i32
  %".37" = ptrtoint i32* %"q.2" to i32
  %".38" = icmp ult i32 %".36", %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: printf("%d",p<q);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".39")
  ;  Source: p
  %"p.4" = load i32*, i32** %"p"
  ;  Source: p=0;
  %".44" = inttoptr i32 0 to i32*
  store i32* %".44", i32** %"p"
  %".46" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.5" = load i32*, i32** %"p"
  ;  Source: printf("%d",p);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".46", i32* %"p.5")
  %".50" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: p
  %"p.6" = load i32*, i32** %"p"
  ;  Source: p==0
  %".53" = ptrtoint i32* %"p.6" to i32
  %".54" = icmp eq i32 %".53", 0
  %".55" = zext i1 %".54" to i32
  ;  Source: printf("%d",p==0);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".55")
  ;  Source: p
  %"p.7" = load i32*, i32** %"p"
  ;  Source: p++;
  %".60" = load i32*, i32** %"p"
  %".61" = getelementptr i32, i32* %".60", i32 1
  store i32* %".61", i32** %"p"
  %".63" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: p
  %"p.8" = load i32*, i32** %"p"
  ;  Source: p>=0
  %".66" = ptrtoint i32* %"p.8" to i32
  %".67" = icmp uge i32 %".66", 0
  %".68" = zext i1 %".67" to i32
  ;  Source: printf("%d",p>=0);
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".68")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"