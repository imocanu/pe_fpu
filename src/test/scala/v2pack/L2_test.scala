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


class L2_test_simple(dut: L2_PE) extends PeekPokeTester(dut) {

  println(" ----->  Operation is L2_test -> INT ")
  println(" ----->  [Simple test] : ") 

    var test_in_0 = "b00000000000000000000000000111011"
    var test_in_1 = "b00000000000000000000000000111011"
    var test_out  = "b00000000000000000011011001100100"
    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in_0, test_in_0.U(32.W))  // 59
    step(10)
    poke(dut.io.in_1, test_in_1.U(32.W))  // 59
    step(20)
    expect(dut.io.out, test_out.U(32.W)) // 59+59=118*118=13924
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in_0, "b11111111111111111111111111000101".U(32.W))  // -59
    step(10)
    poke(dut.io.in_1, "b00000000000000000000000000111011".U(32.W))  // 59
    step(20)
    expect(dut.io.out, "b00000000000000000000000000000000".U(32.W)) // -59+59=0*0=0
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in_0, "b00000000000000000000000101000001".U(32.W))  // 321
    step(10)
    poke(dut.io.in_1, "b00000000000000000000001001010111".U(32.W))  // 599
    step(20)
    expect(dut.io.out, "b00000000000011001110101001000000".U(32.W)) // 321+599=920*920=846400
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

    poke(dut.io.round, "b111".U)
    step(10)
    poke(dut.io.in_0, "b11111111111111111111111010111111".U(32.W))  // -321
    step(10)
    poke(dut.io.in_1, "b11111111111111111111110110101001".U(32.W))  // -599
    step(20)
    expect(dut.io.out, "b00000000000011001110101001000000".U(32.W)) // -321-599=-920*-920=846400
    println(s"[DEBUG] in_0: ${peek(dut.io.in_0)} in_1: ${peek(dut.io.in_1)} out: ${peek(dut.io.out)}")

}



class L2_test extends ChiselFlatSpec with Matchers {
    val vcdName = "L2_test"
    val targetDir = "diagram/" + vcdName
    val unittestsDir = "diagram/unit_tests/test"


    "run L2_test_simple" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new L2_PE ) { c =>
      new L2_test_simple (c)
    } should be (true)
  }

}