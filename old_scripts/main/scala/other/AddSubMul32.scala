package other

import chisel3._
import utils._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class AddSubMul32 extends Module {
  val io = IO(new Bundle {
    val in0 = Input(UInt(32.W))
    val in1 = Input(UInt(32.W))
    val outAdd = Output(UInt(Config.forOUT.W))
    val outSub = Output(UInt(Config.forOUT.W))
    val outMul = Output(UInt(32.W))
  })


  val input_0  = RegNext(io.in0)
  val input_1  = RegNext(io.in1)

  // val input_0  = io.in0.asSInt
  // val input_1  = io.in1.asSInt

  io.outAdd := input_0 + input_1
  io.outSub := input_0 - input_1
  io.outMul := input_0 * input_1
}

object AddSubMul32 extends App {
 val verilogDir = "rtl"
 val verilogName = "AddSubMul32"

 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new AddSubMul32))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new AddSubMul32))
 )

}
