// package top
// //=============================================================================
// //  https://inst.eecs.berkeley.edu/~cs250/sp17/handouts/chisel-tutorial.pdf
// //  https://github.com/zacharymikel/ieee-convert/blob/master/float.v
// //============================================================================== 
// import chisel3.stage._
// import layered.stage._
// import chisel3._
// import chisel3.util._
// import imp._
// import utils._
// import scala.sys.process.{Process, ProcessLogger}


// class PE_FPU_IMP extends Module {
//   val io = IO(new Bundle {
//     val Yi        = Input(Bits(Config.forIN.W))
//     val a1        = Input(Bits(Config.forIN.W))
//     val Xi        = Input(Bits(Config.forIN.W))
//     val B1        = Input(Bits(Config.forIN.W))

//     val Yj        = Input(Bits(Config.forIN.W))
//     val a2        = Input(Bits(Config.forIN.W))
//     val Xj        = Input(Bits(Config.forIN.W))
//     val B2        = Input(Bits(Config.forIN.W))

//     val m31_sel    = Input(Bits(2.W))
//     val m32_sel    = Input(Bits(2.W))
//     val m33_sel    = Input(Bits(2.W))
//     val m34_sel    = Input(Bits(2.W))
//     val m35_sel    = Input(Bits(2.W))
//     val m36_sel    = Input(Bits(2.W))
//     val m37_sel    = Input(Bits(2.W))

//     val addsub_1_op   = Input(Bool())
//     val addsub_2_op   = Input(Bool())

//     // val mem1R1W_WR_FLAG = Input(Bool())
//     // val mem1R1W_RD_FLAG = Input(Bool())

//     val useINT_ALL      = Input(Bool())
//     val simMemOut       = Input(Bits(Config.forSimMemOUT.W))

//     val addsum_1_final  = Output(Bits(Config.forIN.W))  
//     val addsum_2_final  = Output(Bits(Config.forIN.W))
//   })

// //====================================
// // Registers for INPUTS
// //====================================
//   val Yi  = RegNext(io.Yi)
//   val a1  = RegNext(io.a1)
//   val Xi  = RegNext(io.Xi)
//   val B1  = RegNext(io.B1)

//   val Yj  = RegNext(io.Yj)
//   val a2  = RegNext(io.a2)
//   val Xj  = RegNext(io.Xj)
//   val B2  = RegNext(io.B2)
// //====================================
// // Registers for Selectors
// //====================================
//   val mux_1_sel  = RegNext(io.m31_sel)
//   val mux_2_sel  = RegNext(io.m32_sel)
//   val mux_3_sel  = RegNext(io.m33_sel)
//   val mux_4_sel  = RegNext(io.m34_sel)
//   val mux_5_sel  = RegNext(io.m35_sel)
//   val mux_6_sel  = RegNext(io.m36_sel)
//   val mux_7_sel  = RegNext(io.m37_sel)

//   val addsub_1_op   = RegNext(io.addsub_1_op)
//   val addsub_2_op   = RegNext(io.addsub_2_op)

//   val useINT_ALL   = RegNext(io.useINT_ALL)
// //=======================================
// // Shared regs for INPUTS
// //=======================================
//   val addsum_1_out  = RegInit(0.U(32.W))
//   val addsum_2_out  = RegInit(0.U(32.W))
//   val mult_1_out    = RegInit(0.U(32.W))
//   val mult_2_out    = RegInit(0.U(32.W))
//   val mem1R1W_out   = RegNext(io.simMemOut)

//   val mux_1_out = RegInit(0.U(32.W))  
//   val mux_2_out = RegInit(0.U(32.W))
//   val mux_3_out = RegInit(0.U(32.W))
//   val mux_4_out = RegInit(0.U(32.W))
//   val mux_5_out = RegInit(0.U(32.W))  
//   val mux_6_out = RegInit(0.U(32.W))
//   val mux_7_out = RegInit(0.U(32.W))

// //=======================================
// // Layer 1  :  4 x MUX3 IN
// //=======================================
//   val mux_1 = Module( new Mux3_IMP() )
//   mux_1.io.sel := mux_1_sel
//   mux_1.io.in0 := addsum_1_out
//   mux_1.io.in1 := Yi
//   mux_1.io.in2 := a1
//   mux_1_out := mux_1.io.out
//   val mux_2 = Module( new Mux3_IMP() )
//   mux_2.io.sel := mux_2_sel
//   mux_2.io.in0 := Xi
//   mux_2.io.in1 := B1
//   mux_2.io.in2 := addsum_1_out
//   mux_2_out := mux_2.io.out

//   val mux_3 = Module( new Mux3_IMP() )
//   mux_3.io.sel := mux_3_sel
//   mux_3.io.in0 := Yj
//   mux_3.io.in1 := a2
//   mux_3.io.in2 := 0.U(Config.WIDTH.W)
//   mux_3_out := mux_3.io.out
//   val mux_4 = Module( new Mux3_IMP() )
//   mux_4.io.sel := mux_4_sel
//   mux_4.io.in0 := Xj
//   mux_4.io.in1 := B2
//   mux_4.io.in2 := 0.U(Config.WIDTH.W)
//   mux_4_out := mux_4.io.out
// //=======================================
// // Layer 2  :  Multiply
// //=======================================
//   val mult_1 = Module( new Mult_IMP() )
//   mult_1.io.in0     := mux_1_out
//   mult_1.io.in1     := mux_2_out
//   mult_1_out        := mult_1.io.out

//   val mult_2 = Module( new Mult_IMP() )
//   mult_2.io.in0     := mux_3_out
//   mult_2.io.in1     := mux_4_out
//   mult_2_out        := mult_2.io.out
// //=======================================
// // Layer 3  :  2 X MUX from Multiply
// //=======================================
//   val mux_5 = Module( new Mux3_IMP() )
//   mux_5.io.sel := mux_5_sel
//   mux_5.io.in0 := Yi
//   mux_5.io.in1 := mult_1_out
//   mux_5.io.in2 := mem1R1W_out(31, 16)
//   mux_5_out := mux_5.io.out

//   val mux_6 = Module( new Mux3_IMP())
//   mux_6.io.sel := mux_6_sel
//   mux_6.io.in0 := Xi
//   mux_6.io.in1 := mult_2_out
//   mux_6.io.in2 := 0.U(Config.WIDTH.W)
//   mux_6_out := mux_6.io.out
// //=======================================
// // Layer 4  :  ADD/SUB_1
// //=======================================
//   val addsub_1 = Module(new AddSub_IMP())
//   addsub_1.io.op  := addsub_1_op
//   addsub_1.io.in0 := mux_5_out
//   addsub_1.io.in1 := mux_6_out
//   addsum_1_out := addsub_1.io.out
// //=======================================
// // Layer 5  :  MUX_7
// //=======================================
//   val mux_7 = Module( new Mux3_IMP())
//   mux_7.io.sel := mux_7_sel
//   mux_7.io.in0 := mult_1_out
//   mux_7.io.in1 := addsum_1_out
//   mux_7.io.in2 := 0.U(Config.WIDTH.W)
//   mux_7_out := mux_7.io.out
// //=======================================
// // Layer 6  :  ADD/SUB_2
// //=======================================
//   val addsub_2 = Module(new AddSub_IMP())
//   addsub_2.io.op  := addsub_2_op
//   addsub_2.io.in0 := mux_7_out
//   addsub_2.io.in1 := mem1R1W_out(15, 0)
//   addsum_2_out := addsub_2.io.out

//   io.addsum_1_final := addsum_1_out
//   io.addsum_2_final := addsum_2_out
// }

// object PE_FPU_IMP extends App {
//   val verilogDir = "rtl"
//   val verilogName = "PE_FPU_IMP"
//   (new ChiselStage).execute(
//     Array("--compiler", "verilog",
//       "--target-dir", verilogDir,
//       "--output-file", verilogName),
//     Seq(ChiselGeneratorAnnotation(() => new PE_FPU_IMP))
//   )

//   val targetDir = "diagram"
//   (new ElkStage).execute(Array("--target-dir", targetDir),
//     Seq(ChiselGeneratorAnnotation(() => new PE_FPU_IMP))
//   )
// }