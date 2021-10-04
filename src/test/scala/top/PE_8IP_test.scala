package top


import chisel3._
import chisel3.util._
import chisel3.iotesters._
import scala.io.Source
import scala.collection._
import scala.util._
import org.scalatest.matchers.should.Matchers
import utils.TestUtils



class PE_8IP_test_manual(dut: PE_8IP) extends PeekPokeTester(dut) {

    var test_fp_0    = "b"+"01000001101110000000000000000000"  //  23
    var test_fp_1    = "b"+"01000001001100000000000000000000"  //  11
    var test_fp_2    = "b"+"11000010010111000000000000000000"  // -55
    var test_fp_3    = "b"+"11000001001100000000000000000000"  // -11

    // L2 = 16640 =  01000110100000100000000000000000
    // L2 = 5920  =  01000101101110010000000000000000
    // ----------------------------------------------------
    // L1 => 208  =  

    // ----------------------------------------------------
    // DOT => 0    = 00000000000000000000000000000000
    // DOT => 6864 = 01000101110101101000000000000000
    // ----------------------------------------------------
    // WGT => 

    var test_int_0   = "b"+"00000000000000000000000000000010" // 2
    var test_int_1   = "b"+"00000000000000000000000000000000" // 0
    var test_int_2   = "b"+"00000000000000000000000000000001" // 1 
    var test_int_3   = "b"+"00000000000000000000000000000001" // 1

    // var test_int_0   = "b"+"00000000000000000000000000010111" // 23
    // var test_int_1   = "b"+"00000000000000000000000000001011" // 11
    // var test_int_2   = "b"+"11111111111111111111111111001001" // -55
    // var test_int_3   = "b"+"11111111111111111111111111110101" // -11
    // L2 => 144 + 1936 = 2080 * 8 = 16640
    

    // inputTest_0   = "b"+"00000000000000000000000000001001"  //  9
    // inputTest_1   = "b"+"11111111111111111111111111110011"  // -13
    // inputTest_2   = "b"+"11111111111111111111111111101101"  // -19
    // inputTest_3   = "b"+"11111111111111111111111111111101"  // -3
    // L2 => (+22)^2 + (-16)^2 = 484 + 256 = 740 * 8 = 5920

    
    var test_op_type = "b00".U(2.W)

    val test_INT32 = 1
    val test_FP32  = 0

    var inputTest_0 = test_int_0
    var inputTest_1 = test_int_1
    var inputTest_2 = test_int_2
    var inputTest_3 = test_int_3

    poke(dut.io.use_int, false.B)
    poke(dut.io.rounding, "b100".U(3.W))
    poke(dut.io.tininess, "b0".U(1.W))

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

    poke(dut.io.addsub_0_op, 0.U(2.W))
    poke(dut.io.addsub_1_op, 0.U(2.W)) 

    step(5)

  if(test_INT32 == 1)
  {  
    println(" ----->  TEST for [ PE_8IP_test_manual -> INT ]")
    println(" ----->  [Run test] ...")

    poke(dut.io.m_0_sel, 0.U(2.W))
    poke(dut.io.m_1_sel, 0.U(2.W))
    poke(dut.io.m_2_sel, 0.U(2.W))
    poke(dut.io.m_3_sel, 0.U(2.W))
    poke(dut.io.m_4_sel, 0.U(2.W))
    poke(dut.io.m_5_sel, 0.U(2.W))
    poke(dut.io.m_6_sel, 0.U(2.W))
    poke(dut.io.m_7_sel, 0.U(2.W))
    poke(dut.io.m_8_sel, 1.U(2.W))
    poke(dut.io.m_9_sel, 1.U(2.W))

    poke(dut.io.addsub_0_op, 0.U(2.W))
    poke(dut.io.addsub_1_op, 0.U(2.W)) 


    //poke(dut.io.use_int, false.B)
    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b111".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))

    step(5)
    

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

    step(5)

    poke(dut.io.m_4_sel, 2.U(2.W))
    poke(dut.io.m_5_sel, 2.U(2.W))
    poke(dut.io.m_6_sel, 2.U(2.W))
    poke(dut.io.m_7_sel, 2.U(2.W)) 
  

    step(20)


    // inputTest_0   = "b"+"00000000000000000000000000001001"  //  9
    // inputTest_1   = "b"+"11111111111111111111111111110011"  // -13
    // inputTest_2   = "b"+"11111111111111111111111111101101"  // -19
    // inputTest_3   = "b"+"11111111111111111111111111111101"  // -3

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
    println(" ----->  TEST for [ PE_8IP_test_manual -> FP32 ]")
    println(" ----->  [Run test] ...") 

    //step(200)

    inputTest_0 = test_fp_0
    inputTest_1 = test_fp_1
    inputTest_2 = test_fp_2
    inputTest_3 = test_fp_3

    poke(dut.io.use_int, false.B)
    poke(dut.io.rounding, "b100".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))

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


    step(20)


    inputTest_0 = "b"+"01000001000100000000000000000000" //  9
    inputTest_1 = "b"+"11000001010100000000000000000000" // -13
    inputTest_2 = "b"+"11000001100110000000000000000000" // -19
    inputTest_3 = "b"+"11000000010000000000000000000000" // -3 

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


class PE_8IP_test extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_8IP_test"
    val targetDir = "diagram/" + vcdName


    "run PE_8IP_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_MANUAL",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_8IP ) { c =>
      new PE_8IP_test_manual (c)
    } should be (true)
  }

}


