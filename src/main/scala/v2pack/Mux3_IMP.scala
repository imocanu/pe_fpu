package v2pack

import chisel3._
import chisel3.util.{is, switch}
import utils.Config
import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class Mux3_IMP extends Module {
  val io = IO(new Bundle {
    val in0        = Input(Bits(Config.forIN.W))
    val in1        = Input(Bits(Config.forIN.W))
    val in2        = Input(Bits(Config.forIN.W))
    val sel        = Input(Bits(2.W))
    val out        = Output(Bits(Config.forIN.W))
  })

  var out_W = WireDefault(0.U(32.W))
  var sel_W = WireDefault(io.sel)
  var in0_W = WireDefault(io.in0)
  var in1_W = WireDefault(io.in1)
  var in2_W = WireDefault(io.in2)

  switch(sel_W){
    is("b00".U) { out_W := in0_W }
    is("b01".U) { out_W := in1_W }
    is("b10".U) { out_W := in2_W }
    is("b11".U) { out_W := 0.U(32.W)}
  }

  io.out := out_W
}

// object Mux3_IMP extends App {
//  val verilogDir = "rtl"
//  val verilogName = "Mux3_IMP"
//  (new ChiselStage).execute(
//    Array("-X", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new Mux3_IMP))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new Mux3_IMP))
//  )
// }

