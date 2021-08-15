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
    val in1      = Input(Bits(Config.forIN.W))
    val in2      = Input(Bits(Config.forIN.W))
    val useINT   = Input(Bool())
    val round    = Input(UInt(3.W))
    val out      = Output(UInt(Config.forOUT.W))
  })

  // INT flag
  val useINT_sel  = WireDefault(io.useINT)
  // Rounding mode 
  val round_mode  = WireDefault(io.round)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in1  = RegNext(io.in1)
  val fN_in2  = RegNext(io.in2)

  val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  mulRecFN.io.roundingMode   := round_mode
  mulRecFN.io.detectTininess := Config.detectTininess

  when(io.useINT){

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := fN_in1
    iNToRecFN_1.io.roundingMode   := round_mode
    iNToRecFN_1.io.detectTininess := Config.detectTininess
    val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)

    val iNToRecFN_2 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_2.io.signedIn := true.B
    iNToRecFN_2.io.in := fN_in2
    iNToRecFN_2.io.roundingMode   := round_mode
    iNToRecFN_2.io.detectTininess := Config.detectTininess
    val iNToRecFN_2_out  = RegNext(iNToRecFN_2.io.out)

    mulRecFN.io.a := iNToRecFN_1_out
    mulRecFN.io.b := iNToRecFN_2_out
    println("## INPUT INTEGER 32 ##")
  } .otherwise {

    val recFN_from_fN_in1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in1))
    val recFN_from_fN_in2 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in2))

    mulRecFN.io.a := recFN_from_fN_in1
    mulRecFN.io.b := recFN_from_fN_in2
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

    val out_IEEE_FP32 = RegNext(Utils.ieee(mulRecFN_out))
    io.out := out_IEEE_FP32
    println("## OUTPUT FP 32 ##")

  }

}

object Mult extends App {
 val verilogDir = "rtl"
 val verilogName = "Mult"
 (new ChiselStage).execute(
   Array("-X", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new Mult))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new Mult))
 )
}

