package modules

import chisel3._
import utils._
import hardfloat._

//http://www.jhauser.us/arithmetic/HardFloat-1/doc/HardFloat-Verilog.html
//Standard IEEE formats (‘fN’)
//Recoded formats (‘recFN’)
//Raw deconstructions (‘rawFN’)

class in2recFN extends Module {
  val io = IO(new Bundle {
    val in0  = Input(Bits(Config.forIN.W))
    val signed   = Input(Bool())
    val round    = Input(UInt(3.W))
    val outIEEE  = Output(UInt(Config.forOUT.W))
  })

    val iNToRecFN = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
    iNToRecFN.io.signedIn := io.signed
    iNToRecFN.io.in := io.in0
    iNToRecFN.io.roundingMode   := io.round
    iNToRecFN.io.detectTininess := 0.U

  io.outIEEE  := iNToRecFN.io.out
  //println(io.outIEEE)
  //printf("\n[DEBUG] readData : %d", Utils.ieee(addRecFN.io.out))
}