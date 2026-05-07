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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  ;  Source: if(x<5){printf("%d",1);}
  %"x.1" = load i32, i32* %"x"
  %".5" = icmp slt i32 %"x.1", 5
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 1)
  br label %"if.end"
if.end:
  ;  Source: if(x>=5){printf("%d",2);}else{printf("%d",3);}
  %"x.2" = load i32, i32* %"x"
  %".12" = icmp sge i32 %"x.2", 5
  %".13" = zext i1 %".12" to i32
  %"ifcond.1" = icmp ne i32 %".13", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else"
if.then.1:
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 2)
  br label %"if.end.1"
if.end.1:
  ;  Source: if(x==5&&1){if(x!=4){printf("%d",4);}elseif(1){printf("%d",5);}}
  %"x.3" = load i32, i32* %"x"
  %".22" = icmp eq i32 %"x.3", 5
  %".23" = zext i1 %".22" to i32
  %".24" = icmp ne i32 %".23", 0
  %".25" = icmp ne i32 1, 0
  %".26" = and i1 %".24", %".25"
  %".27" = zext i1 %".26" to i32
  %"ifcond.2" = icmp ne i32 %".27", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.else:
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 3)
  br label %"if.end.1"
if.then.2:
  %"x.4" = load i32, i32* %"x"
  %".29" = icmp ne i32 %"x.4", 4
  %".30" = zext i1 %".29" to i32
  %"ifcond.3" = icmp ne i32 %".30", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.1"
if.end.2:
  ;  Source: if(x<5){}else{}
  %"x.5" = load i32, i32* %"x"
  %".40" = icmp slt i32 %"x.5", 5
  %".41" = zext i1 %".40" to i32
  %"ifcond.4" = icmp ne i32 %".41", 0
  br i1 %"ifcond.4", label %"if.then.4", label %"if.else.2"
if.then.3:
  %".32" = bitcast [3 x i8]* @"str.3" to i8*
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 4)
  br label %"if.end.3"
if.end.3:
  br label %"if.end.2"
if.else.1:
  %".35" = bitcast [3 x i8]* @"str.4" to i8*
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 5)
  br label %"if.end.3"
if.then.4:
  br label %"if.end.4"
if.end.4:
  ;  Source: return0;
  ret i32 0
if.else.2:
  br label %"if.end.4"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"