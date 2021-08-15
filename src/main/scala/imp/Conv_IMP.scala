package imp

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

class Conv_IMP extends Module {
  val io = IO(new Bundle {
    val in0       = Input(Bits(Config.forIN.W))
    val in1       = Input(Bits(Config.forIN.W))
    val useINT    = Input(Bool())
    val out0      = Output(UInt(Config.forOUT.W))
    val out1      = Output(UInt(Config.forOUT.W))
  })

  val useINT_sel  = WireDefault(io.useINT)
  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in0  = RegNext(io.in0)
  val fN_in1  = RegNext(io.in1)

  when(useINT_sel){

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := fN_in0
    iNToRecFN_1.io.roundingMode   := Config.roundingMode
    iNToRecFN_1.io.detectTininess := Config.detectTininess
    val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)

    val iNToRecFN_2 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_2.io.signedIn := true.B
    iNToRecFN_2.io.in := fN_in1
    iNToRecFN_2.io.roundingMode   := Config.roundingMode
    iNToRecFN_2.io.detectTininess := Config.detectTininess
    val iNToRecFN_2_out  = RegNext(iNToRecFN_2.io.out)

    io.out0 := iNToRecFN_1_out
    io.out1 := iNToRecFN_2_out
    println("## INPUT INTEGER 32 ##")

  } .otherwise {

    val recFN_from_fN_in1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in0))
    val recFN_from_fN_in2 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in1))
    
    io.out0 := recFN_from_fN_in1
    io.out1 := recFN_from_fN_in2
    println("## INPUT FP 32 ##")
  }
}

// object Conv_IMP extends App {
//  val verilogDir = "rtl"
//  val verilogName = "Conv_IMP"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new Conv_IMP))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new Conv_IMP))
//  )
// }
