package other

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

// FOR test :
// http://weitz.de/ieee/


class recFN2INT_test_1(dut: recFN2INT) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var test_output = TestUtils.read(TestUtils.INT_SUB_RESULT)

  println(" ----->  Operation is recFN > INT ")


//    for (i <- 0 to input_1.size - 1) 
//    {
      step(5)
      poke(dut.io.in, "b01000010111000000000000000000000".U)  // 112
      step(5)

      expect(dut.io.out, 112.S)
      step(5)

    // }
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