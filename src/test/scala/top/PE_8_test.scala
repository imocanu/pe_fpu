package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import scala.io.Source
import scala.collection._
import scala.util._
import org.scalatest.matchers.should.Matchers
import utils.TestUtils


class PE_8_test_INT_L2(dut: PE) extends PeekPokeTester(dut) {

    var test_fp    = "b"+"01000010011011000000000000000000"  // 59
    var test_int_0   = "b"+"00000000000000000000000000111011"  // 59
    var test_int_1   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    println(" ----->  TEST for [ PE -> INT -> L2 ]")
    println(" ----->  [Run test] ...") 

    var in_0     = TestUtils.read(TestUtils.INPUT_1)
    var in_1     = TestUtils.read(TestUtils.INPUT_2)
    var out      = TestUtils.read(TestUtils.SUB_RESULT)

    var test_in_1 = ""
    var test_in_2 = ""
    var test_in_3 = ""
    var test_in_4 = ""
    var test_out  = ""

    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b111".U)
    poke(dut.io.tininess, "b1".U(1.W))
    
    poke(dut.io.Xi_0, test_int_0.U(32.W))
    poke(dut.io.Yi_0, test_int_1.U(32.W))

    poke(dut.io.Xi_1, test_int_0.U(32.W))
    poke(dut.io.Yi_1, test_int_1.U(32.W))

    poke(dut.io.aggr_0, test_int_0.U(32.W))
    poke(dut.io.aggr_1, test_int_0.U(32.W))
    poke(dut.io.aggr_2, test_int_0.U(32.W))
    poke(dut.io.aggr_3, test_int_0.U(32.W))

    poke(dut.io.m_0_sel, 0.U(2.W))
    poke(dut.io.m_1_sel, 0.U(2.W))
    poke(dut.io.m_2_sel, 0.U(2.W))
    poke(dut.io.m_3_sel, 0.U(2.W))
    poke(dut.io.m_4_sel, 0.U(2.W))
    poke(dut.io.m_5_sel, 0.U(2.W))
    poke(dut.io.m_6_sel, 0.U(2.W))
    poke(dut.io.m_7_sel, 0.U(2.W))
    poke(dut.io.m_8_sel, 0.U(2.W))
    poke(dut.io.m_9_sel, 0.U(2.W))

    poke(dut.io.addsub_0_op, false.B)
    poke(dut.io.addsub_1_op, false.B)
}


class PE_8_test_manual(dut: PE_8) extends PeekPokeTester(dut) {

    var test_fp_0    = "b"+"01000010011011000000000000000000"  //  59
    var test_fp_1    = "b"+"11000001010100000000000000000000"  // -13
    var test_fp_2    = "b"+"11000010011011000000000000000000"  // -59
    var test_fp_3    = "b"+"11000001010100000000000000000000"  // -13
    // 5184  =  01000101101000100000000000000000
    // 2116  =  01000101000001000100000000000000
        // 7300  =  01000101111001000010000000000000
            // 29200 =  01000110111001000010000000000000
            // 29200 =  01000110111001000010000000000000
                // 58400 = 01000111011001000010000000000000
    // ----------------------------------------------------
    // 23 & 11 => 2304  =  01000101000100000000000000000000
    
    var test_int_0   = "b"+"00000000000000000000000000111011"  //  59
    var test_int_1   = "b"+"11111111111111111111111111110011"  // -13
    // ( 59 - (-13) )^2    = 5184
    var test_int_2   = "b"+"11111111111111111111111111000101"  // -59
    var test_int_3   = "b"+"11111111111111111111111111110011"  // -13
    // ( (-59) - (-13) )^2 = 2116
    // 5184 + 2116 = 7300 * 8 = 58400
    
    var test_op_type = "b00".U(2.W)

    val test_INT32 = 1
    val test_FP32  = 0

    var inputTest_0 = test_int_0
    var inputTest_1 = test_int_1
    var inputTest_2 = test_int_2
    var inputTest_3 = test_int_3

  if(test_INT32 == 1)
  {  
    println(" ----->  TEST for [ PE_8 -> INT ]")
    println(" ----->  [Run test] ...") 


    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b111".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))
    poke(dut.io.op_type, test_op_type)
    

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))  
  
    step(10)

    inputTest_0 = "b"+"00000000000000000000000000010111" // 23
    inputTest_1 = "b"+"00000000000000000000000000001011" // 11
    inputTest_2 = "b"+"00000000000000000000000000010111" // 23
    inputTest_3 = "b"+"00000000000000000000000000001011" // 11

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))
  }


  if(test_FP32 == 1)
  {  
    println(" ----->  TEST for [ PE_8 -> FP32 ]")
    println(" ----->  [Run test] ...") 

    //step(200)

    inputTest_0 = test_fp_0
    inputTest_1 = test_fp_1
    inputTest_2 = test_fp_2
    inputTest_3 = test_fp_3

    poke(dut.io.use_int, false.B)
    poke(dut.io.rounding, "b100".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))
    poke(dut.io.op_type, test_op_type)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))  

    step(10)

    inputTest_0 = "b"+"01000001101110000000000000000000" // 23
    inputTest_1 = "b"+"01000001001100000000000000000000" // 11
    inputTest_2 = "b"+"01000001101110000000000000000000" // 23
    inputTest_3 = "b"+"01000001001100000000000000000000" // 11 

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W)) 
  }

    step(200) 
    

}


class PE_8_test extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_8_test"
    val targetDir = "diagram/" + vcdName


    "run PE_8_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_MANUAL",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_8 ) { c =>
      new PE_8_test_manual (c)
    } should be (true)
  }

  //     "run PE_test_INT_L2" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_INT_L2",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE ) { c =>
  //     new PE_test_INT_L2 (c)
  //   } should be (true)
  // }

}


