package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import scala.io.Source
import scala.collection._
import scala.util._
import org.scalatest.matchers.should.Matchers
import utils.TestUtils


class PE_test_INT_L2(dut: PE) extends PeekPokeTester(dut) {

    var test_fp    = "b"+"01000010011011000000000000000000"  // 59
    var test_int   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    println(" ----->  TEST with [ PE -> L2 -> INT ]")
    println(" ----->  [Run test] : ") 

    //reset()

    poke(dut.io.Xi_0, test_int.U(32.W))
    poke(dut.io.Yi_0, test_int.U(32.W))
    poke(dut.io.Xi_1, test_int.U(32.W))
    poke(dut.io.Yi_1, test_int.U(32.W))
    poke(dut.io.aggr_0, test_int.U(32.W))
    poke(dut.io.aggr_1, test_int.U(32.W))
    poke(dut.io.aggr_2, test_int.U(32.W))
    poke(dut.io.aggr_3, test_int.U(32.W))

    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b000".U(3.W))
    poke(dut.io.tininess, "b0".U(1.W))
    poke(dut.io.addsub_0_op, false.B)
    poke(dut.io.addsub_1_op, false.B)

    poke(dut.io.m_0_sel, "b01".U(2.W))
    poke(dut.io.m_1_sel, "b01".U(2.W))
    poke(dut.io.m_2_sel, "b01".U(2.W))
    poke(dut.io.m_3_sel, "b01".U(2.W))
    poke(dut.io.m_4_sel, "b00".U(2.W))
    poke(dut.io.m_5_sel, "b00".U(2.W))
    poke(dut.io.m_6_sel, "b00".U(2.W))
    poke(dut.io.m_7_sel, "b00".U(2.W))
    poke(dut.io.m_8_sel, "b01".U(2.W))
    poke(dut.io.m_9_sel, "b01".U(2.W))

    step(50)

    test_int   = "b"+"00000000000000000000000000000001"  // 1

    poke(dut.io.Xi_0, test_int.U(32.W))
    poke(dut.io.Yi_0, test_int.U(32.W))
    poke(dut.io.Xi_1, test_int.U(32.W))
    poke(dut.io.Yi_1, test_int.U(32.W))

    step(50)

}


class PE_test_manual(dut: PE) extends PeekPokeTester(dut) {

    var test_fp    = "b"+"01000010011011000000000000000000"  // 59
    //var test_int   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    var test_int_0   = "b"+"00000000000000000000000000111011"  //  59
    var test_int_1   = "b"+"11111111111111111111111111110011"  // -13
    // ( 59 - (-13) )^2    = 5184
    var test_int_2   = "b"+"11111111111111111111111111000101"  // -59
    var test_int_3   = "b"+"11111111111111111111111111110011"  // -13
    // ( (-59) - (-13) )^2 = 2116
    // 5184 + 2116 = 7300 * 8 = 58400

    var inputTest_0 = test_int_0
    var inputTest_1 = test_int_1
    var inputTest_2 = test_int_2
    var inputTest_3 = test_int_3

    println(" ----->  TEST with [ PE -> INT ]")
    println(" ----->  [Run test] : ") 


    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b100".U)
    poke(dut.io.tininess, "b1".U(1.W))
    
    poke(dut.io.Xi_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1, inputTest_3.U(32.W))


    poke(dut.io.addsub_0_op, true.B)
    poke(dut.io.addsub_1_op, true.B)

    poke(dut.io.m_0_sel, 1.U(2.W))
    poke(dut.io.m_1_sel, 1.U(2.W))
    poke(dut.io.m_2_sel, 1.U(2.W))
    poke(dut.io.m_3_sel, 1.U(2.W))
    poke(dut.io.m_4_sel, 0.U(2.W))
    poke(dut.io.m_5_sel, 0.U(2.W))
    poke(dut.io.m_6_sel, 0.U(2.W))
    poke(dut.io.m_7_sel, 0.U(2.W))
    poke(dut.io.m_8_sel, 1.U(2.W))
    poke(dut.io.m_9_sel, 1.U(2.W))

    step(15)

    poke(dut.io.addsub_0_op, false.B)
    poke(dut.io.addsub_1_op, false.B)

    poke(dut.io.m_4_sel, 2.U(2.W))
    poke(dut.io.m_5_sel, 2.U(2.W))
    poke(dut.io.m_6_sel, 2.U(2.W))
    poke(dut.io.m_7_sel, 2.U(2.W))

    poke(dut.io.aggr_0, inputTest_0.U(32.W))
    poke(dut.io.aggr_1, inputTest_0.U(32.W))
    poke(dut.io.aggr_2, inputTest_1.U(32.W))
    poke(dut.io.aggr_3, inputTest_1.U(32.W))

    poke(dut.io.m_8_sel, 0.U(2.W))
    poke(dut.io.m_9_sel, 0.U(2.W))

    step(50)

    // expect(dut.io.out_0, 0.U(32.W))
    // expect(dut.io.out_1, 0.U(32.W))


    // println(" ----->  TEST with [ PE -> FP ]")
    // println(" ----->  [Run test] : ") 


    // poke(dut.io.use_int, false.B)       
    // poke(dut.io.use_int, false.B)
    // poke(dut.io.rounding, "b100".U)
    // poke(dut.io.tininess, "b1".U(1.W))
    
    // poke(dut.io.Xi_0, test_fp.U(32.W))
    // poke(dut.io.Yi_0, test_fp.U(32.W))

    // poke(dut.io.Xi_1, test_fp.U(32.W))
    // poke(dut.io.Yi_1, test_fp.U(32.W))

    // poke(dut.io.aggr_0, test_fp.U(32.W))
    // poke(dut.io.aggr_1, test_fp.U(32.W))
    // poke(dut.io.aggr_2, test_fp.U(32.W))
    // poke(dut.io.aggr_3, test_fp.U(32.W))

    // poke(dut.io.m_0_sel, 0.U(2.W))
    // poke(dut.io.m_1_sel, 0.U(2.W))
    // poke(dut.io.m_2_sel, 0.U(2.W))
    // poke(dut.io.m_3_sel, 0.U(2.W))
    // poke(dut.io.m_4_sel, 0.U(2.W))
    // poke(dut.io.m_5_sel, 0.U(2.W))
    // poke(dut.io.m_6_sel, 0.U(2.W))
    // poke(dut.io.m_7_sel, 0.U(2.W))
    // poke(dut.io.m_8_sel, 0.U(2.W))
    // poke(dut.io.m_9_sel, 0.U(2.W))

    // poke(dut.io.addsub_0_op, false.B)
    // poke(dut.io.addsub_1_op, false.B)

    // step(50)

}


class PE_test extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_test"
    val targetDir = "diagram/" + vcdName


    "run PE_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_MANUAL",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE ) { c =>
      new PE_test_manual (c)
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


