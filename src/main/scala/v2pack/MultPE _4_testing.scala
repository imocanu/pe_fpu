package v2pack

import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class MultPE_4_testing extends Module {
  val io = IO(new Bundle {
    val use_int  = Input(Bool())
    val in_0     = Input(Bits(Config.forIN.W))
    val in_1     = Input(Bits(Config.forIN.W))
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val out      = Output(Bits(Config.forOUT.W))
  })
  // Rounding type
  val rounding  = RegNext(io.rounding)
  // Tininess type
  val tininess  = RegNext(io.tininess)
  // Use INTEGER
  val use_int      = RegNext(io.use_int)
  // Inputs
  val Xi_0  = RegNext(io.in_0)
  val Yi_0  = RegNext(io.in_1)

  val Xi_recFN_0  = RegInit(0.U(Config.forOUT.W))
  val Yi_recFN_0  = RegInit(0.U(Config.forOUT.W))
  val recFN_out   = RegInit(0.U(Config.forOUT.W))

  when ( use_int ) {

    val iNToRecFN_0 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_0.io.signedIn := true.B
    iNToRecFN_0.io.in := Xi_0
    iNToRecFN_0.io.roundingMode   := rounding
    iNToRecFN_0.io.detectTininess := tininess
    Xi_recFN_0  := iNToRecFN_0.io.out

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := Yi_0
    iNToRecFN_1.io.roundingMode   := rounding
    iNToRecFN_1.io.detectTininess := tininess
    Yi_recFN_0  := iNToRecFN_1.io.out

  } . otherwise {

    Xi_recFN_0 := recFNFromFN(Config.EXP, Config.SIG, Xi_0)
    Yi_recFN_0 := recFNFromFN(Config.EXP, Config.SIG, Yi_0)

  }

  // Mult module
  val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
  mulRecFN.io.roundingMode   := rounding
  mulRecFN.io.detectTininess := tininess
  mulRecFN.io.a := Xi_recFN_0
  mulRecFN.io.b := Yi_recFN_0
  val mulRecFN_out  = RegNext(mulRecFN.io.out)

  when ( use_int ) {
    // INT -> recFN
    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.signedOut    := true.B
    recFNToIN.io.in           := mulRecFN_out
    recFNToIN.io.roundingMode := rounding
    recFN_out := recFNToIN.io.out

  } . otherwise {
    // FP -> recFN
    recFN_out := Utils.ieee(mulRecFN_out)

  }

  io.out := recFN_out
}

object MultPE_4_testing extends App {
 val verilogDir = "rtl"
 val verilogName = "MultPE_4_testing"
 (new ChiselStage).execute(
   Array("-X", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new MultPE_4_testing))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new MultPE_4_testing))
 )
}

