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
  %"peer" = alloca i32
  ;  User Comment: //NORTH++;  /* This should thrown an semantic error because */
  ;  Source: intpeer=1;
  store i32 1, i32* %"peer"
  %"appel" = alloca i32*
  ;  Source: peer
  %"peer.1" = load i32, i32* %"peer"
  ;  Source: &peer
  ;  Source: constint*constappel=&peer;
  store i32* %"peer", i32** %"appel"
  ;  Source: appel
  %"appel.1" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".11" = load i32*, i32** %"appel"
  %".12" = getelementptr i32, i32* %".11", i32 -1
  store i32* %".12", i32** %"appel"
  ;  Source: appel
  %"appel.2" = load i32*, i32** %"appel"
  ;  Source: appel++;
  %".16" = load i32*, i32** %"appel"
  %".17" = getelementptr i32, i32* %".16", i32 1
  store i32* %".17", i32** %"appel"
  ;  Source: appel
  %"appel.3" = load i32*, i32** %"appel"
  ;  Source: ++appel;
  %".21" = load i32*, i32** %"appel"
  %".22" = getelementptr i32, i32* %".21", i32 1
  store i32* %".22", i32** %"appel"
  %".24" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: peer
  %"peer.2" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"peer.2")
  ;  Source: appel
  %"appel.4" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load" = load i32, i32* %"appel.4"
  ;  Source: (*appel)--;
  %".31" = load i32, i32* %"appel.4"
  %".32" = sub i32 %".31", 1
  store i32 %".32", i32* %"appel.4"
  %".34" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: peer
  %"peer.3" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"peer.3")
  ;  Source: appel
  %"appel.5" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.1" = load i32, i32* %"appel.5"
  ;  Source: (*appel)++;
  %".41" = load i32, i32* %"appel.5"
  %".42" = add i32 %".41", 1
  store i32 %".42", i32* %"appel.5"
  %".44" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: peer
  %"peer.4" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"peer.4")
  ;  Source: appel
  %"appel.6" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.2" = load i32, i32* %"appel.6"
  ;  Source: --(*appel);
  %".51" = load i32, i32* %"appel.6"
  %".52" = sub i32 %".51", 1
  store i32 %".52", i32* %"appel.6"
  %".54" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: peer
  %"peer.5" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %"peer.5")
  ;  Source: appel
  %"appel.7" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".60" = load i32*, i32** %"appel"
  %".61" = getelementptr i32, i32* %".60", i32 -1
  store i32* %".61", i32** %"appel"
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