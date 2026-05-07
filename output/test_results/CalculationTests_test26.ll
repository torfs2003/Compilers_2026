; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %"ptr_incdec" = getelementptr i32, i32* %".12", i32 -1
  store i32* %"ptr_incdec", i32** %"appel"
  ;  Source: appel
  %"appel.2" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".16" = load i32*, i32** %"appel"
  %"ptr_incdec.1" = getelementptr i32, i32* %".16", i32 -1
  store i32* %"ptr_incdec.1", i32** %"appel"
  ;  Source: appel
  %"appel.3" = load i32*, i32** %"appel"
  ;  Source: appel++;
  %".20" = load i32*, i32** %"appel"
  %"ptr_incdec.2" = getelementptr i32, i32* %".20", i32 1
  store i32* %"ptr_incdec.2", i32** %"appel"
  ;  Source: appel
  %"appel.4" = load i32*, i32** %"appel"
  ;  Source: ++appel;
  %".24" = load i32*, i32** %"appel"
  %"ptr_incdec.3" = getelementptr i32, i32* %".24", i32 1
  store i32* %"ptr_incdec.3", i32** %"appel"
  %".26" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: peer
  %"peer.2" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"peer.2")
  ;  Source: appel
  %"appel.5" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load" = load i32, i32* %"appel.5"
  ;  Source: (*appel)--;
  %".33" = load i32, i32* %"appel.5"
  %".34" = sub i32 %".33", 1
  store i32 %".34", i32* %"appel.5"
  %".36" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: peer
  %"peer.3" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"peer.3")
  ;  Source: appel
  %"appel.6" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.1" = load i32, i32* %"appel.6"
  ;  Source: (*appel)++;
  %".43" = load i32, i32* %"appel.6"
  %".44" = add i32 %".43", 1
  store i32 %".44", i32* %"appel.6"
  %".46" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: peer
  %"peer.4" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %"peer.4")
  ;  Source: appel
  %"appel.7" = load i32*, i32** %"appel"
  ;  Source: (*appel)
  %"deref_load.2" = load i32, i32* %"appel.7"
  ;  Source: --(*appel);
  %".53" = load i32, i32* %"appel.7"
  %".54" = sub i32 %".53", 1
  store i32 %".54", i32* %"appel.7"
  %".56" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: peer
  %"peer.5" = load i32, i32* %"peer"
  ;  Source: printf("%d ",peer);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"peer.5")
  ;  Source: appel
  %"appel.8" = load i32*, i32** %"appel"
  ;  Source: --appel;
  %".62" = load i32*, i32** %"appel"
  %"ptr_incdec.4" = getelementptr i32, i32* %".62", i32 -1
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