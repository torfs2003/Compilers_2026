; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  ;  Source: 33+69789*(69421/51213+(2231-654));
  %".3" = add i32 33, 110127042
  ;  Source: 654*(15486-(15000+486));
  %".5" = mul i32 654, 0
  ;  Source: 1&&(1||0);
  %".7" = and i32 1, 1
  ;  Source: 0&&(1&&1);
  %".9" = and i32 0, 1
  ;  Source: 0||(0*3);
  %".11" = or i32 0, 0
  ;  Source: 1&&(!(1+0));
  %".13" = and i32 1, 0
  ;  Source: 12+(98721+36265/456)*(0+1687);
  %".15" = add i32 12, 166675600
  ;  Source: 12+(98721*0+36265/456)*(0);
  %".17" = add i32 12, 0
  ;  Source: (12321>(9656+3));
  %".19" = icmp sgt i32 12321, 9659
  %".20" = zext i1 %".19" to i32
  ;  Source: (125154<(54>-65));
  %".22" = icmp slt i32 125154, 1
  %".23" = zext i1 %".22" to i32
  ;  Source: 987842121>=212;
  %".25" = icmp sge i32 987842121, 212
  %".26" = zext i1 %".25" to i32
  ;  Source: -6549<=(2189+63);
  %".28" = icmp sle i32 -6549, 2252
  %".29" = zext i1 %".28" to i32
  ;  Source: 0>=(-564654);
  %".31" = icmp sge i32 0, -564654
  %".32" = zext i1 %".31" to i32
  ;  Source: 540!=58973;
  %".34" = icmp ne i32 540, 58973
  %".35" = zext i1 %".34" to i32
  ;  Source: -5!=-5;
  %".37" = icmp ne i32 -5, -5
  %".38" = zext i1 %".37" to i32
  ;  Source: (-5*20)!=((-4*25));
  %".40" = icmp ne i32 -100, -100
  %".41" = zext i1 %".40" to i32
  ;  Source: 9%10;
  %".43" = srem i32 9, 10
  ;  Source: 19%10;
  %".45" = srem i32 19, 10
  ;  Source: 8971%8;
  %".47" = srem i32 8971, 8
  ;  Source: 1024<<4;
  %".49" = shl i32 1024, 4
  ;  Source: 2048>>3;
  %".51" = ashr i32 2048, 3
  ;  Source: 2048>>-3;
  %".53" = ashr i32 2048, -3
  ;  Source: 23423^7345345;
  %".55" = xor i32 23423, 7345345
  ;  Source: 843&-86;
  %".57" = and i32 843, -86
  ;  Source: 954|976;
  %".59" = or i32 954, 976
  ;  Source: !9736;
  %".61" = icmp eq i32 9736, 0
  %".62" = zext i1 %".61" to i32
  ret i32 0
}
