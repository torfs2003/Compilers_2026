; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"f"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ret void
}

define i32 @"main"()
{
entry:
  ;  Source: f('c');
  %".3" = sext i8 99 to i32
  call void @"f"(i32 %".3")
  ;  Source: return1;
  ret i32 1
}
