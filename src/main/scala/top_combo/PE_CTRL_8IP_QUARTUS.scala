package top_combo

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import top._
import utils._

class PE_CTRL_8IP_QUARTUS extends Module {
  val io = IO(new Bundle {
    val Xi_0_in_0     = Input(Bits(Config.forIN.W))
    val Yi_0_in_0     = Input(Bits(Config.forIN.W))
    val Xi_0_in_1     = Input(Bits(Config.forIN.W))
    val Yi_0_in_1     = Input(Bits(Config.forIN.W))

    val op_type       = Input(UInt(2.W))

    val use_int       = Input(Bool())
    val tininess      = Input(UInt(1.W))
    val rounding      = Input(UInt(3.W))

    val out     = Output(Bits(Config.forIN.W))
    val dbg_fsm = Output(UInt(4.W))  
  })

//====================================
// Registers for INPUTS
//====================================
  val Xi_0_in_0  = RegNext(io.Xi_0_in_0)
  val Yi_0_in_0  = RegNext(io.Yi_0_in_0)
  val Xi_0_in_1  = RegNext(io.Xi_0_in_1)
  val Yi_0_in_1  = RegNext(io.Yi_0_in_1)

  // PE_OPERATION type
  val op_type   = WireDefault(io.op_type)

  // ROUNDING type
  val rounding     = RegNext(io.rounding)
  // TININESS type
  val tininess     = RegNext(io.tininess)
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//====================================
// DEBUG
//====================================
  val dbg_aggr0 = RegInit(0.U(Config.forIN.W))
  val dbg_aggr1 = RegInit(0.U(Config.forIN.W))

//=======================================
// CONTROLLER
//=======================================
  val ctrlPE = Module(new PE_CTRL())
  ctrlPE.io.op_type := op_type
  io.dbg_fsm := ctrlPE.io.dbg_fsm

//=======================================
// PE_8IP module
//=======================================
  val pe_8IP = Module(new PE_8IP())
  pe_8IP.io.use_int  := use_int
  pe_8IP.io.tininess := tininess
  pe_8IP.io.rounding := rounding

  pe_8IP.io.Xi_0_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_0_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_0_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_0_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_1_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_1_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_1_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_1_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_2_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_2_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_2_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_2_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_3_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_3_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_3_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_3_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_4_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_4_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_4_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_4_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_5_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_5_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_5_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_5_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_6_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_6_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_6_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_6_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_7_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_7_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_7_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_7_in_1 := Yi_0_in_1

  pe_8IP.io.m_0_sel := ctrlPE.io.m_0_sel
  pe_8IP.io.m_1_sel := ctrlPE.io.m_1_sel
  pe_8IP.io.m_2_sel := ctrlPE.io.m_2_sel
  pe_8IP.io.m_3_sel := ctrlPE.io.m_3_sel
  pe_8IP.io.m_4_sel := ctrlPE.io.m_4_sel
  pe_8IP.io.m_5_sel := ctrlPE.io.m_5_sel
  pe_8IP.io.m_6_sel := ctrlPE.io.m_6_sel
  pe_8IP.io.m_7_sel := ctrlPE.io.m_7_sel
  pe_8IP.io.m_8_sel := ctrlPE.io.m_8_sel
  pe_8IP.io.m_9_sel := ctrlPE.io.m_9_sel

  pe_8IP.io.addsub_0_op := ctrlPE.io.addsub_0_op
  pe_8IP.io.addsub_1_op := ctrlPE.io.addsub_1_op

  dbg_aggr0 := pe_8IP.io.dbg_aggr0
  dbg_aggr1 := pe_8IP.io.dbg_aggr1

  io.out := pe_8IP.io.out 
}

object PE_CTRL_8IP_QUARTUS extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_CTRL_8IP_QUARTUS"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_CTRL_8IP_QUARTUS))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_CTRL_8IP_QUARTUS))
  )
}