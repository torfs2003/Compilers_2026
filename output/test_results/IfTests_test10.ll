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
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=1;
  store i32 1, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=1;
  store i32 1, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=1;
  store i32 1, i32* %"d"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: if(a){printf("%d",1);if(b<c){printf("%d",2);}elseif(b>d){printf("%d",3);}}elseif(b){printf("%d",4);if(!c){printf("%d",5);}elseif(d){}printf("%d",6);}elseif(c){if(a<b){printf("%d",7);}else{}}elseif(d){printf("%d",8);if(d){printf("%d",9);}}
  %"a.2" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a.2", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %".24" = bitcast [3 x i8]* @"str" to i8*
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 1)
  %"b.2" = load i32, i32* %"b"
  %"c.2" = load i32, i32* %"c"
  %".26" = icmp slt i32 %"b.2", %"c.2"
  %".27" = zext i1 %".26" to i32
  %"ifcond.1" = icmp ne i32 %".27", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.else.1"
if.end:
  %".75" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: printf("%d",10);
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 10)
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: if(a){printf("%d",1);if(b<c){printf("%d",2);}elseif(b>d){printf("%d",3);}}elseif(b){printf("%d",4);if(!c){printf("%d",5);}elseif(d){}printf("%d",6);}elseif(c){if(a<b){printf("%d",7);}else{}}elseif(d){printf("%d",8);if(d){printf("%d",9);}}
  %"a.5" = load i32, i32* %"a"
  %"ifcond.10" = icmp ne i32 %"a.5", 0
  br i1 %"ifcond.10", label %"if.then.10", label %"if.else.6"
if.else:
  %"b.4" = load i32, i32* %"b"
  %"ifcond.3" = icmp ne i32 %"b.4", 0
  br i1 %"ifcond.3", label %"if.then.3", label %"if.else.2"
if.then.1:
  %".29" = bitcast [3 x i8]* @"str.1" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 2)
  br label %"if.end.1"
if.end.1:
  br label %"if.end"
if.else.1:
  %"b.3" = load i32, i32* %"b"
  %"d.2" = load i32, i32* %"d"
  %".32" = icmp sgt i32 %"b.3", %"d.2"
  %".33" = zext i1 %".32" to i32
  %"ifcond.2" = icmp ne i32 %".33", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.2:
  %".35" = bitcast [3 x i8]* @"str.2" to i8*
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 3)
  br label %"if.end.2"
if.end.2:
  br label %"if.end.1"
if.then.3:
  %".41" = bitcast [3 x i8]* @"str.3" to i8*
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 4)
  %"c.3" = load i32, i32* %"c"
  %".43" = icmp eq i32 %"c.3", 0
  %".44" = zext i1 %".43" to i32
  %"ifcond.4" = icmp ne i32 %".44", 0
  br i1 %"ifcond.4", label %"if.then.4", label %"if.else.3"
if.end.3:
  br label %"if.end"
if.else.2:
  %"c.4" = load i32, i32* %"c"
  %"ifcond.6" = icmp ne i32 %"c.4", 0
  br i1 %"ifcond.6", label %"if.then.6", label %"if.else.4"
if.then.4:
  %".46" = bitcast [3 x i8]* @"str.4" to i8*
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 5)
  br label %"if.end.4"
if.end.4:
  %".52" = bitcast [3 x i8]* @"str.5" to i8*
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 6)
  br label %"if.end.3"
if.else.3:
  %"d.3" = load i32, i32* %"d"
  %"ifcond.5" = icmp ne i32 %"d.3", 0
  br i1 %"ifcond.5", label %"if.then.5", label %"if.end.5"
if.then.5:
  br label %"if.end.5"
if.end.5:
  br label %"if.end.4"
if.then.6:
  %"a.3" = load i32, i32* %"a"
  %"b.5" = load i32, i32* %"b"
  %".56" = icmp slt i32 %"a.3", %"b.5"
  %".57" = zext i1 %".56" to i32
  %"ifcond.7" = icmp ne i32 %".57", 0
  br i1 %"ifcond.7", label %"if.then.7", label %"if.else.5"
if.end.6:
  br label %"if.end.3"
if.else.4:
  %"d.4" = load i32, i32* %"d"
  %"ifcond.8" = icmp ne i32 %"d.4", 0
  br i1 %"ifcond.8", label %"if.then.8", label %"if.end.8"
if.then.7:
  %".59" = bitcast [3 x i8]* @"str.6" to i8*
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".59", i32 7)
  br label %"if.end.7"
if.end.7:
  br label %"if.end.6"
if.else.5:
  br label %"if.end.7"
if.then.8:
  %".65" = bitcast [3 x i8]* @"str.7" to i8*
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 8)
  %"d.5" = load i32, i32* %"d"
  %"ifcond.9" = icmp ne i32 %"d.5", 0
  br i1 %"ifcond.9", label %"if.then.9", label %"if.end.9"
if.end.8:
  br label %"if.end.6"
if.then.9:
  %".68" = bitcast [3 x i8]* @"str.8" to i8*
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 9)
  br label %"if.end.9"
if.end.9:
  br label %"if.end.8"
if.then.10:
  %".92" = bitcast [3 x i8]* @"str.10" to i8*
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 1)
  %"b.7" = load i32, i32* %"b"
  %"c.6" = load i32, i32* %"c"
  %".94" = icmp slt i32 %"b.7", %"c.6"
  %".95" = zext i1 %".94" to i32
  %"ifcond.11" = icmp ne i32 %".95", 0
  br i1 %"ifcond.11", label %"if.then.11", label %"if.else.7"
if.end.10:
  %".143" = bitcast [3 x i8]* @"str.19" to i8*
  ;  Source: printf("%d",10);
  %".145" = call i32 (i8*, ...) @"printf"(i8* %".143", i32 10)
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.9" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.11" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: if(a){printf("%d",1);if(b<c){printf("%d",2);}elseif(b>d){printf("%d",3);}}elseif(b){printf("%d",4);if(!c){printf("%d",5);}elseif(d){}printf("%d",6);}elseif(c){if(a<b){printf("%d",7);}else{}}elseif(d){printf("%d",8);if(d){printf("%d",9);}}
  %"a.8" = load i32, i32* %"a"
  %"ifcond.20" = icmp ne i32 %"a.8", 0
  br i1 %"ifcond.20", label %"if.then.20", label %"if.else.12"
if.else.6:
  %"b.9" = load i32, i32* %"b"
  %"ifcond.13" = icmp ne i32 %"b.9", 0
  br i1 %"ifcond.13", label %"if.then.13", label %"if.else.8"
if.then.11:
  %".97" = bitcast [3 x i8]* @"str.11" to i8*
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".97", i32 2)
  br label %"if.end.11"
if.end.11:
  br label %"if.end.10"
if.else.7:
  %"b.8" = load i32, i32* %"b"
  %"d.7" = load i32, i32* %"d"
  %".100" = icmp sgt i32 %"b.8", %"d.7"
  %".101" = zext i1 %".100" to i32
  %"ifcond.12" = icmp ne i32 %".101", 0
  br i1 %"ifcond.12", label %"if.then.12", label %"if.end.12"
if.then.12:
  %".103" = bitcast [3 x i8]* @"str.12" to i8*
  %".104" = call i32 (i8*, ...) @"printf"(i8* %".103", i32 3)
  br label %"if.end.12"
if.end.12:
  br label %"if.end.11"
if.then.13:
  %".109" = bitcast [3 x i8]* @"str.13" to i8*
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".109", i32 4)
  %"c.7" = load i32, i32* %"c"
  %".111" = icmp eq i32 %"c.7", 0
  %".112" = zext i1 %".111" to i32
  %"ifcond.14" = icmp ne i32 %".112", 0
  br i1 %"ifcond.14", label %"if.then.14", label %"if.else.9"
if.end.13:
  br label %"if.end.10"
if.else.8:
  %"c.8" = load i32, i32* %"c"
  %"ifcond.16" = icmp ne i32 %"c.8", 0
  br i1 %"ifcond.16", label %"if.then.16", label %"if.else.10"
if.then.14:
  %".114" = bitcast [3 x i8]* @"str.14" to i8*
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".114", i32 5)
  br label %"if.end.14"
if.end.14:
  %".120" = bitcast [3 x i8]* @"str.15" to i8*
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".120", i32 6)
  br label %"if.end.13"
if.else.9:
  %"d.8" = load i32, i32* %"d"
  %"ifcond.15" = icmp ne i32 %"d.8", 0
  br i1 %"ifcond.15", label %"if.then.15", label %"if.end.15"
if.then.15:
  br label %"if.end.15"
if.end.15:
  br label %"if.end.14"
if.then.16:
  %"a.6" = load i32, i32* %"a"
  %"b.10" = load i32, i32* %"b"
  %".124" = icmp slt i32 %"a.6", %"b.10"
  %".125" = zext i1 %".124" to i32
  %"ifcond.17" = icmp ne i32 %".125", 0
  br i1 %"ifcond.17", label %"if.then.17", label %"if.else.11"
if.end.16:
  br label %"if.end.13"
if.else.10:
  %"d.9" = load i32, i32* %"d"
  %"ifcond.18" = icmp ne i32 %"d.9", 0
  br i1 %"ifcond.18", label %"if.then.18", label %"if.end.18"
if.then.17:
  %".127" = bitcast [3 x i8]* @"str.16" to i8*
  %".128" = call i32 (i8*, ...) @"printf"(i8* %".127", i32 7)
  br label %"if.end.17"
if.end.17:
  br label %"if.end.16"
if.else.11:
  br label %"if.end.17"
if.then.18:
  %".133" = bitcast [3 x i8]* @"str.17" to i8*
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".133", i32 8)
  %"d.10" = load i32, i32* %"d"
  %"ifcond.19" = icmp ne i32 %"d.10", 0
  br i1 %"ifcond.19", label %"if.then.19", label %"if.end.19"
if.end.18:
  br label %"if.end.16"
if.then.19:
  %".136" = bitcast [3 x i8]* @"str.18" to i8*
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 9)
  br label %"if.end.19"
if.end.19:
  br label %"if.end.18"
if.then.20:
  %".160" = bitcast [3 x i8]* @"str.20" to i8*
  %".161" = call i32 (i8*, ...) @"printf"(i8* %".160", i32 1)
  %"b.12" = load i32, i32* %"b"
  %"c.10" = load i32, i32* %"c"
  %".162" = icmp slt i32 %"b.12", %"c.10"
  %".163" = zext i1 %".162" to i32
  %"ifcond.21" = icmp ne i32 %".163", 0
  br i1 %"ifcond.21", label %"if.then.21", label %"if.else.13"
if.end.20:
  %".211" = bitcast [3 x i8]* @"str.29" to i8*
  ;  Source: printf("%d",10);
  %".213" = call i32 (i8*, ...) @"printf"(i8* %".211", i32 10)
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.16" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.13" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.16" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: if(a){printf("%d",1);if(b<c){printf("%d",2);}elseif(b>d){printf("%d",3);}}elseif(b){printf("%d",4);if(!c){printf("%d",5);}elseif(d){}printf("%d",6);}elseif(c){if(a<b){printf("%d",7);}else{}}elseif(d){printf("%d",8);if(d){printf("%d",9);}}
  %"a.11" = load i32, i32* %"a"
  %"ifcond.30" = icmp ne i32 %"a.11", 0
  br i1 %"ifcond.30", label %"if.then.30", label %"if.else.18"
if.else.12:
  %"b.14" = load i32, i32* %"b"
  %"ifcond.23" = icmp ne i32 %"b.14", 0
  br i1 %"ifcond.23", label %"if.then.23", label %"if.else.14"
if.then.21:
  %".165" = bitcast [3 x i8]* @"str.21" to i8*
  %".166" = call i32 (i8*, ...) @"printf"(i8* %".165", i32 2)
  br label %"if.end.21"
if.end.21:
  br label %"if.end.20"
if.else.13:
  %"b.13" = load i32, i32* %"b"
  %"d.12" = load i32, i32* %"d"
  %".168" = icmp sgt i32 %"b.13", %"d.12"
  %".169" = zext i1 %".168" to i32
  %"ifcond.22" = icmp ne i32 %".169", 0
  br i1 %"ifcond.22", label %"if.then.22", label %"if.end.22"
if.then.22:
  %".171" = bitcast [3 x i8]* @"str.22" to i8*
  %".172" = call i32 (i8*, ...) @"printf"(i8* %".171", i32 3)
  br label %"if.end.22"
if.end.22:
  br label %"if.end.21"
if.then.23:
  %".177" = bitcast [3 x i8]* @"str.23" to i8*
  %".178" = call i32 (i8*, ...) @"printf"(i8* %".177", i32 4)
  %"c.11" = load i32, i32* %"c"
  %".179" = icmp eq i32 %"c.11", 0
  %".180" = zext i1 %".179" to i32
  %"ifcond.24" = icmp ne i32 %".180", 0
  br i1 %"ifcond.24", label %"if.then.24", label %"if.else.15"
if.end.23:
  br label %"if.end.20"
if.else.14:
  %"c.12" = load i32, i32* %"c"
  %"ifcond.26" = icmp ne i32 %"c.12", 0
  br i1 %"ifcond.26", label %"if.then.26", label %"if.else.16"
if.then.24:
  %".182" = bitcast [3 x i8]* @"str.24" to i8*
  %".183" = call i32 (i8*, ...) @"printf"(i8* %".182", i32 5)
  br label %"if.end.24"
if.end.24:
  %".188" = bitcast [3 x i8]* @"str.25" to i8*
  %".189" = call i32 (i8*, ...) @"printf"(i8* %".188", i32 6)
  br label %"if.end.23"
if.else.15:
  %"d.13" = load i32, i32* %"d"
  %"ifcond.25" = icmp ne i32 %"d.13", 0
  br i1 %"ifcond.25", label %"if.then.25", label %"if.end.25"
if.then.25:
  br label %"if.end.25"
if.end.25:
  br label %"if.end.24"
if.then.26:
  %"a.9" = load i32, i32* %"a"
  %"b.15" = load i32, i32* %"b"
  %".192" = icmp slt i32 %"a.9", %"b.15"
  %".193" = zext i1 %".192" to i32
  %"ifcond.27" = icmp ne i32 %".193", 0
  br i1 %"ifcond.27", label %"if.then.27", label %"if.else.17"
if.end.26:
  br label %"if.end.23"
if.else.16:
  %"d.14" = load i32, i32* %"d"
  %"ifcond.28" = icmp ne i32 %"d.14", 0
  br i1 %"ifcond.28", label %"if.then.28", label %"if.end.28"
if.then.27:
  %".195" = bitcast [3 x i8]* @"str.26" to i8*
  %".196" = call i32 (i8*, ...) @"printf"(i8* %".195", i32 7)
  br label %"if.end.27"
if.end.27:
  br label %"if.end.26"
if.else.17:
  br label %"if.end.27"
if.then.28:
  %".201" = bitcast [3 x i8]* @"str.27" to i8*
  %".202" = call i32 (i8*, ...) @"printf"(i8* %".201", i32 8)
  %"d.15" = load i32, i32* %"d"
  %"ifcond.29" = icmp ne i32 %"d.15", 0
  br i1 %"ifcond.29", label %"if.then.29", label %"if.end.29"
if.end.28:
  br label %"if.end.26"
if.then.29:
  %".204" = bitcast [3 x i8]* @"str.28" to i8*
  %".205" = call i32 (i8*, ...) @"printf"(i8* %".204", i32 9)
  br label %"if.end.29"
if.end.29:
  br label %"if.end.28"
if.then.30:
  %".228" = bitcast [3 x i8]* @"str.30" to i8*
  %".229" = call i32 (i8*, ...) @"printf"(i8* %".228", i32 1)
  %"b.17" = load i32, i32* %"b"
  %"c.14" = load i32, i32* %"c"
  %".230" = icmp slt i32 %"b.17", %"c.14"
  %".231" = zext i1 %".230" to i32
  %"ifcond.31" = icmp ne i32 %".231", 0
  br i1 %"ifcond.31", label %"if.then.31", label %"if.else.19"
if.end.30:
  %".279" = bitcast [3 x i8]* @"str.39" to i8*
  ;  Source: printf("%d",10);
  %".281" = call i32 (i8*, ...) @"printf"(i8* %".279", i32 10)
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.21" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.17" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.21" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: if(a){printf("%d",1);if(b<c){printf("%d",2);}elseif(b>d){printf("%d",3);}}elseif(b){printf("%d",4);if(!c){printf("%d",5);}elseif(d){}printf("%d",6);}elseif(c){if(a<b){printf("%d",7);}else{}}elseif(d){printf("%d",8);if(d){printf("%d",9);}}
  %"a.14" = load i32, i32* %"a"
  %"ifcond.40" = icmp ne i32 %"a.14", 0
  br i1 %"ifcond.40", label %"if.then.40", label %"if.else.24"
if.else.18:
  %"b.19" = load i32, i32* %"b"
  %"ifcond.33" = icmp ne i32 %"b.19", 0
  br i1 %"ifcond.33", label %"if.then.33", label %"if.else.20"
if.then.31:
  %".233" = bitcast [3 x i8]* @"str.31" to i8*
  %".234" = call i32 (i8*, ...) @"printf"(i8* %".233", i32 2)
  br label %"if.end.31"
if.end.31:
  br label %"if.end.30"
if.else.19:
  %"b.18" = load i32, i32* %"b"
  %"d.17" = load i32, i32* %"d"
  %".236" = icmp sgt i32 %"b.18", %"d.17"
  %".237" = zext i1 %".236" to i32
  %"ifcond.32" = icmp ne i32 %".237", 0
  br i1 %"ifcond.32", label %"if.then.32", label %"if.end.32"
if.then.32:
  %".239" = bitcast [3 x i8]* @"str.32" to i8*
  %".240" = call i32 (i8*, ...) @"printf"(i8* %".239", i32 3)
  br label %"if.end.32"
if.end.32:
  br label %"if.end.31"
if.then.33:
  %".245" = bitcast [3 x i8]* @"str.33" to i8*
  %".246" = call i32 (i8*, ...) @"printf"(i8* %".245", i32 4)
  %"c.15" = load i32, i32* %"c"
  %".247" = icmp eq i32 %"c.15", 0
  %".248" = zext i1 %".247" to i32
  %"ifcond.34" = icmp ne i32 %".248", 0
  br i1 %"ifcond.34", label %"if.then.34", label %"if.else.21"
if.end.33:
  br label %"if.end.30"
if.else.20:
  %"c.16" = load i32, i32* %"c"
  %"ifcond.36" = icmp ne i32 %"c.16", 0
  br i1 %"ifcond.36", label %"if.then.36", label %"if.else.22"
if.then.34:
  %".250" = bitcast [3 x i8]* @"str.34" to i8*
  %".251" = call i32 (i8*, ...) @"printf"(i8* %".250", i32 5)
  br label %"if.end.34"
if.end.34:
  %".256" = bitcast [3 x i8]* @"str.35" to i8*
  %".257" = call i32 (i8*, ...) @"printf"(i8* %".256", i32 6)
  br label %"if.end.33"
if.else.21:
  %"d.18" = load i32, i32* %"d"
  %"ifcond.35" = icmp ne i32 %"d.18", 0
  br i1 %"ifcond.35", label %"if.then.35", label %"if.end.35"
if.then.35:
  br label %"if.end.35"
if.end.35:
  br label %"if.end.34"
if.then.36:
  %"a.12" = load i32, i32* %"a"
  %"b.20" = load i32, i32* %"b"
  %".260" = icmp slt i32 %"a.12", %"b.20"
  %".261" = zext i1 %".260" to i32
  %"ifcond.37" = icmp ne i32 %".261", 0
  br i1 %"ifcond.37", label %"if.then.37", label %"if.else.23"
if.end.36:
  br label %"if.end.33"
if.else.22:
  %"d.19" = load i32, i32* %"d"
  %"ifcond.38" = icmp ne i32 %"d.19", 0
  br i1 %"ifcond.38", label %"if.then.38", label %"if.end.38"
if.then.37:
  %".263" = bitcast [3 x i8]* @"str.36" to i8*
  %".264" = call i32 (i8*, ...) @"printf"(i8* %".263", i32 7)
  br label %"if.end.37"
if.end.37:
  br label %"if.end.36"
if.else.23:
  br label %"if.end.37"
if.then.38:
  %".269" = bitcast [3 x i8]* @"str.37" to i8*
  %".270" = call i32 (i8*, ...) @"printf"(i8* %".269", i32 8)
  %"d.20" = load i32, i32* %"d"
  %"ifcond.39" = icmp ne i32 %"d.20", 0
  br i1 %"ifcond.39", label %"if.then.39", label %"if.end.39"
if.end.38:
  br label %"if.end.36"
if.then.39:
  %".272" = bitcast [3 x i8]* @"str.38" to i8*
  %".273" = call i32 (i8*, ...) @"printf"(i8* %".272", i32 9)
  br label %"if.end.39"
if.end.39:
  br label %"if.end.38"
if.then.40:
  %".296" = bitcast [3 x i8]* @"str.40" to i8*
  %".297" = call i32 (i8*, ...) @"printf"(i8* %".296", i32 1)
  %"b.22" = load i32, i32* %"b"
  %"c.18" = load i32, i32* %"c"
  %".298" = icmp slt i32 %"b.22", %"c.18"
  %".299" = zext i1 %".298" to i32
  %"ifcond.41" = icmp ne i32 %".299", 0
  br i1 %"ifcond.41", label %"if.then.41", label %"if.else.25"
if.end.40:
  %".347" = bitcast [3 x i8]* @"str.49" to i8*
  ;  Source: printf("%d",10);
  %".349" = call i32 (i8*, ...) @"printf"(i8* %".347", i32 10)
  ;  Source: return0;
  ret i32 0
if.else.24:
  %"b.24" = load i32, i32* %"b"
  %"ifcond.43" = icmp ne i32 %"b.24", 0
  br i1 %"ifcond.43", label %"if.then.43", label %"if.else.26"
if.then.41:
  %".301" = bitcast [3 x i8]* @"str.41" to i8*
  %".302" = call i32 (i8*, ...) @"printf"(i8* %".301", i32 2)
  br label %"if.end.41"
if.end.41:
  br label %"if.end.40"
if.else.25:
  %"b.23" = load i32, i32* %"b"
  %"d.22" = load i32, i32* %"d"
  %".304" = icmp sgt i32 %"b.23", %"d.22"
  %".305" = zext i1 %".304" to i32
  %"ifcond.42" = icmp ne i32 %".305", 0
  br i1 %"ifcond.42", label %"if.then.42", label %"if.end.42"
if.then.42:
  %".307" = bitcast [3 x i8]* @"str.42" to i8*
  %".308" = call i32 (i8*, ...) @"printf"(i8* %".307", i32 3)
  br label %"if.end.42"
if.end.42:
  br label %"if.end.41"
if.then.43:
  %".313" = bitcast [3 x i8]* @"str.43" to i8*
  %".314" = call i32 (i8*, ...) @"printf"(i8* %".313", i32 4)
  %"c.19" = load i32, i32* %"c"
  %".315" = icmp eq i32 %"c.19", 0
  %".316" = zext i1 %".315" to i32
  %"ifcond.44" = icmp ne i32 %".316", 0
  br i1 %"ifcond.44", label %"if.then.44", label %"if.else.27"
if.end.43:
  br label %"if.end.40"
if.else.26:
  %"c.20" = load i32, i32* %"c"
  %"ifcond.46" = icmp ne i32 %"c.20", 0
  br i1 %"ifcond.46", label %"if.then.46", label %"if.else.28"
if.then.44:
  %".318" = bitcast [3 x i8]* @"str.44" to i8*
  %".319" = call i32 (i8*, ...) @"printf"(i8* %".318", i32 5)
  br label %"if.end.44"
if.end.44:
  %".324" = bitcast [3 x i8]* @"str.45" to i8*
  %".325" = call i32 (i8*, ...) @"printf"(i8* %".324", i32 6)
  br label %"if.end.43"
if.else.27:
  %"d.23" = load i32, i32* %"d"
  %"ifcond.45" = icmp ne i32 %"d.23", 0
  br i1 %"ifcond.45", label %"if.then.45", label %"if.end.45"
if.then.45:
  br label %"if.end.45"
if.end.45:
  br label %"if.end.44"
if.then.46:
  %"a.15" = load i32, i32* %"a"
  %"b.25" = load i32, i32* %"b"
  %".328" = icmp slt i32 %"a.15", %"b.25"
  %".329" = zext i1 %".328" to i32
  %"ifcond.47" = icmp ne i32 %".329", 0
  br i1 %"ifcond.47", label %"if.then.47", label %"if.else.29"
if.end.46:
  br label %"if.end.43"
if.else.28:
  %"d.24" = load i32, i32* %"d"
  %"ifcond.48" = icmp ne i32 %"d.24", 0
  br i1 %"ifcond.48", label %"if.then.48", label %"if.end.48"
if.then.47:
  %".331" = bitcast [3 x i8]* @"str.46" to i8*
  %".332" = call i32 (i8*, ...) @"printf"(i8* %".331", i32 7)
  br label %"if.end.47"
if.end.47:
  br label %"if.end.46"
if.else.29:
  br label %"if.end.47"
if.then.48:
  %".337" = bitcast [3 x i8]* @"str.47" to i8*
  %".338" = call i32 (i8*, ...) @"printf"(i8* %".337", i32 8)
  %"d.25" = load i32, i32* %"d"
  %"ifcond.49" = icmp ne i32 %"d.25", 0
  br i1 %"ifcond.49", label %"if.then.49", label %"if.end.49"
if.end.48:
  br label %"if.end.46"
if.then.49:
  %".340" = bitcast [3 x i8]* @"str.48" to i8*
  %".341" = call i32 (i8*, ...) @"printf"(i8* %".340", i32 9)
  br label %"if.end.49"
if.end.49:
  br label %"if.end.48"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"
@"str.9" = internal constant [3 x i8] c"%d\00"
@"str.10" = internal constant [3 x i8] c"%d\00"
@"str.11" = internal constant [3 x i8] c"%d\00"
@"str.12" = internal constant [3 x i8] c"%d\00"
@"str.13" = internal constant [3 x i8] c"%d\00"
@"str.14" = internal constant [3 x i8] c"%d\00"
@"str.15" = internal constant [3 x i8] c"%d\00"
@"str.16" = internal constant [3 x i8] c"%d\00"
@"str.17" = internal constant [3 x i8] c"%d\00"
@"str.18" = internal constant [3 x i8] c"%d\00"
@"str.19" = internal constant [3 x i8] c"%d\00"
@"str.20" = internal constant [3 x i8] c"%d\00"
@"str.21" = internal constant [3 x i8] c"%d\00"
@"str.22" = internal constant [3 x i8] c"%d\00"
@"str.23" = internal constant [3 x i8] c"%d\00"
@"str.24" = internal constant [3 x i8] c"%d\00"
@"str.25" = internal constant [3 x i8] c"%d\00"
@"str.26" = internal constant [3 x i8] c"%d\00"
@"str.27" = internal constant [3 x i8] c"%d\00"
@"str.28" = internal constant [3 x i8] c"%d\00"
@"str.29" = internal constant [3 x i8] c"%d\00"
@"str.30" = internal constant [3 x i8] c"%d\00"
@"str.31" = internal constant [3 x i8] c"%d\00"
@"str.32" = internal constant [3 x i8] c"%d\00"
@"str.33" = internal constant [3 x i8] c"%d\00"
@"str.34" = internal constant [3 x i8] c"%d\00"
@"str.35" = internal constant [3 x i8] c"%d\00"
@"str.36" = internal constant [3 x i8] c"%d\00"
@"str.37" = internal constant [3 x i8] c"%d\00"
@"str.38" = internal constant [3 x i8] c"%d\00"
@"str.39" = internal constant [3 x i8] c"%d\00"
@"str.40" = internal constant [3 x i8] c"%d\00"
@"str.41" = internal constant [3 x i8] c"%d\00"
@"str.42" = internal constant [3 x i8] c"%d\00"
@"str.43" = internal constant [3 x i8] c"%d\00"
@"str.44" = internal constant [3 x i8] c"%d\00"
@"str.45" = internal constant [3 x i8] c"%d\00"
@"str.46" = internal constant [3 x i8] c"%d\00"
@"str.47" = internal constant [3 x i8] c"%d\00"
@"str.48" = internal constant [3 x i8] c"%d\00"
@"str.49" = internal constant [3 x i8] c"%d\00"