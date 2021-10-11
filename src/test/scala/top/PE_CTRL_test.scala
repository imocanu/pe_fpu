package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import scala.io.Source
import scala.collection._
import scala.util._
import org.scalatest.matchers.should.Matchers
import utils.TestUtils



class PE_CTRL_test_manual(dut: PE_CTRL) extends PeekPokeTester(dut) {

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

    var test_int_0   = "b"+"00000000000000000000000000010111" // 23
    var test_int_1   = "b"+"00000000000000000000000000001011" // 11
    var test_int_2   = "b"+"11111111111111111111111111001001" // -55
    var test_int_3   = "b"+"11111111111111111111111111110101" // -11
    // L2 => 144 + 1936 = 2080 * 8 = 16640
    

    // inputTest_0   = "b"+"00000000000000000000000000001001"  //  9
    // inputTest_1   = "b"+"11111111111111111111111111110011"  // -13
    // inputTest_2   = "b"+"11111111111111111111111111101101"  // -19
    // inputTest_3   = "b"+"11111111111111111111111111111101"  // -3
    // L2 => (+22)^2 + (-16)^2 = 484 + 256 = 740 * 8 = 5920

    
    var test_op_type = "b00".U(2.W)

    val test_INT32 = 1
    val test_FP32  = 0

    var test_sel  = true.B
    var test_op   = true.B

    var inputTest_0 = test_int_0
    var inputTest_1 = test_int_1
    var inputTest_2 = test_int_2
    var inputTest_3 = test_int_3

    // poke(dut.io.use_int, true.B)
    poke(dut.io.op_type, test_op_type)

    poke(dut.io.m_0_sel, test_sel)
    poke(dut.io.m_1_sel, test_sel)
    poke(dut.io.m_2_sel, test_sel)
    poke(dut.io.m_3_sel, test_sel)
    poke(dut.io.m_4_sel, test_sel)
    poke(dut.io.m_5_sel, test_sel)
    poke(dut.io.m_6_sel, test_sel)
    poke(dut.io.m_7_sel, test_sel)
    poke(dut.io.m_8_sel, test_sel)
    poke(dut.io.m_9_sel, test_sel)

    poke(dut.io.addsub_0_op, test_sel)
    poke(dut.io.addsub_1_op, test_sel)

    step(50)

    test_sel  = false.B
    test_op   = false.B

    // poke(dut.io.use_int, false.B)
    poke(dut.io.op_type, test_op_type)

    poke(dut.io.m_0_sel, test_sel)
    poke(dut.io.m_1_sel, test_sel)
    poke(dut.io.m_2_sel, test_sel)
    poke(dut.io.m_3_sel, test_sel)
    poke(dut.io.m_4_sel, test_sel)
    poke(dut.io.m_5_sel, test_sel)
    poke(dut.io.m_6_sel, test_sel)
    poke(dut.io.m_7_sel, test_sel)
    poke(dut.io.m_8_sel, test_sel)
    poke(dut.io.m_9_sel, test_sel)

    poke(dut.io.addsub_0_op, test_sel)
    poke(dut.io.addsub_1_op, test_sel)

    step(50) 

}


class PE_CTRL_test extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_test"
    val targetDir = "diagram/" + vcdName


    "run PE_CTRL_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_MANUAL",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL) { c =>
      new PE_CTRL_test_manual (c)
    } should be (true)
  }

}


