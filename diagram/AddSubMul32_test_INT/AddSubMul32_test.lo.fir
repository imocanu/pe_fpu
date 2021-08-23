circuit AddSubMul32 :
  module AddSubMul32 :
    input clock : Clock
    input reset : UInt<1>
    input io_in0 : SInt<32>
    input io_in1 : SInt<32>
    output io_outAdd : SInt<33>
    output io_outSub : SInt<33>
    output io_outMul : SInt<33>

    reg input_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), input_0) @[AddSubMul32.scala 19:25]
    reg input_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), input_1) @[AddSubMul32.scala 20:25]
    node _io_outAdd_T = add(input_0, input_1) @[AddSubMul32.scala 22:24]
    node _io_outAdd_T_1 = tail(_io_outAdd_T, 1) @[AddSubMul32.scala 22:24]
    node _io_outAdd_T_2 = asSInt(_io_outAdd_T_1) @[AddSubMul32.scala 22:24]
    node _io_outSub_T = sub(input_0, input_1) @[AddSubMul32.scala 23:24]
    node _io_outSub_T_1 = tail(_io_outSub_T, 1) @[AddSubMul32.scala 23:24]
    node _io_outSub_T_2 = asSInt(_io_outSub_T_1) @[AddSubMul32.scala 23:24]
    node _io_outMul_T = mul(input_0, input_1) @[AddSubMul32.scala 24:24]
    io_outAdd <= _io_outAdd_T_2 @[AddSubMul32.scala 22:13]
    io_outSub <= _io_outSub_T_2 @[AddSubMul32.scala 23:13]
    io_outMul <= asSInt(bits(_io_outMul_T, 32, 0)) @[AddSubMul32.scala 24:13]
    input_0 <= io_in0 @[AddSubMul32.scala 19:25]
    input_1 <= io_in1 @[AddSubMul32.scala 20:25]
