package v2pack

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class AddSubPE extends Module {
  val io = IO(new Bundle {
    val op       = Input(Bool())
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val in_0     = Input(UInt(Config.forOUT.W))
    val in_1     = Input(UInt(Config.forOUT.W))
    val out      = Output(UInt(Config.forOUT.W))
  })
  // Operation : false "+" or true "-"
  val op = RegNext(io.op)

  // Rounding type
  val rounding  = RegNext(io.rounding)

  // Tininess type
  val tininess  = RegNext(io.tininess)

  // Inputs
  val in_0  = RegNext(io.in_0)
  val in_1  = RegNext(io.in_1)

  // AddSub module
  val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
  addRecFN.io.subOp := op
  addRecFN.io.a := in_0
  addRecFN.io.b := in_1
  addRecFN.io.roundingMode   := rounding	
  addRecFN.io.detectTininess := tininess
  val addRecFN_out  = RegNext(addRecFN.io.out)

  io.out := addRecFN_out
}

object AddSubPE extends App {
 val verilogDir = "rtl"
 val verilogName = "AddSubPE"

 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new AddSubPE))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new AddSubPE))
 )

}
