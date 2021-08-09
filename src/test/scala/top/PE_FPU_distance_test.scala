package top

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils
import scala.collection.mutable.ArrayBuffer

class PE_FP32_test4_distance (dut: PE_FPU) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INPUT_2)
  var test_output = TestUtils.read(TestUtils.PE_FP32_TEST_4_RESULT)

  println(" ----->  PE_FP32_test4_distance ( FP32 )")
  var in1 =""
  var in2 =""
  var out =""

  step(10)

  for (i <- 0 to input_1.size - 1) 
  {
    in1 = "b"+ input_1(i)
    in2 = "b"+ input_2(i)
    out = "b"+ test_output(i)
    
    poke(dut.io.simMemOut, "b0000000000000000000000000000000000000000000000000000000000000000".U)
    poke(dut.io.useINT_ALL, false.B)
    poke(dut.io.Xi, in2.U)
    poke(dut.io.Yi, in1.U)
    poke(dut.io.a1, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.B1, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

    step(10)
    poke(dut.io.addsub_1_op, true.B) // SUB
    poke(dut.io.addsub_2_op, true.B) // SUB
    poke(dut.io.m31_sel, "b01".U) // pin 1
    poke(dut.io.m32_sel, "b00".U) // pin 0 
    poke(dut.io.m33_sel, "b00".U)
    poke(dut.io.m34_sel, "b00".U)
    poke(dut.io.m35_sel, "b00".U) // pin 0
    poke(dut.io.m36_sel, "b01".U) // pin 0
    poke(dut.io.m37_sel, "b01".U) // pin 2
    
    step(10)
    poke(dut.io.m31_sel, "b00".U) // pin 1
    poke(dut.io.m32_sel, "b10".U) // pin 0 
    // step(1)
    poke(dut.io.m35_sel, "b01".U)

    step(15)
    
    in1 = "b"+ input_2(i)
    in2 = "b"+ input_1(i)
    //out = "b"+ test_output(i)
    
    poke(dut.io.simMemOut, "b0000000000000000000000000000000000000000000000000000000000000000".U)
    poke(dut.io.useINT_ALL, false.B)
    poke(dut.io.Xi, in2.U)
    poke(dut.io.Yi, in1.U)
    poke(dut.io.a1, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.B1, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Yj, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.a2, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.Xj, "b00000000000000000000000000000000".U(32.W))
    poke(dut.io.B2, "b00000000000000000000000000000000".U(32.W))

    step(10)
    poke(dut.io.addsub_1_op, true.B) // SUB
    poke(dut.io.addsub_2_op, true.B) // SUB
    poke(dut.io.m31_sel, "b01".U) // pin 1
    poke(dut.io.m32_sel, "b00".U) // pin 0 
    poke(dut.io.m33_sel, "b00".U)
    poke(dut.io.m34_sel, "b00".U)
    poke(dut.io.m35_sel, "b00".U) // pin 0
    poke(dut.io.m36_sel, "b01".U) // pin 0
    poke(dut.io.m37_sel, "b01".U) // pin 2
    
    step(10)
    poke(dut.io.m31_sel, "b00".U) // pin 1
    poke(dut.io.m32_sel, "b10".U) // pin 0 
    // step(1)
    poke(dut.io.m35_sel, "b01".U)

    step(15)
    poke(dut.io.simMemOut, dut.io.addsum_1_final.U(64.W))
    step(5)

    if(expect(dut.io.addsum_2_final, out.U))
    {
          println(" -> "+out.asInstanceOf[String]+" : PASS")
    }
    else
    {
          println(" ITER -> "+i)
          println(" IN_1 -> "+in1.asInstanceOf[String])
          println(" IN_2 -> "+in2.asInstanceOf[String])
          println(" TEST_EXP  -> "+out.asInstanceOf[String]+" : TEST FAIL")
          //input_1 = TestUtils.readEmpty()
    }

  }
}

class PE_FP32_test4_pow (dut: PE_FPU) extends PeekPokeTester(dut) {

}

class PE_FPU_distance_test extends ChiselFlatSpec with Matchers {

 val vcdName = "PE_FPU_distance_test"
 val targetDir = "diagram/" + vcdName

  "run PE_FP32_test4_distance" should "pass" in {
  chisel3.iotesters.Driver.execute(Array(
    "--fint-write-vcd",
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"PE_TEST_4",
    "--top-name" , vcdName,
    "--output-file", vcdName),
    () => new PE_FPU ) { c =>
    new PE_FP32_test4_distance (c)
    } should be (true)
  }

}