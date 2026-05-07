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
  %"integer" = alloca i32
  ;  Source: intinteger=5;
  store i32 5, i32* %"integer"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: integer
  %"integer.1" = load i32, i32* %"integer"
  ;  Source: printf("%d",integer);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"integer.1")
  %"int_ptr" = alloca i32*
  ;  Source: integer
  %"integer.2" = load i32, i32* %"integer"
  ;  Source: &integer
  ;  Source: int*int_ptr=&integer;
  store i32* %"integer", i32** %"int_ptr"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: int_ptr
  %"int_ptr.1" = load i32*, i32** %"int_ptr"
  ;  Source: *int_ptr
  %"deref_load" = load i32, i32* %"int_ptr.1"
  ;  Source: printf("%d",*int_ptr);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"deref_load")
  %"ptr_ptr" = alloca i32**
  ;  Source: int_ptr
  %"int_ptr.2" = load i32*, i32** %"int_ptr"
  ;  Source: &int_ptr
  ;  Source: int**ptr_ptr=&int_ptr;
  store i32** %"int_ptr", i32*** %"ptr_ptr"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: ptr_ptr
  %"ptr_ptr.1" = load i32**, i32*** %"ptr_ptr"
  %"deref_load.1" = load i32*, i32** %"ptr_ptr.1"
  ;  Source: **ptr_ptr
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%d",**ptr_ptr);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"deref_load.2")
  %"another_pointer" = alloca i32**
  ;  Source: ptr_ptr
  %"ptr_ptr.2" = load i32**, i32*** %"ptr_ptr"
  ;  Source: int**another_pointer=ptr_ptr;
  store i32** %"ptr_ptr.2", i32*** %"another_pointer"
  %".29" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: another_pointer
  %"another_pointer.1" = load i32**, i32*** %"another_pointer"
  %"deref_load.3" = load i32*, i32** %"another_pointer.1"
  ;  Source: **another_pointer
  %"deref_load.4" = load i32, i32* %"deref_load.3"
  ;  Source: printf("%d",**another_pointer);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"deref_load.4")
  %"z" = alloca i32
  ;  Source: integer
  %"integer.3" = load i32, i32* %"integer"
  ;  Source: integer+5
  %".36" = add i32 %"integer.3", 5
  ;  Source: intz=integer+5;
  store i32 %".36", i32* %"z"
  %".39" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"z.1")
  ;  Source: int_ptr
  %"int_ptr.3" = load i32*, i32** %"int_ptr"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: int_ptr=&z;
  store i32* %"z", i32** %"int_ptr"
  %".48" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: int_ptr
  %"int_ptr.4" = load i32*, i32** %"int_ptr"
  ;  Source: *int_ptr
  %"deref_load.5" = load i32, i32* %"int_ptr.4"
  ;  Source: printf("%d",*int_ptr);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"deref_load.5")
  %"pointer" = alloca i32*
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: int*pointer=&z;
  store i32* %"z", i32** %"pointer"
  %".57" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: pointer
  %"pointer.1" = load i32*, i32** %"pointer"
  ;  Source: *pointer
  %"deref_load.6" = load i32, i32* %"pointer.1"
  ;  Source: printf("%d",*pointer);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %"deref_load.6")
  %"x" = alloca i32
  ;  Source: pointer
  %"pointer.2" = load i32*, i32** %"pointer"
  ;  Source: *pointer
  %"deref_load.7" = load i32, i32* %"pointer.2"
  ;  Source: intx=*pointer;
  store i32 %"deref_load.7", i32* %"x"
  %".66" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %"x.1")
  %"x_ptr" = alloca i32**
  ;  Source: int_ptr
  %"int_ptr.5" = load i32*, i32** %"int_ptr"
  ;  Source: &int_ptr
  ;  Source: int**x_ptr=&int_ptr;
  store i32** %"int_ptr", i32*** %"x_ptr"
  %".74" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: x_ptr
  %"x_ptr.1" = load i32**, i32*** %"x_ptr"
  %"deref_load.8" = load i32*, i32** %"x_ptr.1"
  ;  Source: **x_ptr
  %"deref_load.9" = load i32, i32* %"deref_load.8"
  ;  Source: printf("%d",**x_ptr);
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %"deref_load.9")
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