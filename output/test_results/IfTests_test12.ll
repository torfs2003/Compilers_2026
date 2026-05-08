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
  %"x" = alloca i32
  store i32 5, i32* %"x"
  ;  Source: if(x<5){printf("%d",1);}
  %"x_load" = load i32, i32* %"x"
  %".4" = icmp slt i32 %"x_load", 5
  %".5" = zext i1 %".4" to i32
  %"ifcond" = icmp ne i32 %".5", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".7" = bitcast [3 x i8]* @"str" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 1)
  br label %"if.end"
if.end:
  ;  Source: if(x>=5){printf("%d",2);}
  %"x_load.1" = load i32, i32* %"x"
  %".11" = icmp sge i32 %"x_load.1", 5
  %".12" = zext i1 %".11" to i32
  %"ifcond.1" = icmp ne i32 %".12", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 2)
  br label %"if.end.1"
if.end.1:
  ;  Source: if(x==5&&1){if(x!=4){printf("%d",3);}}
  %"x_load.2" = load i32, i32* %"x"
  %".18" = icmp eq i32 %"x_load.2", 5
  %".19" = zext i1 %".18" to i32
  %".20" = icmp ne i32 %".19", 0
  %".21" = icmp ne i32 1, 0
  %".22" = and i1 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  %"ifcond.2" = icmp ne i32 %".23", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.2:
  %"x_load.3" = load i32, i32* %"x"
  %".25" = icmp ne i32 %"x_load.3", 4
  %".26" = zext i1 %".25" to i32
  %"ifcond.3" = icmp ne i32 %".26", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.end.3"
if.end.2:
  ;  Source: return0;
  ret i32 0
if.then.3:
  %".28" = bitcast [3 x i8]* @"str.2" to i8*
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 3)
  br label %"if.end.3"
if.end.3:
  br label %"if.end.2"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"