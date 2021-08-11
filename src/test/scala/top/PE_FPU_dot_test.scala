package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils
import scala.collection.mutable.ArrayBuffer

class PE_FP32_test5_dot_simple (dut: PE_FPU) extends PeekPokeTester(dut) {

  println(" ----->  PE_FP32_test5_DOT_simple ( FP32 )")
  var in1 =""
  var in2 =""
  var out =""
  var sim_Mem = 0
  var bin_mem = ""
  var to_Store = ""

  out = "b01000010000000000000000000000000"  // 30 + 2 = 32
  
  poke(dut.io.simMemOut, "b0000000000000000000000000000000000000000000000000000000000000000".U)
  poke(dut.io.useINT_ALL, false.B)

  poke(dut.io.a1, "b00111111100000000000000000000000".U(32.W))  // 1
  poke(dut.io.B1, "b01000000000000000000000000000000".U(32.W))  // 2
  poke(dut.io.a2, "b01000000010000000000000000000000".U(32.W))  // 3
  poke(dut.io.B2, "b01000001001000000000000000000000".U(32.W))  // 10
  
  poke(dut.io.Xi, "b00000000000000000000000000000000".U(32.W))
  poke(dut.io.Yi, "b00000000000000000000000000000000".U(32.W))
  poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
  poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))

  poke(dut.io.addsub_1_op, false.B) // ADD
  poke(dut.io.addsub_2_op, false.B) // ADD
  
  poke(dut.io.m31_sel, "b10".U) // pin 3
  poke(dut.io.m32_sel, "b01".U) // pin 2 
  poke(dut.io.m33_sel, "b00".U)
  poke(dut.io.m34_sel, "b00".U)
  poke(dut.io.m35_sel, "b01".U) // pin 2
  poke(dut.io.m36_sel, "b01".U) // pin 2
  poke(dut.io.m37_sel, "b00".U) // pin 1
    
  step(5)

  poke(dut.io.m33_sel, "b01".U) // pin 1
  poke(dut.io.m34_sel, "b01".U) // pin 0 

  step(15)

  if(expect(dut.io.addsum_1_final, out.U))
  {
        println("-> "+out.asInstanceOf[String]+" : PASS")
  }
  else
  {
        println(" TEST_EXP   -> "+out.asInstanceOf[String]+"  : [TEST FAIL] !!!!")
  }
}


class PE_FPU_dot_test extends ChiselFlatSpec with Matchers {

 val vcdName = "PE_FPU_dot_test"
 val targetDir = "diagram/" + vcdName

  "run PE_FP32_test5_dot" should "pass" in {
  chisel3.iotesters.Driver.execute(Array(
    "--fint-write-vcd",
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_5_simple",
    "--top-name" , vcdName,
    "--output-file", vcdName),
    () => new PE_FPU ) { c =>
    new PE_FP32_test5_dot_simple (c)
    } should be (true)
  }

}