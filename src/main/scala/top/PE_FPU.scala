package top
//=============================================================================
//  https://inst.eecs.berkeley.edu/~cs250/sp17/handouts/chisel-tutorial.pdf
//  https://github.com/zacharymikel/ieee-convert/blob/master/float.v
//============================================================================== 
import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._
import scala.sys.process.{Process, ProcessLogger}

//http://www.jhauser.us/arithmetic/HardFloat-1/doc/HardFloat-Verilog.html
//Standard IEEE formats (‘fN’)
//Recoded formats (‘recFN’)
//Raw deconstructions (‘rawFN’)

// fNToRecFN -recFNToFN -iNToRecFN -recFNToIN -recFNToRecFN

class PE_FPU extends Module {
  val io = IO(new Bundle {
    val Yi        = Input(Bits(Config.forIN.W))
    val a1        = Input(Bits(Config.forIN.W))
    val Xi        = Input(Bits(Config.forIN.W))
    val B1        = Input(Bits(Config.forIN.W))

    val Yj        = Input(Bits(Config.forIN.W))
    val a2        = Input(Bits(Config.forIN.W))
    val Xj        = Input(Bits(Config.forIN.W))
    val B2        = Input(Bits(Config.forIN.W))

    val m31_sel    = Input(Bits(2.W))
    val m32_sel    = Input(Bits(2.W))
    val m33_sel    = Input(Bits(2.W))
    val m34_sel    = Input(Bits(2.W))
    val m35_sel    = Input(Bits(2.W))
    val m36_sel    = Input(Bits(2.W))
    val m37_sel    = Input(Bits(2.W))

    val addsub_1_op   = Input(Bool())
    val addsub_2_op   = Input(Bool())

    // val mem1R1W_WR_FLAG = Input(Bool())
    // val mem1R1W_RD_FLAG = Input(Bool())

    val useINT_ALL      = Input(Bool())
    val round_ALL       = Input(UInt(3.W))
    val simMemOut       = Input(Bits(Config.forSimMemOUT.W))

    val addsum_1_final  = Output(Bits(Config.forIN.W))  
    val addsum_2_final  = Output(Bits(Config.forIN.W))
  })

//====================================
// Registers for INPUTS
//====================================
  val Yi  = RegNext(io.Yi)
  val a1  = RegNext(io.a1)
  val Xi  = RegNext(io.Xi)
  val B1  = RegNext(io.B1)

  val Yj  = RegNext(io.Yj)
  val a2  = RegNext(io.a2)
  val Xj  = RegNext(io.Xj)
  val B2  = RegNext(io.B2)
//====================================
// Registers for Selectors
//====================================
  val mux_1_sel  = RegNext(io.m31_sel)
  val mux_2_sel  = RegNext(io.m32_sel)
  val mux_3_sel  = RegNext(io.m33_sel)
  val mux_4_sel  = RegNext(io.m34_sel)
  val mux_5_sel  = RegNext(io.m35_sel)
  val mux_6_sel  = RegNext(io.m36_sel)
  val mux_7_sel  = RegNext(io.m37_sel)

  val addsub_1_op   = RegNext(io.addsub_1_op)
  val addsub_2_op   = RegNext(io.addsub_2_op)

  val useINT_ALL   = RegNext(io.useINT_ALL)
  val round_ALL   = RegNext(io.round_ALL)

  // val mem1R1W_WR_FLAG = RegNext(io.mem1R1W_WR_FLAG)
  // val mem1R1W_RD_FLAG = RegNext(io.mem1R1W_RD_FLAG)

//=======================================
// Shared regs for INPUTS
//=======================================
  val addsum_1_out  = RegInit(0.U(32.W))
  val addsum_2_out  = RegInit(0.U(32.W))
  val mult_1_out    = RegInit(0.U(32.W))
  val mult_2_out    = RegInit(0.U(32.W))
  val mem1R1W_out   = RegNext(io.simMemOut)
  //DO NOT DELETE  :  val mem1R1W_out = RegInit(0.U(32.W))

  val mux_1_out = RegInit(0.U(32.W))  
  val mux_2_out = RegInit(0.U(32.W))
  val mux_3_out = RegInit(0.U(32.W))
  val mux_4_out = RegInit(0.U(32.W))
  val mux_5_out = RegInit(0.U(32.W))  
  val mux_6_out = RegInit(0.U(32.W))
  val mux_7_out = RegInit(0.U(32.W))

//=======================================
// Layer 1  :  4 x MUX3IN
//=======================================
  val mux_1 = Module( new Mux3() )
  mux_1.io.sel := mux_1_sel
  mux_1.io.in0 := addsum_1_out
  mux_1.io.in1 := Yi
  mux_1.io.in2 := a1
  mux_1_out := mux_1.io.outIEEE
  val mux_2 = Module( new Mux3() )
  mux_2.io.sel := mux_2_sel
  mux_2.io.in0 := addsum_1_out
  mux_2.io.in1 := Yi
  mux_2.io.in2 := a1
  mux_2_out := mux_2.io.outIEEE

  val mux_3 = Module( new Mux3() )
  mux_3.io.sel := mux_3_sel
  mux_3.io.in0 := Yj
  mux_3.io.in1 := a1
  mux_3.io.in2 := 0.U(Config.WIDTH.W)
  mux_3_out := mux_3.io.outIEEE
  val mux_4 = Module( new Mux3() )
  mux_4.io.sel := mux_4_sel
  mux_4.io.in0 := Xj
  mux_4.io.in1 := B2
  mux_4.io.in2 := 0.U(Config.WIDTH.W)
  mux_4_out := mux_4.io.outIEEE

//=======================================
// Layer 2  :  Multiply
//=======================================
  val mult_1 = Module( new Mult() )
  mult_1.io.in1     := mux_1_out
  mult_1.io.in2     := mux_2_out
  mult_1.io.round   := round_ALL
  mult_1.io.useINT  := useINT_ALL
  mult_1_out        := mult_1.io.outIEEE

  val mult_2 = Module( new Mult() )
  mult_2.io.in1     := mux_3_out
  mult_2.io.in2     := mux_4_out
  mult_2.io.round   := round_ALL
  mult_2.io.useINT  := useINT_ALL
  mult_2_out        := mult_2.io.outIEEE

//=======================================
// Layer 3  :  2 X MUX from Multiply
//=======================================
  val mux_5 = Module( new Mux3() )
  mux_5.io.sel := mux_5_sel
  mux_5.io.in0 := Yi
  mux_5.io.in1 := mult_1_out
  mux_5.io.in2 := mem1R1W_out(31, 16)
  mux_5_out := mux_5.io.outIEEE

  val mux_6 = Module( new Mux3())
  mux_6.io.sel := mux_6_sel
  mux_6.io.in0 := Xi
  mux_6.io.in1 := B2
  mux_6.io.in2 := 0.U(Config.WIDTH.W)
  mux_6_out := mux_6.io.outIEEE

//io.DEBUG_OUT_layer_3 := Mux(true.B, DEBUG_mux3_5, DEBUG_mux3_6)

//=======================================
// Layer 4  :  ADD/SUB_1
//=======================================
  val addsub_1 = Module(new AddSub())
  addsub_1.io.op  := addsub_1_op
  addsub_1.io.in1 := mux_5_out
  addsub_1.io.in2 := mux_6_out
  //addsub_1.io.round := round_ALL
  addsub_1.io.useINT := useINT_ALL
  addsum_1_out := addsub_1.io.outIEEE

//=======================================
// Layer 5  :  MUX_7
//=======================================
  val mux_7 = Module( new Mux3())
  mux_7.io.sel := mux_7_sel
  mux_7.io.in0 := mult_1_out
  mux_7.io.in1 := addsum_1_out
  mux_7.io.in2 := 0.U(Config.WIDTH.W)

  mux_7_out := mux_7.io.outIEEE

//=======================================
// Layer 6  :  ADD/SUB_2
//=======================================
  val addsub_2 = Module(new AddSub())
  addsub_2.io.op  := addsub_2_op
  addsub_2.io.in1 := mux_7_out
  addsub_2.io.in2 := mem1R1W_out(15,0)
  //addsub_2.io.round := round_ALL
  addsub_2.io.useINT := useINT_ALL
  addsum_2_out := addsub_2.io.outIEEE

  io.addsum_1_final := addsum_1_out
  io.addsum_2_final := addsum_2_out


// //=======================================
// // Layer 7  :  Memory
// //=======================================
//   val mem1R1W = Module(new Mem1R1W())
//   mem1R1W.io.WR_FLAG   := mem1R1W_WR_FLAG
//   mem1R1W.io.RD_FLAG   := mem1R1W_RD_FLAG
//   mem1R1W.io.RD_ADDR  := 0.U
//   mem1R1W.io.WR_DATA  := 0.U
//   mem1R1W.io.WR_ADDR  := 0.U
//   mem1R1W_out := mem1R1W.io.RD_DATA
}

object PE_FPU extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_FPU_Top"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_FPU))
  )

  // (new ChiselStage).execute(
  //   Array("--compiler", "sverilog",
  //     "--target-dir", verilogDir,
  //     "--output-file", verilogName),
  //   Seq(ChiselGeneratorAnnotation(() => new PE_FPU))
  // )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_FPU))
  )
}