package modules

import chisel3._
import utils._
import hardfloat._
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

class INT2recFN extends Module {
  val io = IO(new Bundle {
    val in       = Input(Bits(Config.forIN.W))
    val signed   = Input(Bool())
    val round    = Input(UInt(3.W))
    val out      = Output(UInt(Config.forOUT.W))
  })

    val iNToRecFN = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN.io.signedIn := io.signed
    iNToRecFN.io.in :=  RegNext(recFNFromFN(Config.EXP, Config.SIG, io.in)) 
    iNToRecFN.io.roundingMode   := Config.roundingMode
    iNToRecFN.io.detectTininess := Config.detectTininess

    io.out  := iNToRecFN.io.out
  //println(io.outIEEE)
  //printf("\n[DEBUG] readData : %d", Utils.ieee(addRecFN.io.out))
}

