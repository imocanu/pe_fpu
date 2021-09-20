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

  var in_test = 3.S(32.W)
  var out_test = -326678.S(32.W)

  // for {
  //   in_test <- -10.S(32.W) to 10.S(32.W)
  // } {
  //   step(20)
  //   poke(dut.io.round, "b111".U)
  //   step(10)
  //   poke(dut.io.in, in_test.S(32.W))
  //   step(20)
  //   expect(dut.io.out, in_test.S(32.W))
  //   //step(10)
  //   //println(s"[DEBUG] signed $in_test = out ${peek(dut.io.out)}")
  // }

  // for {
  //   in_test <- -500.U(32.W) to 500.U(32.W)
  // } {
  //   step(20)
  //   poke(dut.io.round, "b111".U)
  //   step(10)
  //   poke(dut.io.in, in_test)
  //   step(20)
  //   expect(dut.io.out, in_test * in_test)
  //   step(10)
  //   println(s"[DEBUG] signed $in_test = out ${peek(dut.io.out)}")
  // }

  // INT -304     11111111111111111111111011010000    >   00000000000000010110100100000000
  // INT -569     11111111111111111111110111000111    >   11111111111110110000111101001111
  // INT 569      00000000000000000000001000111001    >   00000000000001001111000010110001

  val randNum = new Random(326678)
  for(i <- 0 until 50) {
    val a = randNum.nextInt()
    val b = randNum.nextInt(326678)

    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in, "b00000000000000000000000000111011".U(32.W))
    step(20)
    expect(dut.io.out, "b00000000000000000011011001100100".U(32.W))
    //println(s"[DEBUG] signed $a = out ${peek(dut.io.out)}")
  }

  
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