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

  //val in_test = "b00000000000001001001001111100000".U
  val in_test = 300.S
  //val in_test = "h493E0".U
  //int 00000000000001001001001111100000    
  // fn 01001000100100100111110000000000
  val out_test = 300000.S

  poke(dut.io.round, TestUtils.round_odd)
  poke(dut.io.in, in_test)
  step(20)
  expect(dut.io.out, out_test)
  
  poke(dut.io.round, TestUtils.round_min)
  poke(dut.io.in, in_test)
  step(20)
  expect(dut.io.out, out_test)
  poke(dut.io.round, TestUtils.round_max)
  poke(dut.io.in, in_test)
  step(20)
  expect(dut.io.out, out_test)
  poke(dut.io.round, TestUtils.round_minMag)
  poke(dut.io.in, in_test)
  step(20)
  expect(dut.io.out, out_test)
  poke(dut.io.round, TestUtils.round_near_even)
  poke(dut.io.in, in_test)
  step(20)
  expect(dut.io.out, out_test)
  poke(dut.io.round, TestUtils.round_near_maxMag)
  poke(dut.io.in, in_test)
  step(20)
  expect(dut.io.out, out_test)
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