package imp

import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class Mult_IMP extends Module {
  val io = IO(new Bundle {
    val in0      = Input(Bits(Config.forIN.W))
    val in1      = Input(Bits(Config.forIN.W))
    val out      = Output(UInt(Config.forOUT.W))
  })

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in0  = RegNext(io.in0)
  val fN_in1  = RegNext(io.in1)

  val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  mulRecFN.io.roundingMode   := Config.roundingMode
  mulRecFN.io.detectTininess := Config.detectTininess
  mulRecFN.io.a := fN_in0
  mulRecFN.io.b := fN_in1

  io.out := mulRecFN.io.out
}

// object Mult_IMP extends App {
//  val verilogDir = "rtl"
//  val verilogName = "Mult_IMP"
//  (new ChiselStage).execute(
//    Array("-X", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new Mult_IMP))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new Mult_IMP))
//  )
// }

