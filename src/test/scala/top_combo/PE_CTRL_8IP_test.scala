package top_combo


import chisel3._
import chisel3.util._
import chisel3.iotesters._
import scala.io.Source
import scala.collection._
import scala.util._
import org.scalatest.matchers.should.Matchers
import utils.TestUtils


class PE_CTRL_8IP_test_FP_WGT(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> FP -> WGT ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INPUT_4)
  var test_out      = TestUtils.read(TestUtils.FP_WGT_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 57
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type        = 3.U(2.W)

  reset(1)

  poke(dut.io.use_int, false.B)
  poke(dut.io.rounding, "b100".U(3.W))
  poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_FP_DOT(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> FP -> DOT ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INPUT_4)
  var test_out      = TestUtils.read(TestUtils.FP_DOT_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 52
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type        = 2.U(2.W)

  reset(1)

  poke(dut.io.use_int, false.B)
  poke(dut.io.rounding, "b100".U(3.W))
  poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_FP_L1(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> FP -> L1 ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INPUT_4)
  var test_out      = TestUtils.read(TestUtils.FP_L1_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 52
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type        = 1.U(2.W)

  reset(1)

  poke(dut.io.use_int, false.B)
  poke(dut.io.rounding, "b100".U(3.W))
  poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_FP_L2(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> FP -> L2 ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INPUT_4)
  var test_out      = TestUtils.read(TestUtils.FP_L2_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 57
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type        = 0.U(2.W)

  reset(1)

  poke(dut.io.use_int, false.B)
  poke(dut.io.rounding, "b100".U(3.W))
  poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_INT_WGT(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> WGT -> INT ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INT_INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INT_INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INT_INPUT_4)
  var test_out      = TestUtils.read(TestUtils.INT_WGT_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 57
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type = "b11".U(2.W)

  reset(1)

  poke(dut.io.use_int, true.B)
  // poke(dut.io.rounding, "b111".U(3.W))
  // poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }
    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_INT_DOT(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> DOT -> INT ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INT_INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INT_INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INT_INPUT_4)
  var test_out      = TestUtils.read(TestUtils.INT_DOT_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 52
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type = 2.U(2.W)

  reset(1)

  poke(dut.io.use_int, true.B)
  // poke(dut.io.rounding, "b111".U(3.W))
  // poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_INT_L1(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> L1 -> INT ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INT_INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INT_INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INT_INPUT_4)
  var test_out      = TestUtils.read(TestUtils.INT_L1_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 52
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type = 1.U(2.W)

  reset(1)

  poke(dut.io.use_int, true.B)
  // poke(dut.io.rounding, "b111".U(3.W))
  // poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)


  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}


class PE_CTRL_8IP_test_INT_L2(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

  println(" ----->  TEST for [ PE_CTRL_8IP -> L2 -> INT ]")
  println(" ----->  [Run test] ...")

  var test_in_0     = TestUtils.read(TestUtils.INT_INPUT_1)
  var test_in_1     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_in_2     = TestUtils.read(TestUtils.INT_INPUT_3)
  var test_in_3     = TestUtils.read(TestUtils.INT_INPUT_4)
  var test_out      = TestUtils.read(TestUtils.INT_L2_RESULT)

  var inputTest_0 = ""
  var inputTest_1 = ""
  var inputTest_2 = ""
  var inputTest_3 = ""
  var out  = ""

  var check_timeout       = 57
  var pass_iter_timeout   = 0
  var end_iter_timeout    = 20
  var test_op_type = 0.U(2.W)

  reset(1)

  poke(dut.io.use_int, true.B)
  // poke(dut.io.rounding, "b111".U(3.W))
  // poke(dut.io.tininess, "b1".U(1.W))
  poke(dut.io.op_type, test_op_type)

  for (i <- 0 to test_in_1.size - 1) 
  {
    if(i == 0)
    {
      // Add 1 cycle ONLY for Startup step
      check_timeout = check_timeout + 1
    }

    inputTest_0 = "b"+test_in_0(i)
    inputTest_1 = "b"+test_in_1(i)
    inputTest_2 = "b"+test_in_2(i)
    inputTest_3 = "b"+test_in_3(i)  
    out  = "b"+test_out(i)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))

    step(check_timeout)

    if(expect(dut.io.out, out.U(32.W)))
    {
      println(s"[PASS iter ${i}] out : ${peek(dut.io.out)}")
      step(pass_iter_timeout)
    }
    else
    {
      println(s" *****[ TEST NR ${i} ]***** ")
      println(s"[DBG] in0: ${inputTest_0}")
      println(s"[DBG] in1: ${inputTest_1}")
      println(s"[DBG] in2: ${inputTest_2}")
      println(s"[DBG] in3: ${inputTest_3}")
      println(s"[DBG] out: ${peek(dut.io.out)}")
      println(" *****[ TEST FAIL ]***** ")
      System.exit(0)
      //step(pass_iter_timeout)
    } 
  }
  step(end_iter_timeout)
}

class PE_CTRL_8IP_test_manual(dut: PE_CTRL_8IP) extends PeekPokeTester(dut) {

    var test_fp_0   = "b"+"01000001101110000000000000000000"  //  23
    var test_fp_1   = "b"+"01000001001100000000000000000000"  //  11
    var test_fp_2   = "b"+"11000010010111000000000000000000"  // -55
    var test_fp_3   = "b"+"11000001001100000000000000000000"  // -11

    // L2 => 16640  =  01000110100000100000000000000000
    // L2 => 5920   =  01000101101110010000000000000000
    // ----------------------------------------------------
    // L1 =>  -256  =  11000011100000000000000000000000
    // L1 => 16640  =  01000110100000100000000000000000 
    // ----------------------------------------------------
    // DOT => 6864  =  01000101110101101000000000000000
    // DOT => -480  =  11000011111100000000000000000000
    // ----------------------------------------------------
    // WGT => 
    // WGT => 
    // ----------------------------------------------------

    var test_int_0   = "b"+"00000000000000000000000000010111" // 23
    var test_int_1   = "b"+"00000000000000000000000000001011" // 11
    var test_int_2   = "b"+"11111111111111111111111111001001" // -55
    var test_int_3   = "b"+"11111111111111111111111111110101" // -11
    // L2  => 144 + 1936 = 2080 * 8 = 16640   / 00000000000000000100000100000000
    // L1  => 12 + (-44) = (-32) * 8 = -256 / 11111111111111111111111100000000
    // DOT => 253 + 605 = 858 * 8 = 6864
    // WGT => 253 + 605 = 858 * 8 = 6864
    
    // inputTest_0   = "b"+"00000000000000000000000000001001"  //  9
    // inputTest_1   = "b"+"11111111111111111111111111110011"  // -13
    // inputTest_2   = "b"+"11111111111111111111111111101101"  // -19
    // inputTest_3   = "b"+"11111111111111111111111111111101"  // -3
    // L2 => (+22)^2 + (-16)^2 = 484 + 256 = 740 * 8 = 5920
    // L1 => 144 + 1936 = 2080 * 8 = 16640
    // DOT => (-117) + 57 = -60 * 8 = -480 / 11111111111111111111111000100000
    // WGT => (-117) + 57 = -60 * 8 = -480 / 11111111111111111111111000100000


    // 0=L2 1=L1 2=DOT 3=WGT
    var test_op_type = 0.U(2.W)

    val test_INT32 = 1
    val test_FP32  = 0

    var inputTest_0 = test_int_0
    var inputTest_1 = test_int_1
    var inputTest_2 = test_int_2
    var inputTest_3 = test_int_3

    reset(1)

    poke(dut.io.use_int, true.B)
    poke(dut.io.rounding, "b111".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))
    poke(dut.io.op_type, test_op_type)


  if(test_INT32 == 1)
  {  
    println(" ----->  TEST for [ PE_CTRL_8IP_test -> INT ]")
    println(" ----->  [Run test] ...") 
    

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))  
  

    step(57)     // 52 or 57


    inputTest_0   = "b"+"00000000000000000000000000001001"  //  9
    inputTest_1   = "b"+"11111111111111111111111111110011"  // -13
    inputTest_2   = "b"+"11111111111111111111111111101101"  // -19
    inputTest_3   = "b"+"11111111111111111111111111111101"  // -3

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))
  }


  if(test_FP32 == 1)
  {  
    println(" ----->  TEST for [ PE_CTRL_8IP_test -> FP32 ]")
    println(" ----->  [Run test] ...") 

    inputTest_0 = test_fp_0
    inputTest_1 = test_fp_1
    inputTest_2 = test_fp_2
    inputTest_3 = test_fp_3

    poke(dut.io.use_int, false.B)
    poke(dut.io.rounding, "b100".U(3.W))
    poke(dut.io.tininess, "b1".U(1.W))
    poke(dut.io.op_type, test_op_type)

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W))  


    step(20)


    inputTest_0 = "b"+"01000001000100000000000000000000" //  9
    inputTest_1 = "b"+"11000001010100000000000000000000" // -13
    inputTest_2 = "b"+"11000001100110000000000000000000" // -19
    inputTest_3 = "b"+"11000000010000000000000000000000" // -3 

    poke(dut.io.Xi_0_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_0_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_0_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_0_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_1_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_1_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_1_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_1_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_2_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_2_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_2_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_2_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_3_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_3_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_3_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_3_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_4_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_4_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_4_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_4_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_5_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_5_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_5_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_5_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_6_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_6_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_6_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_6_in_1, inputTest_3.U(32.W))

    poke(dut.io.Xi_7_in_0, inputTest_0.U(32.W))
    poke(dut.io.Yi_7_in_0, inputTest_1.U(32.W))
    poke(dut.io.Xi_7_in_1, inputTest_2.U(32.W))
    poke(dut.io.Yi_7_in_1, inputTest_3.U(32.W)) 
  }

    step(20) 
    

}

/// ===================================================================
///  Manual test 
/// ===================================================================
class PE_CTRL_8IP_test_run_MANUAL extends ChiselFlatSpec with Matchers {
  val vcdName = "PE_CTRL_8IP_test_run_MANUAL"
  val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_MANUAL",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_manual (c)
    } should be (true)
  }
}

/// ===================================================================
///  INT tests 
/// ===================================================================
class PE_CTRL_8IP_test_run_INT_L2 extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_INT_L2"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_INT_L2" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT_L2",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_INT_L2 (c)
    } should be (true)
  }
}

class PE_CTRL_8IP_test_run_INT_L1 extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_INT_L1"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_INT_L1" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT_L1",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_INT_L1 (c)
    } should be (true)
  }
}


class PE_CTRL_8IP_test_run_INT_DOT extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_INT_DOT"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_INT_DOT" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT_DOT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_INT_DOT (c)
    } should be (true)
  }
}

class PE_CTRL_8IP_test_run_INT_WGT extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_INT_WGT"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_INT_WGT" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT_WGT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_INT_WGT (c)
    } should be (true)
  }
}

/// ===================================================================
///  FP tests 
/// ===================================================================
class PE_CTRL_8IP_test_run_FP_L2 extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_FP_L2"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_FP_L2" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_FP_L2",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_FP_L2 (c)
    } should be (true)
  }
}

class PE_CTRL_8IP_test_run_FP_L1 extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_FP_L1"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_FP_L1" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_FP_L1",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_FP_L1 (c)
    } should be (true)
  }
}

class PE_CTRL_8IP_test_run_FP_DOT extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_FP_DOT"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_FP_DOT" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_FP_DOT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_FP_DOT (c)
    } should be (true)
  }
}

class PE_CTRL_8IP_test_run_FP_WGT extends ChiselFlatSpec with Matchers {
    val vcdName = "PE_CTRL_8IP_test_run_FP_WGT"
    val targetDir = "diagram/" + vcdName

  "run PE_CTRL_8IP_test_FP_WGT" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_FP_WGT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new PE_CTRL_8IP ) { c =>
      new PE_CTRL_8IP_test_FP_WGT (c)
    } should be (true)
  }
}





  // "run PE_CTRL_8IP_test_FP_L2" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_FP_L2",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_FP_L2 (c)
  //   } should be (true)
  // }

  // "run PE_CTRL_8IP_test_FP_L1" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_FP_L1",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_FP_L1 (c)
  //   } should be (true)
  // }

  // "run PE_CTRL_8IP_test_FP_DOT" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_FP_DOT",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_FP_DOT (c)
  //   } should be (true)
  // }

  // "run PE_CTRL_8IP_test_FP_WGT" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_FP_WGT",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_FP_WGT (c)
  //   } should be (true)
  // }



 






  // "run PE_CTRL_8IP_test_INT_L2" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_INT_L2",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_INT_L2 (c)
  //   } should be (true)
  // }

  // "run PE_CTRL_8IP_test_INT_L1" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_INT_L1",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_INT_L1 (c)
  //   } should be (true)
  // }

  // "run PE_CTRL_8IP_test_INT_DOT" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_INT_DOT",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_INT_DOT (c)
  //   } should be (true)
  // }

  // "run PE_CTRL_8IP_test_INT_WGT" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_INT_WGT",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new PE_CTRL_8IP ) { c =>
  //     new PE_CTRL_8IP_test_INT_WGT (c)
  //   } should be (true)
  // }