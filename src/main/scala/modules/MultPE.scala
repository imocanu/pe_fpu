package modules

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._


class MultPE extends Module {
  val io = IO(new Bundle {
    val use_int  = Input(Bool())
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val in_0     = Input(UInt(Config.forIN.W))
    val in_1     = Input(UInt(Config.forIN.W))
    val out      = Output(UInt(Config.forIN.W))
  })

  // Rounding type
  val rounding  = RegNext(io.rounding)
  // Tininess type
  val tininess  = RegNext(io.tininess)
  // INTEGER Flag
  val use_int   = RegNext(io.use_int)
  // OUTPUT
  val module_out = RegInit(0.U(Config.forOUT.W))

  when(use_int){
    
    val sign_in_0  = RegNext(io.in_0.asSInt())
    val sign_in_1  = RegNext(io.in_1.asSInt())

    // Operation : multiplication
    module_out := (sign_in_0 * sign_in_1).asUInt()

    io.out := module_out
    println("## INTEGER 32 ##")

  } .otherwise {

    val fN_in_0  = RegNext(io.in_0)
    val fN_in_1  = RegNext(io.in_1)

    // FN -> recFN
    val recFN_from_fN_in_0 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in_0))
    val recFN_from_fN_in_1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in_1))

    // Operation : false "+" or true "-"
    val mulRecFN = Module(new MulRecFN(Config.EXP, Config.SIG))
    mulRecFN.io.roundingMode   := rounding
    mulRecFN.io.detectTininess := tininess
    mulRecFN.io.a := recFN_from_fN_in_0
    mulRecFN.io.b := recFN_from_fN_in_1

    module_out := mulRecFN.io.out

    io.out := Utils.ieee(module_out)
    println("## FP 32 ##")

  }

}

object MultPE extends App {
 val verilogDir = "rtl"
 val verilogName = "MultPE"

 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new MultPE))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new MultPE))
 )

}