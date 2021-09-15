package v2pack

import chisel3._
import chisel3.util.{is, switch}
import utils.Config
import chisel3._
import hardfloat._
import utils._
import chisel3.stage._
import layered.stage._

class MuxPE extends Module {
  val io = IO(new Bundle {
    val in_0       = Input(Bits(Config.forIN.W))
    val in_1       = Input(Bits(Config.forIN.W))
    val in_2       = Input(Bits(Config.forIN.W))
    val in_3       = Input(Bits(Config.forIN.W))
    val sel        = Input(Bits(2.W))
    val out        = Output(Bits(Config.forIN.W))
  })

  var sel  = RegNext(io.sel)
  var in_0 = RegNext(io.in_0)
  var in_1 = RegNext(io.in_1)
  var in_2 = RegNext(io.in_2)
  var in_3 = RegNext(io.in_3)

  when ( sel === "b00".U ) 
  {
    io.out := in_0
  } 
  . elsewhen ( sel === "b01".U ) 
  {
    io.out := in_1
  } 
  . elsewhen ( sel === "b10".U ) 
  {
    io.out := in_2
  } 
  . otherwise 
  {
    io.out := in_3
  }
}

object MuxPE extends App {
 val verilogDir = "rtl"
 val verilogName = "MuxPE"
 (new ChiselStage).execute(
   Array("-X", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new MuxPE))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new MuxPE))
 )
}

