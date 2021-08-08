package modules

import chisel3._
import chisel3.util.{is, switch}
import utils.Config
import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class Mux3 extends Module {
  val io = IO(new Bundle {
    val in0        = Input(Bits(Config.forIN.W))
    val in1        = Input(Bits(Config.forIN.W))
    val in2        = Input(Bits(Config.forIN.W))
    val sel        = Input(Bits(2.W))
    val outIEEE    = Output(Bits(Config.forIN.W))
  })
  var out = RegInit(0.U(32.W))
  switch(io.sel){
    is("b00".U) { out := io.in0 }
    is("b01".U) { out := io.in1 }
    is("b10".U) { out := io.in2 }
    is("b11".U) { out := 0.U(32.W) }
  }
  io.outIEEE := out
}

object Mux3 extends App {
 val verilogDir = "rtl"
 val verilogName = "Mux3_Top"
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

