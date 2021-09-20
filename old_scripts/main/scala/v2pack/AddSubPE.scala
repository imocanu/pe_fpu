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

  // val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  // mulRecFN.io.roundingMode   := rounding
  // mulRecFN.io.detectTininess := tininess
  // mulRecFN.io.a := in_0
  // mulRecFN.io.b := in_1
  // val addRecFN_out  = RegNext(mulRecFN.io.out)

  // val test = BigInt(1)<<(Config.EXP + Config.SIG - 1) 
  // val mulAddRecFN = Module(new MulAddRecFN(Config.EXP, Config.SIG))
  // mulAddRecFN.io.op := op
  // mulAddRecFN.io.a := in_0
  // mulAddRecFN.io.b := test.U
  // mulAddRecFN.io.c := in_1
  // mulAddRecFN.io.roundingMode   := rounding
  // mulAddRecFN.io.detectTininess := tininess
  // val addRecFN_out  = RegNext(mulAddRecFN.io.out)

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
