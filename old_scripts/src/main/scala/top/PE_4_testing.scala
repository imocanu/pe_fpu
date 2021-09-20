package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._
import hardfloat._
import scala.sys.process.{Process, ProcessLogger}

class PE_4_testing extends Module {
  val io = IO(new Bundle {
    val Xi_0       = Input(Bits(Config.forIN.W))
    val Yi_0       = Input(Bits(Config.forIN.W))

    val Xi_1       = Input(Bits(Config.forIN.W))
    val Yi_1       = Input(Bits(Config.forIN.W))

    val aggr_0     = Input(Bits(Config.forIN.W))
    val aggr_1     = Input(Bits(Config.forIN.W))
    val aggr_2     = Input(Bits(Config.forIN.W))
    val aggr_3     = Input(Bits(Config.forIN.W))

    val m_0_sel    = Input(Bits(2.W))
    val m_1_sel    = Input(Bits(2.W))
    val m_2_sel    = Input(Bits(2.W))
    val m_3_sel    = Input(Bits(2.W))
    val m_4_sel    = Input(Bits(2.W))
    val m_5_sel    = Input(Bits(2.W))
    val m_6_sel    = Input(Bits(2.W))
    val m_7_sel    = Input(Bits(2.W))
    val m_8_sel    = Input(Bits(2.W))
    val m_9_sel    = Input(Bits(2.W))

    val addsub_0_op   = Input(Bool())
    val addsub_1_op   = Input(Bool())

    val rounding    = Input(UInt(3.W))
    val tininess    = Input(UInt(1.W))
    val use_int     = Input(Bool())

    val out_0  = Output(Bits(Config.forIN.W))  
    val out_1  = Output(Bits(Config.forIN.W))
  })
//====================================
// INPUTS
//====================================
  val Xi_0  = RegNext(io.Xi_0)
  val Yi_0  = RegNext(io.Yi_0)

  val Xi_1  = RegNext(io.Xi_1)
  val Yi_1  = RegNext(io.Yi_1)

  val Xi_recFN_0  = RegInit(0.U(32.W))
  val Yi_recFN_0  = RegInit(0.U(32.W))

  val Xi_recFN_1  = RegInit(0.U(32.W))
  val Yi_recFN_1  = RegInit(0.U(32.W))

  val out_final_0  = RegInit(0.U(32.W))
  val out_final_1  = RegInit(0.U(32.W))

//====================================
// INPUTS
//====================================
  val aggr_0  = RegNext(io.aggr_0)
  val aggr_1  = RegNext(io.aggr_0)

  val aggr_2  = RegNext(io.aggr_0)
  val aggr_3  = RegNext(io.aggr_0)

//====================================
// Selectors
//====================================
  val m_0_sel  = RegNext(io.m_0_sel)
  val m_1_sel  = RegNext(io.m_1_sel)
  val m_2_sel  = RegNext(io.m_2_sel)
  val m_3_sel  = RegNext(io.m_3_sel)
  val m_4_sel  = RegNext(io.m_4_sel)
  val m_5_sel  = RegNext(io.m_5_sel)
  val m_6_sel  = RegNext(io.m_6_sel)
  val m_7_sel  = RegNext(io.m_7_sel)
  val m_8_sel  = RegNext(io.m_8_sel)
  val m_9_sel  = RegNext(io.m_9_sel)

  val addsub_0_op  = RegNext(io.addsub_0_op)
  val addsub_1_op  = RegNext(io.addsub_1_op)

  // Rounding type
  val rounding     = RegNext(io.rounding)
  // Tininess type
  val tininess     = RegNext(io.tininess)
  // Use INTEGER
  val use_int      = RegNext(io.use_int)

  when ( use_int ) {
    val iNToRecFN_0 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_0.io.signedIn := true.B
    iNToRecFN_0.io.in := Xi_0
    iNToRecFN_0.io.roundingMode   := rounding
    iNToRecFN_0.io.detectTininess := tininess
    Xi_recFN_0  := iNToRecFN_0.io.out

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := Yi_0
    iNToRecFN_1.io.roundingMode   := rounding
    iNToRecFN_1.io.detectTininess := tininess
    Yi_recFN_0  := iNToRecFN_1.io.out

    val iNToRecFN_2 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_2.io.signedIn := true.B
    iNToRecFN_2.io.in := Xi_1
    iNToRecFN_2.io.roundingMode   := rounding
    iNToRecFN_2.io.detectTininess := tininess
    Xi_recFN_1  := iNToRecFN_2.io.out

    val iNToRecFN_3 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_3.io.signedIn := true.B
    iNToRecFN_3.io.in := Yi_1
    iNToRecFN_3.io.roundingMode   := rounding
    iNToRecFN_3.io.detectTininess := tininess
    Yi_recFN_1  := iNToRecFN_3.io.out

  } . otherwise {
    Xi_recFN_0 := recFNFromFN(Config.EXP, Config.SIG, Xi_0)
    Yi_recFN_0 := recFNFromFN(Config.EXP, Config.SIG, Yi_0)

    Xi_recFN_1 := recFNFromFN(Config.EXP, Config.SIG, Xi_1)
    Yi_recFN_1 := recFNFromFN(Config.EXP, Config.SIG, Yi_1)
  }

//=======================================
// Layer 1  :  PE module
//=======================================
  val pe = Module( new PE() )
  pe.Xi_0       := Xi_0
  pe.Yi_0       := Yi_0
  pe.Xi_1       := Xi_1
  pe.Yi_1       := Yi_1

  pe.aggr_0     := aggr_0
  pe.aggr_1     := aggr_1
  pe.aggr_2     := aggr_2
  pe.aggr_3     := aggr_3

  pe.m_0_sel    := m_0_sel
  pe.m_1_sel    := m_1_sel
  pe.m_2_sel    := m_2_sel
  pe.m_3_sel    := m_3_sel
  pe.m_4_sel    := m_4_sel
  pe.m_5_sel    := m_5_sel
  pe.m_6_sel    := m_6_sel
  pe.m_7_sel    := m_7_sel
  pe.m_8_sel    := m_8_sel
  pe.m_9_sel    := m_9_sel

  pe.addsub_0_op   := addsub_0_op
  pe.addsub_1_op   := addsub_1_op

  pe.rounding    := rounding
  pe.tininess    := tininess

  when ( use_int ) {
    val iNToRecFN_4 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_4.io.signedIn := true.B
    iNToRecFN_4.io.in := pe.io.out_0
    iNToRecFN_4.io.roundingMode   := rounding
    iNToRecFN_4.io.detectTininess := tininess
    out_final_0  := iNToRecFN_4.io.out

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := pe.io.out_1
    iNToRecFN_1.io.roundingMode   := rounding
    iNToRecFN_1.io.detectTininess := tininess
    out_final_1  := iNToRecFN_1.io.out

  } . otherwise {
    out_final_0 := recFNFromFN(Config.EXP, Config.SIG, pe.io.out_0)
    out_final_1 := recFNFromFN(Config.EXP, Config.SIG, pe.io.out_1)
  }

  io.out_0 := out_final_0    
  io.out_1 := out_final_1
}

object PE_4_testing extends App {
  val verilogDir = "rtl"
  val verilogName = "PE"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
      Seq(ChiselGeneratorAnnotation(() => new PE_4_testing))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
      Seq(ChiselGeneratorAnnotation(() => new PE_4_testing))
  )
}