package modules

import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

//http://www.jhauser.us/arithmetic/HardFloat-1/doc/HardFloat-Verilog.html
//Standard IEEE formats (‘fN’)
//Recoded formats (‘recFN’)
//Raw deconstructions (‘rawFN’)

class Mult_16 extends Module {
  val io = IO(new Bundle {
    val in1      = Input(Bits(16.W))
    val in2      = Input(Bits(16.W))
    val useINT   = Input(Bool())
    val round    = Input(UInt(3.W))
    val out      = Output(UInt(17.W))
  })

  val WIDTH_16 = 16
  val EXP_16   = 5
  val SIG_16   = 11

  // INT flag
  val useINT_sel  = WireDefault(io.useINT)
  // Rounding mode 
  val round_mode  = WireDefault(io.round)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in1  = RegNext(io.in1)
  val fN_in2  = RegNext(io.in2)


  val mulRecFN = Module(new MulRecFN(EXP_16, SIG_16))
  mulRecFN.io.roundingMode   := round_mode
  mulRecFN.io.detectTininess := Config.detectTininess

  val iNToRecFN_1 = Module(new INToRecFN(WIDTH_16, EXP_16, SIG_16))
  iNToRecFN_1.io.signedIn := true.B
  iNToRecFN_1.io.in := fN_in1
  iNToRecFN_1.io.roundingMode   := round_mode
  iNToRecFN_1.io.detectTininess := Config.detectTininess
  val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)

  val iNToRecFN_2 = Module(new INToRecFN(WIDTH_16, EXP_16, SIG_16))
  iNToRecFN_2.io.signedIn := true.B
  iNToRecFN_2.io.in := fN_in2
  iNToRecFN_2.io.roundingMode   := round_mode
  iNToRecFN_2.io.detectTininess := Config.detectTininess
  val iNToRecFN_2_out  = RegNext(iNToRecFN_2.io.out)

  mulRecFN.io.a := iNToRecFN_1_out
  mulRecFN.io.b := iNToRecFN_2_out
  println("## INPUT INTEGER 16 ##")

  val mulRecFN_out  = RegNext(mulRecFN.io.out)

  val recFNToIN = Module(new RecFNToIN(EXP_16, SIG_16, WIDTH_16))
  recFNToIN.io.in           := mulRecFN_out
  recFNToIN.io.roundingMode := round_mode
  recFNToIN.io.signedOut    := true.B
  //val recFNToIN_out = RegNext(recFNToIN.io.out)

  // val recFNToRecFN =
  //     Module(
  //         new RecFNToRecFN(EXP_16, SIG_16, Config.EXP, Config.SIG))
  // recFNToRecFN.io.in := recFNFromFN(EXP_16, SIG_16, recFNToIN_out)
  // recFNToRecFN.io.roundingMode   := round_mode
  // recFNToRecFN.io.detectTininess := Config.detectTininess

  io.out := recFNToIN.io.out
  println("## OUTPUT INTEGER 16 ##")
  
}

// object Mult_16 extends App {
//  val verilogDir = "rtl"
//  val verilogName = "Mult_16"
//  (new ChiselStage).execute(
//    Array("-X", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new Mult_16))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new Mult_16))
//  )
// }

