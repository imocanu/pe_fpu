package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import v2pack._
import utils._
import scala.sys.process.{Process, ProcessLogger}

class PE extends Module {
  val io = IO(new Bundle {
    val Xi_0        = Input(Bits(Config.forIN.W))
    val Yi_0        = Input(Bits(Config.forIN.W))

    val Xi_1        = Input(Bits(Config.forIN.W))
    val Yi_1        = Input(Bits(Config.forIN.W))

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

    val use_int     = Input(Bool())
    val round       = Input(UInt(3.W))

    val addsub_0_out  = Output(Bits(Config.forIN.W))  
    val addsub_1_out  = Output(Bits(Config.forIN.W))
  })

  io.addsub_0_out := DontCare
  io.addsub_1_out := DontCare

//====================================
// Registers for INPUTS
//====================================
  val Xi_0  = RegNext(io.Xi_0)
  val Yi_0  = RegNext(io.Yi_0)

  val Xi_1  = RegNext(io.Xi_1)
  val Yi_1  = RegNext(io.Yi_1)

//====================================
// Registers for Selectors
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

  val use_int  = RegNext(io.use_int)
  val round    = RegNext(io.round)

//=======================================
// Shared regs for INPUTS
//=======================================
  // val addsum_1_out  = RegInit(0.U(32.W))
  // val addsum_2_out  = RegInit(0.U(32.W))
  // val mult_1_out    = RegInit(0.U(32.W))
  // val mult_2_out    = RegInit(0.U(32.W))
  //val testOut = 
  //val m_0_out = WireDefault(Bits(width=Config.forIN.W)) 

  val m_0_out = RegInit(0.U(32.W)) 
  val m_1_out = RegInit(0.U(32.W))  
  val m_2_out = RegInit(0.U(32.W))
  val m_3_out = RegInit(0.U(32.W))
  val m_4_out = RegInit(0.U(32.W))
  val m_5_out = RegInit(0.U(32.W))  
  val m_6_out = RegInit(0.U(32.W))
  val m_7_out = RegInit(0.U(32.W))
  val m_8_out = RegInit(0.U(32.W))
  val m_9_out = RegInit(0.U(32.W))

//=======================================
// Layer 1  :  4 x MUX IN
//=======================================
  val m_0 = Module( new MuxPE() )
  m_0.io.sel := m_0_sel
  m_0.io.in_0 := Xi_0
  m_0.io.in_1 := Yi_0
  m_0.io.in_2 := Xi_0
  m_0.io.in_3 := DontCare
  m_0_out := m_0.io.out



//=======================================
// Layer 2  :  Multiply
//=======================================


//=======================================
// Layer 3  :  2 X MUX from Multiply
//=======================================


//=======================================
// Layer 4  :  ADD/SUB_1
//=======================================


//=======================================
// Layer 5  :  MUX_7
//=======================================


//=======================================
// Layer 6  :  ADD/SUB_2
//=======================================


}

object PE extends App {
  val verilogDir = "rtl"
  val verilogName = "PE"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE))
  )
}