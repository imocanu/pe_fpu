package v2pack

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._
import v2pack._
import scala.sys.process.{Process, ProcessLogger}

//http://www.jhauser.us/arithmetic/HardFloat-1/doc/HardFloat-Verilog.html
//Standard IEEE formats (‘fN’)
//Recoded formats (‘recFN’)
//Raw deconstructions (‘rawFN’)

class Dummy_MULT extends Module {
  val io = IO(new Bundle {
    val rounding  = Input(UInt(3.W))
    val tininess  = Input(UInt(1.W))
    val use_int   = Input(Bool())
    val in_0      = Input(Bits(Config.forIN.W))
    val in_1      = Input(Bits(Config.forIN.W))
    val out       = Output(Bits(Config.forOUT.W))
  })

    val in_0 = RegNext(io.in_0)
    val in_1 = RegNext(io.in_1)
    val round_mode  = RegNext(io.rounding)
    val tininess    = RegNext(io.tininess)
    val use_int     = RegNext(io.use_int)

    val iNToRecFN_0 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_0.io.signedIn := true.B
    iNToRecFN_0.io.in := in_0
    iNToRecFN_0.io.roundingMode   := round_mode
    iNToRecFN_0.io.detectTininess := tininess
    val iNToRecFN_0_out  = RegNext(iNToRecFN_0.io.out)

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := in_1
    iNToRecFN_1.io.roundingMode   := round_mode
    iNToRecFN_1.io.detectTininess := tininess
    val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)



    val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
    mulRecFN.io.roundingMode   := round_mode
    mulRecFN.io.detectTininess := tininess
    mulRecFN.io.a := iNToRecFN_0_out
    mulRecFN.io.b := iNToRecFN_1_out
    val mulModule_out  = RegNext(mulRecFN.io.out)

    // val mulModule = Module(new MultPE())
    // mulModule.io.rounding   := round_mode
    // mulModule.io.tininess := tininess
    // mulModule.io.in_0 := iNToRecFN_0_out
    // mulModule.io.in_1 := iNToRecFN_1_out
    // val mulModule_out  = RegNext(mulModule.io.out)


    // val test = BigInt(1)<<(Config.EXP + Config.SIG - 1)
    // val mulAddRecFN = Module(new MulAddRecFN(Config.EXP, Config.SIG))
    // mulAddRecFN.io.op := false.B
    // mulAddRecFN.io.a := iNToRecFN_0_out
    // mulAddRecFN.io.b := iNToRecFN_0_out
    // mulAddRecFN.io.c := iNToRecFN_0_out
    //    // ((in_0 ^ in_1) & test.U)<<1
    // mulAddRecFN.io.roundingMode   := round_mode
    // mulAddRecFN.io.detectTininess := hardfloat.consts.tininess_afterRounding
    // val mulModule_out  = RegNext(mulAddRecFN.io.out)


    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.signedOut    := true.B
    recFNToIN.io.in           := mulModule_out  // addModule_out //mulModule_out
    recFNToIN.io.roundingMode := round_mode
    val recFNToIN_out = RegInit(0.U(32.W))
    recFNToIN_out := RegNext(recFNToIN.io.out)

    io.out := recFNToIN_out
}

object Dummy_MULT extends App {
 val verilogDir = "rtl"
 val verilogName = "Dummy_MULT"
 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
        Seq(ChiselGeneratorAnnotation(() => new Dummy_MULT))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new Dummy_MULT))
 )
}



    // val addModule = Module(new AddRecFN(Config.EXP, Config.SIG))
    // addModule.io.subOp := false.B
    // addModule.io.a := iNToRecFN_0_out
    // addModule.io.b := iNToRecFN_1_out
    // addModule.io.roundingMode   := round_mode	
    // addModule.io.detectTininess := hardfloat.consts.tininess_afterRounding
    // val addModule_out  = RegNext(addModule.io.out)

    // val addModule = Module(new AddSubPE())
    // addModule.io.op := false.B
    // addModule.io.in_0 := iNToRecFN_0_out
    // addModule.io.in_1 := iNToRecFN_1_out
    // addModule.io.rounding   := round_mode	
    // addModule.io.tininess   := hardfloat.consts.tininess_afterRounding
    // val addModule_out  = RegNext(addModule.io.out)