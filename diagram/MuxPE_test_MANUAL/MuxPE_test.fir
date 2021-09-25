circuit MuxPE :
  module MuxPE :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_0 : UInt<32>, flip in_1 : UInt<32>, flip in_2 : UInt<32>, flip in_3 : UInt<32>, flip sel : UInt<2>, out : UInt<32>}

    reg sel : UInt, clock with :
      reset => (UInt<1>("h0"), sel) @[MuxPE.scala 20:21]
    sel <= io.sel @[MuxPE.scala 20:21]
    reg in_0 : UInt, clock with :
      reset => (UInt<1>("h0"), in_0) @[MuxPE.scala 21:21]
    in_0 <= io.in_0 @[MuxPE.scala 21:21]
    reg in_1 : UInt, clock with :
      reset => (UInt<1>("h0"), in_1) @[MuxPE.scala 22:21]
    in_1 <= io.in_1 @[MuxPE.scala 22:21]
    reg in_2 : UInt, clock with :
      reset => (UInt<1>("h0"), in_2) @[MuxPE.scala 23:21]
    in_2 <= io.in_2 @[MuxPE.scala 23:21]
    reg in_3 : UInt, clock with :
      reset => (UInt<1>("h0"), in_3) @[MuxPE.scala 24:21]
    in_3 <= io.in_3 @[MuxPE.scala 24:21]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[MuxPE.scala 25:21]
    node _T = eq(sel, UInt<2>("h0")) @[MuxPE.scala 27:14]
    when _T : @[MuxPE.scala 28:3]
      out <= in_0 @[MuxPE.scala 29:9]
    else :
      node _T_1 = eq(sel, UInt<2>("h1")) @[MuxPE.scala 31:20]
      when _T_1 : @[MuxPE.scala 32:3]
        out <= in_1 @[MuxPE.scala 33:9]
      else :
        node _T_2 = eq(sel, UInt<2>("h2")) @[MuxPE.scala 35:20]
        when _T_2 : @[MuxPE.scala 36:3]
          out <= in_2 @[MuxPE.scala 37:9]
        else :
          out <= in_3 @[MuxPE.scala 41:9]
    io.out <= out @[MuxPE.scala 44:10]

