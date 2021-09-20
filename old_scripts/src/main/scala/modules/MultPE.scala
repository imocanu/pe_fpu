package modules

import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class MultPE extends Module {
  val io = IO(new Bundle {
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val in_0     = Input(UInt(Config.forOUT.W))
    val in_1     = Input(UInt(Config.forOUT.W))
    val out      = Output(UInt(Config.forOUT.W))
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
  mulRecFN.io.roundingMode   := rounding
  mulRecFN.io.detectTininess := tininess
  mulRecFN.io.a := in_0
  mulRecFN.io.b := in_1
  val mulRecFN_out  = RegNext(mulRecFN.io.out)

  io.out := mulRecFN_out
}

object MultPE extends App {
 val verilogDir = "rtl"
 val verilogName = "Mult"
 (new ChiselStage).execute(
   Array("-X", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
        Seq(ChiselGeneratorAnnotation(() => new MultPE))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new MultPE))
 )
}

