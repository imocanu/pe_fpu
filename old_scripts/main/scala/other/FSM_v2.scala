package modules

import chisel3._
import chisel3.util._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._

// Moore && Mealy

class FSM_v2 extends Module {
  val io = IO(new Bundle {
    val in1      = Input(Bool())
    val in2      = Input(Bool())
    val in3      = Input(Bool())
    val op       = Input(Bool())
    val out      = Output(Bool())
  })

  val cache :: start :: stop :: Nil = Enum (3)
  val stateReg = RegInit (cache)

  io.out := false.B

  switch ( stateReg ) {
    is ( cache ) {
      when(io.in1 ) {
        stateReg := start
        io.out := true.B
      }
    }
    is ( start ) {
      when(io.in2 ) {
        stateReg := stop
    } . elsewhen (io.in3) {
      stateReg := cache
      }
    }
    is ( stop ) {
      when (io.op) {
        stateReg := stop
      }
    }
  }
  //printf("\n[DEBUG] FSM")
}

// object FSM_v2 extends App {
//  val verilogDir = "rtl"
//  val verilogName = "FSM_Top"
//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new FSM_v2))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new FSM_v2))
//  )
// }

