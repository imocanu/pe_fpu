package top_combo

import chisel3.stage._
import layered.stage._
import chisel3._
import chisel3.util._
import modules._
import top._
import utils._

class PE_V2 extends Module {
  val io = IO(new Bundle {
    val Xi_0_in_0     = Input(Bits(Config.forIN.W))
    val Yi_0_in_0     = Input(Bits(Config.forIN.W))
    val Xi_0_in_1     = Input(Bits(Config.forIN.W))
    val Yi_0_in_1     = Input(Bits(Config.forIN.W))

    val Xi_1_in_0     = Input(Bits(Config.forIN.W))
    val Yi_1_in_0     = Input(Bits(Config.forIN.W))
    val Xi_1_in_1     = Input(Bits(Config.forIN.W))
    val Yi_1_in_1     = Input(Bits(Config.forIN.W))

    val Xi_2_in_0     = Input(Bits(Config.forIN.W))
    val Yi_2_in_0     = Input(Bits(Config.forIN.W))
    val Xi_2_in_1     = Input(Bits(Config.forIN.W))
    val Yi_2_in_1     = Input(Bits(Config.forIN.W))

    val Xi_3_in_0     = Input(Bits(Config.forIN.W))
    val Yi_3_in_0     = Input(Bits(Config.forIN.W))
    val Xi_3_in_1     = Input(Bits(Config.forIN.W))
    val Yi_3_in_1     = Input(Bits(Config.forIN.W))

    val Xi_4_in_0     = Input(Bits(Config.forIN.W))
    val Yi_4_in_0     = Input(Bits(Config.forIN.W))
    val Xi_4_in_1     = Input(Bits(Config.forIN.W))
    val Yi_4_in_1     = Input(Bits(Config.forIN.W))

    val Xi_5_in_0     = Input(Bits(Config.forIN.W))
    val Yi_5_in_0     = Input(Bits(Config.forIN.W))
    val Xi_5_in_1     = Input(Bits(Config.forIN.W))
    val Yi_5_in_1     = Input(Bits(Config.forIN.W))

    val Xi_6_in_0     = Input(Bits(Config.forIN.W))
    val Yi_6_in_0     = Input(Bits(Config.forIN.W))
    val Xi_6_in_1     = Input(Bits(Config.forIN.W))
    val Yi_6_in_1     = Input(Bits(Config.forIN.W))

    val Xi_7_in_0     = Input(Bits(Config.forIN.W))
    val Yi_7_in_0     = Input(Bits(Config.forIN.W))
    val Xi_7_in_1     = Input(Bits(Config.forIN.W))
    val Yi_7_in_1     = Input(Bits(Config.forIN.W))

    val op_type       = Input(Bits(2.W))

    val use_int       = Input(Bool())
    val tininess      = Input(UInt(1.W))
    val rounding      = Input(UInt(3.W))

    val out  = Output(Bits(Config.forIN.W))  
  })

//====================================
// Registers for INPUTS
//====================================
  val Xi_0_in_0  = RegNext(io.Xi_0_in_0)
  val Yi_0_in_0  = RegNext(io.Yi_0_in_0)
  val Xi_0_in_1  = RegNext(io.Xi_0_in_1)
  val Yi_0_in_1  = RegNext(io.Yi_0_in_1)

  val Xi_1_in_0  = RegNext(io.Xi_1_in_0)
  val Yi_1_in_0  = RegNext(io.Yi_1_in_0)
  val Xi_1_in_1  = RegNext(io.Xi_1_in_1)
  val Yi_1_in_1  = RegNext(io.Yi_1_in_1)

  val Xi_2_in_0  = RegNext(io.Xi_2_in_0)
  val Yi_2_in_0  = RegNext(io.Yi_2_in_0)
  val Xi_2_in_1  = RegNext(io.Xi_2_in_1)
  val Yi_2_in_1  = RegNext(io.Yi_2_in_1)

  val Xi_3_in_0  = RegNext(io.Xi_3_in_0)
  val Yi_3_in_0  = RegNext(io.Yi_3_in_0)
  val Xi_3_in_1  = RegNext(io.Xi_3_in_1)
  val Yi_3_in_1  = RegNext(io.Yi_3_in_1)

  val Xi_4_in_0  = RegNext(io.Xi_4_in_0)
  val Yi_4_in_0  = RegNext(io.Yi_4_in_0)
  val Xi_4_in_1  = RegNext(io.Xi_4_in_1)
  val Yi_4_in_1  = RegNext(io.Yi_4_in_1)

  val Xi_5_in_0  = RegNext(io.Xi_5_in_0)
  val Yi_5_in_0  = RegNext(io.Yi_5_in_0)
  val Xi_5_in_1  = RegNext(io.Xi_5_in_1)
  val Yi_5_in_1  = RegNext(io.Yi_5_in_1)

  val Xi_6_in_0  = RegNext(io.Xi_6_in_0)
  val Yi_6_in_0  = RegNext(io.Yi_6_in_0)
  val Xi_6_in_1  = RegNext(io.Xi_6_in_1)
  val Yi_6_in_1  = RegNext(io.Yi_6_in_1)

  val Xi_7_in_0  = RegNext(io.Xi_7_in_0)
  val Yi_7_in_0  = RegNext(io.Yi_7_in_0)
  val Xi_7_in_1  = RegNext(io.Xi_7_in_1)
  val Yi_7_in_1  = RegNext(io.Yi_7_in_1)

//====================================
// Registers for Selectors
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

  val op_type   = RegNext(io.op_type)

  // AddSub operation : false "+" OR true "-"
  val addsub_0_op   = RegInit("b11".U(2.W))
  val addsub_1_op   = RegInit("b11".U(2.W))

  // ROUNDING type
  val rounding     = RegNext(io.rounding)
  // TININESS type
  val tininess     = RegNext(io.tininess)
  // INTEGER flag
  val use_int      = RegNext(io.use_int)

//====================================
// Registers for OUTPUTS
//====================================
  val addsum_out   = RegInit(0.U(Config.forIN.W))
  val out          = RegInit(0.U(Config.forIN.W))
  io.out := out

//=======================================
// Shared regs for INPUTS
//=======================================
  val addsum_in_0 = RegInit(0.U(Config.forIN.W))
  val addsum_in_1 = RegInit(0.U(Config.forIN.W))

//====================================
// DEBUG
//====================================
  val dbg_fsm = RegInit(0.U(4.W))
  val dbg_opt = RegInit(0.U(4.W))

//=======================================
// PE_8IP module
//=======================================
  val pe_8IP = Module(new PE_8IP())
  pe_8IP.io.use_int  := use_int
  pe_8IP.io.tininess := tininess
  pe_8IP.io.rounding := rounding

  pe_8IP.io.Xi_0_in_0 := Xi_0_in_0
  pe_8IP.io.Yi_0_in_0 := Yi_0_in_0
  pe_8IP.io.Xi_0_in_1 := Xi_0_in_1
  pe_8IP.io.Yi_0_in_1 := Yi_0_in_1

  pe_8IP.io.Xi_1_in_0 := Xi_1_in_0
  pe_8IP.io.Yi_1_in_0 := Yi_1_in_0
  pe_8IP.io.Xi_1_in_1 := Xi_1_in_1
  pe_8IP.io.Yi_1_in_1 := Yi_1_in_1

  pe_8IP.io.Xi_2_in_0 := Xi_2_in_0
  pe_8IP.io.Yi_2_in_0 := Yi_2_in_0
  pe_8IP.io.Xi_2_in_1 := Xi_2_in_1
  pe_8IP.io.Yi_2_in_1 := Yi_2_in_1

  pe_8IP.io.Xi_3_in_0 := Xi_3_in_0
  pe_8IP.io.Yi_3_in_0 := Yi_3_in_0
  pe_8IP.io.Xi_3_in_1 := Xi_3_in_1
  pe_8IP.io.Yi_3_in_1 := Yi_3_in_1

  pe_8IP.io.Xi_4_in_0 := Xi_4_in_0
  pe_8IP.io.Yi_4_in_0 := Yi_4_in_0
  pe_8IP.io.Xi_4_in_1 := Xi_4_in_1
  pe_8IP.io.Yi_4_in_1 := Yi_4_in_1

  pe_8IP.io.Xi_5_in_0 := Xi_5_in_0
  pe_8IP.io.Yi_5_in_0 := Yi_5_in_0
  pe_8IP.io.Xi_5_in_1 := Xi_5_in_1
  pe_8IP.io.Yi_5_in_1 := Yi_5_in_1

  pe_8IP.io.Xi_6_in_0 := Xi_6_in_0
  pe_8IP.io.Yi_6_in_0 := Yi_6_in_0
  pe_8IP.io.Xi_6_in_1 := Xi_6_in_1
  pe_8IP.io.Yi_6_in_1 := Yi_6_in_1

  pe_8IP.io.Xi_7_in_0 := Xi_7_in_0
  pe_8IP.io.Yi_7_in_0 := Yi_7_in_0
  pe_8IP.io.Xi_7_in_1 := Xi_7_in_1
  pe_8IP.io.Yi_7_in_1 := Yi_7_in_1

  pe_8IP.io.m_0_sel := m_0_sel
  pe_8IP.io.m_1_sel := m_1_sel
  pe_8IP.io.m_2_sel := m_2_sel
  pe_8IP.io.m_3_sel := m_3_sel
  pe_8IP.io.m_4_sel := m_4_sel
  pe_8IP.io.m_5_sel := m_5_sel
  pe_8IP.io.m_6_sel := m_6_sel
  pe_8IP.io.m_7_sel := m_7_sel
  pe_8IP.io.m_8_sel := m_8_sel
  pe_8IP.io.m_9_sel := m_9_sel

  pe_8IP.io.addsub_0_op := addsub_0_op
  pe_8IP.io.addsub_1_op := addsub_1_op

  val aggr0 = RegNext(pe_8IP.io.aggr0)
  val aggr1 = RegNext(pe_8IP.io.aggr1)
  val aggr2 = RegNext(pe_8IP.io.aggr2)
  val aggr3 = RegNext(pe_8IP.io.aggr3)

  out := pe_8IP.io.out

//=======================================
// COUNTERS
//=======================================
  // val STARTUP_cycles    = 10
  // val STARTUP_counter   = Counter(STARTUP_cycles)

  val L1_cycles    = 10
  val L1_counter   = Counter(L1_cycles)

  val L2_cycles    = 15
  val L2_counter   = Counter(L2_cycles)

  val DOT_cycles   = 10
  val DOT_counter  = Counter(DOT_cycles)

  val WGT_cycles   = 15
  val WGT_counter  = Counter(WGT_cycles)

  val AGGR_cycles  = 37
  val AGGR_counter = Counter(AGGR_cycles) 

  val ADD_cycles   = 4
  val ADD_counter  = Counter(ADD_cycles)    

//=======================================
// FSM:Startup->Idle->L2/L1/DOT/WGT->aggr
//=======================================
  val startup :: idle :: start_L2 :: start_L1 :: start_DOT :: start_WGT :: start_aggr :: final_add :: stop_aggr :: Nil = Enum (9)
  val pe_step = RegInit ( startup )

  switch ( pe_step ) 
  {
    is ( startup ) {
      
      dbg_fsm := 9.U(4.W)        
      pe_step := idle

    }
    is ( idle ) {

        dbg_fsm := 1.U(4.W) 

        switch ( op_type ) 
        {
          // Euclidean distance - L2
          is ( "b00".U(2.W) )
          {
            // DEBUG - L2
            dbg_opt := 1.U(4.W)

            // AddSub operation : false "+" OR true "-"
            addsub_0_op := 1.U(2.W)
            addsub_1_op := 1.U(2.W) 

            m_0_sel := 1.U(2.W)
            m_1_sel := 1.U(2.W)
            m_2_sel := 1.U(2.W)
            m_3_sel := 1.U(2.W)

            m_4_sel := 0.U(2.W)
            m_5_sel := 0.U(2.W)
            m_6_sel := 0.U(2.W)
            m_7_sel := 0.U(2.W)

            // output from Mult
            m_8_sel := 1.U(2.W)
            m_9_sel := 1.U(2.W)
            
            pe_step := start_L2
          }
          // Manhattan distance  - L1
          is ( "b01".U(2.W) ) 
          {
            // DEBUG - L1
            dbg_opt := 2.U(4.W)

            // AddSub operation : false "+" OR true "-"
            addsub_0_op := 1.U(2.W)
            addsub_1_op := 1.U(2.W) 

            m_4_sel := 0.U(2.W)
            m_5_sel := 0.U(2.W)
            m_6_sel := 0.U(2.W)
            m_7_sel := 0.U(2.W)

            // output from AddSub
            m_8_sel := 0.U(2.W)
            m_9_sel := 0.U(2.W)
            
            pe_step := start_L1
          }
          // DOT product 
          is ( "b10".U(2.W) ) 
          {
            // DEBUG - DOT
            dbg_opt := 3.U(4.W)

            // AddSub operation : false "+" OR true "-"
            addsub_0_op := 0.U(2.W)
            addsub_1_op := 0.U(2.W) 

            m_0_sel := 0.U(2.W)
            m_1_sel := 0.U(2.W)
            m_2_sel := 0.U(2.W)
            m_3_sel := 0.U(2.W)

            m_4_sel := 0.U(2.W)
            m_5_sel := 0.U(2.W)
            m_6_sel := 0.U(2.W)
            m_7_sel := 0.U(2.W)

            // output from Mult
            m_8_sel := 1.U(2.W)
            m_9_sel := 1.U(2.W)

            pe_step := start_DOT
          }
          // Weighted vector pooling 
          is ( "b11".U(2.W) ) 
          {
            // DEBUG - WGT
            dbg_opt := 4.U(4.W)

            // AddSub operation : false "+" OR true "-"
            addsub_0_op := 0.U(2.W)
            addsub_1_op := 0.U(2.W)

            m_0_sel := 0.U(2.W)
            m_1_sel := 0.U(2.W)
            m_2_sel := 0.U(2.W)
            m_3_sel := 0.U(2.W)

            m_4_sel := 1.U(2.W)
            m_5_sel := 1.U(2.W)
            m_6_sel := 3.U(2.W)
            m_7_sel := 3.U(2.W)

            // output from AddSub
            m_8_sel := 0.U(2.W)
            m_9_sel := 0.U(2.W)

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

        m_4_sel := "b10".U(2.W)
        m_5_sel := "b10".U(2.W)
        m_6_sel := "b10".U(2.W)
        m_7_sel := "b10".U(2.W)

        m_8_sel := "b00".U(2.W)
        m_9_sel := "b00".U(2.W) 

        pe_step := final_add

    }
    is ( final_add ) {
      dbg_fsm := 8.U(4.W)

      AGGR_counter.inc()
      when (AGGR_counter.value === (AGGR_cycles - 1).U) {
        
        //addsum_in_0 := pe_0_out_0
        //addsum_in_1 := pe_0_out_1  

        m_4_sel := 3.U(2.W)
        m_5_sel := 3.U(2.W)
        m_6_sel := 3.U(2.W)
        m_7_sel := 3.U(2.W)
        m_8_sel := 2.U(2.W)
        m_9_sel := 2.U(2.W)

        pe_step := stop_aggr
        AGGR_counter.reset
      }
    }
    is ( stop_aggr ) {
      dbg_fsm := 11.U(4.W)

      ADD_counter.inc()
      when (ADD_counter.value === (ADD_cycles - 1).U) {
        
        pe_step := idle
        ADD_counter.reset
      }
    }
  }
}

object PE_V2 extends App {
  val verilogDir = "rtl"
  val verilogName = "PE_V2"
  (new ChiselStage).execute(
    Array("--compiler", "verilog",
      "--target-dir", verilogDir,
      "--output-file", verilogName),
    Seq(ChiselGeneratorAnnotation(() => new PE_V2))
  )

  val targetDir = "diagram"
  (new ElkStage).execute(Array("--target-dir", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PE_V2))
  )
}