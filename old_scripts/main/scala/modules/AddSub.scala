package modules

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

class AddSub extends Module {
  val io = IO(new Bundle {
    val in1      = Input(Bits(Config.forIN.W))
    val in2      = Input(Bits(Config.forIN.W))
    val op       = Input(Bool())
    val useINT   = Input(Bool())
    val out      = Output(UInt(Config.forOUT.W))
  })

  // Operator 
  val op_sel      = RegNext(io.op)
  // INT Flag
  val useINT_sel  = WireDefault(io.useINT)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in1  = RegNext(io.in1)
  val fN_in2  = RegNext(io.in2)

  val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
  addRecFN.io.subOp := op_sel
  addRecFN.io.roundingMode   := Config.roundingMode	
  addRecFN.io.detectTininess := Config.detectTininess

  when(useINT_sel){

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := fN_in1
    iNToRecFN_1.io.roundingMode   := Config.roundingMode
    iNToRecFN_1.io.detectTininess := Config.detectTininess
    val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)

    val iNToRecFN_2 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_2.io.signedIn := true.B
    iNToRecFN_2.io.in := fN_in2
    iNToRecFN_2.io.roundingMode   := Config.roundingMode
    iNToRecFN_2.io.detectTininess := Config.detectTininess
    val iNToRecFN_2_out  = RegNext(iNToRecFN_2.io.out)

    addRecFN.io.a := iNToRecFN_1_out
    addRecFN.io.b := iNToRecFN_2_out


    println("## INPUT INTEGER 32 ##")

  } .otherwise {

    val recFN_from_fN_in1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in1))
    val recFN_from_fN_in2 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in2))
    
    addRecFN.io.a := recFN_from_fN_in1
    addRecFN.io.b := recFN_from_fN_in2
    println("## INPUT FP 32 ##")

  }

  val addRecFN_out = RegNext(addRecFN.io.out)
  
  when(useINT_sel){

    val recFNToIN = Module(new RecFNToIN(Config.EXP, Config.SIG, Config.WIDTH))
    recFNToIN.io.in           := addRecFN_out
    recFNToIN.io.roundingMode := Config.roundingMode
    recFNToIN.io.signedOut    := true.B
    val recFNToIN_out = RegNext(recFNToIN.io.out)

    io.out := recFNToIN_out
    println("## OUTPUT INTEGER 32 ##")

  } .otherwise {

    val out_IEEE_FP32 = RegNext(Utils.ieee(addRecFN_out))
    io.out := out_IEEE_FP32
    println("## OUTPUT FP 32 ##")

  }

  //printf("\n[DEBUG] readData : %d", Utils.ieee(addRecFN.io.out))
}

object AddSub extends App {
 val verilogDir = "rtl"
 val verilogName = "AddSub"

 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new AddSub))
 )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new AddSub))
 )

}
