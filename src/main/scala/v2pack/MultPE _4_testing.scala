package v2pack

import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class MultPE_4_testing extends Module {
  val io = IO(new Bundle {
    val in_0     = Input(Bits(Config.forIN.W))
    val in_1     = Input(Bits(Config.forIN.W))
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val out      = Output(Bits(Config.forOUT.W))
  })
  // Rounding type
  val rounding  = RegNext(io.rounding)

  // Tininess type
  val tininess  = RegNext(io.tininess)

  // Inputs
  val in_0  = RegNext(io.in_0)
  val in_1  = RegNext(io.in_1)

  // Mul module
  val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  mulRecFN.io.roundingMode   := Config.roundingMode
  mulRecFN.io.detectTininess := Config.detectTininess
  mulRecFN.io.a := in_0
  mulRecFN.io.b := in_1
  val mulRecFN_out  = RegNext(mulRecFN.io.out)

  io.out := mulRecFN_out
}

// object MultPE_4_testing extends App {
//  val verilogDir = "rtl"
//  val verilogName = "MultPE_4_testing"
//  (new ChiselStage).execute(
//    Array("-X", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//     Seq(ChiselGeneratorAnnotation(() => new MultPE_4_testing))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//     Seq(ChiselGeneratorAnnotation(() => new MultPE_4_testing))
//  )
// }

