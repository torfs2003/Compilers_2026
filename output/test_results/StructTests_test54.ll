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
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"