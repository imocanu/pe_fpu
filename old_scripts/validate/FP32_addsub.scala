package validate

import chisel3._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._


class FP32_addsub extends Module {
  val io = IO(new Bundle {
    val use_int  = Input(Bool())
    val op       = Input(Bool())
    val rounding = Input(UInt(3.W))
    val tininess = Input(UInt(1.W))
    val in_0     = Input(Bits(Config.forIN.W))
    val in_1     = Input(Bits(Config.forIN.W))
    val out      = Output(Bits(Config.forOUT.W))
  })

  // OPERATOR 
  val op       = RegNext(io.op)
  // INTEGER Flag
  val use_int  = RegNext(io.use_int)
  // OUTPUT
  val module_out = RegInit(0.U(Config.forOUT.W))

  when(use_int){
    
    val sign_in_0  = RegNext(io.in_0.asSInt())
    val sign_in_1  = RegNext(io.in_1.asSInt())

    // Operation : false "+" or true "-"
    when ( op ) {
      module_out := (sign_in_0 - sign_in_1).asUInt()
    } . otherwise {
      module_out := (sign_in_0 + sign_in_1).asUInt()
    }

    io.out := module_out
    println("## INTEGER 32 ##")

  } .otherwise {

    val fN_in_0  = RegNext(io.in_0)
    val fN_in_1  = RegNext(io.in_1)

    // FN -> recFN
    val recFN_from_fN_in_0 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in_0))
    val recFN_from_fN_in_1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in_1))

    // Operation : false "+" or true "-"
    val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
    addRecFN.io.subOp := op
    addRecFN.io.roundingMode   := io.rounding	
    addRecFN.io.detectTininess := io.tininess
    addRecFN.io.a := recFN_from_fN_in_0
    addRecFN.io.b := recFN_from_fN_in_1

    module_out := addRecFN.io.out

    io.out := Utils.ieee(module_out)
    println("## FP 32 ##")

  }

}

// object FP32_addsub extends App {
//  val verilogDir = "rtl"
//  val verilogName = "FP32_addsub"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new FP32_addsub))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new FP32_addsub))
//  )

// }