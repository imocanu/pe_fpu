package modules

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils
import scala.collection._
import scala.util._
import hardfloat._
import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils


class AddSubPE_test_manual(dut: AddSubPE) extends PeekPokeTester(dut) {

  println(" ----->  TEST with [ INT ]")
  println(" ----->  [Run test] : ") 
  var test_in_0 = ""
  var test_in_1 = ""
  var test_out  = ""

}


class AddSubPE_test extends ChiselFlatSpec with Matchers {
    val vcdName = "AddSubPE_test"
    val targetDir = "diagram/" + vcdName


    "run AddSubPE_test_manual" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
      "--fint-write-vcd",
      "--backend-name", "firrtl",
      "--target-dir", targetDir+"_SIMPLE",
      "--top-name" , vcdName,
      "--output-file", vcdName),
      () => new AddSubPE ) { c =>
      new AddSubPE_test_manual (c)
    } should be (true)
  }

}


