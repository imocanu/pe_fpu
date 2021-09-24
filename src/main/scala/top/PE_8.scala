package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._

class PE_8 extends Module {
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

    // val m_0_sel       = Input(Bits(2.W))
    // val m_1_sel       = Input(Bits(2.W))
    // val m_2_sel       = Input(Bits(2.W))
    // val m_3_sel       = Input(Bits(2.W))
    // val m_4_sel       = Input(Bits(2.W))
    // val m_5_sel       = Input(Bits(2.W))
    // val m_6_sel       = Input(Bits(2.W))
    // val m_7_sel       = Input(Bits(2.W))
    // val m_8_sel       = Input(Bits(2.W))
    // val m_9_sel       = Input(Bits(2.W))

    val op_type       = Input(Bits(2.W))

    // val addsub_0_op   = Input(Bool())
    // val addsub_1_op   = Input(Bool())

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
  val addsub_0_op   = RegInit(0.U(2.W))
  val addsub_1_op   = RegNext(0.U(2.W))

  // Rounding type
  val rounding     = RegNext(io.rounding)
  // Tininess type
  val tininess     = RegNext(io.tininess)
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//====================================
// Registers for OUTPUTS
//====================================
  val addsub_0_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_0_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_1_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_1_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_2_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_2_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_3_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_3_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_4_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_4_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_5_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_5_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_6_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_6_out_1   = RegInit(0.U(Config.forOUT.W))
  val addsub_7_out_0   = RegInit(0.U(Config.forOUT.W))
  val addsub_7_out_1   = RegInit(0.U(Config.forOUT.W))

  val out_0   = RegNext(io.out_0)
  val out_1   = RegNext(io.out_1)

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


  addsub_0_op := "b00".U(2.W)
  addsub_1_op := "b00".U(2.W) 

  // io.out_0 := addsub_0_out_0
  // io.out_1 := addsub_0_out_1

  // m_0_sel := "b01".U(2.W)
  // m_1_sel := "b01".U(2.W)
  // m_2_sel := "b01".U(2.W)
  // m_3_sel := "b01".U(2.W)
  // m_4_sel := "b00".U(2.W)
  // m_5_sel := "b01".U(2.W)
  // m_6_sel := "b01".U(2.W)
  // m_7_sel := "b01".U(2.W)

  // // output for multiplication result
  // m_8_sel := "b01".U(2.W)
  // m_9_sel := "b01".U(2.W)

  // rounding := "b111".U(3.W)
  // tininess := "b1".U(1.W)
  // use_int  := true.B
  // op_type  := "b00".U(2.W)

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
  addsub_0_out_0 := pe_0.io.out_0
  addsub_0_out_1 := pe_0.io.out_1


  // val pe_1 = Module(new PE())
  // pe_1.io.Xi_0 := Xi_1_in_0
  // pe_1.io.Yi_0 := Yi_1_in_0
  // pe_1.io.Xi_1 := Xi_1_in_1
  // pe_1.io.Yi_1 := Yi_1_in_1
  // pe_1.io.aggr_0     := aggr_1_in_0
  // pe_1.io.aggr_1     := aggr_1_in_1
  // pe_1.io.aggr_2     := aggr_1_in_2
  // pe_1.io.aggr_3     := aggr_1_in_3
  // pe_1.io.m_0_sel     := m_0_sel
  // pe_1.io.m_1_sel     := m_1_sel
  // pe_1.io.m_2_sel     := m_2_sel
  // pe_1.io.m_3_sel     := m_3_sel
  // pe_1.io.m_4_sel     := m_4_sel
  // pe_1.io.m_5_sel     := m_5_sel
  // pe_1.io.m_6_sel     := m_6_sel
  // pe_1.io.m_7_sel     := m_7_sel
  // pe_1.io.m_8_sel     := m_8_sel
  // pe_1.io.m_9_sel     := m_9_sel
  // pe_1.io.addsub_0_op := addsub_0_op
  // pe_1.io.addsub_1_op := addsub_1_op
  // pe_1.io.rounding    := rounding
  // pe_1.io.tininess    := tininess
  // pe_1.io.use_int     := use_int
  // addsub_1_out_0 := pe_1.io.out_0
  // addsub_1_out_1 := pe_1.io.out_1


  // val pe_2 = Module(new PE())
  // pe_2.io.Xi_0 := Xi_2_in_0
  // pe_2.io.Yi_0 := Yi_2_in_0
  // pe_2.io.Xi_1 := Xi_2_in_1
  // pe_2.io.Yi_1 := Yi_2_in_1
  // pe_2.io.aggr_0     := aggr_2_in_0
  // pe_2.io.aggr_1     := aggr_2_in_1
  // pe_2.io.aggr_2     := aggr_2_in_2
  // pe_2.io.aggr_3     := aggr_2_in_3
  // pe_2.io.m_0_sel     := m_0_sel
  // pe_2.io.m_1_sel     := m_1_sel
  // pe_2.io.m_2_sel     := m_2_sel
  // pe_2.io.m_3_sel     := m_3_sel
  // pe_2.io.m_4_sel     := m_4_sel
  // pe_2.io.m_5_sel     := m_5_sel
  // pe_2.io.m_6_sel     := m_6_sel
  // pe_2.io.m_7_sel     := m_7_sel
  // pe_2.io.m_8_sel     := m_8_sel
  // pe_2.io.m_9_sel     := m_9_sel
  // pe_2.io.addsub_0_op := addsub_0_op
  // pe_2.io.addsub_1_op := addsub_1_op
  // pe_2.io.rounding    := rounding
  // pe_2.io.tininess    := tininess
  // pe_2.io.use_int     := use_int
  // addsub_2_out_0 := pe_2.io.out_0
  // addsub_2_out_1 := pe_2.io.out_1

  // val pe_3 = Module(new PE())
  // pe_3.io.Xi_0 := Xi_3_in_0
  // pe_3.io.Yi_0 := Yi_3_in_0
  // pe_3.io.Xi_1 := Xi_3_in_1
  // pe_3.io.Yi_1 := Yi_3_in_1
  // pe_3.io.aggr_0     := aggr_3_in_0
  // pe_3.io.aggr_1     := aggr_3_in_1
  // pe_3.io.aggr_2     := aggr_3_in_2
  // pe_3.io.aggr_3     := aggr_3_in_3
  // pe_3.io.m_0_sel     := m_0_sel
  // pe_3.io.m_1_sel     := m_1_sel
  // pe_3.io.m_2_sel     := m_2_sel
  // pe_3.io.m_3_sel     := m_3_sel
  // pe_3.io.m_4_sel     := m_4_sel
  // pe_3.io.m_5_sel     := m_5_sel
  // pe_3.io.m_6_sel     := m_6_sel
  // pe_3.io.m_7_sel     := m_7_sel
  // pe_3.io.m_8_sel     := m_8_sel
  // pe_3.io.m_9_sel     := m_9_sel
  // pe_3.io.addsub_0_op := addsub_0_op
  // pe_3.io.addsub_1_op := addsub_1_op
  // pe_3.io.rounding    := rounding
  // pe_3.io.tininess    := tininess
  // pe_3.io.use_int     := use_int
  // addsub_3_out_0 := pe_3.io.out_0
  // addsub_3_out_1 := pe_3.io.out_1


  // val pe_4 = Module(new PE())
  // pe_4.io.Xi_0 := Xi_4_in_0
  // pe_4.io.Yi_0 := Yi_4_in_0
  // pe_4.io.Xi_1 := Xi_4_in_1
  // pe_4.io.Yi_1 := Yi_4_in_1
  // pe_4.io.aggr_0     := aggr_4_in_0
  // pe_4.io.aggr_1     := aggr_4_in_1
  // pe_4.io.aggr_2     := aggr_4_in_2
  // pe_4.io.aggr_3     := aggr_4_in_3
  // pe_4.io.m_0_sel    := m_0_sel
  // pe_4.io.m_1_sel    := m_1_sel
  // pe_4.io.m_2_sel    := m_2_sel
  // pe_4.io.m_3_sel    := m_3_sel
  // pe_4.io.m_4_sel    := m_4_sel
  // pe_4.io.m_5_sel    := m_5_sel
  // pe_4.io.m_6_sel    := m_6_sel
  // pe_4.io.m_7_sel    := m_7_sel
  // pe_4.io.m_8_sel    := m_8_sel
  // pe_4.io.m_9_sel    := m_9_sel
  // pe_4.io.addsub_0_op := addsub_0_op
  // pe_4.io.addsub_1_op := addsub_1_op
  // pe_4.io.rounding    := rounding
  // pe_4.io.tininess    := tininess
  // pe_4.io.use_int     := use_int
  // addsub_4_out_0 := pe_4.io.out_0
  // addsub_4_out_1 := pe_4.io.out_1


  // val pe_5 = Module(new PE())
  // pe_5.io.Xi_0 := Xi_5_in_0
  // pe_5.io.Yi_0 := Yi_5_in_0
  // pe_5.io.Xi_1 := Xi_5_in_1
  // pe_5.io.Yi_1 := Yi_5_in_1
  // pe_5.io.aggr_0     := aggr_5_in_0
  // pe_5.io.aggr_1     := aggr_5_in_1
  // pe_5.io.aggr_2     := aggr_5_in_2
  // pe_5.io.aggr_3     := aggr_5_in_3
  // pe_5.io.m_0_sel     := m_0_sel
  // pe_5.io.m_1_sel     := m_1_sel
  // pe_5.io.m_2_sel     := m_2_sel
  // pe_5.io.m_3_sel     := m_3_sel
  // pe_5.io.m_4_sel     := m_4_sel
  // pe_5.io.m_5_sel     := m_5_sel
  // pe_5.io.m_6_sel     := m_6_sel
  // pe_5.io.m_7_sel     := m_7_sel
  // pe_5.io.m_8_sel     := m_8_sel
  // pe_5.io.m_9_sel     := m_9_sel
  // pe_5.io.addsub_0_op := addsub_0_op
  // pe_5.io.addsub_1_op := addsub_1_op
  // pe_5.io.rounding    := rounding
  // pe_5.io.tininess    := tininess
  // pe_5.io.use_int     := use_int
  // addsub_5_out_0 := pe_5.io.out_0
  // addsub_5_out_1 := pe_5.io.out_1


  // val pe_6 = Module(new PE())
  // pe_6.io.Xi_0 := Xi_6_in_0
  // pe_6.io.Yi_0 := Yi_6_in_0
  // pe_6.io.Xi_1 := Xi_6_in_1
  // pe_6.io.Yi_1 := Yi_6_in_1
  // pe_6.io.aggr_0     := aggr_6_in_0
  // pe_6.io.aggr_1     := aggr_6_in_1
  // pe_6.io.aggr_2     := aggr_6_in_2
  // pe_6.io.aggr_3     := aggr_6_in_3
  // pe_6.io.m_0_sel     := m_0_sel
  // pe_6.io.m_1_sel     := m_1_sel
  // pe_6.io.m_2_sel     := m_2_sel
  // pe_6.io.m_3_sel     := m_3_sel
  // pe_6.io.m_4_sel     := m_4_sel
  // pe_6.io.m_5_sel     := m_5_sel
  // pe_6.io.m_6_sel     := m_6_sel
  // pe_6.io.m_7_sel     := m_7_sel
  // pe_6.io.m_8_sel     := m_8_sel
  // pe_6.io.m_9_sel     := m_9_sel
  // pe_6.io.addsub_0_op := addsub_0_op
  // pe_6.io.addsub_1_op := addsub_1_op
  // pe_6.io.rounding    := rounding
  // pe_6.io.tininess    := tininess
  // pe_6.io.use_int     := use_int
  // addsub_6_out_0 := pe_6.io.out_0
  // addsub_6_out_1 := pe_6.io.out_1

  // val pe_7 = Module(new PE())
  // pe_7.io.Xi_0 := Xi_7_in_0
  // pe_7.io.Yi_0 := Yi_7_in_0
  // pe_7.io.Xi_1 := Xi_7_in_1
  // pe_7.io.Yi_1 := Yi_7_in_1
  // pe_7.io.aggr_0     := aggr_7_in_0
  // pe_7.io.aggr_1     := aggr_7_in_1
  // pe_7.io.aggr_2     := aggr_7_in_2
  // pe_7.io.aggr_3     := aggr_7_in_3
  // pe_7.io.m_0_sel     := m_0_sel
  // pe_7.io.m_1_sel     := m_1_sel
  // pe_7.io.m_2_sel     := m_2_sel
  // pe_7.io.m_3_sel     := m_3_sel
  // pe_7.io.m_4_sel     := m_4_sel
  // pe_7.io.m_5_sel     := m_5_sel
  // pe_7.io.m_6_sel     := m_6_sel
  // pe_7.io.m_7_sel     := m_7_sel
  // pe_7.io.m_8_sel     := m_8_sel
  // pe_7.io.m_9_sel     := m_9_sel
  // pe_7.io.addsub_0_op := addsub_0_op
  // pe_7.io.addsub_1_op := addsub_1_op
  // pe_7.io.rounding    := rounding
  // pe_7.io.tininess    := tininess
  // pe_7.io.use_int     := use_int
  // addsub_7_out_0 := pe_7.io.out_0
  // addsub_7_out_1 := pe_7.io.out_1

//=======================================
// COUNTERS
//=======================================
  val L2_ADD_cycles = 10
  val L2_ADD_counter = Counter(L2_ADD_cycles)
  val L2_MULT_cycles = 10
  val L2_MULT_counter = Counter(L2_MULT_cycles)
  val STARTUP_cycles = 5
  val STARTUP_counter = Counter(STARTUP_cycles)   

//=======================================
// FSM
//=======================================
  val startup :: idle :: init_L2 :: mult_L2_s2 :: op_1 :: op_2 :: op_3 :: sum_init :: sum_start :: sum_stop :: Nil = Enum (10)
  val pe_step = RegInit ( startup )

  io.out_0 := 0.U
  io.out_1 := 0.U

  // switch ( pe_step ) 
  // {
  //   is ( startup ) {
  //       dbg_fsm := 7.U(4.W)
  //       // STARTUP_counter.inc()
  //       // when (STARTUP_counter.value === (STARTUP_cycles - 1).U) {
  //       //   //pe_step := idle
  //       //   STARTUP_counter.reset
  //       // }

  //       rounding := "b111".U(3.W)
  //       tininess := "b1".U(1.W)
  //       use_int  := true.B
  //       op_type  := "b00".U(2.W)

  //       addsub_0_op := "b00".U(2.W)
  //       addsub_1_op := "b00".U(2.W) 

  //       m_0_sel := "b01".U(2.W)
  //       m_1_sel := "b01".U(2.W)
  //       m_2_sel := "b01".U(2.W)
  //       m_3_sel := "b01".U(2.W)
  //       m_4_sel := "b00".U(2.W)
  //       m_5_sel := "b01".U(2.W)
  //       m_6_sel := "b01".U(2.W)
  //       m_7_sel := "b01".U(2.W)

  //       // output for multiplication result
  //       m_8_sel := "b01".U(2.W)
  //       m_9_sel := "b01".U(2.W)
  //       pe_step := idle
  //   }
  // }

  // switch ( pe_step ) 
  // {
  //   is ( startup ) {
  //       dbg_fsm := 7.U(4.W)
  //       STARTUP_counter.inc()
  //       when (STARTUP_counter.value === (STARTUP_cycles - 1).U) {
  //         pe_step := idle
  //         STARTUP_counter.reset
  //       }
  //   }
  //   is ( idle ) {

  //       dbg_fsm := 1.U(4.W) 

  //       switch ( op_type ) 
  //       {
  //         is ( "b00".U(2.W) )  // Euclidean distance - L2
  //         {
  //           dbg_xxx := 1.U(4.W)

  //           rounding := "b111".U(3.W)
  //           tininess := "b1".U(1.W)
  //           use_int  := true.B
  //           op_type  := "b00".U(2.W)

  //           addsub_0_op := 0.U(32.W)
  //           addsub_1_op := 0.U(32.W) 

  //           m_0_sel := "b01".U(2.W)
  //           m_1_sel := "b01".U(2.W)
  //           m_2_sel := "b01".U(2.W)
  //           m_3_sel := "b01".U(2.W)
  //           m_4_sel := "b00".U(2.W)
  //           m_5_sel := "b01".U(2.W)
  //           m_6_sel := "b01".U(2.W)
  //           m_7_sel := "b01".U(2.W)

  //           // output for multiplication result
  //           m_8_sel := "b01".U(2.W)
  //           m_9_sel := "b01".U(2.W)

  //           // L2_MULT_counter.inc()
  //           // when (L2_ADD_counter.value === (L2_MULT_cycles - 1).U) {
  //           //   pe_step := init_L2
  //           //   L2_MULT_counter.reset
  //           // }
  //           // io.out_0 := addsub_0_out_0
  //           // io.out_1 := addsub_0_out_1
            
  //           pe_step := init_L2
  //         }
  //         is ( "b01".U(2.W) ) // Manhattan distance  - L1
  //         {
  //           dbg_xxx := 2.U(4.W)
  //           pe_step := init_L2
  //         }
  //         is ( "b10".U(2.W) ) // dot product 
  //         {
  //           dbg_xxx := 3.U(4.W)
  //           pe_step := init_L2
  //         }
  //         is ( "b11".U(2.W) ) // weighted vector pooling 
  //         {
  //           dbg_xxx := 4.U(4.W)
  //           pe_step := init_L2
  //         }
  //       }
  //   }
  //   is ( init_L2 ) {
  //     dbg_fsm := 3.U(4.W)

  //     L2_ADD_counter.inc()
  //     when (L2_ADD_counter.value === (L2_ADD_cycles - 1).U) {
  //       pe_step := mult_L2_s2
  //       L2_ADD_counter.reset
  //     }
  //     // when( op_type =/= "b00".U(2.W)){
  //     //   pe_step := idle
  //     // }

  //   }
  //   is ( mult_L2_s2 ) {
  //     dbg_fsm := 4.U(4.W)  

  //     L2_MULT_counter.inc()
  //     when (L2_MULT_counter.value === (L2_MULT_cycles - 1).U) {
  //       pe_step := idle
  //       L2_MULT_counter.reset()
  //     }

  //   }
  //   is ( sum_stop ) {
  //     dbg_fsm := 5.U(4.W)
  //     // when (L2_MULT_counter.value === (L2_MULT_cycles - 1).U) {
  //     //   pe_step := sum_start
  //     //   L2_MULT_counter.reset()
  //     // }
  //     //pe_step := sum_start
  //   }
  // }
}

object PE_8 extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_8"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_8))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_8))
  )
}