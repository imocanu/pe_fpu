package modules

import chisel3._
import chisel3.iotesters._
import org.scalatest.Matchers

class Mux_test_1(dut: Mux3) extends PeekPokeTester(dut) {

  step(5)
  val in0 = "b01000001010000000000000000000000".asUInt(32.W) // 12
  val in1 = "b01000000110000000000000000000000".asUInt(32.W) // 6
  val in2 = "b01000010100100000000000000000000".asUInt(32.W) // 72
  
  poke(dut.io.in0, in0)  // 12
  poke(dut.io.in1, in1)  // 6
  poke(dut.io.in2, in2)  // 72
  step(5)
  poke(dut.io.sel, "b00".U)
  step(5)
  expect(dut.io.outIEEE, in0)  // in0
  step(5)
  poke(dut.io.sel, "b01".U)
  step(5)
  expect(dut.io.outIEEE, in1)  // in1
  step(5)
  poke(dut.io.sel, "b10".U)
  step(5)
  expect(dut.io.outIEEE, in2)  // 12
  step(5)
  poke(dut.io.sel, "b11".U)
  step(5)
  expect(dut.io.outIEEE, "b00000000000000000000000000000000".U)  // 72
  step(5)
}

class Mux3_test extends ChiselFlatSpec with Matchers {

 val vcdName = "Mux3_test"
 val targetDir = "diagram/" + vcdName

 "run Mux_test_1 " should "pass" in {
   chisel3.iotesters.Driver.execute(Array(
    "--fint-write-vcd",
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_Mux3_test",
    "--top-name" , vcdName,
    "--output-file", vcdName),
     () => new Mux3 ) { c =>
     new Mux_test_1 (c)
   } should be (true)
 }
}
