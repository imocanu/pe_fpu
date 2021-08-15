package imp

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class AddSub_IMP extends Module {
  val io = IO(new Bundle {
    val in0      = Input(Bits(Config.forIN.W))
    val in1      = Input(Bits(Config.forIN.W))
    val op       = Input(Bool())
    val out      = Output(UInt(Config.forOUT.W))
  })

  // Operator 
  val op_sel = RegNext(io.op)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in0  = RegNext(io.in0)
  val fN_in1  = RegNext(io.in1)

  val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
  addRecFN.io.subOp := op_sel
  addRecFN.io.a := fN_in0
  addRecFN.io.a := fN_in1
  addRecFN.io.roundingMode   := Config.roundingMode	
  addRecFN.io.detectTininess := Config.detectTininess

  io.out := addRecFN.io.out
}

// object AddSub_IMP extends App {
//  val verilogDir = "rtl"
//  val verilogName = "AddSub_IMP"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new AddSub_IMP))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new AddSub_IMP))
//  )

// }
