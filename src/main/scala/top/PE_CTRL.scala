package top

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import utils._

class PE_CTRL extends Module {
  val io = IO(new Bundle {

    val m_0_sel       = Output(UInt(2.W))
    val m_1_sel       = Output(UInt(2.W))
    val m_2_sel       = Output(UInt(2.W))
    val m_3_sel       = Output(UInt(2.W))
    val m_4_sel       = Output(UInt(2.W))
    val m_5_sel       = Output(UInt(2.W))
    val m_6_sel       = Output(UInt(2.W))
    val m_7_sel       = Output(UInt(2.W))
    val m_8_sel       = Output(UInt(2.W))
    val m_9_sel       = Output(UInt(2.W))

    val addsub_0_op   = Output(UInt(2.W))
    val addsub_1_op   = Output(UInt(2.W))

    val op_type       = Input(UInt(2.W))

    val dbg_fsm = Output(UInt(4.W))

  })

//====================================
// MUX Selectors
//====================================
  val m_0_sel  = RegInit(0.U(2.W))
  val m_1_sel  = RegInit(0.U(2.W))
  val m_2_sel  = RegInit(0.U(2.W))
  val m_3_sel  = RegInit(0.U(2.W))
  val m_4_sel  = RegInit(0.U(2.W))
  val m_5_sel  = RegInit(0.U(2.W))
  val m_6_sel  = RegInit(0.U(2.W))
  val m_7_sel  = RegInit(0.U(2.W))
  val m_8_sel  = RegInit(0.U(2.W))
  val m_9_sel  = RegInit(0.U(2.W))

  val op_type  = RegNext(io.op_type)

  // AddSub operation : false "+" OR true "-"
  val addsub_0_op   = RegInit("b11".U(2.W))
  val addsub_1_op   = RegInit("b11".U(2.W))

  // INTEGER flag
  // val use_int      = RegNext(io.use_int)   // NOT USED

//====================================
// DEBUG
//====================================
  val dbg_fsm = RegInit(0.U(4.W))

  io.m_0_sel := m_0_sel
  io.m_1_sel := m_1_sel
  io.m_2_sel := m_2_sel
  io.m_3_sel := m_3_sel
  io.m_4_sel := m_4_sel
  io.m_5_sel := m_5_sel
  io.m_6_sel := m_6_sel
  io.m_7_sel := m_7_sel
  io.m_8_sel := m_8_sel
  io.m_9_sel := m_9_sel

  io.addsub_0_op := addsub_0_op
  io.addsub_1_op := addsub_1_op

  io.dbg_fsm := dbg_fsm

//=======================================
// COUNTERS
//=======================================
  val L1_cycles    = 10
  val L1_counter   = Counter(L1_cycles)

  val L2_cycles    = 15
  val L2_counter   = Counter(L2_cycles)

  val DOT_cycles   = 10
  val DOT_counter  = Counter(DOT_cycles)

  val WGT_cycles   = 15
  val WGT_counter  = Counter(WGT_cycles)

  val AGGR_cycles  = 38
  val AGGR_counter = Counter(AGGR_cycles) 

  val ADD_cycles   = 2
  val ADD_counter  = Counter(ADD_cycles)    

//=======================================
// FSM:start->Idle->L2/L1/DOT/WGT->aggr
//=======================================
  val start :: idle :: start_L2 :: start_L1 :: start_DOT :: start_WGT :: start_aggr :: final_add :: stop_aggr :: output :: Nil = Enum (10)
  val pe_step = RegInit ( start )

  switch ( pe_step ) 
  {
    is ( start ) {
      
      dbg_fsm := 9.U(4.W)
      pe_step := idle

    }
    is ( idle ) {

        dbg_fsm := 1.U(4.W) 

        switch ( op_type ) 
        {
          // Euclidean distance - L2
          is ( 0.U(2.W) )
          {
            // AddSub operation : 
            // false/0 "+" 
            // true/1  "-"
            addsub_0_op := 1.U(2.W)
            addsub_1_op := 1.U(2.W) 

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: 0.U 3: 0.U
            m_0_sel := 1.U(2.W)
            m_1_sel := 1.U(2.W)
            m_2_sel := 1.U(2.W)
            m_3_sel := 1.U(2.W)

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: AGGR 3: 0.U
            m_4_sel := 0.U(2.W)
            m_5_sel := 0.U(2.W)
            m_6_sel := 0.U(2.W)
            m_7_sel := 0.U(2.W)

            // MUX selector  : 
            // 0: from AddSub  1: from Mult  2: 0.U 3: 0.U
            m_8_sel := 1.U(2.W)
            m_9_sel := 1.U(2.W)
            
            pe_step := start_L2
          }
          // Manhattan distance  - L1
          is ( 1.U(2.W) ) 
          {
            // AddSub operation : 
            // false/0 "+" 
            // true/1  "-"
            addsub_0_op := 1.U(2.W)
            addsub_1_op := 1.U(2.W) 

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: AGGR 3: 0.U
            m_4_sel := 0.U(2.W)
            m_5_sel := 0.U(2.W)
            m_6_sel := 0.U(2.W)
            m_7_sel := 0.U(2.W)

            // MUX selector  : 
            // 0: from AddSub  1: from Mult  2: 0.U 3: 0.U
            m_8_sel := 0.U(2.W)
            m_9_sel := 0.U(2.W)
            
            pe_step := start_L1
          }
          // DOT product 
          is ( 2.U(2.W) ) 
          {
            // AddSub operation : 
            // false/0 "+" 
            // true/1  "-"
            addsub_0_op := 1.U(2.W)
            addsub_1_op := 1.U(2.W) 

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: 0.U 3: 0.U
            m_0_sel := 0.U(2.W)
            m_1_sel := 0.U(2.W)
            m_2_sel := 0.U(2.W)
            m_3_sel := 0.U(2.W)

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: AGGR 3: 0.U
            m_4_sel := 0.U(2.W)
            m_5_sel := 0.U(2.W)
            m_6_sel := 0.U(2.W)
            m_7_sel := 0.U(2.W)

            // MUX selector  : 
            // 0: from AddSub  1: from Mult  2: 0.U 3: 0.U
            m_8_sel := 1.U(2.W)
            m_9_sel := 1.U(2.W)

            pe_step := start_DOT
          }
          // Weighted vector pooling 
          is ( 3.U(2.W) ) 
          {
            // AddSub operation : 
            // false/0 "+" 
            // true/1  "-"
            addsub_0_op := 0.U(2.W)
            addsub_1_op := 0.U(2.W)

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: 0.U 3: 0.U
            m_0_sel := 0.U(2.W)
            m_1_sel := 0.U(2.W)
            m_2_sel := 0.U(2.W)
            m_3_sel := 0.U(2.W)

            // MUX selector  : 
            // 0: X/Y  1: from Mult  2: AGGR 3: 0.U
            m_4_sel := 1.U(2.W)
            m_5_sel := 1.U(2.W)
            m_6_sel := 3.U(2.W)
            m_7_sel := 3.U(2.W)

            // MUX selector  : 
            // 0: from AddSub  1: from Mult  2: 0.U 3: 0.U
            m_8_sel := 0.U(2.W)
            m_9_sel := 3.U(2.W)

            pe_step := start_WGT
          }
        }
    }
    is ( start_L2 ) {
      dbg_fsm := 2.U(4.W)

      L2_counter.inc()
      when (L2_counter.value === (L2_cycles - 1).U) {
        pe_step := start_aggr
        L2_counter.reset
      }

    }
    is ( start_L1 ) {
      dbg_fsm := 3.U(4.W)

      L1_counter.inc()
      when (L1_counter.value === (L1_cycles - 1).U) {
        pe_step := start_aggr
        L1_counter.reset
      }

    }
    is ( start_DOT ) {
      dbg_fsm := 4.U(4.W)

      DOT_counter.inc()
      when (DOT_counter.value === (DOT_cycles - 1).U) {
        pe_step := start_aggr
        DOT_counter.reset
      }

    }
    is ( start_WGT ) {
      dbg_fsm := 5.U(4.W)

      WGT_counter.inc()
      when (WGT_counter.value === (WGT_cycles - 1).U) {
        pe_step := start_aggr
        WGT_counter.reset
      }

    }
    is ( start_aggr ) {
      dbg_fsm := 7.U(4.W)

        addsub_0_op := 0.U(2.W)
        addsub_1_op := 0.U(2.W)

        // MUX selector  : 
        // 0: X/Y  1: from Mult  2: AGGR 3: 0.U
        m_4_sel := 2.U(2.W)
        m_5_sel := 2.U(2.W)
        m_6_sel := 2.U(2.W)
        m_7_sel := 2.U(2.W)

        // MUX selector  : 
        // 0: from AddSub  1: from Mult  2: 0.U 3: 0.U
        m_8_sel := 0.U(2.W)
        m_9_sel := 0.U(2.W) 

        pe_step := final_add

    }
    is ( final_add ) {
      dbg_fsm := 8.U(4.W)

      AGGR_counter.inc()
      when (AGGR_counter.value === (AGGR_cycles - 1).U) {
        
        // MUX selector  : 
        // 0: X/Y  1: from Mult  2: 0.U 3: 0.U
        m_0_sel := 3.U(2.W)
        m_1_sel := 3.U(2.W)
        m_2_sel := 3.U(2.W)
        m_3_sel := 3.U(2.W)

        // MUX selector  : 
        // 0: X/Y  1: from Mult  2: AGGR 3: 0.U
        m_4_sel := 3.U(2.W)
        m_5_sel := 3.U(2.W)
        m_6_sel := 3.U(2.W)
        m_7_sel := 3.U(2.W)

        // MUX selector  : 
        // 0: from AddSub  1: from Mult  2: 0.U 3: 0.U
        m_8_sel := 2.U(2.W)
        m_9_sel := 2.U(2.W)

        pe_step := stop_aggr
        AGGR_counter.reset
      }
    }
    is ( stop_aggr ) {
      dbg_fsm := 10.U(4.W)

       ADD_counter.inc()
       when (ADD_counter.value === (ADD_cycles - 1).U) {
         pe_step := output
          ADD_counter.reset
       }
    }
    is ( output ) {
      dbg_fsm := 11.U(4.W)

      pe_step := idle
    }
  }

}

object PE_CTRL extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_CTRL"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_CTRL))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_CTRL))
  )
}