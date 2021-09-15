package other

import chisel3._
import utils._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class AddSubMul32 extends Module {
  val io = IO(new Bundle {
    val in0 = Input(SInt(Config.WIDTH.W))
    val in1 = Input(SInt(Config.WIDTH.W))
    val outAdd = Output(SInt(Config.forOUT.W))
    val outSub = Output(SInt(Config.forOUT.W))
    val outMul = Output(SInt(Config.forOUT.W))
  })


  val input_0  = RegNext(io.in0)
  val input_1  = RegNext(io.in1)

  io.outAdd := input_0 + input_1
  io.outSub := input_0 - input_1
  io.outMul := input_0 * input_1
}

// object AddSubMul32 extends App {
//  val verilogDir = "rtl"
//  val verilogName = "AddSubMul32"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new AddSubMul32))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new AddSubMul32))
//  )

// }
