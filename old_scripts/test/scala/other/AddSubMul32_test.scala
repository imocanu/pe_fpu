package other

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

// FOR test :
// http://weitz.de/ieee/


class ADDSUBMUL_INTEGER(dut: AddSubMul32) extends PeekPokeTester(dut) {
  var input_0     = TestUtils.read(TestUtils.INT_INPUT_1)
  var input_1     = TestUtils.read(TestUtils.INT_INPUT_2)
  var test_add    = TestUtils.read(TestUtils.INT_ADD_RESULT)
  var test_sub    = TestUtils.read(TestUtils.INT_SUB_RESULT)
  var test_mul    = TestUtils.read(TestUtils.INT_MUL_RESULT)

  println(" ----->  Operation is ADD/SUB/MUL ( INT )")

  var in0 = ""
  var in1 = ""
  var out_add = ""
  var out_sub = ""
  var out_mul = ""

  // for {
  //   in_test <- -32767.S(32.W) to -32050.S(32.W)
  // } {
  //   poke(dut.io.in0, in_test)
  //   poke(dut.io.in1, in_test)
  //   println(s"FOR in_test $in_test")
  //   step(10)
  //   //expect(dut.io.outAdd, in_test + in_test)
  //   //expect(dut.io.outSub, in_test - in_test)
  //   expect(dut.io.outMul, in_test * in_test)
  //   println(s"got add ${peek(dut.io.outAdd)} sub ${peek(dut.io.outSub)} mul ${peek(dut.io.outMul)}")
  // }

  // for {
  //   in_test <- 32750.S(32.W) to 32767.S(32.W)
  // } {
  //   poke(dut.io.in0, in_test)
  //   poke(dut.io.in1, in_test)
  //   println(s"FOR in_test $in_test")
  //   step(10)
  //   // expect(dut.io.outAdd, in_test + in_test)
  //   // expect(dut.io.outSub, in_test - in_test)
  //   expect(dut.io.outMul, in_test * in_test)
  //   println(s"got add ${peek(dut.io.outAdd)} sub ${peek(dut.io.outSub)} mul ${peek(dut.io.outMul)}")
  // }

    step(10)
    poke(dut.io.in0, "b00000000000000000101100000000010".U(32.W))  // // 22530
    poke(dut.io.in1, "b00000000000000000101100000000010".U(32.W))  // // 22530
    step(10)
    // expect(dut.io.outAdd, in_test + in_test)
    // expect(dut.io.outSub, in_test - in_test)
    if(expect(dut.io.outMul, "b00011110010000010110000000000100".U(33.W)))  // 507600900
    {
        println(" -> "+out_mul.asInstanceOf[String]+" : PASS")
        step(10)
    }

    step(10)
    poke(dut.io.in0, "b11111111111111111010011111111110".U(32.W))  // -22530
    poke(dut.io.in1, "b11111111111111111010011111111110".U(32.W))  // -22530
    step(10)
    // expect(dut.io.outAdd, in_test + in_test)
    // expect(dut.io.outSub, in_test - in_test)
    if(expect(dut.io.outMul, "b00011110010000010110000000000100".U(33.W)))  // 507600900
    {
        println(" -> "+out_mul.asInstanceOf[String]+" : PASS")
        step(10)
    }


    step(10)
    poke(dut.io.in0, "b11111111111111111100111000000101".U(32.W))   // -12795
    poke(dut.io.in1, "b00000000000000000101100000000010".U(32.W))   // 22530
    step(10)
    // expect(dut.io.outAdd, in_test + in_test)
    // expect(dut.io.outSub, in_test - in_test)

    if(expect(dut.io.outMul, "b11101110110100010101010000001010".U(32.W)))  // −288271350
    {
        println(" -> "+out_mul.asInstanceOf[String]+" : PASS")
        step(10)
    }


   println(" !!!!!!!!!!!!  Test GENERATED for ADD/SUB/MUL ( INT )") 

  for (i <- 0 to input_1.size - 1) 
  {
    in0 = "b"+ input_0(i)
    in1 = "b"+ input_1(i)
    out_add = "b"+test_add(i)
    out_sub = "b"+test_sub(i)
    out_mul = "b"+test_mul(i)

    step(10)

    poke(dut.io.in0, in0.U(32.W))
    poke(dut.io.in1, in1.U(32.W))
    println(s"FOR in_0 $in0 & in_1 $in1")
    //println(s"EXPECT add $out_add sub $out_sub mul $out_mul")
    
    step(10)
    expect(dut.io.outAdd, out_add.U(32.W))
    expect(dut.io.outSub, out_sub.U(32.W))
    if(expect(dut.io.outMul, out_mul.U(32.W)))
    {
        println(" -> "+out_mul.asInstanceOf[String]+" : PASS")
        step(10)
    }
    else
    {
        println(" ITER -> "+i)
        println(" IN_0 -> "+in0.asInstanceOf[String])
        println(" IN_1 -> "+in1.asInstanceOf[String])
        println(" REZ ADD -> "+out_mul.asInstanceOf[String]+" : TEST FAIL")
        System.exit(0)
    }
  }
}


class AddSubMul32_test extends ChiselFlatSpec with Matchers {
    val vcdName = "AddSubMul32_test"
    val targetDir = "diagram/" + vcdName


  "run ADDSUBMUL_INTEGER" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_INT",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new AddSubMul32 ) { c =>
      new ADDSUBMUL_INTEGER (c)
    } should be (true)
  }
}
