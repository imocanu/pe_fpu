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
    val out      = Output(UInt(33.W))
  })

    val in_test = RegNext(io.in)
    val round_mode  = WireDefault(io.round)

    val iNToRecFN = Module(new INToRecFN(Config.EXP, Config.SIG, Config.WIDTH))
    iNToRecFN.io.signedIn := true.B
    iNToRecFN.io.in := "b01001000100100100111110000000000".U // in_test
    iNToRecFN.io.roundingMode   := round_mode
    iNToRecFN.io.detectTininess := Config.detectTininess
    val mid = RegNext(iNToRecFN.io.out)



    val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
    addRecFN.io.subOp := false.B
    addRecFN.io.a :=  mid // OK recFNFromFN(Config.EXP, Config.SIG, in_test)
    addRecFN.io.b :=  mid // OK recFNFromFN(Config.EXP, Config.SIG, in_test)
    addRecFN.io.roundingMode   := round_mode
    addRecFN.io.detectTininess := Config.detectTininess
    val add = RegNext(addRecFN.io.out)


  
    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.in :=  add //add // recFNFromFN(Config.EXP, Config.SIG, mid)
      // OK recFNFromFN(Config.EXP, Config.SIG, in_test)
      //fNFromRecFN(Config.EXP, Config.SIG, recFNFromFN(Config.EXP, Config.SIG, mid))  
    recFNToIN.io.roundingMode := round_mode
    recFNToIN.io.signedOut    := true.B
    val recFNToIN_out = RegNext(recFNToIN.io.out)

    io.out := recFNToIN_out
    //io.out := fNFromRecFN(Config.EXP, Config.SIG, mid)
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
