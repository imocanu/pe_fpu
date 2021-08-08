package modules

import chisel3._
import chisel3.iotesters._
import org.scalatest._

class Memory_1 (dut: Mem1R1W) extends PeekPokeTester(dut) {
  poke(dut.io.RD_FLAG, false.B)
  poke(dut.io.WR_FLAG, false.B)
  println("\n*=====< debug >======*")
  step(1)
  poke(dut.io.RD_FLAG, false.B)
  poke(dut.io.WR_FLAG, true.B)
  println("\n*=====< debug >======*")
  step(1)
  poke(dut.io.WR_ADDR, 1.U)
  poke(dut.io.WR_DATA, 5.U)
  step(1)
  poke(dut.io.WR_ADDR, 2.U)
  poke(dut.io.WR_DATA, 6.U)
  step(1)
  poke(dut.io.RD_FLAG, true.B)
  poke(dut.io.WR_FLAG, false.B)
  println("\n*=====< debug >======*")
  step(1)
  poke(dut.io.RD_ADDR, 1.U)
  step(1)
  expect(dut.io.RD_DATA, 5.U)
  step(1)
  poke(dut.io.RD_ADDR, 2.U)
  step(1)
  expect(dut.io.RD_DATA, 6.U)
  step(1)
}

class Memory_2(dut: Mem1R1W) extends PeekPokeTester(dut) {
  poke(dut.io.RD_FLAG, false.B)
  poke(dut.io.WR_FLAG, false.B)
  println("\n*=====< debug >======*")
  step(1)
  poke(dut.io.WR_ADDR, 1.U)
  poke(dut.io.WR_DATA, 5.U)
  step(1)
  poke(dut.io.WR_ADDR, 2.U)
  poke(dut.io.WR_DATA, 6.U)
  step(1)
  poke(dut.io.RD_FLAG, true.B)
  poke(dut.io.WR_FLAG, false.B)
  println("\n*=====< debug >======*")
  step(1)
}

//class Mem1R1WTest extends ChiselFlatSpec with Matchers {
//
//  val vcdName = "Mem1R1WTest"
//  val targetDir = "diagram/" + vcdName
//  behavior of "<<< RUN : "+vcdName+" >>>"
//
//  var width = 8
//  var no = 1
//  "run test_"+no+" ..." should "pass" in {
//    chisel3.iotesters.Driver.execute(Array(
//      "--fint-write-vcd",
//      "--backend-name", "firrtl",
//      "--target-dir", targetDir,
//      "--top-name" , vcdName,
//      "--output-file", vcdName),
//      () => new Mem1R1W()) { c =>
//      new Memory_1 (c)
//    } should be (true)
//  }
//
//  width = 16
//  no = 2
//  "run test_"+no+" ..." should "pass" in {
//    chisel3.iotesters.Driver.execute(Array(
//      "--fint-write-vcd",
//      "--backend-name", "firrtl",
//      "--target-dir", targetDir,
//      "--top-name" , vcdName+width,
//      "--output-file", vcdName+width),
//      () => new Mem1R1W()) { c =>
//      new Memory_2 (c)
//    } should be (true)
//  }
//
//  behavior of "<<< DONE : "+vcdName+" >>>"
//}

