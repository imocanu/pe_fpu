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
    //val round    = Input(UInt(3.W))
    val outIEEE  = Output(UInt(Config.forOUT.W))
  })

  val op_sel      = RegNext(io.op)
  val useINT_sel  = WireDefault(io.useINT)
  //val round_sel  = RegNext(io.round)

  // fn -> Reg_1 -> Reg_2 -> recFN
  val fN_in1  = RegNext(io.in1)
  val fN_in2  = RegNext(io.in2)

  val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
  addRecFN.io.subOp := op_sel
  addRecFN.io.roundingMode   := hardfloat.consts.round_near_maxMag	
  addRecFN.io.detectTininess := hardfloat.consts.tininess_afterRounding

  when(useINT_sel){

    val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_1.io.signedIn := true.B
    iNToRecFN_1.io.in := fN_in1
    iNToRecFN_1.io.roundingMode   := hardfloat.consts.round_near_maxMag
    iNToRecFN_1.io.detectTininess := hardfloat.consts.tininess_afterRounding
    //val iNToRecFN_1_out  = RegNext(iNToRecFN_1.io.out)

    val iNToRecFN_2 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN_2.io.signedIn := true.B
    iNToRecFN_2.io.in := fN_in2
    iNToRecFN_2.io.roundingMode   := hardfloat.consts.round_near_maxMag
    iNToRecFN_2.io.detectTininess := hardfloat.consts.tininess_afterRounding
    //val iNToRecFN_2_out  = RegNext(iNToRecFN_2.io.out)

    addRecFN.io.a := iNToRecFN_1.io.out
    addRecFN.io.b := iNToRecFN_2.io.out
    println("## USE INTEGER 32 ##")

  } .otherwise {

    //val recFN_from_fN_in1 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in1))
    //val recFN_from_fN_in2 = RegNext(recFNFromFN(Config.EXP, Config.SIG, fN_in2))
    
    addRecFN.io.a := recFNFromFN(Config.EXP, Config.SIG, fN_in1)
    addRecFN.io.b := recFNFromFN(Config.EXP, Config.SIG, fN_in2)
    println("## USE FP 32 ##")

  }

  val addRecFN_out  = WireDefault(addRecFN.io.out)
  val outIEEE_out   = WireDefault(Utils.ieee(addRecFN.io.out))

  io.outIEEE := outIEEE_out
  //printf("\n[DEBUG] readData : %d", Utils.ieee(addRecFN.io.out))
}

object AddSub extends App {
 val verilogDir = "rtl"
 val verilogName = "AddSub_Top"
 (new ChiselStage).execute(
   Array("--compiler", "verilog",
     "--target-dir", verilogDir,
     "--output-file", verilogName),
   Seq(ChiselGeneratorAnnotation(() => new AddSub))
 )

//  (new ChiselStage).execute(
//    Array("-X", "sverilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new AddSub))
//  )

//  (new ChiselStage).execute(
//    Array("-X", "high",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new AddSub))
//  )

 val targetDir = "diagram"
 (new ElkStage).execute(Array("--target-dir", targetDir),
   Seq(ChiselGeneratorAnnotation(() => new AddSub))
 )
}
