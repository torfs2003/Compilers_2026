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
  ;  Source: if(x<5){}
  %"x_load" = load i32, i32* %"x"
  %".4" = icmp slt i32 %"x_load", 5
  %".5" = zext i1 %".4" to i32
  %"ifcond" = icmp ne i32 %".5", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  br label %"if.end"
if.end:
  ;  Source: if(x>=5){}else{}
  %"x_load.1" = load i32, i32* %"x"
  %".9" = icmp sge i32 %"x_load.1", 5
  %".10" = zext i1 %".9" to i32
  %"ifcond.1" = icmp ne i32 %".10", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else"
if.then.1:
  br label %"if.end.1"
if.end.1:
  ;  Source: if(x==5&&1){if(x!=4){}elseif(1){}}
  %"x_load.2" = load i32, i32* %"x"
  %".15" = icmp eq i32 %"x_load.2", 5
  %".16" = zext i1 %".15" to i32
  %".17" = icmp ne i32 %".16", 0
  %".18" = icmp ne i32 1, 0
  %".19" = and i1 %".17", %".18"
  %".20" = zext i1 %".19" to i32
  %"ifcond.2" = icmp ne i32 %".20", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.else:
  br label %"if.end.1"
if.then.2:
  %"x_load.3" = load i32, i32* %"x"
  %".22" = icmp ne i32 %"x_load.3", 4
  %".23" = zext i1 %".22" to i32
  %"ifcond.3" = icmp ne i32 %".23", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.1"
if.end.2:
  ;  Source: if(x++){}else{}
  %"x_load.4" = load i32, i32* %"x"
  %".29" = load i32, i32* %"x"
  %".30" = add i32 %".29", 1
  store i32 %".30", i32* %"x"
  %"ifcond.4" = icmp ne i32 %".29", 0
  br i1 %"ifcond.4", label %"if.then.4", label %"if.else.2"
if.then.3:
  br label %"if.end.3"
if.end.3:
  br label %"if.end.2"
if.else.1:
  br label %"if.end.3"
if.then.4:
  br label %"if.end.4"
if.end.4:
  %".35" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load.5" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"x_load.5")
  ;  Source: return0;
  ret i32 0
if.else.2:
  br label %"if.end.4"
}

@"str" = internal constant [3 x i8] c"%d\00"