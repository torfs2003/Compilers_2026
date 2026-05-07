; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  store i32 1000, i32* %"i"
  %"char_buff" = alloca i8*
  %"i.1" = load i32, i32* %"i"
  %".3" = call i8* @"malloc"(i32 %"i.1")
  store i8* %".3", i8** %"char_buff"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: j=0
  store i32 0, i32* %"j"
  br label %"while.cond"
while.cond:
  %"j.2" = load i32, i32* %"j"
  %"i.2" = load i32, i32* %"i"
  %".10" = icmp slt i32 %"j.2", %"i.2"
  %".11" = zext i1 %".10" to i32
  %"whilecond" = icmp ne i32 %".11", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"j.3" = load i32, i32* %"j"
  %".13" = srem i32 %"j.3", 20
  %".14" = sext i8 65 to i32
  %".15" = add i32 %".14", %".13"
  %"char_buff.1" = load i8*, i8** %"char_buff"
  %"j.4" = load i32, i32* %"j"
  %".16" = getelementptr i8, i8* %"char_buff.1", i32 %"j.4"
  %"deref_load" = load i8, i8* %".16"
  %".17" = trunc i32 %".15" to i8
  store i8 %".17", i8* %".16"
  %"j.5" = load i32, i32* %"j"
  %".19" = load i32, i32* %"j"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"j"
  br label %"while.cond"
while.end:
  %"fp" = alloca i8*
  %".23" = bitcast [16 x i8]* @"str" to i8*
  %".24" = bitcast [2 x i8]* @"str.1" to i8*
  %".25" = call i8* @"fopen"(i8* %".23", i8* %".24")
  store i8* %".25", i8** %"fp"
  ;  Source: char_buff
  %"char_buff.2" = load i8*, i8** %"char_buff"
  ;  Source: fp
  %"fp.1" = load i8*, i8** %"fp"
  ;  Source: fputs(char_buff,fp);
  %".30" = call i32 @"fputs"(i8* %"char_buff.2", i8* %"fp.1")
  ;  Source: fp
  %"fp.2" = load i8*, i8** %"fp"
  ;  Source: fclose(fp);
  %".33" = call i32 @"fclose"(i8* %"fp.2")
  %"char_buff2" = alloca i8*
  %"i.3" = load i32, i32* %"i"
  %".34" = call i8* @"malloc"(i32 %"i.3")
  store i8* %".34", i8** %"char_buff2"
  ;  Source: fp
  %"fp.3" = load i8*, i8** %"fp"
  %".37" = bitcast [16 x i8]* @"str.2" to i8*
  %".38" = bitcast [2 x i8]* @"str.3" to i8*
  ;  Source: fopen("files/test8.txt","r")
  %".40" = call i8* @"fopen"(i8* %".37", i8* %".38")
  ;  Source: fp=fopen("files/test8.txt","r");
  store i8* %".40", i8** %"fp"
  ;  Source: char_buff2
  %"char_buff2.1" = load i8*, i8** %"char_buff2"
  ;  Source: i
  %"i.4" = load i32, i32* %"i"
  ;  Source: fp
  %"fp.4" = load i8*, i8** %"fp"
  ;  Source: fgets(char_buff2,i,fp);
  %".47" = call i8* @"fgets"(i8* %"char_buff2.1", i32 %"i.4", i8* %"fp.4")
  %".48" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: char_buff2
  %"char_buff2.2" = load i8*, i8** %"char_buff2"
  ;  Source: printf("%s",char_buff2);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i8* %"char_buff2.2")
  ;  Source: fp
  %"fp.5" = load i8*, i8** %"fp"
  ;  Source: fclose(fp);
  %".54" = call i32 @"fclose"(i8* %"fp.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"files/test8.txt\00"
@"str.1" = internal constant [2 x i8] c"w\00"
@"str.2" = internal constant [16 x i8] c"files/test8.txt\00"
@"str.3" = internal constant [2 x i8] c"r\00"
@"str.4" = internal constant [3 x i8] c"%s\00"