// package top

// import chisel3._
// import chisel3.util._
// import chisel3.iotesters._
// import org.scalatest.Matchers
// import scala.io.Source
// import utils.TestUtils
// import scala.collection.mutable.ArrayBuffer

// class PE_FP32_test0_FP32 (dut: PE_FPU) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INPUT_2)
//   var input_3     = TestUtils.read(TestUtils.INPUT_3)
//   var input_4     = TestUtils.read(TestUtils.INPUT_4)
//   var test_output = TestUtils.read(TestUtils.PE_FP32_TEST_0_RESULT)
  
//   println(" ----->  PE_FP32_test0_FP32 ( FP32 ) inputs : "+input_1.size.toString)
//   println("check bounds : "+input_1.size.toString+input_2.size.toString+input_3.size.toString+input_4.size.toString)
//   println("check bounds : "+test_output.size.toString)
//   var in1 =""
//   var in2 =""
//   var in3 =""
//   var in4 =""
//   var out =""
//   var sim_Mem = 0
//   var bin_mem = ""
//   var to_Store = ""

//   for (i <- 0 to input_1.size - 1) 
//   {
//       in1 = "b"+ input_1(i)
//       in2 = "b"+ input_2(i)
//       in3 = "b"+ input_3(i)
//       in4 = "b"+ input_4(i)
//       out = "b"+ test_output(i)

//       poke(dut.io.simMemOut, "b0000000000000000000000000000000000000000000000000000000000000000".U)
//       poke(dut.io.useINT_ALL,  false.B) // FP32

//       poke(dut.io.addsub_1_op, false.B) // ADD
//       poke(dut.io.addsub_2_op, false.B) // ADD
      
//       poke(dut.io.m31_sel, "b10".U) 
//       poke(dut.io.m32_sel, "b01".U) 
//       poke(dut.io.m33_sel, "b00".U)
//       poke(dut.io.m34_sel, "b00".U)
//       poke(dut.io.m35_sel, "b01".U) 
//       poke(dut.io.m36_sel, "b00".U) 
//       poke(dut.io.m37_sel, "b01".U) 

//       poke(dut.io.a1, in1.U)  
//       poke(dut.io.B1, in2.U)  
//       poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W)) 
//       poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W)) 
//       poke(dut.io.Xi, in3.U)
//       poke(dut.io.Yi, in4.U)
//       poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//       poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
        
//       poke(dut.io.m36_sel, "b01".U) 
//       poke(dut.io.m37_sel, "b00".U)  

//       step(15)

//       if(expect(dut.io.addsum_1_final, out.U))
//       {
//             println("-> "+out.asInstanceOf[String]+" : PASS")
//       }
//       else
//       {
//             println("TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
//       }
//   }

// }


// class PE_test0_INT (dut: PE_FPU) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var input_3     = TestUtils.read(TestUtils.INT_INPUT_3)
//   var input_4     = TestUtils.read(TestUtils.INT_INPUT_4)
//   var test_output = TestUtils.read(TestUtils.PE_INT_TEST_0_RESULT)
  
//   println(" ----->  PE_test0_INT ( INT ) inputs : "+input_1.size.toString)
//   println("check bounds : "+input_1.size.toString+input_2.size.toString+input_3.size.toString+input_4.size.toString)
//   println("check bounds : "+test_output.size.toString)
//   var in1 =""
//   var in2 =""
//   var in3 =""
//   var in4 =""
//   var out =""
//   var sim_Mem = 0
//   var bin_mem = ""
//   var to_Store = ""

//   for (i <- 0 to input_1.size - 1) 
//   {
//       in1 = "b"+ input_1(i)
//       in2 = "b"+ input_2(i)
//       in3 = "b"+ input_3(i)
//       in4 = "b"+ input_4(i)
//       out = "b"+ test_output(i)

//       poke(dut.io.simMemOut, "b0000000000000000000000000000000000000000000000000000000000000000".U)
//       poke(dut.io.useINT_ALL,  true.B) // FP32

//       poke(dut.io.addsub_1_op, false.B) // ADD
//       poke(dut.io.addsub_2_op, false.B) // ADD
      
//       poke(dut.io.m31_sel, "b10".U) 
//       poke(dut.io.m32_sel, "b01".U) 
//       poke(dut.io.m33_sel, "b00".U)
//       poke(dut.io.m34_sel, "b00".U)
//       poke(dut.io.m35_sel, "b01".U) 
//       poke(dut.io.m36_sel, "b00".U) 
//       poke(dut.io.m37_sel, "b01".U) 

//       poke(dut.io.a1, in1.U)  
//       poke(dut.io.B1, in2.U)  
//       poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W)) 
//       poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W)) 
//       poke(dut.io.Xi, in3.U)
//       poke(dut.io.Yi, in4.U)
//       poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
//       poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
        
//       poke(dut.io.m36_sel, "b01".U) 
//       poke(dut.io.m37_sel, "b00".U)  

//       step(15)

//       if(expect(dut.io.addsum_1_final, out.U))
//       {
//             println("-> "+out.asInstanceOf[String]+" : PASS")
//       }
//       else
//       {
//             println("TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
//       }
//   }

// }


// class PE_FP32_test0 extends ChiselFlatSpec with Matchers {

//  val vcdName = "PE_FP32_test0"
//  val targetDir = "diagram/" + vcdName

 
//   "run PE_FP32_test0_FP32" should "pass" in {
//   chisel3.iotesters.Driver.execute(Array(
//     "--fint-write-vcd",
//     "--backend-name", "firrtl",
//     "--target-dir", targetDir+"_FP32",
//     "--top-name" , vcdName,
//     "--output-file", vcdName),
//     () => new PE_FPU ) { c =>
//     new PE_FP32_test0_FP32 (c)
//     } should be (true)
//   }


//   "run PE_test0_INT" should "pass" in {
//   chisel3.iotesters.Driver.execute(Array(
//     "--fint-write-vcd",
//     "--backend-name", "firrtl",
//     "--target-dir", targetDir+"_INT",
//     "--top-name" , vcdName,
//     "--output-file", vcdName),
//     () => new PE_FPU ) { c =>
//     new PE_test0_INT (c)
//     } should be (true)
//   }

// }