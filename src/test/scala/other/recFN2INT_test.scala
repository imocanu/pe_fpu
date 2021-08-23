package other

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

// FOR test :
// http://weitz.de/ieee/

class recFN2INT_test_1(dut: recFN2INT) extends PeekPokeTester(dut) {

  println(" ----->  Operation is recFN -> INT ")

  println(" ----->  [NOT generated] : ") 

  //val in_test = "b11111111111110110000001111101010".U   // -326678
  // val in_test = -326678.S(32.W)
  var in_test = 3.S(32.W)

  //val in_test = "h493E0".U
  //int 00000000000001001001001111100000    
  // fn 01001000100100100111110000000000
  var out_test = -326678.S(32.W)

    for {
    in_test <- -10.S(32.W) to 10.S(32.W)
  } {
    step(20)
    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in, in_test.S(32.W))
    step(20)
    expect(dut.io.out, in_test.S(32.W))
    //step(10)
    //println(s"[DEBUG] signed $in_test = out ${peek(dut.io.out)}")
  }

  val randNum = new Random
  for(i <- 0 until 50) {
    val a = randNum.nextInt(326670)
    val b = randNum.nextInt(326678)

    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in, a.S(32.W))
    step(20)
    expect(dut.io.out, a.S(32.W))
    println(s"[DEBUG] signed $a = out ${peek(dut.io.out)}")
  }



  //   step(20)
  // poke(dut.io.round, TestUtils.round_odd)
  // step(10)
  // poke(dut.io.in, in_test)
  // step(20)
  // expect(dut.io.out, out_test)
  // step(10)
  // poke(dut.io.round, "b111".U)
  // step(10)
  // poke(dut.io.in, in_test)
  // step(20)
  // poke(dut.io.round, TestUtils.round_min)
  // step(10)
  // poke(dut.io.in, in_test)
  // step(20)
  // expect(dut.io.out, out_test)
  // poke(dut.io.round, TestUtils.round_max)
  // poke(dut.io.in, in_test)
  // step(20)
  // expect(dut.io.out, out_test)
  // poke(dut.io.round, TestUtils.round_minMag)
  // poke(dut.io.in, in_test)
  // step(20)
  // expect(dut.io.out, out_test)
  // poke(dut.io.round, TestUtils.round_near_even)
  // poke(dut.io.in, in_test)
  // step(20)
  // expect(dut.io.out, out_test)
  // poke(dut.io.round, TestUtils.round_near_maxMag)
  // poke(dut.io.in, in_test)
  // step(20)
  // expect(dut.io.out, out_test)
  
}



class recFN2INT_test extends ChiselFlatSpec with Matchers {
    val vcdName = "recFN2INT_test"
    val targetDir = "diagram/" + vcdName
    val unittestsDir = "diagram/unit_tests/test"


  "run recFN2INT_test_1" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_ADD_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new recFN2INT ) { c =>
      new recFN2INT_test_1 (c)
    } should be (true)
  }

}