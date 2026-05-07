; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"f" = alloca i32*
  ;  Source: calloc(10,4)
  %".3" = call i8* @"calloc"(i32 10, i32 4)
  ;  Source: (int*)calloc(10,4)
  %".5" = bitcast i8* %".3" to i32*
  ;  Source: int*f=(int*)calloc(10,4);
  store i32* %".5", i32** %"f"
  ;  Source: f
  %"f.1" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".10" = getelementptr i32, i32* %"f.1", i32 9
  %"deref_load" = load i32, i32* %".10"
  ;  Source: *(f+9)=5;
  store i32 5, i32* %".10"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".16" = getelementptr i32, i32* %"f.2", i32 9
  ;  Source: *(f+9)
  %"deref_load.1" = load i32, i32* %".16"
  ;  Source: printf("%d",*(f+9));
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"deref_load.1")
  ;  Source: f
  %"f.3" = load i32*, i32** %"f"
  ;  Source: free(f);
  %".22" = bitcast i32* %"f.3" to i8*
  call void @"free"(i8* %".22")
  ;  Source: f
  %"f.4" = load i32*, i32** %"f"
  ;  Source: calloc(10,4)
  %".26" = call i8* @"calloc"(i32 10, i32 4)
  ;  Source: (int*)calloc(10,4)
  %".28" = bitcast i8* %".26" to i32*
  ;  Source: f=(int*)calloc(10,4);
  store i32* %".28", i32** %"f"
  ;  Source: f
  %"f.5" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".33" = getelementptr i32, i32* %"f.5", i32 9
  %"deref_load.2" = load i32, i32* %".33"
  ;  Source: *(f+9)=5;
  store i32 5, i32* %".33"
  %".36" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.6" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".39" = getelementptr i32, i32* %"f.6", i32 9
  ;  Source: *(f+9)
  %"deref_load.3" = load i32, i32* %".39"
  ;  Source: printf("%d",*(f+9));
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"deref_load.3")
  ;  Source: f
  %"f.7" = load i32*, i32** %"f"
  ;  Source: f
  %"f.8" = load i32*, i32** %"f"
  ;  Source: realloc(f,40)
  %".46" = bitcast i32* %"f.8" to i8*
  %".47" = call i8* @"realloc"(i8* %".46", i32 40)
  ;  Source: (int*)realloc(f,40)
  %".49" = bitcast i8* %".47" to i32*
  ;  Source: f=(int*)realloc(f,40);
  store i32* %".49", i32** %"f"
  %".52" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.9" = load i32*, i32** %"f"
  ;  Source: (f+9)
  %".55" = getelementptr i32, i32* %"f.9", i32 9
  ;  Source: *(f+9)
  %"deref_load.4" = load i32, i32* %".55"
  ;  Source: printf("%d",*(f+9));
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %"deref_load.4")
  ;  Source: f
  %"f.10" = load i32*, i32** %"f"
  ;  Source: free(f);
  %".61" = bitcast i32* %"f.10" to i8*
  call void @"free"(i8* %".61")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"