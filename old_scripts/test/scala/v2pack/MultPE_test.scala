package v2pack

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils
import scala.collection._
import scala.util._
import v2pack._
import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils


class test_random_MULT_FP32(dut: MultPE_4_testing) extends PeekPokeTester(dut) {
  println(" ----->  TEST RANDOM with [ MULT -> FP32 ]")
  println(" ----->  [Run test] : ") 


  var in_0     = TestUtils.read(TestUtils.INPUT_1)
  var in_1     = TestUtils.read(TestUtils.INPUT_2)
  var out      = TestUtils.read(TestUtils.MUL_RESULT)

  var test_in_0 = ""
  var test_in_1 = ""
  var test_out  = ""

  poke(dut.io.rounding, "b111".U(3.W))
  step(10)
  poke(dut.io.use_int, true.B)
  step(10)
  poke(dut.io.tininess, "b1".U(1.W))
  step(10)

  for (i <- 0 to in_1.size - 1) 
  {
    test_in_0 = "b"+in_0(i)
    test_in_1 = "b"+in_1(i) 
    test_out  = "b"+out(i)
    step(10)
    poke(dut.io.in_0, test_in_0.U) 
    poke(dut.io.in_1, test_in_1.U)
    step(10)

    if(expect(dut.io.out, test_out.U(33.W)))
    {
      println(s"[DBG ${i}] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
      step(10)
    }
    else
    {
      println(" *****[ TEST FAIL ]***** ")
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in_0: ${peek(dut.io.in_0)}")
      println(s"[DBG] in_1: ${peek(dut.io.in_1)}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
    }
  }
}


class test_random_MULT_INT(dut: MultPE_4_testing) extends PeekPokeTester(dut) {
  println(" ----->  TEST RANDOM with [ ADD -> INT ]")
  println(" ----->  [Run test] : ") 


  var in_0     = TestUtils.read(TestUtils.INT_INPUT_1)
  var in_1     = TestUtils.read(TestUtils.INT_INPUT_2)
  var out      = TestUtils.read(TestUtils.INT_ADD_RESULT)

  var test_in_0 = ""
  var test_in_1 = ""
  var test_out  = ""

  poke(dut.io.rounding, "b111".U)
  step(10)
  poke(dut.io.use_int, true.B)
  step(10)
  poke(dut.io.tininess, "b1".U(1.W))
  step(10)

  for (i <- 0 to in_1.size - 1) 
  {
    test_in_0 = "b"+in_0(i)
    test_in_1 = "b"+in_1(i) 
    test_out  = "b"+out(i)
    step(10)
    poke(dut.io.in_0, 32700.S(32.W)) 
    poke(dut.io.in_1, 32700.S(32.W))
    step(10)

    if(expect(dut.io.out, test_out.U(33.W)))
    {
      println(s"[DBG ${i}] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
      step(10)
    }
    else
    {
      println(" *****[ TEST FAIL ]***** ")
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in_0: ${peek(dut.io.in_0)}")
      println(s"[DBG] in_1: ${peek(dut.io.in_1)}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
    }
  }
}

class MultPE_test_simple(dut: MultPE_4_testing) extends PeekPokeTester(dut) {

  println(" ----->  MULT TEST with [ INT ]")
  println(" ----->  [Run test] : ") 
  var test_in_0 = ""
  var test_in_1 = ""
  var test_out  = ""

  poke(dut.io.rounding, "b111".U)
  step(10)
  poke(dut.io.use_int, true.B)
  step(10)
  poke(dut.io.tininess, "b1".U(1.W))
  step(10)

  test_in_0 = "b"+"11111111111111111100001000001110" // -15858  -5773 = 91548234
  test_in_1 = "b"+"11111111111111111110100101110011"   
  test_out  = "b"+"00000101011101001110101001001010" // 91548234
  poke(dut.io.in_0, test_in_0.U(32.W))
  step(10) 
  poke(dut.io.in_1, test_in_1.U(32.W))
  step(10)
  expect(dut.io.out, test_out.U(33.W))
  println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

  step(10)

  test_in_0 = "b"+"00000000000000000000000000111011"  // 59
  test_in_1 = "b"+"00000000000000000000000000111011"  // 59 
  test_out  = "b"+"00000000000000000000110110011001"  // 3481
  poke(dut.io.in_0, test_in_0.U(32.W)) 
  poke(dut.io.in_1, test_in_1.U(32.W))
  step(10)
  expect(dut.io.out, test_out.U(33.W))
  println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
  
  step(10)

  test_in_0 = "b"+"11111111111111111000000000000001"  // -32767
  test_in_1 = "b"+"11111111111111111000000000000001"  // -32767 
  test_out  = "b"+"00111111111111110000000000000001"  // 1073676289
  poke(dut.io.in_0, test_in_0.U(32.W)) 
  poke(dut.io.in_1, test_in_1.U(32.W))
  step(10)
  expect(dut.io.out, test_out.U(33.W))
  println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

  step(10)


  // println(" ----->  MULT TEST with [ FP32 ]")

  // poke(dut.io.rounding, "b100".U)  // round_near_maxMag
  // step(10)
  // poke(dut.io.use_int, false.B)
  // step(10)
  // poke(dut.io.tininess, "b1".U(1.W))
  // step(10)

  // test_in_0 = "b"+"01000010011011000000000000000000"  // 59
  // test_in_1 = "b"+"01000010011011000000000000000000"  // 59 
  // test_out  = "b"+"01000101010110011001000000000000"  // 3481
  // poke(dut.io.in_0, test_in_0.U(32.W)) 
  // poke(dut.io.in_1, test_in_1.U(32.W))
  // step(10)
  // expect(dut.io.out, test_out.U(32.W))
  // println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

  // step(10)

  // test_in_0 = "b"+"01000010011011000000000000000000"  // -32767
  // test_in_1 = "b"+"01000010011011000000000000000000"  // -32767 
  // test_out  = "b"+"01001110011111111111110000000000"  // 1073676289
  // poke(dut.io.in_0, test_in_0.U(32.W)) 
  // poke(dut.io.in_1, test_in_1.U(32.W))
  // step(10)
  // expect(dut.io.out, test_out.U(32.W))
  // println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

  // step(10)
}


class MultPE_test extends ChiselFlatSpec with Matchers {
    val vcdName = "MultPE_test"
    val targetDir = "diagram/" + vcdName
    val unittestsDir = "diagram/unit_tests/test"

    "run AddSubPE_test_simple" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_SIMPLE",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new MultPE_4_testing ) { c =>
      new MultPE_test_simple (c)
    } should be (true)
  }

  //   "run test_random_MULT_INT" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_MULT_INT",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new MultPE_4_testing ) { c =>
  //     new test_random_MULT_INT (c)
  //   } should be (true)
  // }

  //   "run test_random_MULT_FP32" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_MULT_FP32",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new MultPE_4_testing ) { c =>
  //     new test_random_MULT_FP32 (c)
  //   } should be (true)
  // }

}