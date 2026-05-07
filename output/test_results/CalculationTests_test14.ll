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
  %"integer" = alloca i32
  store i32 5, i32* %"integer"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: integer
  %"integer.1" = load i32, i32* %"integer"
  ;  Source: printf("%d",integer);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"integer.1")
  %"int_ptr" = alloca i32*
  store i32* %"integer", i32** %"int_ptr"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: int_ptr
  %"int_ptr.1" = load i32*, i32** %"int_ptr"
  ;  Source: *int_ptr
  %"deref_load" = load i32, i32* %"int_ptr.1"
  ;  Source: printf("%d",*int_ptr);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"deref_load")
  %"ptr_ptr" = alloca i32**
  store i32** %"int_ptr", i32*** %"ptr_ptr"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: ptr_ptr
  %"ptr_ptr.1" = load i32**, i32*** %"ptr_ptr"
  %"deref_load.1" = load i32*, i32** %"ptr_ptr.1"
  ;  Source: **ptr_ptr
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%d",**ptr_ptr);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load.2")
  %"another_pointer" = alloca i32**
  %"ptr_ptr.2" = load i32**, i32*** %"ptr_ptr"
  store i32** %"ptr_ptr.2", i32*** %"another_pointer"
  %".20" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: another_pointer
  %"another_pointer.1" = load i32**, i32*** %"another_pointer"
  %"deref_load.3" = load i32*, i32** %"another_pointer.1"
  ;  Source: **another_pointer
  %"deref_load.4" = load i32, i32* %"deref_load.3"
  ;  Source: printf("%d",**another_pointer);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"deref_load.4")
  %"z" = alloca i32
  %"integer.2" = load i32, i32* %"integer"
  %".25" = add i32 %"integer.2", 5
  store i32 %".25", i32* %"z"
  %".27" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"z.1")
  ;  Source: int_ptr
  %"int_ptr.2" = load i32*, i32** %"int_ptr"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: int_ptr=&z;
  store i32* %"z", i32** %"int_ptr"
  %".36" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: int_ptr
  %"int_ptr.3" = load i32*, i32** %"int_ptr"
  ;  Source: *int_ptr
  %"deref_load.5" = load i32, i32* %"int_ptr.3"
  ;  Source: printf("%d",*int_ptr);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"deref_load.5")
  %"pointer" = alloca i32*
  store i32* %"z", i32** %"pointer"
  %".42" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: pointer
  %"pointer.1" = load i32*, i32** %"pointer"
  ;  Source: *pointer
  %"deref_load.6" = load i32, i32* %"pointer.1"
  ;  Source: printf("%d",*pointer);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"deref_load.6")
  %"x" = alloca i32
  %"pointer.2" = load i32*, i32** %"pointer"
  %"deref_load.7" = load i32, i32* %"pointer.2"
  store i32 %"deref_load.7", i32* %"x"
  %".48" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"x.1")
  %"x_ptr" = alloca i32**
  store i32** %"int_ptr", i32*** %"x_ptr"
  %".53" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: x_ptr
  %"x_ptr.1" = load i32**, i32*** %"x_ptr"
  %"deref_load.8" = load i32*, i32** %"x_ptr.1"
  ;  Source: **x_ptr
  %"deref_load.9" = load i32, i32* %"deref_load.8"
  ;  Source: printf("%d",**x_ptr);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %"deref_load.9")
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