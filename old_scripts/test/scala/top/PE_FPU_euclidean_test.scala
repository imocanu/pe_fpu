// package top

// import chisel3._
// import chisel3.util._
// import chisel3.iotesters._
// import org.scalatest.Matchers
// import scala.io.Source
// import utils.TestUtils
// import scala.collection.mutable.ArrayBuffer

// class PE_FP32_test4_euclidean (dut: PE_FPU) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INPUT_2)
//   var test_output = TestUtils.read(TestUtils.PE_FP32_TEST_4_RESULT)

//   println(" ----->  PE_FP32_test4_euclidean ( FP32 )")
//   var in1 =""
//   var in2 =""
//   var out =""
//   var sim_Mem = 0
//   var bin_mem = ""
//   var to_Store = ""

//   step(10)

//   for (i <- 0 to input_1.size - 1) 
//   {
//     in1 = "b"+ input_1(i)
//     in2 = "b"+ input_2(i)
//     out = "b"+ test_output(i)
    
//     poke(dut.io.simMemOut, 0.U(64.W))
//     poke(dut.io.useINT_ALL, false.B)
//     poke(dut.io.Xi, in2.U)
//     poke(dut.io.Yi, in1.U)
//     poke(dut.io.a1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

//     step(10)
//     poke(dut.io.addsub_1_op, true.B) // SUB
//     poke(dut.io.addsub_2_op, true.B) // SUB
//     poke(dut.io.m31_sel, "b01".U) // pin 1
//     poke(dut.io.m32_sel, "b00".U) // pin 0 
//     poke(dut.io.m33_sel, "b00".U)
//     poke(dut.io.m34_sel, "b00".U)
//     poke(dut.io.m35_sel, "b00".U) // pin 0
//     poke(dut.io.m36_sel, "b01".U) // pin 0
//     poke(dut.io.m37_sel, "b01".U) // pin 2
    
//     step(10)
//     poke(dut.io.m31_sel, "b00".U) // pin 1
//     poke(dut.io.m32_sel, "b10".U) // pin 0 
//     // step(1)
//     poke(dut.io.m35_sel, "b01".U)

//     step(15)
    
//     sim_Mem = peek(dut.io.addsum_1_final).toLong
//     bin_mem = sim_Mem.toBinaryString
//     to_Store = "b0"+bin_mem
//     poke(dut.io.simMemOut, to_Store.U)

//     step(5)

//     in1 = "b"+ input_2(i)
//     in2 = "b"+ input_1(i)
    
//     poke(dut.io.useINT_ALL, false.B)
//     poke(dut.io.Xi, in2.U)
//     poke(dut.io.Yi, in1.U)
//     poke(dut.io.a1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

//     step(10)

//     poke(dut.io.addsub_1_op, true.B) // SUB
//     poke(dut.io.addsub_2_op, true.B) // SUB
//     poke(dut.io.m31_sel, "b01".U) // pin 1
//     poke(dut.io.m32_sel, "b00".U) // pin 0 
//     poke(dut.io.m33_sel, "b00".U)
//     poke(dut.io.m34_sel, "b00".U)
//     poke(dut.io.m35_sel, "b00".U) // pin 0
//     poke(dut.io.m36_sel, "b01".U) // pin 0
//     poke(dut.io.m37_sel, "b01".U) // pin 2
    
//     step(10)

//     poke(dut.io.m31_sel, "b00".U) // pin 1
//     poke(dut.io.m32_sel, "b10".U) // pin 0 
//     poke(dut.io.m35_sel, "b01".U)
    
//     step(20)

//     if(expect(dut.io.addsum_2_final, out.U))
//     {
//           //poke(dut.io.simMemOut, to_Store.U(64.W))
//           println(" DEBUG MEM  -> "+to_Store)
//           println("            -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           println(" ITER -> "+i+"        : [TEST FAIL] !!!!")
//           println(" DEBUG MEM  -> "+to_Store)
//           println(" DEBUG IN_1 -> "+in1.asInstanceOf[String])
//           println(" DEBUG IN_2 -> "+in2.asInstanceOf[String])
//           println(" TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
//           println(" ITER -> "+i+"        : [TEST FAIL] !!!!")
//           //input_1 = TestUtils.readEmpty()
//           //System.exit(0)
//     }

//   }
// }


// class PE_INT_test4_euclidean (dut: PE_FPU) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var test_output = TestUtils.read(TestUtils.PE_INT_TEST_4_RESULT)

//   println(" ----->  PE_INT_test4_euclidean ( INT )")
//   var in1 =""
//   var in2 =""
//   var out =""
//   var sim_Mem = 0
//   var bin_mem = ""
//   var to_Store = ""

//   step(10)

//   for (i <- 0 to input_1.size - 1) 
//   {
//     in1 = "b"+ input_1(i)
//     in2 = "b"+ input_2(i)
//     out = "b"+ test_output(i)
    
//     poke(dut.io.simMemOut, 0.U(64.W))
//     poke(dut.io.useINT_ALL, true.B)   // INT
//     poke(dut.io.Xi, in2.U)
//     poke(dut.io.Yi, in1.U)
//     poke(dut.io.a1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

//     step(10)
//     poke(dut.io.addsub_1_op, true.B) // SUB
//     poke(dut.io.addsub_2_op, true.B) // SUB
//     poke(dut.io.m31_sel, "b01".U) // pin 1
//     poke(dut.io.m32_sel, "b00".U) // pin 0 
//     poke(dut.io.m33_sel, "b00".U)
//     poke(dut.io.m34_sel, "b00".U)
//     poke(dut.io.m35_sel, "b00".U) // pin 0
//     poke(dut.io.m36_sel, "b01".U) // pin 0
//     poke(dut.io.m37_sel, "b01".U) // pin 2
    
//     step(10)
//     poke(dut.io.m31_sel, "b00".U) // pin 1
//     poke(dut.io.m32_sel, "b10".U) // pin 0 
//     // step(1)
//     poke(dut.io.m35_sel, "b01".U)

//     step(15)
    
//     sim_Mem = peek(dut.io.addsum_1_final).toLong
//     bin_mem = sim_Mem.toBinaryString
//     to_Store = "b0"+bin_mem
//     poke(dut.io.simMemOut, to_Store.U)

//     step(5)

//     in1 = "b"+ input_2(i)
//     in2 = "b"+ input_1(i)
    
//     poke(dut.io.useINT_ALL, false.B)
//     poke(dut.io.Xi, in2.U)
//     poke(dut.io.Yi, in1.U)
//     poke(dut.io.a1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B1, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
//     poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

//     step(10)

//     poke(dut.io.addsub_1_op, true.B) // SUB
//     poke(dut.io.addsub_2_op, true.B) // SUB
//     poke(dut.io.m31_sel, "b01".U) // pin 1
//     poke(dut.io.m32_sel, "b00".U) // pin 0 
//     poke(dut.io.m33_sel, "b00".U)
//     poke(dut.io.m34_sel, "b00".U)
//     poke(dut.io.m35_sel, "b00".U) // pin 0
//     poke(dut.io.m36_sel, "b01".U) // pin 0
//     poke(dut.io.m37_sel, "b01".U) // pin 2
    
//     step(10)

//     poke(dut.io.m31_sel, "b00".U) // pin 1
//     poke(dut.io.m32_sel, "b10".U) // pin 0 
//     poke(dut.io.m35_sel, "b01".U)
    
//     step(20)

//     if(expect(dut.io.addsum_2_final, out.U))
//     {
//           //poke(dut.io.simMemOut, to_Store.U(64.W))
//           println(" DEBUG MEM  -> "+to_Store)
//           println("            -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           println(" ITER -> "+i+"        : [TEST FAIL] !!!!")
//           println(" DEBUG MEM  -> "+to_Store)
//           println(" DEBUG IN_1 -> "+in1.asInstanceOf[String])
//           println(" DEBUG IN_2 -> "+in2.asInstanceOf[String])
//           println(" TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
//           println(" ITER -> "+i+"        : [TEST FAIL] !!!!")
//           //System.exit(0)
//     }

//   }
// }


// // class PE_FPU_euclidean_test extends ChiselFlatSpec with Matchers {

// //  val vcdName = "PE_FPU_euclidean_test"
// //  val targetDir = "diagram/" + vcdName

// //   "run PE_FP32_test4_euclidean" should "pass" in {
// //   chisel3.iotesters.Driver.execute(Array(
// //     "--fint-write-vcd",
// //     "--backend-name", "firrtl",
// //     "--target-dir", targetDir+"_FP32",
// //     "--top-name" , vcdName,
// //     "--output-file", vcdName),
// //     () => new PE_FPU ) { c =>
// //     new PE_FP32_test4_euclidean (c)
// //     } should be (true)
// //   }

// //   "run PE_INT_test4_euclidean" should "pass" in {
// //   chisel3.iotesters.Driver.execute(Array(
// //     "--fint-write-vcd",
// //     "--backend-name", "firrtl",
// //     "--target-dir", targetDir+"_INT",
// //     "--top-name" , vcdName,
// //     "--output-file", vcdName),
// //     () => new PE_FPU ) { c =>
// //     new PE_INT_test4_euclidean (c)
// //     } should be (true)
// //   }

// // }