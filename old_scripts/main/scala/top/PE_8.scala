package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._
import scala.sys.process.{Process, ProcessLogger}

class PE_8 extends Module {
  val io = IO(new Bundle {
    val Xi_0        = Input(Bits(Config.forIN.W))
    val Yi_0        = Input(Bits(Config.forIN.W))

    val Xi_1        = Input(Bits(Config.forIN.W))
    val Yi_1        = Input(Bits(Config.forIN.W))

    val Xi_2        = Input(Bits(Config.forIN.W))
    val Yi_2        = Input(Bits(Config.forIN.W))

    val Xi_3        = Input(Bits(Config.forIN.W))
    val Yi_3        = Input(Bits(Config.forIN.W))

    val Xi_4        = Input(Bits(Config.forIN.W))
    val Yi_4        = Input(Bits(Config.forIN.W))

    val Xi_5        = Input(Bits(Config.forIN.W))
    val Yi_5        = Input(Bits(Config.forIN.W))

    val Xi_6        = Input(Bits(Config.forIN.W))
    val Yi_6        = Input(Bits(Config.forIN.W))

    val Xi_7        = Input(Bits(Config.forIN.W))
    val Yi_7        = Input(Bits(Config.forIN.W))

    val op_type    = Input(Bits(3.W))

    val addsub_0_op   = Input(Bool())
    val addsub_1_op   = Input(Bool())

    val use_int       = Input(Bool())
    val round         = Input(UInt(3.W))

    val addsub_0_out  = Output(Bits(Config.forIN.W))  
    val addsub_1_out  = Output(Bits(Config.forIN.W))
  })

//====================================
// Registers for INPUTS
//====================================
  val Xi_0  = RegNext(io.Xi_0)
  val Yi_0  = RegNext(io.Yi_0)

  val Xi_1  = RegNext(io.Xi_1)
  val Yi_1  = RegNext(io.Yi_1)

  val Xi_2  = RegNext(io.Xi_2)
  val Yi_2  = RegNext(io.Yi_2)

  val Xi_3  = RegNext(io.Xi_3)
  val Yi_3  = RegNext(io.Yi_3)

  val Xi_4  = RegNext(io.Xi_4)
  val Yi_4  = RegNext(io.Yi_4)

  val Xi_5  = RegNext(io.Xi_5)
  val Yi_5  = RegNext(io.Yi_5)

  val Xi_6  = RegNext(io.Xi_6)
  val Yi_6  = RegNext(io.Yi_6)

  val Xi_7  = RegNext(io.Xi_7)
  val Yi_7  = RegNext(io.Yi_7)



  // val Xi_0_fp  = RegInit(0.U(Config.forIN.W))
  // val Yi_0_fp  = RegInit(0.U(Config.forIN.W))
  
  // val Xi_0_fp  = RegInit(0.U(Config.forIN.W))
  // val Yi_0_fp  = RegInit(0.U(Config.forIN.W))

  // val Xi_0_fp  = RegInit(0.U(Config.forIN.W))
  // val Yi_0_fp  = RegInit(0.U(Config.forIN.W))

  // val Xi_0_fp  = RegInit(0.U(Config.forIN.W))
  // val Yi_0_fp  = RegInit(0.U(Config.forIN.W))

  // val Xi_0_fp  = RegInit(0.U(Config.forIN.W))
  // val Yi_0_fp  = RegInit(0.U(Config.forIN.W))

  // val Xi_0_fp  = RegInit(0.U(Config.forIN.W))
  // val Yi_0_fp  = RegInit(0.U(Config.forIN.W))

//====================================
// Registers for Selectors
//====================================
  // val m_0_sel  = RegNext(io.m_0_sel)
  // val m_1_sel  = RegNext(io.m_1_sel)
  // val m_2_sel  = RegNext(io.m_2_sel)
  // val m_3_sel  = RegNext(io.m_3_sel)
  // val m_4_sel  = RegNext(io.m_4_sel)
  // val m_5_sel  = RegNext(io.m_5_sel)
  // val m_6_sel  = RegNext(io.m_6_sel)
  // val m_7_sel  = RegNext(io.m_7_sel)
  // val m_8_sel  = RegNext(io.m_8_sel)
  // val m_9_sel  = RegNext(io.m_9_sel)

  val addsub_0_op   = RegNext(io.addsub_0_op)
  val addsub_1_op   = RegNext(io.addsub_1_op)

  val use_int  = RegNext(io.use_int)
  val round    = RegNext(io.round)

  val addsub_0_out   = RegNext(io.addsub_0_out)
  val addsub_1_out   = RegNext(io.addsub_1_out)

//=======================================
// Shared regs for INPUTS
//=======================================
  val mux_0_out = RegInit(0.U(32.W)) 
  val mux_1_out = RegInit(0.U(32.W))  
  val mux_2_out = RegInit(0.U(32.W))
  val mux_3_out = RegInit(0.U(32.W))
  val mux_4_out = RegInit(0.U(32.W))
  val mux_5_out = RegInit(0.U(32.W))  
  val mux_6_out = RegInit(0.U(32.W))
  val mux_7_out = RegInit(0.U(32.W))
  val mux_8_out = RegInit(0.U(32.W))
  val mux_9_out = RegInit(0.U(32.W))

  when(use_int){

    println("## INPUT INTEGER 32 ##")

  } .otherwise {

    //val recFN_from_fN_in0 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in0))
    //val recFN_from_fN_in1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in1))
    println("## INPUT FP 32 ##")
  }

  val idle :: init :: op_1 :: op_2 :: op_3 :: sum_init :: sum_start :: sum_stop :: Nil = Enum (8)
  val pe_step = RegInit ( idle )

  switch ( pe_step ) 
  {
    is ( idle ) {
      pe_step := init
    }
    is ( init ) {
      pe_step := sum_stop
    }
    is ( sum_stop ) {
      pe_step := idle
    }
  }

  io.addsub_0_out := 0.U
  io.addsub_1_out := 0.U
}

// object PE_8 extends App {
//   val verilogDir = "rtl"
//   val verilogName = "PE_8"
//   (new ChiselStage).execute(
//     Array("--compiler", "verilog",
//       "--target-dir", verilogDir,
//       "--output-file", verilogName),
//     Seq(ChiselGeneratorAnnotation(() => new PE_8))
//   )

//   val targetDir = "diagram"
//   (new ElkStage).execute(Array("--target-dir", targetDir),
//     Seq(ChiselGeneratorAnnotation(() => new PE_8))
//   )
// }