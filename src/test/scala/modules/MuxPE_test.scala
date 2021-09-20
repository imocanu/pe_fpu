package modules

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import scala.io.Source
import scala.collection._
import scala.util._
import org.scalatest.matchers.should.Matchers
import utils.TestUtils


class MuxPE_test_manual(dut: MuxPE) extends PeekPokeTester(dut) {

    var test_fp    = "b"+"01000010011011000000000000000000"  // 59
    var test_int   = "b"+"00000000000000000000000000111011"  // 59
    var test_zero  = "b"+"00000000000000000000000000000000"  // 0

    println(" ----->  TEST with [ MUX -> INT ]")
    println(" ----->  [Run test] : ") 

    step(10)
    
    poke(dut.io.in_0, test_int.U(32.W))
    poke(dut.io.in_1, test_zero.U(32.W))
    poke(dut.io.in_2, test_zero.U(32.W))
    poke(dut.io.in_3, test_zero.U(32.W))
    poke(dut.io.sel, "b00".U)
    step(10)
    expect(dut.io.out, test_int.U(32.W))

    poke(dut.io.in_0, test_zero.U(32.W))
    poke(dut.io.in_1, test_int.U(32.W))
    poke(dut.io.in_2, test_zero.U(32.W))
    poke(dut.io.in_3, test_zero.U(32.W))
    poke(dut.io.sel, "b01".U)
    step(10)
    expect(dut.io.out, test_int.U(32.W))

    poke(dut.io.in_0, test_zero.U(32.W))
    poke(dut.io.in_1, test_zero.U(32.W))
    poke(dut.io.in_2, test_int.U(32.W))
    poke(dut.io.in_3, test_zero.U(32.W))
    poke(dut.io.sel, "b10".U)
    step(10)
    expect(dut.io.out, test_int.U(32.W))

    poke(dut.io.in_0, test_zero.U(32.W))
    poke(dut.io.in_1, test_zero.U(32.W))
    poke(dut.io.in_2, test_zero.U(32.W))
    poke(dut.io.in_3, test_int.U(32.W))
    poke(dut.io.sel, "b11".U)
    step(10)
    expect(dut.io.out, test_int.U(32.W))


    println(" ----->  TEST with [ MUX -> FP ]")
    println(" ----->  [Run test] : ")
    
    step(10)

    poke(dut.io.in_0, test_fp.U(32.W))
    poke(dut.io.in_1, test_zero.U(32.W))
    poke(dut.io.in_2, test_zero.U(32.W))
    poke(dut.io.in_3, test_zero.U(32.W))
    poke(dut.io.sel, "b00".U)
    step(10)
    expect(dut.io.out, test_fp.U(32.W))

    poke(dut.io.in_0, test_zero.U(32.W))
    poke(dut.io.in_1, test_fp.U(32.W))
    poke(dut.io.in_2, test_zero.U(32.W))
    poke(dut.io.in_3, test_zero.U(32.W))
    poke(dut.io.sel, "b01".U)
    step(10)
    expect(dut.io.out, test_fp.U(32.W))

    poke(dut.io.in_0, test_zero.U(32.W))
    poke(dut.io.in_1, test_zero.U(32.W))
    poke(dut.io.in_2, test_fp.U(32.W))
    poke(dut.io.in_3, test_zero.U(32.W))
    poke(dut.io.sel, "b10".U)
    step(10)
    expect(dut.io.out, test_fp.U(32.W))

    poke(dut.io.in_0, test_zero.U(32.W))
    poke(dut.io.in_1, test_zero.U(32.W))
    poke(dut.io.in_2, test_zero.U(32.W))
    poke(dut.io.in_3, test_fp.U(32.W))
    poke(dut.io.sel, "b11".U)
    step(10)
    expect(dut.io.out, test_fp.U(32.W)) 

}


class MuxPE_test extends ChiselFlatSpec with Matchers {
    val vcdName = "MuxPE_test"
    val targetDir = "diagram/" + vcdName


    "run MuxPE_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_MANUAL",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new MuxPE ) { c =>
      new MuxPE_test_manual (c)
    } should be (true)
  }

}


