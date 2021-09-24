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
    var test_int   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    println(" ----->  TEST with [ PE -> L2 -> INT ]")
    println(" ----->  [Run test] : ") 

    poke(dut.io.use_int, true.B)
    poke(dut.io.use_int, false.B)
    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b111".U)
    poke(dut.io.tininess, "b1".U(1.W))
    
    poke(dut.io.Xi_0, test_int.U(32.W))
    poke(dut.io.Yi_0, test_int.U(32.W))

    poke(dut.io.Xi_1, test_int.U(32.W))
    poke(dut.io.Yi_1, test_int.U(32.W))

    poke(dut.io.aggr_0, test_int.U(32.W))
    poke(dut.io.aggr_1, test_int.U(32.W))
    poke(dut.io.aggr_2, test_int.U(32.W))
    poke(dut.io.aggr_3, test_int.U(32.W))

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

    var test_fp    = "b"+"01000010011011000000000000000000"  // 59
    var test_int   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    var inputTest = test_int

    println(" ----->  TEST with [ PE -> INT ]")
    println(" ----->  [Run test] : ") 

    //step(10)
    reset()


    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b111".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))
    poke(dut.io.op_type, "b00".U(2.W))
    //step(20)
    
    poke(dut.io.Xi_0_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest.U(32.W))  
    
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

    // step(20)
    // poke(dut.io.op_type, 0.U(2.W))
    // step(20)
    // poke(dut.io.op_type, 1.U(2.W))
    // step(20)
    // poke(dut.io.op_type, 0.U(2.W))
    // step(20)
    // poke(dut.io.op_type, 1.U(2.W))
    // step(20)
    // poke(dut.io.op_type, 0.U(2.W))
    step(50)
    //reset()

    inputTest = "b"+"00000000000000000000000000001101" // 13

    poke(dut.io.Xi_0_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest.U(32.W)) 

    step(50) 

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


