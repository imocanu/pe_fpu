circuit MuxPE :
  module MuxPE :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    input io_in_2 : UInt<32>
    input io_in_3 : UInt<32>
    input io_sel : UInt<2>
    output io_out : UInt<32>

    reg sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), sel) @[MuxPE.scala 20:21]
    reg in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_0) @[MuxPE.scala 21:21]
    reg in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_1) @[MuxPE.scala 22:21]
    reg in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_2) @[MuxPE.scala 23:21]
    reg in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_3) @[MuxPE.scala 24:21]
    reg out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), out) @[MuxPE.scala 25:21]
    node _T = eq(sel, UInt<2>("h0")) @[MuxPE.scala 27:14]
    node _T_1 = eq(sel, UInt<2>("h1")) @[MuxPE.scala 31:20]
    node _T_2 = eq(sel, UInt<2>("h2")) @[MuxPE.scala 35:20]
    node _GEN_0 = mux(_T_2, in_2, in_3) @[MuxPE.scala 36:3 37:9 41:9]
    node _GEN_1 = mux(_T_1, in_1, _GEN_0) @[MuxPE.scala 32:3 33:9]
    node _GEN_2 = mux(_T, in_0, _GEN_1) @[MuxPE.scala 28:3 29:9]
    io_out <= out @[MuxPE.scala 44:10]
    sel <= io_sel @[MuxPE.scala 20:21]
    in_0 <= io_in_0 @[MuxPE.scala 21:21]
    in_1 <= io_in_1 @[MuxPE.scala 22:21]
    in_2 <= io_in_2 @[MuxPE.scala 23:21]
    in_3 <= io_in_3 @[MuxPE.scala 24:21]
    out <= mux(reset, UInt<32>("h0"), _GEN_2) @[MuxPE.scala 25:{21,21}]
