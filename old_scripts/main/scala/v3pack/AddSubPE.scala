// package v2pack

// import chisel3._
// import utils._
// import hardfloat._
// import chisel3.stage._
// import layered.stage._
// import scala.sys.process.{Process, ProcessLogger}

// class AddSubPE extends Module {
//   val io = IO(new Bundle {
//     val op       = Input(Bool())
//     val use_int  = Input(Bool())
//     val rounding = Input(UInt(3.W))
//     val tininess = Input(UInt(1.W))
//     val in_0     = Input(Bits(Config.forIN.W))
//     val in_1     = Input(Bits(Config.forIN.W))
//     val out      = Output(UInt(Config.forOUT.W))
//   })
//   // Operation : false "+" or true "-"
//   val op = RegNext(io.op)
//   // Rounding type
//   val rounding     = RegNext(io.rounding)
//   // Tininess type
//   val tininess     = RegNext(io.tininess)
//   // Use INTEGER
//   val use_int      = RegNext(io.use_int)

//   // Inputs
//   val Xi_0  = RegNext(io.in_0)
//   val Yi_0  = RegNext(io.in_1)

//   val Xi_recFN_0  = RegInit(0.U(Config.forOUT.W))
//   val Yi_recFN_0  = RegInit(0.U(Config.forOUT.W))
//   val recFN_out   = RegInit(0.U(Config.forOUT.W))

//   val sig_Xi = io.in_0.asSInt
//   val sig_Yi = io.in_1.asSInt
//   //val recFN_out   = RegInit(0.U(Config.forIN.W))

//   when ( use_int ) {
    
//     val iNToRecFN_0 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
//     iNToRecFN_0.io.signedIn := true.B
//     iNToRecFN_0.io.in := Xi_0
//     iNToRecFN_0.io.roundingMode   := rounding
//     iNToRecFN_0.io.detectTininess := tininess
//     Xi_recFN_0  := iNToRecFN_0.io.out


//     val iNToRecFN_1 = Module(new INToRecFN(Config.WIDTH, Config.EXP, Config.SIG))
//     iNToRecFN_1.io.signedIn := true.B
//     iNToRecFN_1.io.in := Yi_0
//     iNToRecFN_1.io.roundingMode   := rounding
//     iNToRecFN_1.io.detectTininess := tininess
//     Yi_recFN_0  := iNToRecFN_1.io.out
    
//   } . otherwise {

//     Xi_recFN_0 := recFNFromFN(Config.EXP, Config.SIG, Xi_0)
//     Yi_recFN_0 := recFNFromFN(Config.EXP, Config.SIG, Yi_0)

//   }

//   // AddSub module
//   // val addRecFN = Module(new AddRecFN(Config.EXP, Config.SIG))
//   // addRecFN.io.subOp := op
//   // addRecFN.io.a := Xi_recFN_0
//   // addRecFN.io.b := Yi_recFN_0
//   // addRecFN.io.roundingMode   := rounding	
//   // addRecFN.io.detectTininess := tininess
//   // val addRecFN_out  = RegNext(addRecFN.io.out)

//   val addRecFN = Module( new AddSubPE() )
//   addRecFN.io.op   := op
//   addRecFN.io.in_0 := Xi_recFN_0
//   addRecFN.io.in_1 := Yi_recFN_0
//   addRecFN.io.rounding  := rounding	
//   addRecFN.io.tininess  := tininess
//   val addRecFN_out  = RegNext(addRecFN.io.out)

//   when ( use_int ) {

//     when ( op ) {
//       io.out := sig_Xi - sig_Yi
//     } . otherwise {
//       io.out := sig_Xi + sig_Yi
//     }

//   } . otherwise {

//     recFN_out := Utils.ieee(addRecFN_out)
//     io.out := recFN_out
//   }

// }

// object AddSubPE extends App {
//  val verilogDir = "rtl"
//  val verilogName = "AddSubPE"

//  (new ChiselStage).execute(
//    Array("--compiler", "verilog",
//      "--target-dir", verilogDir,
//      "--output-file", verilogName),
//     Seq(ChiselGeneratorAnnotation(() => new AddSubPE))
//  )

//  val targetDir = "diagram"
//  (new ElkStage).execute(Array("--target-dir", targetDir),
//     Seq(ChiselGeneratorAnnotation(() => new AddSubPE))
//  )

// }
