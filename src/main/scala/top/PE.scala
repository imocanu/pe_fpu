package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._

class PE extends Module {
  val io = IO(new Bundle {
    val Xi_0       = Input(Bits(Config.forIN.W))
    val Yi_0       = Input(Bits(Config.forIN.W))

    val Xi_1       = Input(Bits(Config.forIN.W))
    val Yi_1       = Input(Bits(Config.forIN.W))

    val aggr_0     = Input(UInt(Config.forIN.W))
    val aggr_1     = Input(UInt(Config.forIN.W))
    val aggr_2     = Input(UInt(Config.forIN.W))
    val aggr_3     = Input(UInt(Config.forIN.W))

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

    val out_0  = Output(Bits(Config.forOUT.W))  
    val out_1  = Output(Bits(Config.forOUT.W))
  })
//====================================
// INPUTS
//====================================
  val Xi_0  = RegNext(io.Xi_0)
  val Yi_0  = RegNext(io.Yi_0)

  val Xi_1  = RegNext(io.Xi_1)
  val Yi_1  = RegNext(io.Yi_1)

//====================================
// INPUTS for Aggregation
//====================================
  val aggr_0  = RegNext(io.aggr_0)
  val aggr_1  = RegNext(io.aggr_0)

  val aggr_2  = RegNext(io.aggr_0)
  val aggr_3  = RegNext(io.aggr_0)

//====================================
// SELECTORS
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
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//=======================================
// Shared regs for INPUTS/OUTPUTS
//=======================================
  val addsubModule_0_out  = RegInit(0.U(Config.forOUT.W))
  val addsubModule_1_out  = RegInit(0.U(Config.forOUT.W))
  val multModule_0_out    = RegInit(0.U(Config.forOUT.W))
  val multModule_1_out    = RegInit(0.U(Config.forOUT.W))

  val m_0_out = RegInit(0.U(Config.forOUT.W)) 
  val m_1_out = RegInit(0.U(Config.forOUT.W))  
  val m_2_out = RegInit(0.U(Config.forOUT.W))
  val m_3_out = RegInit(0.U(Config.forOUT.W))
  val m_4_out = RegInit(0.U(Config.forOUT.W))
  val m_5_out = RegInit(0.U(Config.forOUT.W))  
  val m_6_out = RegInit(0.U(Config.forOUT.W))
  val m_7_out = RegInit(0.U(Config.forOUT.W))
  val m_8_out = RegInit(0.U(Config.forOUT.W))
  val m_9_out = RegInit(0.U(Config.forOUT.W))

//=======================================
// Init Modules
//=======================================
  val m_0 = Module( new MuxPE() )
  val m_1 = Module( new MuxPE() )
  val m_2 = Module( new MuxPE() )
  val m_3 = Module( new MuxPE() )
  val m_4 = Module( new MuxPE() )
  val m_5 = Module( new MuxPE() )
  val m_6 = Module( new MuxPE() )
  val m_7 = Module( new MuxPE() )
  val m_8 = Module( new MuxPE() )
  val m_9 = Module( new MuxPE() )

  val multModule_0 = Module(new MultPE())
  val multModule_1 = Module(new MultPE())

  val addsubModule_0 = Module(new AddSubPE())
  val addsubModule_1 = Module(new AddSubPE())

//=======================================
// Layer 1  :  4 x MUX IN
//=======================================
  m_0.io.sel := m_0_sel
  m_1.io.sel := m_1_sel
  m_2.io.sel := m_2_sel
  m_3.io.sel := m_3_sel
  m_4.io.sel := m_4_sel
  m_5.io.sel := m_5_sel
  m_6.io.sel := m_6_sel
  m_7.io.sel := m_7_sel
  m_8.io.sel := m_8_sel
  m_9.io.sel := m_9_sel


  m_0.io.in_0 := Xi_0
  m_0.io.in_1 := addsubModule_0_out
  m_0.io.in_2 := 0.U(Config.forIN.W)
  m_0.io.in_3 := 0.U(Config.forIN.W)
  m_0_out := m_0.io.out

  m_1.io.in_0 := Yi_0
  m_1.io.in_1 := addsubModule_0_out
  m_1.io.in_2 := 0.U(Config.forIN.W)
  m_1.io.in_3 := 0.U(Config.forIN.W)
  m_1_out := m_1.io.out

  m_2.io.in_0 := Xi_1
  m_2.io.in_1 := addsubModule_1_out
  m_2.io.in_2 := 0.U(Config.forIN.W)
  m_2.io.in_3 := 0.U(Config.forIN.W)
  m_2_out := m_2.io.out

  m_3.io.in_0 := Yi_1
  m_3.io.in_1 := addsubModule_1_out
  m_3.io.in_2 := 0.U(Config.forIN.W)
  m_3.io.in_3 := 0.U(Config.forIN.W)
  m_3_out := m_3.io.out

//=======================================
// Layer 2  :  2 X MULT
//=======================================
  multModule_0.io.rounding   := rounding
  multModule_0.io.tininess   := tininess
  multModule_0.io.use_int    := use_int
  multModule_0.io.in_0 := m_0_out
  multModule_0.io.in_1 := m_1_out
  multModule_0_out  := multModule_0.io.out


  multModule_1.io.rounding   := rounding
  multModule_1.io.tininess   := tininess
  multModule_1.io.use_int    := use_int
  multModule_1.io.in_0 := m_2_out
  multModule_1.io.in_1 := m_3_out
  multModule_1_out  := multModule_1.io.out

//=======================================
// Layer 3  :  4 X MUX
//=======================================
  m_4.io.in_0 := Xi_0
  m_4.io.in_1 := multModule_0_out
  m_4.io.in_2 := aggr_0
  m_4.io.in_3 := 0.U(Config.forIN.W)
  m_4_out     := m_4.io.out

  m_5.io.in_0 := Yi_0
  m_5.io.in_1 := multModule_1_out
  m_5.io.in_2 := aggr_1
  m_5.io.in_3 := 0.U(Config.forIN.W)
  m_5_out     := m_5.io.out

  m_6.io.in_0 := Xi_1
  m_6.io.in_1 := multModule_1_out
  m_6.io.in_2 := aggr_2
  m_6.io.in_3 := 0.U(Config.forIN.W)
  m_6_out     := m_6.io.out

  m_7.io.in_0 := Yi_1
  m_7.io.in_1 := 0.U(Config.forIN.W)
  m_7.io.in_2 := aggr_3
  m_7.io.in_3 := 0.U(Config.forIN.W)
  m_7_out     := m_7.io.out

//=======================================
// Layer 4  :  2 X ADD/SUB
//=======================================
  addsubModule_0.io.op         := addsub_0_op
  addsubModule_0.io.rounding   := rounding	
  addsubModule_0.io.tininess   := tininess
  addsubModule_0.io.use_int    := use_int
  addsubModule_0.io.in_0       := m_4_out
  addsubModule_0.io.in_1       := m_5_out
  addsubModule_0_out  := addsubModule_0.io.out


  addsubModule_1.io.op         := addsub_1_op
  addsubModule_1.io.rounding   := rounding	
  addsubModule_1.io.tininess   := tininess
  addsubModule_1.io.use_int    := use_int
  addsubModule_1.io.in_0       := m_6_out
  addsubModule_1.io.in_1       := m_7_out
  addsubModule_1_out  := addsubModule_1.io.out

//=======================================
// Layer 5  :  2 X MUX OUT
//=======================================
  m_8.io.in_0 := addsubModule_0_out
  m_8.io.in_1 := multModule_0_out
  m_8.io.in_2 := 0.U(Config.forIN.W)
  m_8.io.in_3 := 0.U(Config.forIN.W)
  m_8_out     := m_8.io.out

  m_9.io.in_0 := addsubModule_1_out
  m_9.io.in_1 := multModule_1_out
  m_9.io.in_2 := 0.U(Config.forIN.W)
  m_9.io.in_3 := 0.U(Config.forIN.W)
  m_9_out     := m_9.io.out

//=======================================
// Layer 6  :  Outputs
//=======================================
  io.out_0 := m_8_out
  io.out_1 := m_9_out

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


















// //====================================
// // INPUTS
// //====================================
//   val Xi_0  = RegNext(io.Xi_0)
//   val Yi_0  = RegNext(io.Yi_0)

//   val Xi_1  = RegNext(io.Xi_1)
//   val Yi_1  = RegNext(io.Yi_1)

// //====================================
// // INPUTS for Aggregation
// //====================================
//   val aggr_0  = RegNext(io.aggr_0)
//   val aggr_1  = RegNext(io.aggr_0)

//   val aggr_2  = RegNext(io.aggr_0)
//   val aggr_3  = RegNext(io.aggr_0)

// //====================================
// // SELECTORS
// //====================================
//   val m_0_sel  = RegNext(io.m_0_sel)
//   val m_1_sel  = RegNext(io.m_1_sel)
//   val m_2_sel  = RegNext(io.m_2_sel)
//   val m_3_sel  = RegNext(io.m_3_sel)
//   val m_4_sel  = RegNext(io.m_4_sel)
//   val m_5_sel  = RegNext(io.m_5_sel)
//   val m_6_sel  = RegNext(io.m_6_sel)
//   val m_7_sel  = RegNext(io.m_7_sel)
//   val m_8_sel  = RegNext(io.m_8_sel)
//   val m_9_sel  = RegNext(io.m_9_sel)

//   val addsub_0_op  = RegNext(io.addsub_0_op)
//   val addsub_1_op  = RegNext(io.addsub_1_op)

//   // Rounding type
//   val rounding     = RegNext(io.rounding)
//   // Tininess type
//   val tininess     = RegNext(io.tininess)
//   // INTEGER flag
//   val use_int      = RegNext(io.use_int)

// //=======================================
// // Shared regs for INPUTS/OUTPUTS
// //=======================================
//   val addsubModule_0_out  = RegInit(0.U(Config.forOUT.W))
//   val addsubModule_1_out  = RegInit(0.U(Config.forOUT.W))
//   val multModule_0_out    = RegInit(0.U(Config.forOUT.W))
//   val multModule_1_out    = RegInit(0.U(Config.forOUT.W))

//   val m_0_out = RegInit(0.U(Config.forOUT.W)) 
//   val m_1_out = RegInit(0.U(Config.forOUT.W))  
//   val m_2_out = RegInit(0.U(Config.forOUT.W))
//   val m_3_out = RegInit(0.U(Config.forOUT.W))
//   val m_4_out = RegInit(0.U(Config.forOUT.W))
//   val m_5_out = RegInit(0.U(Config.forOUT.W))  
//   val m_6_out = RegInit(0.U(Config.forOUT.W))
//   val m_7_out = RegInit(0.U(Config.forOUT.W))
//   val m_8_out = RegInit(0.U(Config.forOUT.W))
//   val m_9_out = RegInit(0.U(Config.forOUT.W))

// //=======================================
// // Layer 1  :  4 x MUX IN
// //=======================================
//   val m_0 = Module( new MuxPE() )
//   m_0.io.sel := m_0_sel
//   m_0.io.in_0 := Xi_0
//   m_0.io.in_1 := addsubModule_0_out
//   m_0.io.in_2 := DontCare
//   m_0.io.in_3 := DontCare
//   m_0_out := m_0.io.out

//   val m_1 = Module( new MuxPE() )
//   m_1.io.sel := m_1_sel
//   m_1.io.in_0 := Yi_0
//   m_1.io.in_1 := addsubModule_0_out
//   m_1.io.in_2 := DontCare
//   m_1.io.in_3 := DontCare
//   m_1_out := m_1.io.out

//   val m_2 = Module( new MuxPE() )
//   m_2.io.sel := m_2_sel
//   m_2.io.in_0 := Xi_1
//   m_2.io.in_1 := addsubModule_1_out
//   m_2.io.in_2 := DontCare
//   m_2.io.in_3 := DontCare
//   m_2_out := m_2.io.out

//   val m_3 = Module( new MuxPE() )
//   m_3.io.sel := m_3_sel
//   m_3.io.in_0 := Yi_1
//   m_3.io.in_1 := addsubModule_1_out
//   m_3.io.in_2 := DontCare
//   m_3.io.in_3 := DontCare
//   m_3_out := m_3.io.out

// //=======================================
// // Layer 2  :  2 X MULT
// //=======================================
//   val multModule_0 = Module(new MultPE())
//   multModule_0.io.rounding   := rounding
//   multModule_0.io.tininess   := tininess
//   multModule_0.io.use_int    := use_int
//   multModule_0.io.in_0 := m_0_out
//   multModule_0.io.in_1 := m_1_out
//   multModule_0_out  := multModule_0.io.out

//   val multModule_1 = Module(new MultPE())
//   multModule_1.io.rounding   := rounding
//   multModule_1.io.tininess   := tininess
//   multModule_1.io.use_int    := use_int
//   multModule_1.io.in_0 := m_2_out
//   multModule_1.io.in_1 := m_3_out
//   multModule_1_out  := multModule_1.io.out

// //=======================================
// // Layer 3  :  4 X MUX
// //=======================================
//   val m_4 = Module( new MuxPE() )
//   m_4.io.sel  := m_0_sel
//   m_4.io.in_0 := Xi_0
//   m_4.io.in_1 := multModule_0_out
//   m_4.io.in_2 := aggr_0
//   m_4.io.in_3 := DontCare
//   m_4_out     := m_4.io.out

//   val m_5 = Module( new MuxPE() )
//   m_5.io.sel  := m_5_sel
//   m_5.io.in_0 := Yi_0
//   m_5.io.in_1 := multModule_1_out
//   m_5.io.in_2 := aggr_1
//   m_5.io.in_3 := DontCare
//   m_5_out     := m_5.io.out

//   val m_6 = Module( new MuxPE() )
//   m_6.io.sel  := m_6_sel
//   m_6.io.in_0 := Xi_1
//   m_6.io.in_1 := multModule_1_out
//   m_6.io.in_2 := aggr_2
//   m_6.io.in_3 := DontCare
//   m_6_out     := m_6.io.out

//   val m_7 = Module( new MuxPE() )
//   m_7.io.sel  := m_7_sel
//   m_7.io.in_0 := Yi_1
//   m_7.io.in_1 := DontCare
//   m_7.io.in_2 := aggr_3
//   m_7.io.in_3 := DontCare
//   m_7_out     := m_7.io.out

// //=======================================
// // Layer 4  :  2 X ADD/SUB
// //=======================================
//   val addsubModule_0 = Module(new AddSubPE())
//   addsubModule_0.io.op         := addsub_0_op
//   addsubModule_0.io.rounding   := rounding	
//   addsubModule_0.io.tininess   := tininess
//   addsubModule_0.io.use_int    := use_int
//   addsubModule_0.io.in_0       := m_4_out
//   addsubModule_0.io.in_1       := m_5_out
//   addsubModule_0_out  := addsubModule_0.io.out

//   val addsubModule_1 = Module(new AddSubPE())
//   addsubModule_1.io.op         := addsub_1_op
//   addsubModule_1.io.rounding   := rounding	
//   addsubModule_1.io.tininess   := tininess
//   addsubModule_1.io.use_int    := use_int
//   addsubModule_1.io.in_0       := m_6_out
//   addsubModule_1.io.in_1       := m_7_out
//   addsubModule_1_out  := addsubModule_1.io.out

// //=======================================
// // Layer 5  :  2 X MUX OUT
// //=======================================
//   val m_8 = Module( new MuxPE() )
//   m_8.io.sel  := m_8_sel
//   m_8.io.in_0 := addsubModule_0_out
//   m_8.io.in_1 := multModule_0_out
//   m_8.io.in_2 := DontCare
//   m_8.io.in_3 := DontCare
//   m_8_out     := m_8.io.out

//   val m_9 = Module( new MuxPE() )
//   m_9.io.sel  := m_7_sel
//   m_9.io.in_0 := addsubModule_1_out
//   m_9.io.in_1 := multModule_1_out
//   m_9.io.in_2 := DontCare
//   m_9.io.in_3 := DontCare
//   m_9_out     := m_9.io.out

// //=======================================
// // Layer 6  :  Outputs
// //=======================================
//   io.out_0 := m_8_out
//   io.out_1 := m_9_out