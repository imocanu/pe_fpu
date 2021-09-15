// package top

// import chisel3._
// import chisel3.util._
// import chisel3.iotesters._
// import org.scalatest.Matchers
// import scala.io.Source
// import utils.TestUtils
// import scala.collection.mutable.ArrayBuffer

// class PE_FP32_test3_case (dut: PE_FPU) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INPUT_2)
//   var test_output = TestUtils.read(TestUtils.PE_FP32_TEST_3_RESULT)

//   println(" ----->  PE_FP32_test3_case ( FP32 )")
//   var in1 =""
//   var in2 =""
//   var out =""

//   step(2)  
//   poke(dut.io.useINT_ALL, false.B)
//   step(2)
//   poke(dut.io.m31_sel, "b10".U) // pin 3
//   step(2)
//   poke(dut.io.m32_sel, "b01".U) // pin 2 
//   step(2)
//   poke(dut.io.m33_sel, "b11".U) // DontCare
//   step(2)
//   poke(dut.io.m34_sel, "b11".U) // DontCare
//   step(2)
//   poke(dut.io.m35_sel, "b01".U) // pin 2
//   step(2)
//   poke(dut.io.m36_sel, "b00".U) // pin 1
//   step(2)
//   poke(dut.io.m37_sel, "b01".U) // pin 2
//   step(2)
//   poke(dut.io.addsub_1_op, false.B) // ADD
//   step(2)
//   poke(dut.io.addsub_2_op, false.B) // ADD

//   step(20)

//   for (i <- 0 to input_1.size - 1) 
//   {
//     in1 = "b"+ input_1(i)
//     in2 = "b"+ input_2(i)
//     out = "b"+ test_output(i)

//     step(2)  
//     poke(dut.io.Yi, "b00000000000000000000000000000000".U(32.W))
//     step(2)
//     poke(dut.io.a1, in1.U)
//     step(2)
//     poke(dut.io.Xi, in2.U)
//     step(2)
//     poke(dut.io.B1, in2.U)
//     step(2)
//     poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//     step(2)
//     poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
//     step(2)
//     poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
//     step(2)
//     poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

//     step(20)

//     if(expect(dut.io.addsum_1_final, out.U))
//     {
//           //println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           println(" ITER -> "+i)
//           println(" IN_1 -> "+in1.asInstanceOf[String])
//           println(" IN_2 -> "+in2.asInstanceOf[String])
//           println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           input_1 = TestUtils.readEmpty()
//     } 
//   }
// }


// class PE_INT_test3_case (dut: PE_FPU) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var test_output = TestUtils.read(TestUtils.PE_INT_TEST_3_RESULT)

//   println(" ----->  PE_INT_test3_case ( INT )")
//   // val in1 =""
//   // var in2 =""
//   var out =""

//   step(2)  
//   poke(dut.io.useINT_ALL, true.B)
//   step(2)
//   poke(dut.io.m31_sel, "b10".U) // pin 3
//   step(2)
//   poke(dut.io.m32_sel, "b01".U) // pin 2 
//   step(2)
//   poke(dut.io.m33_sel, "b11".U) // DontCare
//   step(2)
//   poke(dut.io.m34_sel, "b11".U) // DontCare
//   step(2)
//   poke(dut.io.m35_sel, "b01".U) // pin 2
//   step(2)
//   poke(dut.io.m36_sel, "b00".U) // pin 1
//   step(2)
//   poke(dut.io.m37_sel, "b01".U) // pin 2
//   step(2)
//   poke(dut.io.addsub_1_op, false.B) // ADD
//   step(2)
//   poke(dut.io.addsub_2_op, false.B) // ADD

//   step(20)

//   for (i <- 0 to input_1.size - 1) 
//   {
//     // in1 = input_1(i).toInt
//     // in2 = input_2(i).toInt
//     out = "b"+ test_output(i)

//     step(2)  
//     poke(dut.io.Yi, 0.S)
//     step(2)
//     poke(dut.io.a1, input_1(i).toInt.S)
//     step(2)
//     poke(dut.io.Xi, input_2(i).toInt.S)
//     step(2)
//     poke(dut.io.B1, input_2(i).toInt.S)
//     step(2)
//     poke(dut.io.Yj, 0.S)
//     step(2)
//     poke(dut.io.a2, 0.S)
//     step(2)
//     poke(dut.io.Xj, 0.S)
//     step(2)
//     poke(dut.io.B2, 0.S)

//     step(20)

//     if(expect(dut.io.addsum_1_final, out.U))
//     {
//           //println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           println(" ITER -> "+i)
//           println(" IN_1 -> "+input_1(i).asInstanceOf[String])
//           println(" IN_2 -> "+input_2(i).asInstanceOf[String])
//           println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           input_1 = TestUtils.readEmpty()
//     } 
//   }
// }


// class PE_1(dut: PE_FPU) extends PeekPokeTester(dut) {
//   step(5)
//   poke(dut.io.Yi, "b01000000000000000000000000000000".U(32.W))
//   poke(dut.io.a1, "b01100000000000000000000000000000".U(32.W))
//   poke(dut.io.Xi, "b01110000000000000000000000000000".U(32.W))
//   poke(dut.io.B1, "b01110000000000000000000000000000".U(32.W))

//   poke(dut.io.Yj, "b01000000000000000000000000000000".U(32.W))
//   poke(dut.io.a2, "b01100000000000000000000000000000".U(32.W))
//   poke(dut.io.Xj, "b01110000000000000000000000000000".U(32.W))
//   poke(dut.io.B2, "b01110000000000000000000000000000".U(32.W))
//   step(5)
//   println("\n*=====< debug >======*")
// }

// class PE_FPU_test extends ChiselFlatSpec with Matchers {

//  val vcdName = "PE_FPU_test"
//  val targetDir = "diagram/" + vcdName

// //  var width = 8
// //  var no = 1
// //  "run test_"+no+" ..." should "pass" in {
// //    chisel3.iotesters.Driver.execute(Array(
// //      "--fint-write-vcd",
// //      "--backend-name", "firrtl",
// //      "--target-dir", targetDir,
// //      "--top-name" , vcdName,
// //      "--output-file", vcdName),
// //      () => new PE_FPU ) { c =>
// //      new PE_1 (c)
// //    } should be (true)
// //  }

// // "run PE_FP32_test3_case" should "pass" in {
// //   chisel3.iotesters.Driver.execute(Array(
// //     "--fint-write-vcd",
// //     "--backend-name", "firrtl",
// //     "--target-dir", targetDir+"_PE_TEST_3_FP32",
// //     "--top-name" , vcdName,
// //     "--output-file", vcdName),
// //     () => new PE_FPU ) { c =>
// //     new PE_FP32_test3_case (c)
// //     } should be (true)
// //   }

//   "run PE_INT_test3_case" should "pass" in {
//   chisel3.iotesters.Driver.execute(Array(
//     "--fint-write-vcd",
//     "--backend-name", "firrtl",
//     "--target-dir", targetDir+"_PE_TEST_3_INT",
//     "--top-name" , vcdName,
//     "--output-file", vcdName),
//     () => new PE_FPU ) { c =>
//     new PE_INT_test3_case (c)
//     } should be (true)
//   }

// }