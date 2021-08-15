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
    val in       = Input(Bits(Config.forIN.W))
    val out      = Output(UInt(Config.forOUT.W))
  })

    val in_FN = RegNext(io.in)
    val round_mode  = WireDefault(io.round)
  
    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.in           := recFNFromFN(Config.EXP, Config.SIG, in_FN)
    recFNToIN.io.roundingMode := Config.roundingMode
    recFNToIN.io.signedOut    := io.signed

    val recFNToIN_out = RegNext(recFNToIN.io.out)

    io.out := recFNToIN_out
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
