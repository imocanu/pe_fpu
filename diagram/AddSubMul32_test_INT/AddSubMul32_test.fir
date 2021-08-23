;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit AddSubMul32 : 
  module AddSubMul32 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : SInt<32>, flip in1 : SInt<32>, outAdd : SInt<33>, outSub : SInt<33>, outMul : SInt<33>}
    
    reg input_0 : SInt, clock @[AddSubMul32.scala 19:25]
    input_0 <= io.in0 @[AddSubMul32.scala 19:25]
    reg input_1 : SInt, clock @[AddSubMul32.scala 20:25]
    input_1 <= io.in1 @[AddSubMul32.scala 20:25]
    node _io_outAdd_T = add(input_0, input_1) @[AddSubMul32.scala 22:24]
    node _io_outAdd_T_1 = tail(_io_outAdd_T, 1) @[AddSubMul32.scala 22:24]
    node _io_outAdd_T_2 = asSInt(_io_outAdd_T_1) @[AddSubMul32.scala 22:24]
    io.outAdd <= _io_outAdd_T_2 @[AddSubMul32.scala 22:13]
    node _io_outSub_T = sub(input_0, input_1) @[AddSubMul32.scala 23:24]
    node _io_outSub_T_1 = tail(_io_outSub_T, 1) @[AddSubMul32.scala 23:24]
    node _io_outSub_T_2 = asSInt(_io_outSub_T_1) @[AddSubMul32.scala 23:24]
    io.outSub <= _io_outSub_T_2 @[AddSubMul32.scala 23:13]
    node _io_outMul_T = mul(input_0, input_1) @[AddSubMul32.scala 24:24]
    io.outMul <= _io_outMul_T @[AddSubMul32.scala 24:13]
    
