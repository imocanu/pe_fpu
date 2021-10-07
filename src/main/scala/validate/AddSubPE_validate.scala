package validate

import chisel3._
import utils._
import modules._
import hardfloat._
import chisel3.stage._
import layered.stage._

class AddSubPE_validate extends Module {
  val io = IO(new Bundle {
    val op       = Input(Bool())
    val use_int  = Input(Bool())
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val in_0     = Input(UInt(Config.forIN.W))
    val in_1     = Input(UInt(Config.forIN.W))
    val out      = Output(UInt(Config.forOUT.W))
  })

  // Operation : false "+" or true "-"
  val op           = RegNext(io.op)
  // Rounding type
  val rounding     = RegNext(io.rounding)
  // Tininess type
  val tininess     = RegNext(io.tininess)
  // Use INTEGER
  val use_int      = RegNext(io.use_int)
  // Inputs
  val Xi_0  = RegNext(io.in_0)
  val Yi_0  = RegNext(io.in_1)

  // Outputs
  val Xi_recFN_0  = RegInit(0.U(Config.forOUT.W))
  val Yi_recFN_0  = RegInit(0.U(Config.forOUT.W))
  val f_out       = RegInit(0.U(Config.forOUT.W))


  val addRecFN = Module( new AddSubPE() )
  addRecFN.io.op        := op
  addRecFN.io.use_int   := use_int
  addRecFN.io.rounding  := rounding	
  addRecFN.io.tininess  := tininess

  // val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
  // addRecFN.io.subOp := op
  // addRecFN.io.roundingMode   := io.rounding	
  // addRecFN.io.detectTininess := io.tininess

  when ( use_int ) {

    addRecFN.io.in_0 := Xi_0
    addRecFN.io.in_1 := Yi_0
    //addRecFN.io.a := Xi_0
    //addRecFN.io.b := Yi_0
    println("## INPUT INTEGER 32 ##")
    
  } . otherwise {

    val recFN_from_fN_in1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, Xi_0))
    val recFN_from_fN_in2 = RegNext(recFNFromFN(Config.EXP, Config.SIG, Yi_0))
    
    addRecFN.io.in_0 := recFN_from_fN_in1
    addRecFN.io.in_1 := recFN_from_fN_in2
    //addRecFN.io.a := recFN_from_fN_in1
    //addRecFN.io.b := recFN_from_fN_in2
    println("## INPUT FP 32 ##")

  }

  f_out := addRecFN.io.out

  when ( use_int ) {
    // INT -> out
    io.out := f_out
    println("## OUTPUT INTEGER 32 ##")

  } . otherwise {
    // FP -> recFN -> out
    io.out := Utils.ieee(f_out)
    println("## OUTPUT FP 32 ##")

  }

}

// object AddSubPE_validate extends App {
//  val verilogDir = "rtl"
//  val verilogName = "AddSubPE_validate"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//     Seq(ChiselGeneratorAnnotation(() => new AddSubPE_validate))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//     Seq(ChiselGeneratorAnnotation(() => new AddSubPE_validate))
//  )

// }

