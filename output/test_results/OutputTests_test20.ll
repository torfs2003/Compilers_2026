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
  %"line_of_code" = alloca i32
  ;  User Comment: /*
  ;  User Comment: * This is a comment
  ;  User Comment: *
  ;  User Comment: */
  ;  Source: intline_of_code=5;
  store i32 5, i32* %"line_of_code"
  %"f" = alloca float
  ;  User Comment: /**
  ;  User Comment: * Another Comment
  ;  User Comment: ***** /
  ;  User Comment: /**
  ;  User Comment: *
  ;  User Comment: *
  ;  User Comment: **/
  ;  Source: floatf=45;
  %".16" = sitofp i32 45 to float
  store float %".16", float* %"f"
  %"c" = alloca i8
  ;  User Comment: /* /// ** ** // // //  */
  ;  Source: charc='b';
  store i8 98, i8* %"c"
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %".23" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"x.1")
  %".27" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: line_of_code
  %"line_of_code.1" = load i32, i32* %"line_of_code"
  ;  Source: printf("%d",line_of_code);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"line_of_code.1")
  %".31" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".34" = zext i8 %"c.1" to i32
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"