package modules

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

// FOR test :
// http://weitz.de/ieee/


class SUB_INTEGER_verilator(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_output = TestUtils.read(TestUtils.INT_SUB_RESULT)

  println(" ----->  Operation is SUB ( INT )")
  
  poke(dut.io.op, true.B)
  step(2)
  poke(dut.io.useINT, true.B)
  step(2)
  //poke(dut.io.round,TestUtils.getRound(roundSel))
  step(2)

   for (i <- 0 to input_1.size - 1) {
     val in1 = input_1(i).toLong
     val in2 = input_2(i).toLong
     val out = "b"+ test_output(i)
    poke(dut.io.in1, in1.S)
    poke(dut.io.in2, in2.S)
    step(5)
    //println(" -> "+out.asInstanceOf[String])
    expect(dut.io.outIEEE, out.U)
    step(5)
   }
  println(" ------------------------------------- ")
}

// class AddSub_verilator extends ChiselFlatSpec with Matchers {
//     val vcdName = "AddSub_verilator"
//     val targetDir = "diagram/" + vcdName
//     val unittestsDir = "diagram/unit_tests/test"

// //    "run SUB_INTEGER_round_select" should "pass" in {
// //    chisel3.iotesters.Driver.execute(
// //      Array("--generate-vcd-output", "on",
// //      "--top-name", "make_no_vcd",
// //      "--backend-name", "verilator",
// //      "--target-dir", targetDir),
// //      () => new AddSub )
// //      { c => new SUB_INTEGER_verilator (c, TestUtils.round_near_maxMag_UINT)
// //    } should be (true)
// //  }

// }
