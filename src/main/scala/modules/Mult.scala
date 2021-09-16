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

class Mult extends Module {
  val io = IO(new Bundle {
    val in0      = Input(SInt(Config.forIN.W))
    val in1      = Input(SInt(Config.forIN.W))
    val fp0      = Input(Bits(Config.forIN.W))
    val fp1      = Input(Bits(Config.forIN.W))
    val useINT   = Input(Bool())
    val round    = Input(UInt(3.W))
    val out      = Output(UInt(Config.forOUT.W))
  })

  // INT flag
  val useINT_sel  = RegNext(io.useINT)
  // Rounding mode 
  val round_mode  = RegNext(io.round)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in0  = RegNext(io.in0)
  val fN_in1  = RegNext(io.in1)

  val fN_fp0  = RegNext(io.fp0)
  val fN_fp1  = RegNext(io.fp1)

  val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  mulRecFN.io.roundingMode   := round_mode
  mulRecFN.io.detectTininess := Config.detectTininess

  when(io.useINT){

    val iNToRecFN_0 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_0.io.signedIn := true.B
    iNToRecFN_0.io.in := fN_in0
    iNToRecFN_0.io.roundingMode   := round_mode
    iNToRecFN_0.io.detectTininess := Config.detectTininess
    val iNToRecFN_0_out  = RegNext(iNToRecFN_0.io.out)

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := fN_in1
    iNToRecFN_1.io.roundingMode   := round_mode
    iNToRecFN_1.io.detectTininess := Config.detectTininess
    val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)

    mulRecFN.io.a := iNToRecFN_0_out
    mulRecFN.io.b := iNToRecFN_1_out
    println("## INPUT INTEGER 32 ##")
  } .otherwise {

    val recFN_from_fN_fp0 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_fp0))
    val recFN_from_fN_fp1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_fp1))

    mulRecFN.io.a := recFN_from_fN_fp0
    mulRecFN.io.b := recFN_from_fN_fp1
    println("## INPUT FP 32 ##")
  }

  val mulRecFN_out  = RegNext(mulRecFN.io.out)

  when(useINT_sel){

    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.in           := mulRecFN_out
    recFNToIN.io.roundingMode := round_mode
    recFNToIN.io.signedOut    := true.B
    val recFNToIN_out = RegNext(recFNToIN.io.out)

    io.out := recFNToIN_out
    println("## OUTPUT INTEGER 32 ##")

  } .otherwise {

    val out_FP32 = RegNext(Utils.ieee(mulRecFN_out))
    io.out := out_FP32
    println("## OUTPUT FP 32 ##")

  }

}

// object Mult extends App {
//  val verilogDir = "rtl"
//  val verilogName = "Mult"
//  (new ChiselStage).execute(
//    Array("-X", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new Mult))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new Mult))
//  )
// }

