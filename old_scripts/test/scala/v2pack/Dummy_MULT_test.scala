package v2pack

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils
import scala.collection._
import scala.util._
import hardfloat._
import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

class Dummy_MULT_test_generate(dut: Dummy_MULT) extends PeekPokeTester(dut) {
    println(" ----->  TEST RANDOM with [ INT ]")
    println(" ----->  [Run test] : ") 


    var in_0     = TestUtils.read(TestUtils.INT_INPUT_1)
    var in_1     = TestUtils.read(TestUtils.INT_INPUT_2)
    var out      = TestUtils.read(TestUtils.INT_MUL_RESULT)

    var test_in_0 = ""
    var test_in_1 = ""
    var test_out  = ""

    poke(dut.io.rounding, "b111".U)
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)

    for (i <- 0 to in_1.size - 1) 
    {
        test_in_0 = "b"+in_0(i)
        test_in_1 = "b"+in_1(i) 
        test_out  = "b"+out(i)
        step(10)
        poke(dut.io.in_0, test_in_0.U(32.W))  
        step(10)
        poke(dut.io.in_1, test_in_1.U(32.W))  
        step(20)
        expect(dut.io.out, test_out.U(33.W)) 
        println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
        step(10)
    }
}

class Dummy_MULT_test_simple(dut: Dummy_MULT) extends PeekPokeTester(dut) {

  println(" ----->  Operation is MULT_test -> INT ")
  println(" ----->  [Simple test] : ") 

    var test_in_0 = ""
    var test_in_1 = ""
    var test_out  = ""

    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)

    test_in_0 = "b"+"11111111111111111100011101010101"  // -14507 
    test_in_1 = "b"+"00000000000000000010111101001001"  // 12105
    test_out  = "b"+"11110101100010000111001000111101"  // −175607235

    poke(dut.io.in_0, test_in_0.U(32.W))  
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000111111111111111"  // 32767
    test_in_1 = "b"+"00000000000000000111111111111111"  // 32767
    test_out  = "b"+"00111111111111110000000000000001"  // 1073676289
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(33.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(33.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000111101110000110"  // 31622
    test_in_1 = "b"+"00000000000000000111101110000110"  // 31622
    test_out  = "b"+"00111011100110100000101000100100"  // 
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"11111111111111111000101011010000"  // -30000
    test_in_1 = "b"+"00000000000000000111010100110000"  // 30000
    test_out  = "b"+"11001010010110110001011100000000"  // 
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000111010100110000"  // 30000
    test_in_1 = "b"+"00000000000000000111010100110000"  // 30000
    test_out  = "b"+"00110101101001001110100100000000"  // 
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000010011100010000"  // 10000
    test_in_1 = "b"+"00000000000000000010011100010000"  // 10000
    test_out  = "b"+"00000101111101011110000100000000"
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"11111111111111111111110000011000"  // -1000
    test_in_1 = "b"+"00000000000000000000001111101000"  // 1000
    test_out  = "b"+"11111111111100001011110111000000"
    poke(dut.io.rounding, "b111".U)
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000000000001100100"  // 100
    test_in_1 = "b"+"11111111111111111111111110011100"  // -100
    test_out  = "b"+"11111111111111111101100011110000"
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000000000000000000"  // 0
    test_in_1 = "b"+"11111111111111111111111111110100"  // -12
    test_out  = "b"+"00000000000000000000000000000000"  // 0
    poke(dut.io.rounding, "b111".U(3.W))
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)

    test_in_0 = "b"+"00000000000000000000000000100010"  // 34
    test_in_1 = "b"+"11111111111111111111111111110100"  // -12
    test_out  = "b"+"11111111111111111111111001101000"  // 408
    poke(dut.io.rounding, "b111".U)
    step(10)
    poke(dut.io.tininess, "b1".U(1.W))
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  
    step(10)
    expect(dut.io.out, test_out.U(33.W)) 
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")
    step(10)
}



class Dummy_MULT_test extends ChiselFlatSpec with Matchers {
    val vcdName = "Dummy_MULT_test"
    val targetDir = "diagram/" + vcdName
    val unittestsDir = "diagram/unit_tests/test"


    "run Dummy_MULT_test_simple" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new Dummy_MULT ) { c =>
      new Dummy_MULT_test_simple (c)
    } should be (true)
  }

    "run Dummy_MULT_test_generate" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_RANDOM_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new Dummy_MULT ) { c =>
        new Dummy_MULT_test_generate (c)
    } should be (true)
  }

}