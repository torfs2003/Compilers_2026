; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %"ptr_incdec" = getelementptr i32, i32* %".11", i32 -1
  store i32* %"ptr_incdec", i32** %"appel"
  ;  Source: appel
  %"appel.2" = load i32*, i32** %"appel"
  ;  Source: appel++;
  %".15" = load i32*, i32** %"appel"
  %"ptr_incdec.1" = getelementptr i32, i32* %".15", i32 1
  store i32* %"ptr_incdec.1", i32** %"appel"
  ;  Source: appel
  %"appel.3" = load i32*, i32** %"appel"
  ;  Source: ++appel;
  %".19" = load i32*, i32** %"appel"
  %"ptr_incdec.2" = getelementptr i32, i32* %".19", i32 1
  store i32* %"ptr_incdec.2", i32** %"appel"
  %".21" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: peer
  %"peer.2" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"peer.2")
  ;  Source: appel
  %"appel.4" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load" = load i32, i32* %"appel.4"
  ;  Source: (*appel)--;
  %".28" = load i32, i32* %"appel.4"
  %".29" = sub i32 %".28", 1
  store i32 %".29", i32* %"appel.4"
  %".31" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: peer
  %"peer.3" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"peer.3")
  ;  Source: appel
  %"appel.5" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.1" = load i32, i32* %"appel.5"
  ;  Source: (*appel)++;
  %".38" = load i32, i32* %"appel.5"
  %".39" = add i32 %".38", 1
  store i32 %".39", i32* %"appel.5"
  %".41" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: peer
  %"peer.4" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"peer.4")
  ;  Source: appel
  %"appel.6" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.2" = load i32, i32* %"appel.6"
  ;  Source: --(*appel);
  %".48" = load i32, i32* %"appel.6"
  %".49" = sub i32 %".48", 1
  store i32 %".49", i32* %"appel.6"
  %".51" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: peer
  %"peer.5" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %"peer.5")
  ;  Source: appel
  %"appel.7" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".57" = load i32*, i32** %"appel"
  %"ptr_incdec.3" = getelementptr i32, i32* %".57", i32 -1
  store i32* %"ptr_incdec.3", i32** %"appel"
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