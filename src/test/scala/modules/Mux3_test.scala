package modules

import chisel3._
import chisel3.iotesters._
import org.scalatest.Matchers

class Mux_test_1(dut: Mux3) extends PeekPokeTester(dut) {

  step(5)
  poke(dut.io.in0, "b01000001010000000000000000000000".asUInt(32.W))  // 12
  poke(dut.io.in1, "b01000000110000000000000000000000".asUInt(32.W))  // 6
  poke(dut.io.in2, "b01000010100100000000000000000000".asUInt(32.W))  // 72
  step(5)
  poke(dut.io.sel, "b10".U)
  step(5)
  expect(dut.io.outIEEE, "b01000001010000000000000000000000".U)  // 12
  step(5)
  poke(dut.io.sel, "b01".U)
  step(5)
  expect(dut.io.outIEEE, "b01000000110000000000000000000000".U)  // 6
  step(5)
  poke(dut.io.sel, "b10".U)
  step(5)
  expect(dut.io.outIEEE, "b01000010100100000000000000000000".U)  // 72
  step(5)
  poke(dut.io.sel, "b00".U)
  step(5)
  expect(dut.io.outIEEE, "b00000000000000000000000000000000".U)  // 0
  step(5)
  poke(dut.io.sel, "b11".U)
  step(5)
  expect(dut.io.outIEEE, "b00000000000000000000000000000000".U)  // 0
  step(5)
  poke(dut.io.sel, "b00".U)
  step(5)
  expect(dut.io.outIEEE, "b00000000000000000000000000000000".U)  // 0
  step(5)

}

//class Mux3_test extends ChiselFlatSpec with Matchers {
//
//  val vcdName = "Mux3_test"
//  val targetDir = "diagram/" + vcdName
//  behavior of "<<< RUN : "+vcdName+" >>>"
//
//  var width = 32
//  var no = 1
//  "run test_"+no+" ..." should "pass" in {
//    chisel3.iotesters.Driver.execute(Array(
//      "--fint-write-vcd",
//      "--backend-name", "firrtl",
//      "--target-dir", targetDir,
//      "--top-name" , vcdName,
//      "--output-file", vcdName),
//      () => new Mux3 ) { c =>
//      new Mux_test_1 (c)
//    } should be (true)
//  }
//
//  behavior of "<<< DONE : "+vcdName+" >>>"
//}
