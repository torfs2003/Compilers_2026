; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"peer" = alloca i32
  ;  User Comment: /* NORTH++;  This should thrown an semantic error because */
  ;  User Comment: /* const int* appel = &peer; This should also give an error */
  ;  Source: intpeer=1;
  store i32 1, i32* %"peer"
  %"appel" = alloca i32*
  ;  Source: peer
  %"peer.1" = load i32, i32* %"peer"
  ;  Source: &peer
  ;  Source: int*appel=&peer;
  store i32* %"peer", i32** %"appel"
  ;  Source: appel
  %"appel.1" = load i32*, i32** %"appel"
  ;  Source: appel--;
  %".12" = load i32*, i32** %"appel"
  %".13" = getelementptr i32, i32* %".12", i32 -1
  store i32* %".13", i32** %"appel"
  ;  Source: appel
  %"appel.2" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".17" = load i32*, i32** %"appel"
  %".18" = getelementptr i32, i32* %".17", i32 -1
  store i32* %".18", i32** %"appel"
  ;  Source: appel
  %"appel.3" = load i32*, i32** %"appel"
  ;  Source: appel++;
  %".22" = load i32*, i32** %"appel"
  %".23" = getelementptr i32, i32* %".22", i32 1
  store i32* %".23", i32** %"appel"
  ;  Source: appel
  %"appel.4" = load i32*, i32** %"appel"
  ;  Source: ++appel;
  %".27" = load i32*, i32** %"appel"
  %".28" = getelementptr i32, i32* %".27", i32 1
  store i32* %".28", i32** %"appel"
  %".30" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: peer
  %"peer.2" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"peer.2")
  ;  Source: appel
  %"appel.5" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load" = load i32, i32* %"appel.5"
  ;  Source: (*appel)--;
  %".37" = load i32, i32* %"appel.5"
  %".38" = sub i32 %".37", 1
  store i32 %".38", i32* %"appel.5"
  %".40" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: peer
  %"peer.3" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %"peer.3")
  ;  Source: appel
  %"appel.6" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.1" = load i32, i32* %"appel.6"
  ;  Source: (*appel)++;
  %".47" = load i32, i32* %"appel.6"
  %".48" = add i32 %".47", 1
  store i32 %".48", i32* %"appel.6"
  %".50" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: peer
  %"peer.4" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %"peer.4")
  ;  Source: appel
  %"appel.7" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.2" = load i32, i32* %"appel.7"
  ;  Source: --(*appel);
  %".57" = load i32, i32* %"appel.7"
  %".58" = sub i32 %".57", 1
  store i32 %".58", i32* %"appel.7"
  %".60" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: peer
  %"peer.5" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %"peer.5")
  ;  Source: appel
  %"appel.8" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".66" = load i32*, i32** %"appel"
  %".67" = getelementptr i32, i32* %".66", i32 -1
  store i32* %".67", i32** %"appel"
  ;  User Comment: /* --(peer+peer); This is not allowed /
  ;  User Comment: --(peer);
  ;  User Comment: --(appel);
  ;  User Comment: / appel + --appel; This returns an semantic error*/
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [4 x i8] c"%d \00"
@"str.2" = internal constant [4 x i8] c"%d \00"
@"str.3" = internal constant [4 x i8] c"%d \00"