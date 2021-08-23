package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils
import scala.collection.mutable.ArrayBuffer

class PE_FP32_test7_vec_sum_simple (dut: PE_FPU) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INPUT_2)
  var test_output = TestUtils.read(TestUtils.PE_FP32_TEST_7_RESULT)

  println(" ----->  PE_FP32_test7_vec_sum_simple ( FP32 )")
  var in1 =""
  var in2 =""
  var out ="b"+ test_output(0)
  var sim_Mem = 0
  var bin_mem = ""
  var to_Store = ""

  step(10)

  for (i <- 0 to input_1.size - 2) 
  {
    in1 = "b"+ input_1(i)
    in2 = "b"+ input_2(i)
    poke(dut.io.simMemOut, 0.U(64.W))
    poke(dut.io.useINT_ALL, false.B)

    poke(dut.io.a1, in1.U)  
    poke(dut.io.B1, in2.U)  
    poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))  
    poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))  
    
    poke(dut.io.Xi, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Yi, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))

    step(5)
    poke(dut.io.addsub_1_op, false.B) // ADD
    poke(dut.io.addsub_2_op, false.B) // ADD
    
    poke(dut.io.m31_sel, "b10".U) // pin 3
    poke(dut.io.m32_sel, "b01".U) // pin 2 
    poke(dut.io.m33_sel, "b00".U)
    poke(dut.io.m34_sel, "b00".U)
    poke(dut.io.m35_sel, "b01".U) // pin 2
    poke(dut.io.m36_sel, "b01".U) // pin 2
    poke(dut.io.m37_sel, "b01".U) // pin 1
      
    step(10)
    in1 = "b"+ input_1(i+1)
    in2 = "b"+ input_2(i+1)
    poke(dut.io.a2, in1.U)   
    poke(dut.io.B2, in2.U)
    poke(dut.io.m33_sel, "b01".U)
    poke(dut.io.m34_sel, "b01".U)
    poke(dut.io.m36_sel, "b01".U)
    
    step(15)
  }

  if(expect(dut.io.addsum_2_final, out.U))
  {
        println("-> "+out.asInstanceOf[String]+" : PASS")
  }
  else
  {
        println(" TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
  }

}



class PE_INT_test7_vec_sum_simple (dut: PE_FPU) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_output = TestUtils.read(TestUtils.PE_INT_TEST_7_RESULT)

  println(" ----->  PE_INT_test7_vec_sum_simple ( INT )")
  var in1 =""
  var in2 =""
  var out ="b"+ test_output(0)
  var sim_Mem = 0
  var bin_mem = ""
  var to_Store = ""

  step(10)

  for (i <- 0 to input_1.size - 2) 
  {
    in1 = "b"+ input_1(i)
    in2 = "b"+ input_2(i)
    poke(dut.io.simMemOut, 0.U(64.W))
    poke(dut.io.useINT_ALL, false.B)

    poke(dut.io.a1, in1.U)  
    poke(dut.io.B1, in2.U)  
    poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))  
    poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))  
    
    poke(dut.io.Xi, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Yi, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))

    step(5)
    poke(dut.io.addsub_1_op, false.B) // ADD
    poke(dut.io.addsub_2_op, false.B) // ADD
    
    poke(dut.io.m31_sel, "b10".U) // pin 3
    poke(dut.io.m32_sel, "b01".U) // pin 2 
    poke(dut.io.m33_sel, "b00".U)
    poke(dut.io.m34_sel, "b00".U)
    poke(dut.io.m35_sel, "b01".U) // pin 2
    poke(dut.io.m36_sel, "b01".U) // pin 2
    poke(dut.io.m37_sel, "b01".U) // pin 1
      
    step(10)
    in1 = "b"+ input_1(i+1)
    in2 = "b"+ input_2(i+1)
    poke(dut.io.a2, in1.U)   
    poke(dut.io.B2, in2.U)
    poke(dut.io.m33_sel, "b01".U)
    poke(dut.io.m34_sel, "b01".U)
    poke(dut.io.m36_sel, "b01".U)
    
    step(15)
  }

  if(expect(dut.io.addsum_2_final, out.U))
  {
        println("-> "+out.asInstanceOf[String]+" : PASS")
  }
  else
  {
        println(" TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
  }

}


class PE_FPU_vector_sum_test extends ChiselFlatSpec with Matchers {

 val vcdName = "PE_FPU_vector_sum_test"
 val targetDir = "diagram/" + vcdName

  "run PE_FP32_test7_vec_sum_simple" should "pass" in {
  chisel3.iotesters.Driver.execute(Array(
    "--fint-write-vcd",
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_FP32",
    "--top-name" , vcdName,
    "--output-file", vcdName),
    () => new PE_FPU ) { c =>
    new PE_FP32_test7_vec_sum_simple (c)
    } should be (true)
  }


  "run PE_INT_test7_vec_sum_simple" should "pass" in {
  chisel3.iotesters.Driver.execute(Array(
    "--fint-write-vcd",
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_INT",
    "--top-name" , vcdName,
    "--output-file", vcdName),
    () => new PE_FPU ) { c =>
    new PE_INT_test7_vec_sum_simple (c)
    } should be (true)
  }

}