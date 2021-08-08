package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

class PE_FP32_test3_case (dut: PE_FPU) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INPUT_2)
  var test_output = TestUtils.read(TestUtils.PE_FP32_TEST_3_RESULT)

  println(" ----->  PE_FP32_test3_case ( FP32 )")
  step(5)

  for (i <- 0 to input_1.size - 1) {
    val in1 = "b"+ input_1(i)
    val in2 = "b"+ input_2(i)
    val out = "b"+ test_output(i)

    poke(dut.io.Yi, "b01000000000000000000000000000000".U(32.W))
    poke(dut.io.a1, in1.U)
    poke(dut.io.Xi, "b01110000000000000000000000000000".U(32.W))
    poke(dut.io.B1, in1.U)
    step(5)

    poke(dut.io.m31_sel, "b10".U) // pin 3
    poke(dut.io.m32_sel, "b01".U) // pin 2 
    poke(dut.io.m33_sel, "b00".U)
    poke(dut.io.m34_sel, "b00".U)
    poke(dut.io.m35_sel, "b01".U) // pin 2
    poke(dut.io.m36_sel, "b00".U) // pin 1
    poke(dut.io.m37_sel, "b01".U) // pin 2

    step(5)

    poke(dut.io.addsub_1_op, false.B) // ADD
    poke(dut.io.addsub_2_op, false.B) // ADD

    step(5)

    poke(dut.io.useINT_ALL, false.B)
    poke(dut.io.round_ALL,  "b100".U)

    step(5)

    println(" -> "+out.asInstanceOf[String])
    //expect(dut.io.addsum_1_final, out.U)
    step(5)
  }

}


class PE_1(dut: PE_FPU) extends PeekPokeTester(dut) {
  step(5)
  poke(dut.io.Yi, "b01000000000000000000000000000000".U(32.W))
  poke(dut.io.a1, "b01100000000000000000000000000000".U(32.W))
  poke(dut.io.Xi, "b01110000000000000000000000000000".U(32.W))
  poke(dut.io.B1, "b01110000000000000000000000000000".U(32.W))

  poke(dut.io.Yj, "b01000000000000000000000000000000".U(32.W))
  poke(dut.io.a2, "b01100000000000000000000000000000".U(32.W))
  poke(dut.io.Xj, "b01110000000000000000000000000000".U(32.W))
  poke(dut.io.B2, "b01110000000000000000000000000000".U(32.W))
  step(5)
  println("\n*=====< debug >======*")
}

class PE_FPU_test extends ChiselFlatSpec with Matchers {

 val vcdName = "PE_FPU_test"
 val targetDir = "diagram/" + vcdName

//  var width = 8
//  var no = 1
//  "run test_"+no+" ..." should "pass" in {
//    chisel3.iotesters.Driver.execute(Array(
//      "--fint-write-vcd",
//      "--backend-name", "firrtl",
//      "--target-dir", targetDir,
//      "--top-name" , vcdName,
//      "--output-file", vcdName),
//      () => new PE_FPU ) { c =>
//      new PE_1 (c)
//    } should be (true)
//  }

"run PE_FP32_test3_case" should "pass" in {
  chisel3.iotesters.Driver.execute(Array(
    "--fint-write-vcd",
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_PE_TEST_3",
    "--top-name" , vcdName,
    "--output-file", vcdName),
    () => new PE_FPU ) { c =>
    new PE_FP32_test3_case (c)
    } should be (true)
  }

}
