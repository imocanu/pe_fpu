package modules

import chisel3._
import chisel3.util._
import utils._
import hardfloat._
import chisel3.stage._
import layered.stage._

// Moore ( robust ) && Mealy ( small circuits )

class FSM extends Module {
  val io = IO(new Bundle {
    val in1      = Input(Bool())
    val in2      = Input(Bool())
    val in3      = Input(Bool())
    val op       = Input(Bool())
    val out      = Output(Bool())
  })

  val fsm  = Module ( new PopCountFSM )
  val data = Module ( new PopCountDataPath )

  val cache :: start :: stop :: Nil = Enum (3)
  val stateReg = RegInit (cache)

  switch ( stateReg ) {
    is ( cache ) {
      when(io.in1 ) {
        stateReg := start
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


  fsm.io.dinValid := io.in1
  //io.dinReady := fsm.io.dinReady
  //io.popCntValid := fsm.io.popCntValid
  fsm.io.popCntReady := io.in1

  data.io.din := io.in1
  //io.popCnt := data.io.popCnt

  data.io.load := fsm.io.load
  fsm.io.done := data.io.done

  io.out := stateReg === stop

  //printf("\n[DEBUG] FSM")
}


class PopCountDataPath extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt (8.W))
    val load = Input(Bool ())
    val popCnt = Output (UInt (4.W))
    val done = Output (Bool ())
  })

  val dataReg = RegInit (0.U(8.W))
  val popCntReg = RegInit (0.U(8.W))
  val counterReg = RegInit (0.U(4.W))
  dataReg := 0.U ## dataReg (7, 1)
  popCntReg := popCntReg + dataReg (0)
  val done = counterReg === 0.U

  when(!done) 
  {
    counterReg := counterReg - 1.U
  }
  when(io.load) 
  {
    dataReg := io.din
    popCntReg := 0.U
    counterReg := 8.U
  }
  // debug output
  printf ("%x %d\n", dataReg , popCntReg )
  io. popCnt := popCntReg
  io.done := done
}


class PopCountFSM extends Module {
  val io = IO(new Bundle {
    val dinValid = Input(Bool ())
    val dinReady = Output (Bool ())
    val popCntValid = Output (Bool ())
    val popCntReady = Input(Bool ())
    val load = Output (Bool ())
    val done = Input(Bool ())
  })

  val idle :: count :: done :: Nil = Enum (3)
  val stateReg = RegInit (idle)
  io.load := false.B
  io. dinReady := false.B
  io. popCntValid := false.B

  switch ( stateReg ) {
    is(idle) {
      io. dinReady := true.B
      when(io. dinValid ) {
        io.load := true.B
        stateReg := count
      }
    }
    is( count ) {
      when(io.done) {
        stateReg := done
      }
    }
    is(done) {
      io. popCntValid := true.B
      when(io. popCntReady ) {
        stateReg := idle
      }
    }
  }
}

// object FSM extends App {
//  val verilogDir = "rtl"
//  val verilogName = "FSM_Top"
//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//    Seq(ChiselGeneratorAnnotation(() => new FSM))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new FSM))
//  )
// }