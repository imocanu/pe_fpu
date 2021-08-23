package other

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import scala.sys.process.{Process, ProcessLogger}

//http://www.jhauser.us/arithmetic/HardFloat-1/doc/HardFloat-Verilog.html
//Standard IEEE formats (‘fN’)
//Recoded formats (‘recFN’)
//Raw deconstructions (‘rawFN’)

class recFN2INT extends Module {
  val io = IO(new Bundle {
    val signed   = Input(Bool())
    val round    = Input(UInt(3.W))
    val in       = Input(Bits(32.W))
    val out      = Output(Bits(32.W))
  })

    //val in_test = RegNext(io.in)
    //val in_test = WireDefault(io.in.asSInt)
    val in_test = RegNext(io.in)
    val round_mode  = RegNext(io.round)

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := in_test 
    // "b11111111111110110000001111101010".asUInt(32.W)
    iNToRecFN_1.io.roundingMode   := round_mode
    iNToRecFN_1.io.detectTininess := hardfloat.consts.tininess_afterRounding
    val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)


    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.in           := iNToRecFN_1_out
    recFNToIN.io.roundingMode := round_mode
    recFNToIN.io.signedOut    := true.B
    val recFNToIN_out = RegNext(recFNToIN.io.out)

    io.out := recFNToIN_out
    //io.out := iNToRecFN_1_out
}

object recFN2INT extends App {
 val verilogDir = "rtl"
 val verilogName = "recFN2INT"
 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new recFN2INT))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new recFN2INT))
 )
}
