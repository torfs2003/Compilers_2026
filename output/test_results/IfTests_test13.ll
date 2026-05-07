; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  ;  Source: if(x<5){printf("%d",1);}
  %"x.1" = load i32, i32* %"x"
  %".4" = icmp slt i32 %"x.1", 5
  %".5" = zext i1 %".4" to i32
  %"ifcond" = icmp ne i32 %".5", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".7" = bitcast [3 x i8]* @"str" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 1)
  br label %"if.end"
if.end:
  ;  Source: if(x>=5){printf("%d",2);}else{printf("%d",3);}
  %"x.2" = load i32, i32* %"x"
  %".11" = icmp sge i32 %"x.2", 5
  %".12" = zext i1 %".11" to i32
  %"ifcond.1" = icmp ne i32 %".12", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else"
if.then.1:
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 2)
  br label %"if.end.1"
if.end.1:
  ;  Source: if(x==5&&1){if(x!=4){printf("%d",4);}elseif(1){printf("%d",5);}}
  %"x.3" = load i32, i32* %"x"
  %".21" = icmp eq i32 %"x.3", 5
  %".22" = zext i1 %".21" to i32
  %".23" = icmp ne i32 %".22", 0
  %".24" = icmp ne i32 1, 0
  %".25" = and i1 %".23", %".24"
  %".26" = zext i1 %".25" to i32
  %"ifcond.2" = icmp ne i32 %".26", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.else:
  %".17" = bitcast [3 x i8]* @"str.2" to i8*
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 3)
  br label %"if.end.1"
if.then.2:
  %"x.4" = load i32, i32* %"x"
  %".28" = icmp ne i32 %"x.4", 4
  %".29" = zext i1 %".28" to i32
  %"ifcond.3" = icmp ne i32 %".29", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.1"
if.end.2:
  ;  Source: if(x<5){}else{}
  %"x.5" = load i32, i32* %"x"
  %".39" = icmp slt i32 %"x.5", 5
  %".40" = zext i1 %".39" to i32
  %"ifcond.4" = icmp ne i32 %".40", 0
  br i1 %"ifcond.4", label %"if.then.4", label %"if.else.2"
if.then.3:
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 4)
  br label %"if.end.3"
if.end.3:
  br label %"if.end.2"
if.else.1:
  %".34" = bitcast [3 x i8]* @"str.4" to i8*
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 5)
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