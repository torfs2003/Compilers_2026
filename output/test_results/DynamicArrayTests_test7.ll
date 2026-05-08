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
  %"f" = alloca i32*
  %".2" = call i8* @"calloc"(i32 10, i32 4)
  %".3" = bitcast i8* %".2" to i32*
  store i32* %".3", i32** %"f"
  ;  Source: f
  %"f_load" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".7" = getelementptr i32, i32* %"f_load", i32 9
  %"deref_load" = load i32, i32* %".7"
  ;  Source: *(f+9)=5;
  store i32 5, i32* %".7"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f_load.1" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".13" = getelementptr i32, i32* %"f_load.1", i32 9
  ;  Source: *(f+9)
  %"deref_load.1" = load i32, i32* %".13"
  ;  Source: printf("%d",*(f+9));
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"deref_load.1")
  ;  Source: f
  %"f_load.2" = load i32*, i32** %"f"
  ;  Source: free(f);
  %".19" = bitcast i32* %"f_load.2" to i8*
  call void @"free"(i8* %".19")
  ;  Source: f
  %"f_load.3" = load i32*, i32** %"f"
  ;  Source: calloc(10,4)
  %".23" = call i8* @"calloc"(i32 10, i32 4)
  ;  Source: (int*)calloc(10,4)
  %".25" = bitcast i8* %".23" to i32*
  ;  Source: f=(int*)calloc(10,4);
  store i32* %".25", i32** %"f"
  ;  Source: f
  %"f_load.4" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".30" = getelementptr i32, i32* %"f_load.4", i32 9
  %"deref_load.2" = load i32, i32* %".30"
  ;  Source: *(f+9)=5;
  store i32 5, i32* %".30"
  %".33" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f_load.5" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".36" = getelementptr i32, i32* %"f_load.5", i32 9
  ;  Source: *(f+9)
  %"deref_load.3" = load i32, i32* %".36"
  ;  Source: printf("%d",*(f+9));
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %"deref_load.3")
  ;  Source: f
  %"f_load.6" = load i32*, i32** %"f"
  ;  Source: f
  %"f_load.7" = load i32*, i32** %"f"
  ;  Source: realloc(f,40)
  %".43" = bitcast i32* %"f_load.7" to i8*
  %".44" = call i8* @"realloc"(i8* %".43", i32 40)
  ;  Source: (int*)realloc(f,40)
  %".46" = bitcast i8* %".44" to i32*
  ;  Source: f=(int*)realloc(f,40);
  store i32* %".46", i32** %"f"
  %".49" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f_load.8" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".52" = getelementptr i32, i32* %"f_load.8", i32 9
  ;  Source: *(f+9)
  %"deref_load.4" = load i32, i32* %".52"
  ;  Source: printf("%d",*(f+9));
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %"deref_load.4")
  ;  Source: f
  %"f_load.9" = load i32*, i32** %"f"
  ;  Source: free(f);
  %".58" = bitcast i32* %"f_load.9" to i8*
  call void @"free"(i8* %".58")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"