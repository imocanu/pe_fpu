package modules

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

// FOR test :
// http://weitz.de/ieee/


class SUB_INTEGER_simple(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_output = TestUtils.read(TestUtils.INT_SUB_RESULT)

  println(" ----->  Operation is SUB ( INT )")
  
  poke(dut.io.op, true.B)
  poke(dut.io.useINT, true.B)

  var in1 = ""
  var in2 = ""
  var out = ""

  for (i <- 0 to input_1.size - 1) 
  {
    in1 = "b"+input_1(i)
    in2 = "b"+input_2(i)
    out = "b"+test_output(i)
    poke(dut.io.in1, in1.U)
    poke(dut.io.in2, in2.U)
    step(20)

    if(expect(dut.io.out, out.U))
    {
          println(" -> "+out.asInstanceOf[String]+" : PASS")
    }
    else
    {
          println(" ITER -> "+i)
          println(" IN_1 -> "+in1.asInstanceOf[String])
          println(" IN_2 -> "+in2.asInstanceOf[String])
          println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
          System.exit(0)
    } 
  }
}

class ADD_INTEGER_simple(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_output = TestUtils.read(TestUtils.INT_ADD_RESULT)

  println(" ----->  Operation is ADD ( INT )")
  
  poke(dut.io.op, false.B)
  poke(dut.io.useINT, true.B)

  var in1 = ""
  var in2 = ""
  var out = ""

  for (i <- 0 to input_1.size - 1) 
  {
    in1 = "b"+input_1(i)
    in2 = "b"+input_2(i)
    out = "b"+test_output(i)
    poke(dut.io.in1, in1.U)
    poke(dut.io.in2, in2.U)
    step(20)

    if(expect(dut.io.out, out.U))
    {
          println(" -> "+out.asInstanceOf[String]+" : PASS")
    }
    else
    {
          println(" ITER -> "+i)
          println(" IN_1 -> "+in1.asInstanceOf[String])
          println(" IN_2 -> "+in2.asInstanceOf[String])
          println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
          System.exit(0)
    } 
  }
}

class SUB_FP32_round_select(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INPUT_2)
  var test_output = TestUtils.read(TestUtils.SUB_RESULT)

  println(" ----->  Operation is SUB ( FP32 )")
  
  poke(dut.io.op, true.B)
  step(2)
  poke(dut.io.useINT, false.B)
  step(2)
  //poke(dut.io.round,TestUtils.getRound(roundSel))
  step(2)

  for (i <- 0 to input_1.size - 1) {
    val in1 = "b"+ input_1(i)
    val in2 = "b"+ input_2(i)
    val out = "b"+ test_output(i)
    // println(" -> "+in1.asInstanceOf[String])
    // println(" -> "+in2.asInstanceOf[String])
    poke(dut.io.in1, in1.U)
    poke(dut.io.in2, in2.U)
    step(5)
    //println(" -> "+out.asInstanceOf[String])
    expect(dut.io.out, out.U)
    step(5)
  }

  println(" ------------------------------------- ")
}

class ADD_FP32_round_select(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
  var input_1     = TestUtils.read(TestUtils.INPUT_1)
  var input_2     = TestUtils.read(TestUtils.INPUT_2)
  var test_output = TestUtils.read(TestUtils.ADD_RESULT)

  println(" ----->  Operation is ADD ( FP32 )")

  poke(dut.io.op, false.B)
  step(2)
  poke(dut.io.useINT, false.B)
  step(2)
  //poke(dut.io.round,TestUtils.getRound(roundSel))
  step(2)

  for (i <- 0 to input_1.size - 1) {
    val in1 = "b"+ input_1(i)
    val in2 = "b"+ input_2(i)
    val out = "b"+ test_output(i)
    // println(" -> "+in1.asInstanceOf[String])
    // println(" -> "+in2.asInstanceOf[String])
    poke(dut.io.in1, in1.U)
    poke(dut.io.in2, in2.U)
    step(5)
    //println(" -> "+out.asInstanceOf[String])
    expect(dut.io.out, out.U)
    step(5)
  }

  println(" ------------------------------------- ")
}

// class ADD_INTEGER_round_all(dut: AddSub) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var test_output = TestUtils.read(TestUtils.INT_ADD_RESULT)

//   println(" ----->  Operation is ADD ( INT ) ALL")
  
//   poke(dut.io.op, false.B)
//   step(2)
//   poke(dut.io.useINT, true.B)
//   step(2)

//   poke(dut.io.round,TestUtils.round_max)
//   step(2)
//   for (i <- 0 to input_1.size - 1) {
//     val in1 = input_1(i).toInt
//     val in2 = input_2(i).toInt
//     val out = "b"+ test_output(i)
//     poke(dut.io.in1, in1.S)
//     poke(dut.io.in2, in2.S)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" -------------------round_max------------------ ")

//   poke(dut.io.round,TestUtils.round_min)
//   step(2)
//   for (i <- 0 to input_1.size - 1) {
//     val in1 = input_1(i).toInt
//     val in2 = input_2(i).toInt
//     val out = "b"+ test_output(i)
//     poke(dut.io.in1, in1.S)
//     poke(dut.io.in2, in2.S)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" -------------------round_min------------------ ")

//   poke(dut.io.round,TestUtils.round_minMag)
//   step(2)
//   for (i <- 0 to input_1.size - 1) {
//     val in1 = input_1(i).toInt
//     val in2 = input_2(i).toInt
//     val out = "b"+ test_output(i)
//     poke(dut.io.in1, in1.S)
//     poke(dut.io.in2, in2.S)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" -------------------round_minMag------------------ ")

//   poke(dut.io.round,TestUtils.round_near_even)
//   step(2)
//   for (i <- 0 to input_1.size - 1) {
//     val in1 = input_1(i).toInt
//     val in2 = input_2(i).toInt
//     val out = "b"+ test_output(i)
//     poke(dut.io.in1, in1.S)
//     poke(dut.io.in2, in2.S)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" -------------------round_near_even------------------ ")

//   poke(dut.io.round,TestUtils.round_near_maxMag)
//   step(2)
//   for (i <- 0 to input_1.size - 1) {
//     val in1 = input_1(i).toInt
//     val in2 = input_2(i).toInt
//     val out = "b"+ test_output(i)
//     poke(dut.io.in1, in1.S)
//     poke(dut.io.in2, in2.S)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" -------------------round_near_maxMag------------------ ")

//   poke(dut.io.round,TestUtils.round_odd)
//   step(2)
//   for (i <- 0 to input_1.size - 1) {
//     val in1 = input_1(i).toInt
//     val in2 = input_2(i).toInt
//     val out = "b"+ test_output(i)
//     poke(dut.io.in1, in1.S)
//     poke(dut.io.in2, in2.S)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" -------------------round_add------------------ ")
// }


// class SUB_round_select(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
//   var input_1    = TestUtils.read(TestUtils.INPUT_1)
//   var input_2    = TestUtils.read(TestUtils.INPUT_2)
//   var add_output = TestUtils.read(TestUtils.SUB_RESULT)

//   println(" ----->  Operation is SUB")

//   poke(dut.io.op, true.B)
//   step(2)

//   if(roundSel == TestUtils.round_near_even_UINT)
//   {
//     println(" ----->  round_near_even_UINT")
//     poke(dut.io.round, TestUtils.round_near_even)
//   }
//   else  if(roundSel == TestUtils.round_minMag_UINT)
//   {
//     println(" ----->  round_minMag_UINT")
//     poke(dut.io.round, TestUtils.round_minMag)
//   } 
//   else  if(roundSel == TestUtils.round_min_UINT)
//   {
//     println(" ----->  round_min_UINT")
//     poke(dut.io.round, TestUtils.round_min)
//   } 
//   else  if(roundSel == TestUtils.round_max_UINT)
//   {
//     println(" ----->  round_max_UINT")
//     poke(dut.io.round, TestUtils.round_max)
//   } 
//   else  if(roundSel == TestUtils.round_near_maxMag_UINT)
//   {
//     println(" ----->  round_near_maxMag_UINT")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//   } 
//   else if(roundSel == TestUtils.round_odd_UINT)
//   {
//     println(" ----->  round_odd_UINT")
//     poke(dut.io.round, TestUtils.round_odd)
//   } 
//   else
//   {
//     println(" ----->  round value is Invalid")
//     println(" ----->  Default is : round_near_maxMag")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//   }  

//   step(2)

//   for (i <- 0 to input_1.size - 1) {
//     val in1 = "b"+ input_1(i)
//     val in2 = "b"+ input_2(i)
//     val out = "b"+ add_output(i)
//     poke(dut.io.in1, in1.U)
//     poke(dut.io.in2, in2.U)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" ------------------------------------- ")
// }

// class ADD_round_select(dut: AddSub, roundSel: UInt) extends PeekPokeTester(dut) {
//   var input_1    = TestUtils.read(TestUtils.INPUT_1)
//   var input_2    = TestUtils.read(TestUtils.INPUT_2)
//   var add_output = TestUtils.read(TestUtils.ADD_RESULT)

//   println(" ----->  Operation is ADD")
  
//   poke(dut.io.op, false.B)
//   step(2)
//   poke(dut.io.useINT, false.B)
//   step(2)

//   if(roundSel == TestUtils.round_near_even_UINT)
//   {
//     println(" ----->  round_near_even_UINT")
//     poke(dut.io.round, TestUtils.round_near_even)
//   }
//   else  if(roundSel == TestUtils.round_minMag_UINT)
//   {
//     println(" ----->  round_minMag_UINT")
//     poke(dut.io.round, TestUtils.round_minMag)
//   } 
//   else  if(roundSel == TestUtils.round_min_UINT)
//   {
//     println(" ----->  round_min_UINT")
//     poke(dut.io.round, TestUtils.round_min)
//   } 
//   else  if(roundSel == TestUtils.round_max_UINT)
//   {
//     println(" ----->  round_max_UINT")
//     poke(dut.io.round, TestUtils.round_max)
//   } 
//   else  if(roundSel == TestUtils.round_near_maxMag_UINT)
//   {
//     println(" ----->  round_near_maxMag_UINT")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//   } 
//   else if(roundSel == TestUtils.round_odd_UINT)
//   {
//     println(" ----->  round_odd_UINT")
//     poke(dut.io.round, TestUtils.round_odd)
//   } 
//   else
//   {
//     println(" ----->  round value is Invalid")
//     println(" ----->  Default is : round_near_maxMag")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//   }  

//   step(2)

//   for (i <- 0 to input_1.size - 1) {
//     val in1 = "b"+ input_1(i)
//     val in2 = "b"+ input_2(i)
//     val out = "b"+ add_output(i)
//     poke(dut.io.in1, in1.U)
//     poke(dut.io.in2, in2.U)
//     step(5)
//     //println(" -> "+out.asInstanceOf[String])
//     expect(dut.io.out, out.U)
//     step(5)
//   }
//   println(" ------------------------------------- ")
// }

class test_2(dut: AddSub) extends PeekPokeTester(dut) {
  // poke(dut.io.op, false.B)
  // step(5)
  // poke(dut.io.in1, "b01000010111101100000000000000000".asUInt(32.W)) 
  // poke(dut.io.in2, "b00111111100000000000000000000000".asUInt(32.W)) 
  // step(5)
  // expect(dut.io.out, "b01000010111110000000000000000000".U)
  // step(5)
  // poke(dut.io.op, true.B)
  // step(5)
  // poke(dut.io.in1, "b01000010111101100000000000000000".asUInt(32.W))
  // poke(dut.io.in2, "b00111111100000000000000000000000".asUInt(32.W)) 
  // step(5)
  // expect(dut.io.out, "b01000010111101000000000000000000".U)
  // step(5)

  step(5)
  poke(dut.io.useINT, true.B)
  step(5)
  poke(dut.io.op, false.B)
  step(5)
  poke(dut.io.in1, "b00010011000001011101010100100001".asUInt(32.W)) 
  poke(dut.io.in2, "b11111110100110111011111101100100".asUInt(32.W)) 
  step(5)
  expect(dut.io.out, "b00010001101000011001010010000101".U)
  step(5)
}

class AddSub_test_FULL extends ChiselFlatSpec with Matchers {
    val vcdName = "AddSub_test"
    val targetDir = "diagram/" + vcdName
    val unittestsDir = "diagram/unit_tests/test"
}

class AddSub_test extends ChiselFlatSpec with Matchers {
    val vcdName = "AddSub_test"
    val targetDir = "diagram/" + vcdName
    val unittestsDir = "diagram/unit_tests/test"

//   "run ADD_INTEGER_round_select" should "pass" in {
//   chisel3.iotesters.Driver.execute(Array(
//     "--fint-write-vcd",
//     "--backend-name", "firrtl",
//     "--target-dir", targetDir+"_ADD",
//     "--top-name" , vcdName,
//     "--output-file", vcdName),
//     () => new AddSub ) { c =>
//     new ADD_INTEGER_round_all (c)
//   } should be (true)
// }

//   "run test2" should "pass" in {
//   chisel3.iotesters.Driver.execute(Array(
//     "--fint-write-vcd",
//     "--backend-name", "firrtl",
//     "--target-dir", targetDir+"_ADD",
//     "--top-name" , vcdName,
//     "--output-file", vcdName),
//     () => new AddSub ) { c =>
//     new test_2 (c)
//   } should be (true)
// }








  // "run SUB_FP32_round_select" should "pass" in {
  // chisel3.iotesters.Driver.execute(Array(
  //   "--fint-write-vcd",
  //   "--backend-name", "firrtl",
  //   "--target-dir", targetDir+"_SUB_FP32",
  //   "--top-name" , vcdName,
  //   "--output-file", vcdName),
  //   () => new AddSub ) { c =>
  //   new SUB_FP32_round_select (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }


  // "run ADD_FP32_round_select" should "pass" in {
  // chisel3.iotesters.Driver.execute(Array(
  //   "--fint-write-vcd",
  //   "--backend-name", "firrtl",
  //   "--target-dir", targetDir+"_ADD_FP32",
  //   "--top-name" , vcdName,
  //   "--output-file", vcdName),
  //   () => new AddSub ) { c =>
  //   new ADD_FP32_round_select (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }

  "run ADD_INTEGER_simple" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_ADD_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new AddSub ) { c =>
      new ADD_INTEGER_simple (c, TestUtils.round_near_maxMag_UINT)
    } should be (true)
  }

  "run SUB_INTEGER_simple" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_SUB_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new AddSub ) { c =>
      new SUB_INTEGER_simple (c, TestUtils.round_near_maxMag_UINT)
    } should be (true)
  }

  //   "run SUB_INTEGER_round_select" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_SUB_INT",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new AddSub ) { c =>
  //     new SUB_INTEGER_round_select (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }








  // "run ADD_round_select" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--backend-name", "firrtl"
  //     ),
  //     () => new AddSub ) { c =>
  //     new ADD_round_select (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }

  // "run SUB_round_select" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--backend-name", "firrtl"
  //     ),
  //     () => new AddSub ) { c =>
  //     new SUB_round_select (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }




  // "run ADD_all_"+no+" ..." should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_ADD",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new AddSub ) { c =>
  //     new ADD_test (c)
  //   } should be (true)
  // }

  // "run SUB_all_"+no+" ..." should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_SUB",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new AddSub ) { c =>
  //     new SUB_test (c)
  //   } should be (true)
  // }

  // "run ADD_round_MAX_"+no+" ..." should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--backend-name", "firrtl"
  //     ),
  //     () => new AddSub ) { c =>
  //     new ADD_round_MAX (c)
  //   } should be (true)
  // }


  // "run ADD_round_MIN_"+no+" ..." should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--backend-name", "firrtl"
  //     ),
  //     () => new AddSub ) { c =>
  //     new ADD_round_MIN (c)
  //   } should be (true)
  // }
}
