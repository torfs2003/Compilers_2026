; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"peer" = alloca i32
  store i32 1, i32* %"peer"
  %"appel" = alloca i32*
  store i32* %"peer", i32** %"appel"
  ;  Source: appel
  %"appel.1" = load i32*, i32** %"appel"
  ;  Source: appel--;
  %".6" = load i32*, i32** %"appel"
  %"ptr_incdec" = getelementptr i32, i32* %".6", i32 -1
  store i32* %"ptr_incdec", i32** %"appel"
  ;  Source: appel
  %"appel.2" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".10" = load i32*, i32** %"appel"
  %"ptr_incdec.1" = getelementptr i32, i32* %".10", i32 -1
  store i32* %"ptr_incdec.1", i32** %"appel"
  ;  Source: appel
  %"appel.3" = load i32*, i32** %"appel"
  ;  Source: appel++;
  %".14" = load i32*, i32** %"appel"
  %"ptr_incdec.2" = getelementptr i32, i32* %".14", i32 1
  store i32* %"ptr_incdec.2", i32** %"appel"
  ;  Source: appel
  %"appel.4" = load i32*, i32** %"appel"
  ;  Source: ++appel;
  %".18" = load i32*, i32** %"appel"
  %"ptr_incdec.3" = getelementptr i32, i32* %".18", i32 1
  store i32* %"ptr_incdec.3", i32** %"appel"
  %".20" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: peer
  %"peer.1" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"peer.1")
  ;  Source: appel
  %"appel.5" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load" = load i32, i32* %"appel.5"
  ;  Source: (*appel)--;
  %".27" = load i32, i32* %"appel.5"
  %".28" = sub i32 %".27", 1
  store i32 %".28", i32* %"appel.5"
  %".30" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: peer
  %"peer.2" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"peer.2")
  ;  Source: appel
  %"appel.6" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.1" = load i32, i32* %"appel.6"
  ;  Source: (*appel)++;
  %".37" = load i32, i32* %"appel.6"
  %".38" = add i32 %".37", 1
  store i32 %".38", i32* %"appel.6"
  %".40" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: peer
  %"peer.3" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %"peer.3")
  ;  Source: appel
  %"appel.7" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.2" = load i32, i32* %"appel.7"
  ;  Source: --(*appel);
  %".47" = load i32, i32* %"appel.7"
  %".48" = sub i32 %".47", 1
  store i32 %".48", i32* %"appel.7"
  %".50" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: peer
  %"peer.4" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %"peer.4")
  ;  Source: appel
  %"appel.8" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".56" = load i32*, i32** %"appel"
  %"ptr_incdec.4" = getelementptr i32, i32* %".56", i32 -1
  store i32* %"ptr_incdec.4", i32** %"appel"
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