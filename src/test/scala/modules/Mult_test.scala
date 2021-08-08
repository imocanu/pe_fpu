package modules

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

class MUL_INTEGER_round_select(dut: Mult, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_output = TestUtils.read(TestUtils.INT_MUL_RESULT)

  println(" ----->  Operation is MUL ( INT )")
  
  poke(dut.io.useINT, true.B)
  step(2)
  poke(dut.io.round,TestUtils.getRound(roundSel))
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


class MUL_FP32_round_select(dut: Mult, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INPUT_2)
  var test_output = TestUtils.read(TestUtils.MUL_RESULT)

  println(" ----->  Operation is MUL ( FP32 )")
  
  poke(dut.io.useINT, false.B)
  step(2)
  poke(dut.io.round,TestUtils.getRound(roundSel))
  step(2)

   for (i <- 0 to input_1.size - 1) {
     val in1 = "b"+ input_1(i)
     val in2 = "b"+ input_2(i)
     val out = "b"+ test_output(i)
    poke(dut.io.in1, in1.U)
    poke(dut.io.in2, in2.U)
    step(5)
    //println(" -> "+out.asInstanceOf[String])
    expect(dut.io.outIEEE, out.U)
    step(5)
   }

  println(" ------------------------------------- ")
}

class Mult_test_1(dut: Mult) extends PeekPokeTester(dut) {

  step(5)
  poke(dut.io.in1, "b01000001010000000000000000000000".asUInt(32.W))  // 12
  poke(dut.io.in2, "b01000000110000000000000000000000".asUInt(32.W))  // 6
  step(5)
  expect(dut.io.outIEEE, "b01000010100100000000000000000000".U)  // 72
  step(5)
}

class MUL_round_select(dut: Mult, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1    = TestUtils.read(TestUtils.INPUT_1)
  var input_2    = TestUtils.read(TestUtils.INPUT_2)
  var mul_output = TestUtils.read(TestUtils.MUL_RESULT)

  println(" ----->  Operation is MUL")

  if(roundSel == TestUtils.round_near_even_UINT)
  {
    println(" ----->  round_near_even_UINT")
    poke(dut.io.round, TestUtils.round_near_even)
  }
  else  if(roundSel == TestUtils.round_minMag_UINT)
  {
    println(" ----->  round_minMag_UINT")
    poke(dut.io.round, TestUtils.round_minMag)
  } 
  else  if(roundSel == TestUtils.round_min_UINT)
  {
    println(" ----->  round_min_UINT")
    poke(dut.io.round, TestUtils.round_min)
  } 
  else  if(roundSel == TestUtils.round_max_UINT)
  {
    println(" ----->  round_max_UINT")
    poke(dut.io.round, TestUtils.round_max)
  } 
  else  if(roundSel == TestUtils.round_near_maxMag_UINT)
  {
    println(" ----->  round_near_maxMag_UINT")
    poke(dut.io.round, TestUtils.round_near_maxMag)
  } 
  else if(roundSel == TestUtils.round_odd_UINT)
  {
    println(" ----->  round_odd_UINT")
    poke(dut.io.round, TestUtils.round_odd)
  } 
  else
  {
    println(" ----->  round value is Invalid")
    println(" ----->  Default is : round_near_maxMag")
    poke(dut.io.round, TestUtils.round_near_maxMag)
  }  

  step(2)

  for (i <- 0 to input_1.size - 1) {
    val in1 = "b"+ input_1(i)
    val in2 = "b"+ input_2(i)
    val out = "b"+ mul_output(i)
    poke(dut.io.in1, in1.U)
    poke(dut.io.in2, in2.U)
    step(5)
    //println(" -> "+out.asInstanceOf[String])
    expect(dut.io.outIEEE, out.U)
    step(5)
  }
  println(" ------------------------------------- ")
}

class Mult_test extends ChiselFlatSpec with Matchers {

 val vcdName = "Mult_test"
 val targetDir = "diagram/" + vcdName

//  var no = 1
//  "run test_"+no+" ..." should "pass" in {
//    chisel3.iotesters.Driver.execute(Array(
//      "--fint-write-vcd",
//      "--backend-name", "firrtl",
//      "--target-dir", targetDir,
//      "--top-name" , vcdName,
//      "--output-file", vcdName),
//      () => new Mult ) { c =>
//      new Mult_test_1 (c)
//    } should be (true)
//  }

  //  "run MUL_round_select" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--backend-name", "firrtl"
  //     ),
  //     () => new Mult ) { c =>
  //     new MUL_round_select (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }

  "run MUL_FP32_round_select" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_FP32"
    ),
    () => new Mult ) { c =>
    new MUL_FP32_round_select (c, TestUtils.round_near_maxMag_UINT)
    } should be (true)
  }

  "run MUL_INTEGER_round_select" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_INT"
    ),
    () => new Mult ) { c =>
    new MUL_INTEGER_round_select (c, TestUtils.round_near_maxMag_UINT)
    } should be (true)
  }
}
