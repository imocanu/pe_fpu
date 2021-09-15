package v2pack

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class AddSub_fp extends Module {
  val io = IO(new Bundle {
    val in0      = Input(SInt(Config.forIN.W))
    val in1      = Input(SInt(Config.forIN.W))
    val fp0      = Input(Bits(Config.forIN.W))
    val fp1      = Input(Bits(Config.forIN.W))
    val op       = Input(Bool())
    val use_int  = Input(Bool())
    val out      = Output(Bits(Config.forOUT.W))
    val sint_out      = Output(SInt(Config.forOUT.W))
  })

  io.out := 0.U(32.W)
  io.sint_out := 0.S(32.W)

  // Operator 
  val op = RegNext(io.op)

  // Flag for INT input
  val use_int = RegNext(io.use_int)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in0  = RegNext(io.fp0)
  val fN_in1  = RegNext(io.fp1)

  val sint_in0  = RegNext(io.in0)
  val sint_in1  = RegNext(io.in1)

  val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
  addRecFN.io.subOp := op
  addRecFN.io.a := fN_in0
  addRecFN.io.b := fN_in1
  addRecFN.io.roundingMode   := Config.roundingMode	
  addRecFN.io.detectTininess := Config.detectTininess

  when(use_int){

    when(op){
      io.sint_out := sint_in0 - sint_in1
    } .otherwise {
      io.sint_out := sint_in0 + sint_in1
    }

  } .otherwise {

    io.out := addRecFN.io.out

  }
}

// object AddSub_fp extends App {
//  val verilogDir = "rtl"
//  val verilogName = "AddSub_fp"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new AddSub_fp))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new AddSub_fp))
//  )

// }
