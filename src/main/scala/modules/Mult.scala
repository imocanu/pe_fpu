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
    val outIEEE  = Output(UInt(Config.forOUT.W))
  })

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in1  = RegNext(io.in1)
  val fN_in2  = RegNext(io.in2)

  val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
  iNToRecFN_1.io.signedIn := true.B
  iNToRecFN_1.io.in := fN_in1
  iNToRecFN_1.io.roundingMode   := hardfloat.consts.round_near_maxMag
  iNToRecFN_1.io.detectTininess := hardfloat.consts.tininess_afterRounding

  val iNToRecFN_2 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
  iNToRecFN_2.io.signedIn := true.B
  iNToRecFN_2.io.in := fN_in2
  iNToRecFN_2.io.roundingMode   := hardfloat.consts.round_near_maxMag
  iNToRecFN_2.io.detectTininess := hardfloat.consts.tininess_afterRounding

  val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  mulRecFN.io.a := recFNFromFN(Config.EXP, Config.SIG, io.in1)
  mulRecFN.io.b := recFNFromFN(Config.EXP, Config.SIG, io.in2)
  mulRecFN.io.roundingMode   := hardfloat.consts.round_near_maxMag
  mulRecFN.io.detectTininess := hardfloat.consts.tininess_afterRounding

  when(io.useINT){
    mulRecFN.io.a := iNToRecFN_1.io.out
    mulRecFN.io.b := iNToRecFN_2.io.out
    println("## USE INTEGER 32 ##")
  } .otherwise {
    mulRecFN.io.a := recFNFromFN(Config.EXP, Config.SIG, io.in1)
    mulRecFN.io.b := recFNFromFN(Config.EXP, Config.SIG, io.in2)
    println("## USE FP 32 ##")
  }

  io.outIEEE  := Utils.ieee(mulRecFN.io.out)
  //printf("=> %b",io.out.asUInt())
}

object Mult extends App {
 val verilogDir = "rtl"
 val verilogName = "Mult_Top"
 (new ChiselStage).execute(
   Array("-X", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new Mult))
 )

//  (new ChiselStage).execute(
//    Array("-X", "sverilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new Mult))
//  )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new Mult))
 )
}

