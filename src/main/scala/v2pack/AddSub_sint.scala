package v2pack

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class AddSub_sint extends Module {
  val io = IO(new Bundle {
    val in0 = Input(SInt(Config.WIDTH.W))
    val in1 = Input(SInt(Config.WIDTH.W))
    val op  = Input(Bool())
    val out = Output(SInt(Config.forOUT.W))
  })

  // Select operation 
  val op_sel = RegNext(io.op)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val sint_in0  = RegNext(io.in0)
  val sint_in1  = RegNext(io.in1)

  val output  = RegInit(0.S(Config.WIDTH.W))

  when(op_sel){
    output := sint_in0 - sint_in1
  } .otherwise {
    output := sint_in0 + sint_in1
  }
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
