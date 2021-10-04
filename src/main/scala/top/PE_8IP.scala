package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._

class PE_8IP extends Module {
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

    val m_0_sel  = Input(UInt(2.W))
    val m_1_sel  = Input(UInt(2.W))
    val m_2_sel  = Input(UInt(2.W))
    val m_3_sel  = Input(UInt(2.W))
    val m_4_sel  = Input(UInt(2.W))
    val m_5_sel  = Input(UInt(2.W))
    val m_6_sel  = Input(UInt(2.W))
    val m_7_sel  = Input(UInt(2.W))
    val m_8_sel  = Input(UInt(2.W))
    val m_9_sel  = Input(UInt(2.W))

    val addsub_0_op   = Input(UInt(2.W))
    val addsub_1_op   = Input(UInt(2.W))

    val use_int       = Input(Bool())
    val tininess      = Input(UInt(1.W))
    val rounding      = Input(UInt(3.W))

    val outAggr_0_0  = Output(Bits(Config.forIN.W))
    val outAggr_0_1  = Output(Bits(Config.forIN.W))
    val outAggr_0_2  = Output(Bits(Config.forIN.W))
    val outAggr_0_3  = Output(Bits(Config.forIN.W))

    val outAggr_1_0  = Output(Bits(Config.forIN.W))
    val outAggr_1_1  = Output(Bits(Config.forIN.W))
    val outAggr_1_2  = Output(Bits(Config.forIN.W))
    val outAggr_1_3  = Output(Bits(Config.forIN.W))

    val outAggr_2_0  = Output(Bits(Config.forIN.W))
    val outAggr_2_1  = Output(Bits(Config.forIN.W))
    val outAggr_2_2  = Output(Bits(Config.forIN.W))
    val outAggr_2_3  = Output(Bits(Config.forIN.W))

    val outAggr_3_0  = Output(Bits(Config.forIN.W))
    val outAggr_3_1  = Output(Bits(Config.forIN.W))
    val outAggr_3_2  = Output(Bits(Config.forIN.W))
    val outAggr_3_3  = Output(Bits(Config.forIN.W))
    

    val out  = Output(Bits(Config.forIN.W))  
  })

//====================================
// Registers for INPUTS
//====================================
  val Xi_0_in_0  = RegNext(io.Xi_0_in_0)
  val Yi_0_in_0  = RegNext(io.Yi_0_in_0)
  val Xi_0_in_1  = RegNext(io.Xi_0_in_1)
  val Yi_0_in_1  = RegNext(io.Yi_0_in_1)
  val aggr_0_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_0_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_0_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_0_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_1_in_0  = RegNext(io.Xi_1_in_0)
  val Yi_1_in_0  = RegNext(io.Yi_1_in_0)
  val Xi_1_in_1  = RegNext(io.Xi_1_in_1)
  val Yi_1_in_1  = RegNext(io.Yi_1_in_1)
  val aggr_1_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_1_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_1_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_1_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_2_in_0  = RegNext(io.Xi_2_in_0)
  val Yi_2_in_0  = RegNext(io.Yi_2_in_0)
  val Xi_2_in_1  = RegNext(io.Xi_2_in_1)
  val Yi_2_in_1  = RegNext(io.Yi_2_in_1)
  val aggr_2_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_2_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_2_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_2_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_3_in_0  = RegNext(io.Xi_3_in_0)
  val Yi_3_in_0  = RegNext(io.Yi_3_in_0)
  val Xi_3_in_1  = RegNext(io.Xi_3_in_1)
  val Yi_3_in_1  = RegNext(io.Yi_3_in_1)
  val aggr_3_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_3_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_3_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_3_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_4_in_0  = RegNext(io.Xi_4_in_0)
  val Yi_4_in_0  = RegNext(io.Yi_4_in_0)
  val Xi_4_in_1  = RegNext(io.Xi_4_in_1)
  val Yi_4_in_1  = RegNext(io.Yi_4_in_1)
  val aggr_4_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_4_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_4_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_4_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_5_in_0  = RegNext(io.Xi_5_in_0)
  val Yi_5_in_0  = RegNext(io.Yi_5_in_0)
  val Xi_5_in_1  = RegNext(io.Xi_5_in_1)
  val Yi_5_in_1  = RegNext(io.Yi_5_in_1)
  val aggr_5_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_5_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_5_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_5_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_6_in_0  = RegNext(io.Xi_6_in_0)
  val Yi_6_in_0  = RegNext(io.Yi_6_in_0)
  val Xi_6_in_1  = RegNext(io.Xi_6_in_1)
  val Yi_6_in_1  = RegNext(io.Yi_6_in_1)
  val aggr_6_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_6_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_6_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_6_in_3  = RegInit(0.U(Config.forIN.W))

  val Xi_7_in_0  = RegNext(io.Xi_7_in_0)
  val Yi_7_in_0  = RegNext(io.Yi_7_in_0)
  val Xi_7_in_1  = RegNext(io.Xi_7_in_1)
  val Yi_7_in_1  = RegNext(io.Yi_7_in_1)
  val aggr_7_in_0  = RegInit(0.U(Config.forIN.W))
  val aggr_7_in_1  = RegInit(0.U(Config.forIN.W))
  val aggr_7_in_2  = RegInit(0.U(Config.forIN.W))
  val aggr_7_in_3  = RegInit(0.U(Config.forIN.W))

//====================================
// MUX selectors
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

  // val m_0_sel  = RegInit(1.U(2.W))
  // val m_1_sel  = RegInit(1.U(2.W))
  // val m_2_sel  = RegInit(1.U(2.W))
  // val m_3_sel  = RegInit(1.U(2.W))
  // val m_4_sel  = RegInit(1.U(2.W))
  // val m_5_sel  = RegInit(1.U(2.W))
  // val m_6_sel  = RegInit(1.U(2.W))
  // val m_7_sel  = RegInit(1.U(2.W))
  // val m_8_sel  = RegInit(1.U(2.W))
  // val m_9_sel  = RegInit(1.U(2.W))

  // AddSub operation : false "+" OR true "-"
  val addsub_0_op   = RegNext(io.addsub_0_op)
  val addsub_1_op   = RegNext(io.addsub_1_op)

  // ROUNDING type
  val rounding     = RegNext(io.rounding)
  // TININESS type
  val tininess     = RegNext(io.tininess)
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//====================================
// Registers for OUTPUTS
//====================================
  val pe_0_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_0_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_1_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_1_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_2_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_2_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_3_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_3_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_4_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_4_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_5_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_5_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_6_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_6_out_1   = RegInit(0.U(Config.forIN.W))
  val pe_7_out_0   = RegInit(0.U(Config.forIN.W))
  val pe_7_out_1   = RegInit(0.U(Config.forIN.W))

  val addsum_out   = RegInit(0.U(Config.forIN.W))
  val out          = RegInit(0.U(Config.forIN.W))

//=======================================
// Shared regs for INPUTS
//=======================================
  val addsum_in_0 = RegInit(0.U(Config.forIN.W))
  val addsum_in_1 = RegInit(0.U(Config.forIN.W))


//=======================================
// Init PEs
//=======================================
  val pe_0 = Module(new PE())
  pe_0.io.Xi_0 := Xi_0_in_0
  pe_0.io.Yi_0 := Yi_0_in_0
  pe_0.io.Xi_1 := Xi_0_in_1
  pe_0.io.Yi_1 := Yi_0_in_1
  pe_0.io.aggr_0     := aggr_0_in_0
  pe_0.io.aggr_1     := aggr_0_in_1
  pe_0.io.aggr_2     := aggr_0_in_2
  pe_0.io.aggr_3     := aggr_0_in_3
  pe_0.io.m_0_sel    := m_0_sel
  pe_0.io.m_1_sel    := m_1_sel
  pe_0.io.m_2_sel    := m_2_sel
  pe_0.io.m_3_sel    := m_3_sel
  pe_0.io.m_4_sel    := m_4_sel
  pe_0.io.m_5_sel    := m_5_sel
  pe_0.io.m_6_sel    := m_6_sel
  pe_0.io.m_7_sel    := m_7_sel
  pe_0.io.m_8_sel    := m_8_sel
  pe_0.io.m_9_sel    := m_9_sel
  pe_0.io.addsub_0_op := addsub_0_op
  pe_0.io.addsub_1_op := addsub_1_op
  pe_0.io.rounding    := rounding
  pe_0.io.tininess    := tininess
  pe_0.io.use_int     := use_int
  pe_0_out_0 := pe_0.io.out_0
  pe_0_out_1 := pe_0.io.out_1


  val pe_1 = Module(new PE())
  pe_1.io.Xi_0 := Xi_1_in_0
  pe_1.io.Yi_0 := Yi_1_in_0
  pe_1.io.Xi_1 := Xi_1_in_1
  pe_1.io.Yi_1 := Yi_1_in_1
  pe_1.io.aggr_0     := aggr_1_in_0
  pe_1.io.aggr_1     := aggr_1_in_1
  pe_1.io.aggr_2     := aggr_1_in_2
  pe_1.io.aggr_3     := aggr_1_in_3
  pe_1.io.m_0_sel     := m_0_sel
  pe_1.io.m_1_sel     := m_1_sel
  pe_1.io.m_2_sel     := m_2_sel
  pe_1.io.m_3_sel     := m_3_sel
  pe_1.io.m_4_sel     := m_4_sel
  pe_1.io.m_5_sel     := m_5_sel
  pe_1.io.m_6_sel     := m_6_sel
  pe_1.io.m_7_sel     := m_7_sel
  pe_1.io.m_8_sel     := m_8_sel
  pe_1.io.m_9_sel     := m_9_sel
  pe_1.io.addsub_0_op := addsub_0_op
  pe_1.io.addsub_1_op := addsub_1_op
  pe_1.io.rounding    := rounding
  pe_1.io.tininess    := tininess
  pe_1.io.use_int     := use_int
  pe_1_out_0 := pe_1.io.out_0
  pe_1_out_1 := pe_1.io.out_1


  val pe_2 = Module(new PE())
  pe_2.io.Xi_0 := Xi_2_in_0
  pe_2.io.Yi_0 := Yi_2_in_0
  pe_2.io.Xi_1 := Xi_2_in_1
  pe_2.io.Yi_1 := Yi_2_in_1
  pe_2.io.aggr_0     := aggr_2_in_0
  pe_2.io.aggr_1     := aggr_2_in_1
  pe_2.io.aggr_2     := aggr_2_in_2
  pe_2.io.aggr_3     := aggr_2_in_3
  pe_2.io.m_0_sel     := m_0_sel
  pe_2.io.m_1_sel     := m_1_sel
  pe_2.io.m_2_sel     := m_2_sel
  pe_2.io.m_3_sel     := m_3_sel
  pe_2.io.m_4_sel     := m_4_sel
  pe_2.io.m_5_sel     := m_5_sel
  pe_2.io.m_6_sel     := m_6_sel
  pe_2.io.m_7_sel     := m_7_sel
  pe_2.io.m_8_sel     := m_8_sel
  pe_2.io.m_9_sel     := m_9_sel
  pe_2.io.addsub_0_op := addsub_0_op
  pe_2.io.addsub_1_op := addsub_1_op
  pe_2.io.rounding    := rounding
  pe_2.io.tininess    := tininess
  pe_2.io.use_int     := use_int
  pe_2_out_0 := pe_2.io.out_0
  pe_2_out_1 := pe_2.io.out_1

  val pe_3 = Module(new PE())
  pe_3.io.Xi_0 := Xi_3_in_0
  pe_3.io.Yi_0 := Yi_3_in_0
  pe_3.io.Xi_1 := Xi_3_in_1
  pe_3.io.Yi_1 := Yi_3_in_1
  pe_3.io.aggr_0     := aggr_3_in_0
  pe_3.io.aggr_1     := aggr_3_in_1
  pe_3.io.aggr_2     := aggr_3_in_2
  pe_3.io.aggr_3     := aggr_3_in_3
  pe_3.io.m_0_sel     := m_0_sel
  pe_3.io.m_1_sel     := m_1_sel
  pe_3.io.m_2_sel     := m_2_sel
  pe_3.io.m_3_sel     := m_3_sel
  pe_3.io.m_4_sel     := m_4_sel
  pe_3.io.m_5_sel     := m_5_sel
  pe_3.io.m_6_sel     := m_6_sel
  pe_3.io.m_7_sel     := m_7_sel
  pe_3.io.m_8_sel     := m_8_sel
  pe_3.io.m_9_sel     := m_9_sel
  pe_3.io.addsub_0_op := addsub_0_op
  pe_3.io.addsub_1_op := addsub_1_op
  pe_3.io.rounding    := rounding
  pe_3.io.tininess    := tininess
  pe_3.io.use_int     := use_int
  pe_3_out_0 := pe_3.io.out_0
  pe_3_out_1 := pe_3.io.out_1


  val pe_4 = Module(new PE())
  pe_4.io.Xi_0 := Xi_4_in_0
  pe_4.io.Yi_0 := Yi_4_in_0
  pe_4.io.Xi_1 := Xi_4_in_1
  pe_4.io.Yi_1 := Yi_4_in_1
  pe_4.io.aggr_0     := aggr_4_in_0
  pe_4.io.aggr_1     := aggr_4_in_1
  pe_4.io.aggr_2     := aggr_4_in_2
  pe_4.io.aggr_3     := aggr_4_in_3
  pe_4.io.m_0_sel    := m_0_sel
  pe_4.io.m_1_sel    := m_1_sel
  pe_4.io.m_2_sel    := m_2_sel
  pe_4.io.m_3_sel    := m_3_sel
  pe_4.io.m_4_sel    := m_4_sel
  pe_4.io.m_5_sel    := m_5_sel
  pe_4.io.m_6_sel    := m_6_sel
  pe_4.io.m_7_sel    := m_7_sel
  pe_4.io.m_8_sel    := m_8_sel
  pe_4.io.m_9_sel    := m_9_sel
  pe_4.io.addsub_0_op := addsub_0_op
  pe_4.io.addsub_1_op := addsub_1_op
  pe_4.io.rounding    := rounding
  pe_4.io.tininess    := tininess
  pe_4.io.use_int     := use_int
  pe_4_out_0 := pe_4.io.out_0
  pe_4_out_1 := pe_4.io.out_1


  val pe_5 = Module(new PE())
  pe_5.io.Xi_0 := Xi_5_in_0
  pe_5.io.Yi_0 := Yi_5_in_0
  pe_5.io.Xi_1 := Xi_5_in_1
  pe_5.io.Yi_1 := Yi_5_in_1
  pe_5.io.aggr_0     := aggr_5_in_0
  pe_5.io.aggr_1     := aggr_5_in_1
  pe_5.io.aggr_2     := aggr_5_in_2
  pe_5.io.aggr_3     := aggr_5_in_3
  pe_5.io.m_0_sel     := m_0_sel
  pe_5.io.m_1_sel     := m_1_sel
  pe_5.io.m_2_sel     := m_2_sel
  pe_5.io.m_3_sel     := m_3_sel
  pe_5.io.m_4_sel     := m_4_sel
  pe_5.io.m_5_sel     := m_5_sel
  pe_5.io.m_6_sel     := m_6_sel
  pe_5.io.m_7_sel     := m_7_sel
  pe_5.io.m_8_sel     := m_8_sel
  pe_5.io.m_9_sel     := m_9_sel
  pe_5.io.addsub_0_op := addsub_0_op
  pe_5.io.addsub_1_op := addsub_1_op
  pe_5.io.rounding    := rounding
  pe_5.io.tininess    := tininess
  pe_5.io.use_int     := use_int
  pe_5_out_0 := pe_5.io.out_0
  pe_5_out_1 := pe_5.io.out_1


  val pe_6 = Module(new PE())
  pe_6.io.Xi_0 := Xi_6_in_0
  pe_6.io.Yi_0 := Yi_6_in_0
  pe_6.io.Xi_1 := Xi_6_in_1
  pe_6.io.Yi_1 := Yi_6_in_1
  pe_6.io.aggr_0     := aggr_6_in_0
  pe_6.io.aggr_1     := aggr_6_in_1
  pe_6.io.aggr_2     := aggr_6_in_2
  pe_6.io.aggr_3     := aggr_6_in_3
  pe_6.io.m_0_sel     := m_0_sel
  pe_6.io.m_1_sel     := m_1_sel
  pe_6.io.m_2_sel     := m_2_sel
  pe_6.io.m_3_sel     := m_3_sel
  pe_6.io.m_4_sel     := m_4_sel
  pe_6.io.m_5_sel     := m_5_sel
  pe_6.io.m_6_sel     := m_6_sel
  pe_6.io.m_7_sel     := m_7_sel
  pe_6.io.m_8_sel     := m_8_sel
  pe_6.io.m_9_sel     := m_9_sel
  pe_6.io.addsub_0_op := addsub_0_op
  pe_6.io.addsub_1_op := addsub_1_op
  pe_6.io.rounding    := rounding
  pe_6.io.tininess    := tininess
  pe_6.io.use_int     := use_int
  pe_6_out_0 := pe_6.io.out_0
  pe_6_out_1 := pe_6.io.out_1

  val pe_7 = Module(new PE())
  pe_7.io.Xi_0 := Xi_7_in_0
  pe_7.io.Yi_0 := Yi_7_in_0
  pe_7.io.Xi_1 := Xi_7_in_1
  pe_7.io.Yi_1 := Yi_7_in_1
  pe_7.io.aggr_0     := aggr_7_in_0
  pe_7.io.aggr_1     := aggr_7_in_1
  pe_7.io.aggr_2     := aggr_7_in_2
  pe_7.io.aggr_3     := aggr_7_in_3
  pe_7.io.m_0_sel     := m_0_sel
  pe_7.io.m_1_sel     := m_1_sel
  pe_7.io.m_2_sel     := m_2_sel
  pe_7.io.m_3_sel     := m_3_sel
  pe_7.io.m_4_sel     := m_4_sel
  pe_7.io.m_5_sel     := m_5_sel
  pe_7.io.m_6_sel     := m_6_sel
  pe_7.io.m_7_sel     := m_7_sel
  pe_7.io.m_8_sel     := m_8_sel
  pe_7.io.m_9_sel     := m_9_sel
  pe_7.io.addsub_0_op := addsub_0_op
  pe_7.io.addsub_1_op := addsub_1_op
  pe_7.io.rounding    := rounding
  pe_7.io.tininess    := tininess
  pe_7.io.use_int     := use_int
  pe_7_out_0 := pe_7.io.out_0
  pe_7_out_1 := pe_7.io.out_1

  // addsum_in_0 := pe_0_out_0
  // addsum_in_1 := pe_0_out_1

// // =======================================
// // AddSum Module
// // =======================================
//   val addsubModule_0 = Module(new AddSubPE())
//   addsubModule_0.io.op         := false.B
//   addsubModule_0.io.rounding   := rounding	
//   addsubModule_0.io.tininess   := tininess
//   addsubModule_0.io.use_int    := use_int
//   addsubModule_0.io.in_0       := addsum_in_0
//   addsubModule_0.io.in_1       := addsum_in_1
//   io.out  := addsubModule_0.io.out

//=======================================
// AGGREGATION
//=======================================
  // root
  aggr_0_in_0 := pe_0_out_0
  aggr_0_in_1 := pe_1_out_1
  aggr_0_in_2 := pe_0_out_1
  aggr_0_in_3 := pe_1_out_0

  // nodes
  aggr_1_in_0 := pe_2_out_0
  aggr_1_in_1 := pe_2_out_1
  aggr_1_in_2 := pe_3_out_0
  aggr_1_in_3 := pe_3_out_1

  aggr_2_in_0 := pe_4_out_0
  aggr_2_in_1 := pe_4_out_1
  aggr_2_in_2 := pe_5_out_0
  aggr_2_in_3 := pe_5_out_1

  aggr_3_in_0 := pe_6_out_0
  aggr_3_in_1 := pe_6_out_1
  aggr_3_in_2 := pe_7_out_0
  aggr_3_in_3 := pe_7_out_1



  // io.outAggr_0_0 := aggr_0_in_0
  // io.outAggr_0_1 := aggr_0_in_1
  // io.outAggr_0_2 := aggr_0_in_2
  // io.outAggr_0_3 := aggr_0_in_3

  // io.outAggr_1_0 := aggr_1_in_0
  // io.outAggr_1_1 := aggr_1_in_1
  // io.outAggr_1_2 := aggr_1_in_2
  // io.outAggr_1_3 := aggr_1_in_3

  // io.outAggr_2_0 := aggr_2_in_0
  // io.outAggr_2_1 := aggr_2_in_1
  // io.outAggr_2_2 := aggr_2_in_2
  // io.outAggr_2_3 := aggr_2_in_3

  // io.outAggr_3_0 := aggr_3_in_0
  // io.outAggr_3_1 := aggr_3_in_1
  // io.outAggr_3_2 := aggr_3_in_2
  // io.outAggr_3_3 := aggr_3_in_3 

  io.outAggr_0_0 := 0.U(32.W)
  io.outAggr_0_1 := 0.U(32.W)
  io.outAggr_0_2 := 0.U(32.W)
  io.outAggr_0_3 := 0.U(32.W)

  io.outAggr_1_0 := 0.U(32.W)
  io.outAggr_1_1 := 0.U(32.W)
  io.outAggr_1_2 := 0.U(32.W)
  io.outAggr_1_3 := 0.U(32.W)

  io.outAggr_2_0 := 0.U(32.W)
  io.outAggr_2_1 := 0.U(32.W)
  io.outAggr_2_2 := 0.U(32.W)
  io.outAggr_2_3 := 0.U(32.W)

  io.outAggr_3_0 := 0.U(32.W)
  io.outAggr_3_1 := 0.U(32.W)
  io.outAggr_3_2 := 0.U(32.W)
  io.outAggr_3_3 := 0.U(32.W)     

 io.out := out

}

object PE_8IP extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_8IP"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_8IP))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_8IP))
  )
}