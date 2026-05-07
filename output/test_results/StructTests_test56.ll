; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.b" = type {i32}
%"struct.a" = type {%"struct.b"*, %"struct.b"}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b1" = alloca %"struct.b"
  ;  Source: structbb1;
  %"b2" = alloca %"struct.b"
  ;  Source: structbb2;
  ;  Source: b1.a
  %"gep_a" = getelementptr inbounds %"struct.b", %"struct.b"* %"b1", i32 0, i32 0
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: b1.a=5;
  store i32 5, i32* %"gep_a"
  ;  Source: b2.a
  %"gep_a.1" = getelementptr inbounds %"struct.b", %"struct.b"* %"b2", i32 0, i32 0
  %"load_a.1" = load i32, i32* %"gep_a.1"
  ;  Source: b2.a=7;
  store i32 7, i32* %"gep_a.1"
  %"a1" = alloca %"struct.a"
  ;  Source: structaa1;
  ;  Source: a1.b_value
  %"gep_b_value" = getelementptr inbounds %"struct.a", %"struct.a"* %"a1", i32 0, i32 1
  ;  Source: b1
  ;  Source: a1.b_value=b1;
  %".14" = load %"struct.b", %"struct.b"* %"b1"
  store %"struct.b" %".14", %"struct.b"* %"gep_b_value"
  ;  Source: a1.b_ptr
  %"gep_b_ptr" = getelementptr inbounds %"struct.a", %"struct.a"* %"a1", i32 0, i32 0
  %"load_b_ptr" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr"
  ;  Source: b2
  ;  Source: &b2
  ;  Source: a1.b_ptr=&b2;
  store %"struct.b"* %"b2", %"struct.b"** %"gep_b_ptr"
  %".21" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a1.b_value.a
  %"gep_b_value.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"a1", i32 0, i32 1
  %"gep_a.2" = getelementptr inbounds %"struct.b", %"struct.b"* %"gep_b_value.1", i32 0, i32 0
  %"load_a.2" = load i32, i32* %"gep_a.2"
  ;  Source: printf("%d",a1.b_value.a);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"load_a.2")
  %".25" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a1.b_ptr->a
  %"gep_b_ptr.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"a1", i32 0, i32 0
  %"load_b_ptr.1" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.1"
  %".27" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.1"
  %"gep_a.3" = getelementptr inbounds %"struct.b", %"struct.b"* %".27", i32 0, i32 0
  %"load_a.3" = load i32, i32* %"gep_a.3"
  ;  Source: printf("%d",a1.b_ptr->a);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %"load_a.3")
  %".30" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: (*a1.b_ptr).a
  %"gep_b_ptr.2" = getelementptr inbounds %"struct.a", %"struct.a"* %"a1", i32 0, i32 0
  %"load_b_ptr.2" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.2"
  %"gep_a.4" = getelementptr inbounds %"struct.b", %"struct.b"* %"load_b_ptr.2", i32 0, i32 0
  %"load_a.4" = load i32, i32* %"gep_a.4"
  ;  Source: printf("%d",(*a1.b_ptr).a);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"load_a.4")
  %"a2" = alloca %"struct.a"*
  ;  Source: a1
  ;  Source: &a1
  ;  Source: structa*a2=&a1;
  store %"struct.a"* %"a1", %"struct.a"** %"a2"
  %".38" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a2->b_value.a
  %".40" = load %"struct.a"*, %"struct.a"** %"a2"
  %"gep_b_value.2" = getelementptr inbounds %"struct.a", %"struct.a"* %".40", i32 0, i32 1
  %"gep_a.5" = getelementptr inbounds %"struct.b", %"struct.b"* %"gep_b_value.2", i32 0, i32 0
  %"load_a.5" = load i32, i32* %"gep_a.5"
  ;  Source: printf("%d",a2->b_value.a);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %"load_a.5")
  %".43" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a2->b_ptr->a
  %".45" = load %"struct.a"*, %"struct.a"** %"a2"
  %"gep_b_ptr.3" = getelementptr inbounds %"struct.a", %"struct.a"* %".45", i32 0, i32 0
  %"load_b_ptr.3" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.3"
  %".46" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.3"
  %"gep_a.6" = getelementptr inbounds %"struct.b", %"struct.b"* %".46", i32 0, i32 0
  %"load_a.6" = load i32, i32* %"gep_a.6"
  ;  Source: printf("%d",a2->b_ptr->a);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %"load_a.6")
  %".49" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: (*a2->b_ptr).a
  %".51" = load %"struct.a"*, %"struct.a"** %"a2"
  %"gep_b_ptr.4" = getelementptr inbounds %"struct.a", %"struct.a"* %".51", i32 0, i32 0
  %"load_b_ptr.4" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.4"
  %"gep_a.7" = getelementptr inbounds %"struct.b", %"struct.b"* %"load_b_ptr.4", i32 0, i32 0
  %"load_a.7" = load i32, i32* %"gep_a.7"
  ;  Source: printf("%d",(*a2->b_ptr).a);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"load_a.7")
  %".54" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: (*a2).b_value.a
  %"a2.1" = load %"struct.a"*, %"struct.a"** %"a2"
  %"gep_b_value.3" = getelementptr inbounds %"struct.a", %"struct.a"* %"a2.1", i32 0, i32 1
  %"gep_a.8" = getelementptr inbounds %"struct.b", %"struct.b"* %"gep_b_value.3", i32 0, i32 0
  %"load_a.8" = load i32, i32* %"gep_a.8"
  ;  Source: printf("%d",(*a2).b_value.a);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %"load_a.8")
  %".58" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: (*a2).b_ptr->a
  %"a2.2" = load %"struct.a"*, %"struct.a"** %"a2"
  %"gep_b_ptr.5" = getelementptr inbounds %"struct.a", %"struct.a"* %"a2.2", i32 0, i32 0
  %"load_b_ptr.5" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.5"
  %".60" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.5"
  %"gep_a.9" = getelementptr inbounds %"struct.b", %"struct.b"* %".60", i32 0, i32 0
  %"load_a.9" = load i32, i32* %"gep_a.9"
  ;  Source: printf("%d",(*a2).b_ptr->a);
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %"load_a.9")
  %".63" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: (*(*a2).b_ptr).a
  %"a2.3" = load %"struct.a"*, %"struct.a"** %"a2"
  %"gep_b_ptr.6" = getelementptr inbounds %"struct.a", %"struct.a"* %"a2.3", i32 0, i32 0
  %"load_b_ptr.6" = load %"struct.b"*, %"struct.b"** %"gep_b_ptr.6"
  %"gep_a.10" = getelementptr inbounds %"struct.b", %"struct.b"* %"load_b_ptr.6", i32 0, i32 0
  %"load_a.10" = load i32, i32* %"gep_a.10"
  ;  Source: printf("%d",(*(*a2).b_ptr).a);
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %"load_a.10")
  ;  Source: return0;
  ret i32 0
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