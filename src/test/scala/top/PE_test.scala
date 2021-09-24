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

    reset()

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

    step(10)

    test_int = "b"+"00000000000000000000000000001101" // 13

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

    step(10)
}


class PE_test_manual(dut: PE) extends PeekPokeTester(dut) {

    var test_fp    = "b"+"01000010011011000000000000000000"  // 59
    var test_int   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    println(" ----->  TEST with [ PE -> INT ]")
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

    step(50)


    println(" ----->  TEST with [ PE -> FP ]")
    println(" ----->  [Run test] : ") 


    poke(dut.io.use_int, false.B)       
    poke(dut.io.use_int, false.B)
    poke(dut.io.rounding, "b100".U)
    poke(dut.io.tininess, "b1".U(1.W))
    
    poke(dut.io.Xi_0, test_fp.U(32.W))
    poke(dut.io.Yi_0, test_fp.U(32.W))

    poke(dut.io.Xi_1, test_fp.U(32.W))
    poke(dut.io.Yi_1, test_fp.U(32.W))

    poke(dut.io.aggr_0, test_fp.U(32.W))
    poke(dut.io.aggr_1, test_fp.U(32.W))
    poke(dut.io.aggr_2, test_fp.U(32.W))
    poke(dut.io.aggr_3, test_fp.U(32.W))

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

    step(50)


    // val out_0  = Output(Bits(Config.forOUT.W))  
    // val out_1  = Output(Bits(Config.forOUT.W))

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

      "run PE_test_INT_L2" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT_L2",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE ) { c =>
      new PE_test_INT_L2 (c)
    } should be (true)
  }

}


