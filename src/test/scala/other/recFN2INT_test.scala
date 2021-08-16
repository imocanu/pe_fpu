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
  poke(dut.io.signed, true.B)
  poke(dut.io.round, TestUtils.round_minMag)

  val r = scala.util.Random
  val a: immutable.Seq[Int] = (0 to 5).map(_ => r.nextInt(10000000))
  val y = a.map( x => {
    val bin = x.toBinaryString
    val zero = 8 - bin.length
    List.fill(zero)(0).mkString("") ++ bin
  })
  //println(scala.util.Random.shuffle(y))
  // for (generatedBIN <- y) 
  // {
  //     println("Input "+generatedBIN+" = "+Integer.parseInt(generatedBIN, 2).toString())
  //     val testBin = "b"+generatedBIN
  //     poke(dut.io.in, testBin.U)
  //     step(20)
  //     val rez = Integer.parseInt(generatedBIN, 2)
  //     expect(dut.io.out, rez.S)
  // }

  println(" ----->  [NOT generated] : ") 

  val tt = "b11111111111111111100101011010110" 
  poke(dut.io.round, TestUtils.round_odd)
  poke(dut.io.in, "h447a0000".U(32.W))
  step(20)
  expect(dut.io.out, -13610.S)
  
  poke(dut.io.round, TestUtils.round_min)
  poke(dut.io.in, "b01001101100111000011111011001000".U)
  step(5)  
  expect(dut.io.out, 327670016.S)
  poke(dut.io.round, TestUtils.round_max)
  poke(dut.io.in, "b01001101100111000011111011001000".U)
  step(5)  
  expect(dut.io.out, 327670016.S)
  poke(dut.io.round, TestUtils.round_minMag)
  poke(dut.io.in, "b01001101100111000011111011001000".U)
  step(5)  
  expect(dut.io.out, 327670016.S)
  poke(dut.io.round, TestUtils.round_near_even)
  poke(dut.io.in, "b01001101100111000011111011001000".U)
  step(5)  
  expect(dut.io.out, 327670016.S)
  poke(dut.io.round, TestUtils.round_near_maxMag)
  poke(dut.io.in, "b01001101100111000011111011001000".U)
  step(5)  
  expect(dut.io.out, 327670016.S)
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