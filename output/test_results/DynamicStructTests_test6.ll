; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.mapEntry" = type {i8*, i32}
%"struct.map" = type {%"struct.mapEntry"*, i32}
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

define i32 @"equal"(i8* %".1", i8* %".2")
{
entry:
  %"a" = alloca i8*
  store i8* %".1", i8** %"a"
  %"b" = alloca i8*
  store i8* %".2", i8** %"b"
  %"index" = alloca i32
  store i32 0, i32* %"index"
  ;  Source: while(1){chara_char=*(a+index);charb_char=*(b+index);if(a_char=='\0'&&b_char=='\0'){return1;}if(a_char=='\0'||b_char=='\0'){return0;}if(a_char!=b_char){return0;}index++;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a_char" = alloca i8
  %"a.1" = load i8*, i8** %"a"
  %"index.1" = load i32, i32* %"index"
  %".10" = getelementptr i8, i8* %"a.1", i32 %"index.1"
  %"deref_load" = load i8, i8* %".10"
  store i8 %"deref_load", i8* %"a_char"
  %"b_char" = alloca i8
  %"b.1" = load i8*, i8** %"b"
  %"index.2" = load i32, i32* %"index"
  %".12" = getelementptr i8, i8* %"b.1", i32 %"index.2"
  %"deref_load.1" = load i8, i8* %".12"
  store i8 %"deref_load.1", i8* %"b_char"
  %"a_char.1" = load i8, i8* %"a_char"
  %".14" = icmp eq i8 %"a_char.1", 0
  %".15" = zext i1 %".14" to i32
  %"b_char.1" = load i8, i8* %"b_char"
  %".16" = icmp eq i8 %"b_char.1", 0
  %".17" = zext i1 %".16" to i32
  %".18" = icmp ne i32 %".15", 0
  %".19" = icmp ne i32 %".17", 0
  %".20" = and i1 %".18", %".19"
  %".21" = zext i1 %".20" to i32
  %"ifcond" = icmp ne i32 %".21", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ret i32 0
if.then:
  ret i32 1
if.end:
  %"a_char.2" = load i8, i8* %"a_char"
  %".24" = icmp eq i8 %"a_char.2", 0
  %".25" = zext i1 %".24" to i32
  %"b_char.2" = load i8, i8* %"b_char"
  %".26" = icmp eq i8 %"b_char.2", 0
  %".27" = zext i1 %".26" to i32
  %".28" = icmp ne i32 %".25", 0
  %".29" = icmp ne i32 %".27", 0
  %".30" = or i1 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  %"ifcond.1" = icmp ne i32 %".31", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  ret i32 0
if.end.1:
  %"a_char.3" = load i8, i8* %"a_char"
  %"b_char.3" = load i8, i8* %"b_char"
  %".34" = icmp ne i8 %"a_char.3", %"b_char.3"
  %".35" = zext i1 %".34" to i32
  %"ifcond.2" = icmp ne i32 %".35", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then.2:
  ret i32 0
if.end.2:
  %"index.3" = load i32, i32* %"index"
  %".38" = load i32, i32* %"index"
  %".39" = add i32 %".38", 1
  store i32 %".39", i32* %"index"
  br label %"while.cond"
}

define void @"addEntry"(%"struct.map"* %".1", i8* %".2", i32 %".3")
{
entry:
  %"map" = alloca %"struct.map"*
  store %"struct.map"* %".1", %"struct.map"** %"map"
  %"key" = alloca i8*
  store i8* %".2", i8** %"key"
  %"value" = alloca i32
  store i32 %".3", i32* %"value"
  %"a" = alloca i32
  %".8" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".8", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  %".9" = load i32, i32* %"gep_size"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"gep_size"
  store i32 %".10", i32* %"a"
  ;  Source: map->nodes
  %".14" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_nodes" = getelementptr inbounds %"struct.map", %"struct.map"* %".14", i32 0, i32 0
  %"load_nodes" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes"
  ;  Source: map->nodes
  %".16" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_nodes.1" = getelementptr inbounds %"struct.map", %"struct.map"* %".16", i32 0, i32 0
  %"load_nodes.1" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes.1"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: sizeof(structmapEntry)*a
  %".21" = mul i32 %".18", %"a.1"
  ;  Source: realloc(map->nodes,sizeof(structmapEntry)*a)
  %".23" = bitcast %"struct.mapEntry"* %"load_nodes.1" to i8*
  %".24" = call i8* @"realloc"(i8* %".23", i32 %".21")
  ;  Source: map->nodes=realloc(map->nodes,sizeof(structmapEntry)*a);
  %".26" = bitcast i8* %".24" to %"struct.mapEntry"*
  store %"struct.mapEntry"* %".26", %"struct.mapEntry"** %"gep_nodes"
  ;  Source: (map->nodes+(a-1))->map_key
  %".29" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_nodes.2" = getelementptr inbounds %"struct.map", %"struct.map"* %".29", i32 0, i32 0
  %"load_nodes.2" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes.2"
  %"a.2" = load i32, i32* %"a"
  %".30" = sub i32 %"a.2", 1
  %".31" = getelementptr %"struct.mapEntry", %"struct.mapEntry"* %"load_nodes.2", i32 %".30"
  %"gep_map_key" = getelementptr inbounds %"struct.mapEntry", %"struct.mapEntry"* %".31", i32 0, i32 0
  %"load_map_key" = load i8*, i8** %"gep_map_key"
  ;  Source: key
  %"key.1" = load i8*, i8** %"key"
  ;  Source: (map->nodes+(a-1))->map_key=key;
  store i8* %"key.1", i8** %"gep_map_key"
  ;  Source: (map->nodes+(a-1))->map_value
  %".36" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_nodes.3" = getelementptr inbounds %"struct.map", %"struct.map"* %".36", i32 0, i32 0
  %"load_nodes.3" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes.3"
  %"a.3" = load i32, i32* %"a"
  %".37" = sub i32 %"a.3", 1
  %".38" = getelementptr %"struct.mapEntry", %"struct.mapEntry"* %"load_nodes.3", i32 %".37"
  %"gep_map_value" = getelementptr inbounds %"struct.mapEntry", %"struct.mapEntry"* %".38", i32 0, i32 1
  %"load_map_value" = load i32, i32* %"gep_map_value"
  ;  Source: value
  %"value.1" = load i32, i32* %"value"
  ;  Source: (map->nodes+(a-1))->map_value=value;
  store i32 %"value.1", i32* %"gep_map_value"
  ret void
}

define i32 @"getEntry"(%"struct.map"* %".1", i8* %".2")
{
entry:
  %"map" = alloca %"struct.map"*
  store %"struct.map"* %".1", %"struct.map"** %"map"
  %"key" = alloca i8*
  store i8* %".2", i8** %"key"
  %"i" = alloca i32
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".10" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".10", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  %".11" = icmp slt i32 %"i.2", %"load_size"
  %".12" = zext i1 %".11" to i32
  %"whilecond" = icmp ne i32 %".12", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"map_key" = alloca i8*
  %".14" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_nodes" = getelementptr inbounds %"struct.map", %"struct.map"* %".14", i32 0, i32 0
  %"load_nodes" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes"
  %"i.3" = load i32, i32* %"i"
  %".15" = getelementptr %"struct.mapEntry", %"struct.mapEntry"* %"load_nodes", i32 %"i.3"
  %"gep_map_key" = getelementptr inbounds %"struct.mapEntry", %"struct.mapEntry"* %".15", i32 0, i32 0
  %"load_map_key" = load i8*, i8** %"gep_map_key"
  store i8* %"load_map_key", i8** %"map_key"
  %"map_key.1" = load i8*, i8** %"map_key"
  %"key.1" = load i8*, i8** %"key"
  %".17" = call i32 @"equal"(i8* %"map_key.1", i8* %"key.1")
  %"ifcond" = icmp ne i32 %".17", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return-1;
  ret i32 -1
if.then:
  %".19" = load %"struct.map"*, %"struct.map"** %"map"
  %"gep_nodes.1" = getelementptr inbounds %"struct.map", %"struct.map"* %".19", i32 0, i32 0
  %"load_nodes.1" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes.1"
  %"i.4" = load i32, i32* %"i"
  %".20" = getelementptr %"struct.mapEntry", %"struct.mapEntry"* %"load_nodes.1", i32 %"i.4"
  %"gep_map_value" = getelementptr inbounds %"struct.mapEntry", %"struct.mapEntry"* %".20", i32 0, i32 1
  %"load_map_value" = load i32, i32* %"gep_map_value"
  ret i32 %"load_map_value"
if.end:
  %"i.5" = load i32, i32* %"i"
  %".22" = load i32, i32* %"i"
  %".23" = add i32 %".22", 1
  store i32 %".23", i32* %"i"
  br label %"while.cond"
}

define %"struct.map"* @"create_map"()
{
entry:
  %"m" = alloca %"struct.map"*
  %".2" = getelementptr i32, i32* null, i32 1
  %".3" = ptrtoint i32* %".2" to i32
  %".4" = call i8* @"malloc"(i32 %".3")
  %".5" = bitcast i8* %".4" to %"struct.map"*
  store %"struct.map"* %".5", %"struct.map"** %"m"
  ;  Source: m->size
  %".8" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".8", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  ;  Source: m->size=0;
  store i32 0, i32* %"gep_size"
  ;  Source: m->nodes
  %".12" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_nodes" = getelementptr inbounds %"struct.map", %"struct.map"* %".12", i32 0, i32 0
  %"load_nodes" = load %"struct.mapEntry"*, %"struct.mapEntry"** %"gep_nodes"
  ;  Source: sizeof(structmapEntry)
  %".14" = getelementptr i32, i32* null, i32 1
  %".15" = ptrtoint i32* %".14" to i32
  ;  Source: malloc(sizeof(structmapEntry))
  %".17" = call i8* @"malloc"(i32 %".15")
  ;  Source: m->nodes=malloc(sizeof(structmapEntry));
  %".19" = bitcast i8* %".17" to %"struct.mapEntry"*
  store %"struct.mapEntry"* %".19", %"struct.mapEntry"** %"gep_nodes"
  ;  Source: returnm;
  %"m.1" = load %"struct.map"*, %"struct.map"** %"m"
  ret %"struct.map"* %"m.1"
}

define i32 @"main"()
{
entry:
  %"m" = alloca %"struct.map"*
  %".2" = call %"struct.map"* @"create_map"()
  store %"struct.map"* %".2", %"struct.map"** %"m"
  ;  Source: m
  %"m.1" = load %"struct.map"*, %"struct.map"** %"m"
  %".5" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: addEntry(m,"lala",5);
  call void @"addEntry"(%"struct.map"* %"m.1", i8* %".5", i32 5)
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: m->size
  %".10" = load %"struct.map"*, %"struct.map"** %"m"
  %"gep_size" = getelementptr inbounds %"struct.map", %"struct.map"* %".10", i32 0, i32 1
  %"load_size" = load i32, i32* %"gep_size"
  ;  Source: printf("%d",m->size);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"load_size")
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  %".14" = bitcast [4 x i8]* @"str.3" to i8*
  %".15" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: equal("aaa","aa")
  %".17" = call i32 @"equal"(i8* %".14", i8* %".15")
  ;  Source: printf("%d",equal("aaa","aa"));
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  %".20" = bitcast [3 x i8]* @"str.5" to i8*
  %".21" = bitcast [4 x i8]* @"str.6" to i8*
  %".22" = bitcast [4 x i8]* @"str.7" to i8*
  ;  Source: equal("aaa","abb")
  %".24" = call i32 @"equal"(i8* %".21", i8* %".22")
  ;  Source: printf("%d",equal("aaa","abb"));
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".24")
  %".27" = bitcast [3 x i8]* @"str.8" to i8*
  %".28" = bitcast [4 x i8]* @"str.9" to i8*
  %".29" = bitcast [4 x i8]* @"str.10" to i8*
  ;  Source: equal("aaa","aaa")
  %".31" = call i32 @"equal"(i8* %".28", i8* %".29")
  ;  Source: printf("%d",equal("aaa","aaa"));
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".31")
  %".34" = bitcast [3 x i8]* @"str.11" to i8*
  %".35" = bitcast [4 x i8]* @"str.12" to i8*
  %".36" = bitcast [1 x i8]* @"str.13" to i8*
  ;  Source: equal("aaa","")
  %".38" = call i32 @"equal"(i8* %".35", i8* %".36")
  ;  Source: printf("%d",equal("aaa",""));
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".38")
  %"v" = alloca i32
  %"m.2" = load %"struct.map"*, %"struct.map"** %"m"
  %".41" = bitcast [5 x i8]* @"str.14" to i8*
  %".42" = call i32 @"getEntry"(%"struct.map"* %"m.2", i8* %".41")
  store i32 %".42", i32* %"v"
  %".44" = bitcast [3 x i8]* @"str.15" to i8*
  ;  Source: v
  %"v.1" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %"v.1")
  ;  Source: m
  %"m.3" = load %"struct.map"*, %"struct.map"** %"m"
  ;  Source: free(m);
  %".50" = bitcast %"struct.map"* %"m.3" to i8*
  call void @"free"(i8* %".50")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"lala\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [4 x i8] c"aaa\00"
@"str.4" = internal constant [3 x i8] c"aa\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [4 x i8] c"aaa\00"
@"str.7" = internal constant [4 x i8] c"abb\00"
@"str.8" = internal constant [3 x i8] c"%d\00"
@"str.9" = internal constant [4 x i8] c"aaa\00"
@"str.10" = internal constant [4 x i8] c"aaa\00"
@"str.11" = internal constant [3 x i8] c"%d\00"
@"str.12" = internal constant [4 x i8] c"aaa\00"
@"str.13" = internal constant [1 x i8] c"\00"
@"str.14" = internal constant [5 x i8] c"lala\00"
@"str.15" = internal constant [3 x i8] c"%d\00"