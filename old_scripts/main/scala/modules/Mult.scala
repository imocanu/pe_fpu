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
    val useINT   = Input(Bool())
    val round    = Input(UInt(3.W))
    val in0      = Input(Bits(33.W))
    val in1      = Input(Bits(33.W))
    val out      = Output(Bits(33.W))
  })

  // INT flag
  val useINT_sel  = RegNext(io.useINT)
  // Rounding mode 
  val round_mode  = RegNext(io.round)
  // INPUTS
  val fN_in0  = RegNext(io.in0)
  val fN_in1  = RegNext(io.in1)

  val iNToRecFN_0_out = RegInit(0.U(33.W))
  val iNToRecFN_1_out = RegInit(0.U(33.W))
  val mulRecFN_out    = RegInit(0.U(33.W))
  val recFNToINT_out  = RegInit(0.U(33.W))

  when(io.useINT){

  // def exp(f: Int) = f match {
  //  case 16 => 5
  //  case 32 => 8
  //  case 64 => 11
  // }

  // def sig(f: Int) = f match {
  //  case 16 => 11
  //  case 32 => 24
  //  case 64 => 53
  // }

    val iNToRecFN_0 = Module(new INToRecFN(33, 8, 24))
    iNToRecFN_0.io.signedIn := true.B
    iNToRecFN_0.io.in := fN_in0
    iNToRecFN_0.io.roundingMode   := round_mode
    iNToRecFN_0.io.detectTininess := hardfloat.consts.tininess_afterRounding
    iNToRecFN_0_out  := iNToRecFN_0.io.out

    val iNToRecFN_1 = Module(new INToRecFN(33, 8, 24))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := fN_in1
    iNToRecFN_1.io.roundingMode   := round_mode
    iNToRecFN_1.io.detectTininess := hardfloat.consts.tininess_afterRounding
    iNToRecFN_1_out  := iNToRecFN_1.io.out

    println("## INPUT INTEGER 32 ##")

  } .otherwise {
    iNToRecFN_0_out := recFNFromFN(8, 24, fN_in0)
    iNToRecFN_1_out := recFNFromFN(8, 24, fN_in1)

    println("## INPUT FP 32 ##")
  }

  val mulRecFN = Module(new MulRecFN(8, 24))
  mulRecFN.io.roundingMode   := round_mode
  mulRecFN.io.detectTininess := hardfloat.consts.tininess_afterRounding
  mulRecFN.io.a := iNToRecFN_0_out
  mulRecFN.io.b := iNToRecFN_1_out
  mulRecFN_out  := mulRecFN.io.out

  // val mulRecFN = Module(new MulAddRecFN(11, 53))
  // mulRecFN.io.op := false.B
  // mulRecFN.io.a := iNToRecFN_0_out
  // mulRecFN.io.b := iNToRecFN_1_out
  // mulRecFN.io.c := iNToRecFN_1_out
  // mulRecFN.io.roundingMode   := round_mode
  // mulRecFN.io.detectTininess := hardfloat.consts.tininess_afterRounding
  // mulRecFN_out  := mulRecFN.io.out

  when(useINT_sel){
    val recFNToIN = Module(new RecFNToIN(8, 24, 33))
    recFNToIN.io.in           := mulRecFN_out
    recFNToIN.io.roundingMode := round_mode
    recFNToIN.io.signedOut    := true.B
    recFNToINT_out := recFNToIN.io.out

    println("## OUTPUT INTEGER 32 ##")

  } .otherwise {
    recFNToINT_out := Utils.ieee(mulRecFN_out)
    println("## OUTPUT FP 32 ##")
  }

  io.out := recFNToINT_out
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

