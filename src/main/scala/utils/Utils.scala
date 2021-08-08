package utils

import chisel3._
import chisel3.util.{is, switch}

object Config {

  val WIDTH = 32

  val MEM_ADDR_WIDTH = 8
  val MEM_INIT       = 1024

  val EXP       = exp(WIDTH)  
  val SIG       = sig(WIDTH) 
  val forIN     = EXP + SIG
  val forOUT    = EXP + SIG + 1
  val forSimMemOUT = 64

  val roundingMode   = hardfloat.consts.round_near_maxMag
  val detectTininess = hardfloat.consts.tininess_afterRounding

  def round_near_even   = "b000".asUInt(3.W)
  def round_minMag      = "b001".asUInt(3.W)
  def round_min         = "b010".asUInt(3.W)
  def round_max         = "b011".asUInt(3.W)
  def round_near_maxMag = "b100".asUInt(3.W)
  def round_odd         = "b110".asUInt(3.W)

  def exp(f: Int) = f match {
   case 16 => 5
   case 32 => 8
   case 64 => 11
  }

  def sig(f: Int) = f match {
   case 16 => 11
   case 32 => 24
   case 64 => 53
  }


  // def Mux3IN (sel: Bits, in0: Bits, in1: Bits, in2: Bits): Bits = {
  //   var out = RegInit(0.U(32.W))
  //   switch(sel){
  //     is("b10".U) { out := in0 }
  //     is("b01".U) { out := in1 }
  //     is("b11".U) { out := in2 }
  //   }
  //   out
  // }
}

object Utils{
  def ieee(x: UInt)   = hardfloat.fNFromRecFN(Config.EXP, Config.SIG, x)
  def recode(x: UInt) = hardfloat.recFNFromFN(Config.EXP, Config.SIG, x)
  // def int2recode(x: UInt, s: Bool) = {
  //       val iNToRecFN = Module(new INToRecFN(WIDTH, EXP, SIG))
  //       iNToRecFN.io.signedIn := s.B
  //       iNToRecFN.io.in := io.in
  //       iNToRecFN.io.roundingMode   := io.roundingMode
  //       iNToRecFN.io.detectTininess := io.detectTininess
  // }
}