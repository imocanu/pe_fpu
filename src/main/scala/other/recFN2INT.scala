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
    val in       = Input(Bits(16.W))
    val out      = Output(UInt(17.W))
  })

    val in_FN = RegNext(io.in)
    val round_mode  = WireDefault(io.round)
  
    val recFNToIN = Module(new RecFNToIN(5, 11, 16))
    recFNToIN.io.in           := recFNFromFN(5, 11, in_FN)
    recFNToIN.io.roundingMode := round_mode
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
