package top_combo

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import top._
import utils._

class PE_CTRL_8IP extends Module {
  val io = IO(new Bundle {
    val Xi_0_in_0     = Input(Bits(Config.forIN.W))
    val Yi_0_in_0     = Input(Bits(Config.forIN.W))
    val Xi_0_in_1     = Input(Bits(Config.forIN.W))
    val Yi_0_in_1     = Input(Bits(Config.forIN.W))

    val Xi_1_in_0     = Input(Bits(Config.forIN.W))
    val Yi_1_in_0     = Input(Bits(Config.forIN.W))
    val Xi_1_in_1     = Input(Bits(Config.forIN.W))
    val Yi_1_in_1     = Input(Bits(Config.forIN.W))

    val Xi_2_in_0     = Input(Bits(Config.forIN.W))
    val Yi_2_in_0     = Input(Bits(Config.forIN.W))
    val Xi_2_in_1     = Input(Bits(Config.forIN.W))
    val Yi_2_in_1     = Input(Bits(Config.forIN.W))

    val Xi_3_in_0     = Input(Bits(Config.forIN.W))
    val Yi_3_in_0     = Input(Bits(Config.forIN.W))
    val Xi_3_in_1     = Input(Bits(Config.forIN.W))
    val Yi_3_in_1     = Input(Bits(Config.forIN.W))

    val Xi_4_in_0     = Input(Bits(Config.forIN.W))
    val Yi_4_in_0     = Input(Bits(Config.forIN.W))
    val Xi_4_in_1     = Input(Bits(Config.forIN.W))
    val Yi_4_in_1     = Input(Bits(Config.forIN.W))

    val Xi_5_in_0     = Input(Bits(Config.forIN.W))
    val Yi_5_in_0     = Input(Bits(Config.forIN.W))
    val Xi_5_in_1     = Input(Bits(Config.forIN.W))
    val Yi_5_in_1     = Input(Bits(Config.forIN.W))

    val Xi_6_in_0     = Input(Bits(Config.forIN.W))
    val Yi_6_in_0     = Input(Bits(Config.forIN.W))
    val Xi_6_in_1     = Input(Bits(Config.forIN.W))
    val Yi_6_in_1     = Input(Bits(Config.forIN.W))

    val Xi_7_in_0     = Input(Bits(Config.forIN.W))
    val Yi_7_in_0     = Input(Bits(Config.forIN.W))
    val Xi_7_in_1     = Input(Bits(Config.forIN.W))
    val Yi_7_in_1     = Input(Bits(Config.forIN.W))

    val op_type       = Input(UInt(2.W))

    val use_int       = Input(Bool())
    val tininess      = Input(UInt(1.W))
    val rounding      = Input(UInt(3.W))

    val out  = Output(Bits(Config.forIN.W))  
  })

//====================================
// Registers for INPUTS
//====================================
  val Xi_0_in_0  = RegNext(io.Xi_0_in_0)
  val Yi_0_in_0  = RegNext(io.Yi_0_in_0)
  val Xi_0_in_1  = RegNext(io.Xi_0_in_1)
  val Yi_0_in_1  = RegNext(io.Yi_0_in_1)

  val Xi_1_in_0  = RegNext(io.Xi_1_in_0)
  val Yi_1_in_0  = RegNext(io.Yi_1_in_0)
  val Xi_1_in_1  = RegNext(io.Xi_1_in_1)
  val Yi_1_in_1  = RegNext(io.Yi_1_in_1)

  val Xi_2_in_0  = RegNext(io.Xi_2_in_0)
  val Yi_2_in_0  = RegNext(io.Yi_2_in_0)
  val Xi_2_in_1  = RegNext(io.Xi_2_in_1)
  val Yi_2_in_1  = RegNext(io.Yi_2_in_1)

  val Xi_3_in_0  = RegNext(io.Xi_3_in_0)
  val Yi_3_in_0  = RegNext(io.Yi_3_in_0)
  val Xi_3_in_1  = RegNext(io.Xi_3_in_1)
  val Yi_3_in_1  = RegNext(io.Yi_3_in_1)

  val Xi_4_in_0  = RegNext(io.Xi_4_in_0)
  val Yi_4_in_0  = RegNext(io.Yi_4_in_0)
  val Xi_4_in_1  = RegNext(io.Xi_4_in_1)
  val Yi_4_in_1  = RegNext(io.Yi_4_in_1)

  val Xi_5_in_0  = RegNext(io.Xi_5_in_0)
  val Yi_5_in_0  = RegNext(io.Yi_5_in_0)
  val Xi_5_in_1  = RegNext(io.Xi_5_in_1)
  val Yi_5_in_1  = RegNext(io.Yi_5_in_1)

  val Xi_6_in_0  = RegNext(io.Xi_6_in_0)
  val Yi_6_in_0  = RegNext(io.Yi_6_in_0)
  val Xi_6_in_1  = RegNext(io.Xi_6_in_1)
  val Yi_6_in_1  = RegNext(io.Yi_6_in_1)

  val Xi_7_in_0  = RegNext(io.Xi_7_in_0)
  val Yi_7_in_0  = RegNext(io.Yi_7_in_0)
  val Xi_7_in_1  = RegNext(io.Xi_7_in_1)
  val Yi_7_in_1  = RegNext(io.Yi_7_in_1)

//====================================
// Registers for Selectors
//====================================
  val m_0_sel  = RegInit(0.U(2.W))
  val m_1_sel  = RegInit(0.U(2.W))
  val m_2_sel  = RegInit(0.U(2.W))
  val m_3_sel  = RegInit(0.U(2.W))
  val m_4_sel  = RegInit(0.U(2.W))
  val m_5_sel  = RegInit(0.U(2.W))
  val m_6_sel  = RegInit(0.U(2.W))
  val m_7_sel  = RegInit(0.U(2.W))
  val m_8_sel  = RegInit(0.U(2.W))
  val m_9_sel  = RegInit(0.U(2.W))

  val op_type   = RegNext(io.op_type)

  // AddSub operation : false "+" OR true "-"
  // val addsub_0_op   = RegInit("b11".U(2.W))
  // val addsub_1_op   = RegInit("b11".U(2.W))

  // ROUNDING type
  val rounding     = RegNext(io.rounding)
  // TININESS type
  val tininess     = RegNext(io.tininess)
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//====================================
// DEBUG
//====================================
val dbg_fsm = RegInit(0.U(4.W))
val dbg_opt = RegInit(0.U(4.W))

//=======================================
// CONTROLLER
//=======================================
  val ctrlPE = Module(new PE_CTRL())
  ctrlPE.io.op_type := 0.U(2.W) //op_type
  ctrlPE.io.use_int := use_int
  m_0_sel := ctrlPE.io.m_0_sel
  m_1_sel := ctrlPE.io.m_1_sel
  m_2_sel := ctrlPE.io.m_2_sel
  m_3_sel := ctrlPE.io.m_3_sel
  m_4_sel := ctrlPE.io.m_4_sel
  m_5_sel := ctrlPE.io.m_5_sel
  m_6_sel := ctrlPE.io.m_6_sel
  m_7_sel := ctrlPE.io.m_7_sel
  m_8_sel := ctrlPE.io.m_8_sel
  m_9_sel := ctrlPE.io.m_9_sel

  // addsub_0_op := ctrlPE.io.addsub_0_op
  // addsub_1_op := ctrlPE.io.addsub_1_op

  dbg_fsm := ctrlPE.io.dbg_fsm

//=======================================
// PE_8IP module
//=======================================
  val pe_8IP = Module(new PE_8IP())
  pe_8IP.io.use_int  := use_int
  pe_8IP.io.tininess := tininess
  pe_8IP.io.rounding := rounding

  pe_8IP.io.Xi_0_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_0_in_0 := Xi_0_in_0
  pe_8IP.io.Xi_0_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_0_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_1_in_0 := Xi_1_in_0
  pe_8IP.io.Yi_1_in_0 := Xi_1_in_0
  pe_8IP.io.Xi_1_in_1 := Xi_1_in_1
  pe_8IP.io.Yi_1_in_1 := Yi_1_in_1

  pe_8IP.io.Xi_2_in_0 := Xi_2_in_0
  pe_8IP.io.Yi_2_in_0 := Xi_2_in_0
  pe_8IP.io.Xi_2_in_1 := Xi_2_in_1
  pe_8IP.io.Yi_2_in_1 := Yi_2_in_1

  pe_8IP.io.Xi_3_in_0 := Xi_3_in_0
  pe_8IP.io.Yi_3_in_0 := Xi_3_in_0
  pe_8IP.io.Xi_3_in_1 := Xi_3_in_1
  pe_8IP.io.Yi_3_in_1 := Yi_3_in_1

  pe_8IP.io.Xi_4_in_0 := Xi_4_in_0
  pe_8IP.io.Yi_4_in_0 := Xi_4_in_0
  pe_8IP.io.Xi_4_in_1 := Xi_4_in_1
  pe_8IP.io.Yi_4_in_1 := Yi_4_in_1

  pe_8IP.io.Xi_5_in_0 := Xi_5_in_0
  pe_8IP.io.Yi_5_in_0 := Xi_5_in_0
  pe_8IP.io.Xi_5_in_1 := Xi_5_in_1
  pe_8IP.io.Yi_5_in_1 := Yi_5_in_1

  pe_8IP.io.Xi_6_in_0 := Xi_6_in_0
  pe_8IP.io.Yi_6_in_0 := Xi_6_in_0
  pe_8IP.io.Xi_6_in_1 := Xi_6_in_1
  pe_8IP.io.Yi_6_in_1 := Yi_6_in_1

  pe_8IP.io.Xi_7_in_0 := Xi_7_in_0
  pe_8IP.io.Yi_7_in_0 := Xi_7_in_0
  pe_8IP.io.Xi_7_in_1 := Xi_7_in_1
  pe_8IP.io.Yi_7_in_1 := Yi_7_in_1

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

  val outAggr_0_0  = RegNext(pe_8IP.io.outAggr_0_0)
  val outAggr_0_1  = RegNext(pe_8IP.io.outAggr_0_1)
  val outAggr_0_2  = RegNext(pe_8IP.io.outAggr_0_2)
  val outAggr_0_3  = RegNext(pe_8IP.io.outAggr_0_3)

  val outAggr_1_0  = RegNext(pe_8IP.io.outAggr_1_0)
  val outAggr_1_1  = RegNext(pe_8IP.io.outAggr_1_1)
  val outAggr_1_2  = RegNext(pe_8IP.io.outAggr_1_2)
  val outAggr_1_3  = RegNext(pe_8IP.io.outAggr_1_3)

  val outAggr_2_0  = RegNext(pe_8IP.io.outAggr_2_0)
  val outAggr_2_1  = RegNext(pe_8IP.io.outAggr_2_1)
  val outAggr_2_2  = RegNext(pe_8IP.io.outAggr_2_2)
  val outAggr_2_3  = RegNext(pe_8IP.io.outAggr_2_3)

  val outAggr_3_0  = RegNext(pe_8IP.io.outAggr_3_0)
  val outAggr_3_1  = RegNext(pe_8IP.io.outAggr_3_1)
  val outAggr_3_2  = RegNext(pe_8IP.io.outAggr_3_2)
  val outAggr_3_3  = RegNext(pe_8IP.io.outAggr_3_3)

  io.out := pe_8IP.io.out  
}

object PE_CTRL_8IP extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_CTRL_8IP"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_CTRL_8IP))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_CTRL_8IP))
  )
}