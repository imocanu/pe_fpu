package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._

class PE_8_ADDERS extends Module {
  val io = IO(new Bundle {
    val Xi_0_in_0        = Input(Bits(Config.forIN.W))
    val Yi_0_in_0        = Input(Bits(Config.forIN.W))
    val Xi_0_in_1        = Input(Bits(Config.forIN.W))
    val Yi_0_in_1        = Input(Bits(Config.forIN.W))

    val Xi_1_in_0        = Input(Bits(Config.forIN.W))
    val Yi_1_in_0        = Input(Bits(Config.forIN.W))
    val Xi_1_in_1        = Input(Bits(Config.forIN.W))
    val Yi_1_in_1        = Input(Bits(Config.forIN.W))

    val Xi_2_in_0        = Input(Bits(Config.forIN.W))
    val Yi_2_in_0        = Input(Bits(Config.forIN.W))
    val Xi_2_in_1        = Input(Bits(Config.forIN.W))
    val Yi_2_in_1        = Input(Bits(Config.forIN.W))

    val Xi_3_in_0        = Input(Bits(Config.forIN.W))
    val Yi_3_in_0        = Input(Bits(Config.forIN.W))
    val Xi_3_in_1        = Input(Bits(Config.forIN.W))
    val Yi_3_in_1        = Input(Bits(Config.forIN.W))

    val Xi_4_in_0        = Input(Bits(Config.forIN.W))
    val Yi_4_in_0        = Input(Bits(Config.forIN.W))
    val Xi_4_in_1        = Input(Bits(Config.forIN.W))
    val Yi_4_in_1        = Input(Bits(Config.forIN.W))

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

    val op_type       = Input(Bits(2.W))

    val use_int       = Input(Bool())
    val tininess      = Input(UInt(1.W))
    val rounding      = Input(UInt(3.W))

    val out_0  = Output(Bits(Config.forIN.W))  
    val out_1  = Output(Bits(Config.forIN.W))
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
// Registers for Selectors
//====================================
  val m_0_sel  = RegInit(1.U(2.W))
  val m_1_sel  = RegInit(1.U(2.W))
  val m_2_sel  = RegInit(1.U(2.W))
  val m_3_sel  = RegInit(1.U(2.W))
  val m_4_sel  = RegInit(0.U(2.W))
  val m_5_sel  = RegInit(1.U(2.W))
  val m_6_sel  = RegInit(1.U(2.W))
  val m_7_sel  = RegInit(1.U(2.W))
  val m_8_sel  = RegInit(1.U(2.W))
  val m_9_sel  = RegInit(1.U(2.W))

  val op_type   = RegNext(io.op_type)

  // AddSub operation : false "+" & true "-"
  val addsub_0_op   = RegInit("b00".U(2.W))
  val addsub_1_op   = RegNext("b00".U(2.W))

  // Rounding type
  val rounding     = RegNext(io.rounding)
  // Tininess type
  val tininess     = RegNext(io.tininess)
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//====================================
// Registers for OUTPUTS
//====================================
  val pe_0_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_0_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_1_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_1_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_2_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_2_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_3_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_3_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_4_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_4_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_5_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_5_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_6_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_6_out_1   = RegInit(0.U(Config.forOUT.W))
  val pe_7_out_0   = RegInit(0.U(Config.forOUT.W))
  val pe_7_out_1   = RegInit(0.U(Config.forOUT.W))

  val out_0   = RegInit(0.U(Config.forOUT.W))
  val out_1   = RegInit(0.U(Config.forOUT.W))

//=======================================
// Shared regs for INPUTS
//=======================================
  // val mux_0_out = RegInit(0.U(Config.forOUT.W)) 
  // val mux_1_out = RegInit(0.U(Config.forOUT.W))  
  // val mux_2_out = RegInit(0.U(Config.forOUT.W))
  // val mux_3_out = RegInit(0.U(Config.forOUT.W))
  // val mux_4_out = RegInit(0.U(Config.forOUT.W))
  // val mux_5_out = RegInit(0.U(Config.forOUT.W))  
  // val mux_6_out = RegInit(0.U(Config.forOUT.W))
  // val mux_7_out = RegInit(0.U(Config.forOUT.W))
  // val mux_8_out = RegInit(0.U(Config.forOUT.W))
  // val mux_9_out = RegInit(0.U(Config.forOUT.W))

//====================================
// DEBUGS
//====================================
  val dbg_fsm = RegInit(0.U(4.W))
  val dbg_xxx = RegInit(0.U(4.W))

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

//=======================================
// SUM Connections
//=======================================
// root
  val addsubModule_0_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_1_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_2_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_3_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_4_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_5_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_6_out  = RegInit(0.U(Config.forOUT.W))

  val addsubpe_0_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_1_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_2_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_3_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_4_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_5_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_6_out  = RegInit(0.U(Config.forOUT.W))
  val addsubpe_7_out  = RegInit(0.U(Config.forOUT.W))

  val addsubModule_0 = Module(new AddSubPE())
  val addsubModule_1 = Module(new AddSubPE())
  val addsubModule_2 = Module(new AddSubPE())
  val addsubModule_3 = Module(new AddSubPE())
  val addsubModule_4 = Module(new AddSubPE())
  val addsubModule_5 = Module(new AddSubPE())
  val addsubModule_6 = Module(new AddSubPE())

  val addsubpe_0 = Module(new AddSubPE())
  val addsubpe_1 = Module(new AddSubPE())
  val addsubpe_2 = Module(new AddSubPE())
  val addsubpe_3 = Module(new AddSubPE())
  val addsubpe_4 = Module(new AddSubPE())
  val addsubpe_5 = Module(new AddSubPE())
  val addsubpe_6 = Module(new AddSubPE())
  val addsubpe_7 = Module(new AddSubPE())
// -----------------------------------------
  addsubpe_0.io.op         := "b00".U(2.W)
  addsubpe_0.io.rounding   := rounding	
  addsubpe_0.io.tininess   := tininess
  addsubpe_0.io.use_int    := use_int
  addsubpe_0.io.in_0       := pe_0_out_0
  addsubpe_0.io.in_1       := pe_0_out_1
  addsubpe_0_out  := addsubpe_0.io.out

  addsubpe_1.io.op         := "b00".U(2.W)
  addsubpe_1.io.rounding   := rounding	
  addsubpe_1.io.tininess   := tininess
  addsubpe_1.io.use_int    := use_int
  addsubpe_1.io.in_0       := pe_0_out_0
  addsubpe_1.io.in_1       := pe_0_out_1
  addsubpe_1_out  := addsubpe_1.io.out

  addsubpe_2.io.op         := "b00".U(2.W)
  addsubpe_2.io.rounding   := rounding	
  addsubpe_2.io.tininess   := tininess
  addsubpe_2.io.use_int    := use_int
  addsubpe_2.io.in_0       := pe_0_out_0
  addsubpe_2.io.in_1       := pe_0_out_1
  addsubpe_2_out  := addsubpe_2.io.out

  addsubpe_3.io.op         := "b00".U(2.W)
  addsubpe_3.io.rounding   := rounding	
  addsubpe_3.io.tininess   := tininess
  addsubpe_3.io.use_int    := use_int
  addsubpe_3.io.in_0       := pe_0_out_0
  addsubpe_3.io.in_1       := pe_0_out_1
  addsubpe_3_out  := addsubpe_3.io.out

  addsubpe_4.io.op         := "b00".U(2.W)
  addsubpe_4.io.rounding   := rounding	
  addsubpe_4.io.tininess   := tininess
  addsubpe_4.io.use_int    := use_int
  addsubpe_4.io.in_0       := pe_0_out_0
  addsubpe_4.io.in_1       := pe_0_out_1
  addsubpe_4_out  := addsubpe_4.io.out

  addsubpe_5.io.op         := "b00".U(2.W)
  addsubpe_5.io.rounding   := rounding	
  addsubpe_5.io.tininess   := tininess
  addsubpe_5.io.use_int    := use_int
  addsubpe_5.io.in_0       := pe_0_out_0
  addsubpe_5.io.in_1       := pe_0_out_1
  addsubpe_5_out  := addsubpe_5.io.out

  addsubpe_6.io.op         := "b00".U(2.W)
  addsubpe_6.io.rounding   := rounding	
  addsubpe_6.io.tininess   := tininess
  addsubpe_6.io.use_int    := use_int
  addsubpe_6.io.in_0       := pe_0_out_0
  addsubpe_6.io.in_1       := pe_0_out_1
  addsubpe_6_out  := addsubpe_6.io.out

  addsubpe_7.io.op         := "b00".U(2.W)
  addsubpe_7.io.rounding   := rounding	
  addsubpe_7.io.tininess   := tininess
  addsubpe_7.io.use_int    := use_int
  addsubpe_7.io.in_0       := pe_0_out_0
  addsubpe_7.io.in_1       := pe_0_out_1
  addsubpe_7_out  := addsubpe_7.io.out

  // -----------------------------------------
  addsubModule_0.io.op         := "b00".U(2.W)
  addsubModule_0.io.rounding   := rounding	
  addsubModule_0.io.tininess   := tininess
  addsubModule_0.io.use_int    := use_int
  addsubModule_0.io.in_0       := addsubModule_1_out
  addsubModule_0.io.in_1       := addsubModule_2_out
  addsubModule_0_out  := addsubModule_0.io.out

  addsubModule_1.io.op         := "b00".U(2.W)
  addsubModule_1.io.rounding   := rounding	
  addsubModule_1.io.tininess   := tininess
  addsubModule_1.io.use_int    := use_int
  addsubModule_1.io.in_0       := addsubModule_3_out
  addsubModule_1.io.in_1       := addsubModule_4_out
  addsubModule_1_out  := addsubModule_1.io.out

  addsubModule_2.io.op         := "b00".U(2.W)
  addsubModule_2.io.rounding   := rounding	
  addsubModule_2.io.tininess   := tininess
  addsubModule_2.io.use_int    := use_int
  addsubModule_2.io.in_0       := addsubModule_5_out
  addsubModule_2.io.in_1       := addsubModule_6_out
  addsubModule_2_out  := addsubModule_2.io.out

  addsubModule_3.io.op         := "b00".U(2.W)
  addsubModule_3.io.rounding   := rounding	
  addsubModule_3.io.tininess   := tininess
  addsubModule_3.io.use_int    := use_int
  addsubModule_3.io.in_0       := addsubpe_0_out
  addsubModule_3.io.in_1       := addsubpe_1_out
  addsubModule_3_out  := addsubModule_3.io.out

  addsubModule_4.io.op         := "b00".U(2.W)
  addsubModule_4.io.rounding   := rounding	
  addsubModule_4.io.tininess   := tininess
  addsubModule_4.io.use_int    := use_int
  addsubModule_4.io.in_0       := addsubpe_2_out
  addsubModule_4.io.in_1       := addsubpe_3_out
  addsubModule_4_out  := addsubModule_4.io.out

  addsubModule_5.io.op         := "b00".U(2.W)
  addsubModule_5.io.rounding   := rounding	
  addsubModule_5.io.tininess   := tininess
  addsubModule_5.io.use_int    := use_int
  addsubModule_5.io.in_0       := addsubpe_4_out
  addsubModule_5.io.in_1       := addsubpe_5_out
  addsubModule_5_out  := addsubModule_5.io.out

  addsubModule_6.io.op         := "b00".U(2.W)
  addsubModule_6.io.rounding   := rounding	
  addsubModule_6.io.tininess   := tininess
  addsubModule_6.io.use_int    := use_int
  addsubModule_6.io.in_0       := addsubpe_6_out
  addsubModule_6.io.in_1       := addsubpe_7_out
  addsubModule_6_out  := addsubModule_6.io.out

//=======================================
// COUNTERS
//=======================================
  val L2_cycles = 15
  val L2_counter = Counter(L2_cycles)

  val SUM_4_2_cycles = 15
  val SUM_4_2_counter = Counter(SUM_4_2_cycles)    

//=======================================
// FSM
//=======================================
  val startup :: idle :: init_L2 :: mult_L2_s2 :: op_1 :: op_2 :: op_3 :: sum_init :: sum_start :: sum_stop :: Nil = Enum (10)
  val pe_step = RegInit ( startup )


  switch ( pe_step ) 
  {
    is ( startup ) {
        dbg_fsm := 9.U(4.W)        
        pe_step := idle
    }
    is ( idle ) {

        dbg_fsm := 1.U(4.W) 

        switch ( op_type ) 
        {
          is ( "b00".U(2.W) )  // Euclidean distance - L2
          {
            dbg_xxx := 1.U(4.W)

            addsub_0_op := 0.U(2.W)
            addsub_1_op := 0.U(2.W) 

            m_0_sel := "b01".U(2.W)
            m_1_sel := "b01".U(2.W)
            m_2_sel := "b01".U(2.W)
            m_3_sel := "b01".U(2.W)
            m_4_sel := "b00".U(2.W)
            m_5_sel := "b00".U(2.W)
            m_6_sel := "b00".U(2.W)
            m_7_sel := "b00".U(2.W)

            // output for multiplication result
            m_8_sel := "b01".U(2.W)
            m_9_sel := "b01".U(2.W)
            
            pe_step := init_L2
          }
          is ( "b01".U(2.W) ) // Manhattan distance  - L1
          {
            dbg_xxx := 2.U(4.W)
            pe_step := init_L2
          }
          is ( "b10".U(2.W) ) // dot product 
          {
            dbg_xxx := 3.U(4.W)
            pe_step := init_L2
          }
          is ( "b11".U(2.W) ) // weighted vector pooling 
          {
            dbg_xxx := 4.U(4.W)
            pe_step := init_L2
          }
        }
    }
    is ( init_L2 ) {
      dbg_fsm := 3.U(4.W)

      L2_counter.inc()
      when (L2_counter.value === (L2_cycles - 1).U) {
        pe_step := sum_init
        L2_counter.reset
      }

    }
    is ( sum_init ) {
      dbg_fsm := 5.U(4.W)

      pe_step := sum_start
    }
    is ( sum_start ) {
      dbg_fsm := 6.U(4.W)  

      SUM_4_2_counter.inc()
      when (SUM_4_2_counter.value === (SUM_4_2_cycles - 1).U) {
        SUM_4_2_counter.reset()
        pe_step := sum_stop
      }
    }
    is ( sum_stop ) {
      dbg_fsm := 7.U(4.W)  

      out_0 := addsubModule_0_out
      out_1 := addsubModule_0_out

      pe_step := idle
    }
  }

  io.out_0 := out_0
  io.out_1 := out_1
}

object PE_8_ADDERS extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_8_ADDERS"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_8_ADDERS))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_8_ADDERS))
  )
}