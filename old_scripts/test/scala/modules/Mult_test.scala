package modules

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.Matchers
import scala.io.Source
import utils.TestUtils

class MUL_INTEGER_simple(dut: Mult) extends PeekPokeTester(dut) {
    var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
    var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
    var test_output = TestUtils.read(TestUtils.INT_MUL_RESULT)

    var in1 = ""
    var in2 = ""
    var out = ""

    println(" ----->  Operation is MUL ( INT )")

    poke(dut.io.useINT, true.B)
    step(10)
    poke(dut.io.round, "b111".U(3.W))
    step(10)

    for (i <- 0 to input_1.size - 1) 
    {
        in1 = "b"+input_1(i)
        in2 = "b"+input_2(i)
        out = "b"+test_output(i)
        poke(dut.io.in0, in1.U(33.W))
        poke(dut.io.in1, in2.U(33.W))
        step(10)

        if(expect(dut.io.out, out.U(33.W)))
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

class MUL_FP32_simple(dut: Mult) extends PeekPokeTester(dut) {
    var input_1     = TestUtils.read(TestUtils.INPUT_1)
    var input_2     = TestUtils.read(TestUtils.INPUT_2)
    var test_output = TestUtils.read(TestUtils.MUL_RESULT)

    val in1 = ""
    val in2 = ""
    val out = ""

    println(" ----->  Operation is MUL ( FP32 )")

    poke(dut.io.useINT, false.B)
    poke(dut.io.round, "b100".U(3.W))

    for (i <- 0 to input_1.size - 1) 
    {
        val in1 = "b"+ input_1(i)
        val in2 = "b"+ input_2(i)
        val out = "b"+ test_output(i)
        poke(dut.io.in0, in1.U(32.W))
        poke(dut.io.in1, in2.U(32.W))
        step(5)
        expect(dut.io.out, out.U(33.W))
    }
}

// class Mult_test_1(dut: Mult) extends PeekPokeTester(dut) {

//   step(5)
//   //poke(dut.io.round, "b111".U(3.W))
//   step(5)
//   poke(dut.io.useINT, true.B)
//   step(5)
//   poke(dut.io.in1, 17210.S(32.W))
//   step(5)
//   poke(dut.io.in2, 19732.S(32.W))
//   step(10)
//   println(s"[DEBUG] out ${peek(dut.io.out)}")
//   expect(dut.io.out, 339587720.S(32.W))
//   step(5)
// }

// class MUL_round_all(dut: Mult, roundSel: UInt) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var test_output = TestUtils.read(TestUtils.INT_MUL_RESULT)

//   println(" ----->  Operation is MUL - ROUND ALL ( INT )")

//   poke(dut.io.useINT, true.B)
  
//   var in1 = ""
//   var in2 = ""
//   var out = ""

//   for (i <- 0 to input_1.size - 1) 
//   {
//     println(" #######  [ITERATION] > "+i+" < ##########")
//     in1 = "b"+input_1(i)
//     in2 = "b"+input_2(i)
//     out = "b"+test_output(i)
//     poke(dut.io.in1, in1.U)
//     poke(dut.io.in2, in2.U)

//     println(" ----->  round_near_even")
//     poke(dut.io.round, TestUtils.round_near_even)
//     step(20)
//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           // println(" ITER -> "+i)
//           // println(" IN_1 -> "+in1.asInstanceOf[String])
//           // println(" IN_2 -> "+in2.asInstanceOf[String])
//           // println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     }

//     println(" ----->  round_minMag")
//     poke(dut.io.round, TestUtils.round_minMag)
//     step(20)
//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           // println(" ITER -> "+i)
//           // println(" IN_1 -> "+in1.asInstanceOf[String])
//           // println(" IN_2 -> "+in2.asInstanceOf[String])
//           // println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     }

//     println(" ----->  round_min")
//     poke(dut.io.round, TestUtils.round_min)
//     step(20)
//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           // println(" ITER -> "+i)
//           // println(" IN_1 -> "+in1.asInstanceOf[String])
//           // println(" IN_2 -> "+in2.asInstanceOf[String])
//           // println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     }

//     println(" ----->  round_max")
//     poke(dut.io.round, TestUtils.round_max)
//     step(20)
//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           // println(" ITER -> "+i)
//           // println(" IN_1 -> "+in1.asInstanceOf[String])
//           // println(" IN_2 -> "+in2.asInstanceOf[String])
//           // println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     }

//     println(" ----->  round_near_maxMag")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//     step(20)
//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           // println(" ITER -> "+i)
//           // println(" IN_1 -> "+in1.asInstanceOf[String])
//           // println(" IN_2 -> "+in2.asInstanceOf[String])
//           // println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     }

//     println(" ----->  round_odd")
//     poke(dut.io.round, TestUtils.round_odd)
//     step(20)
//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           // println(" ITER -> "+i)
//           // println(" IN_1 -> "+in1.asInstanceOf[String])
//           // println(" IN_2 -> "+in2.asInstanceOf[String])
//           // println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     }
//   }
// }

// class MUL_round_select(dut: Mult, roundSel: UInt) extends PeekPokeTester(dut) {
//   var input_1     = TestUtils.read(TestUtils.INT_INPUT_1)
//   var input_2     = TestUtils.read(TestUtils.INT_INPUT_2)
//   var test_output = TestUtils.read(TestUtils.INT_MUL_RESULT)
  
//   println(" ----->  Operation is MUL ( INT )")

//   poke(dut.io.useINT, true.B)
  
//   var in1 = ""
//   var in2 = ""
//   var out = ""

//   if(roundSel == TestUtils.round_near_even_UINT)
//   {
//     println(" ----->  round_near_even")
//     poke(dut.io.round, TestUtils.round_near_even)
//   }
//   else  if(roundSel == TestUtils.round_minMag_UINT)
//   {
//     println(" ----->  round_minMag")
//     poke(dut.io.round, TestUtils.round_minMag)
//   } 
//   else  if(roundSel == TestUtils.round_min_UINT)
//   {
//     println(" ----->  round_min")
//     poke(dut.io.round, TestUtils.round_min)
//   } 
//   else  if(roundSel == TestUtils.round_max_UINT)
//   {
//     println(" ----->  round_max")
//     poke(dut.io.round, TestUtils.round_max)
//   } 
//   else  if(roundSel == TestUtils.round_near_maxMag_UINT)
//   {
//     println(" ----->  round_near_maxMag")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//   } 
//   else if(roundSel == TestUtils.round_odd_UINT)
//   {
//     println(" ----->  round_odd")
//     poke(dut.io.round, TestUtils.round_odd)
//   } 
//   else
//   {
//     println(" ----->  round value is Invalid")
//     println(" ----->  Default is : round_near_maxMag")
//     poke(dut.io.round, TestUtils.round_near_maxMag)
//   }  

//   for (i <- 0 to input_1.size - 1) 
//   {
//     in1 = "b"+input_1(i)
//     in2 = "b"+input_2(i)
//     out = "b"+test_output(i)
//     poke(dut.io.in1, in1.U)
//     poke(dut.io.in2, in2.U)
    
//     step(20)

//     if(expect(dut.io.out, out.U))
//     {
//           println(" -> "+out.asInstanceOf[String]+" : PASS")
//     }
//     else
//     {
//           println(" ITER -> "+i)
//           println(" IN_1 -> "+in1.asInstanceOf[String])
//           println(" IN_2 -> "+in2.asInstanceOf[String])
//           println(" REZ  -> "+out.asInstanceOf[String]+" : TEST FAIL")
//           //System.exit(0)
//     } 
//   }
// }



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





  //  "run MUL_round_all" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_INT_ALL_ROUND"
  //     ),
  //     () => new Mult ) { c =>
  //     new MUL_round_all (c, TestUtils.round_near_maxMag_UINT)
  //   } should be (true)
  // }

//      "run TEST_1" should "pass" in {
//     chisel3.iotesters.Driver.execute(Array(
//       "--backend-name", "firrtl",
//       "--target-dir", targetDir+"_INT"
//       ),
//       () => new Mult ) { c =>
//       new Mult_test_1 (c)
//     } should be (true)
//   }





  // "run MUL_FP32_simple" should "pass" in {
  //   chisel3.iotesters.Driver.execute(Array(
  //     "--fint-write-vcd",
  //     "--backend-name", "firrtl",
  //     "--target-dir", targetDir+"_MULT_FP32",
  //     "--top-name" , vcdName,
  //     "--output-file", vcdName),
  //     () => new Mult ) { c =>
  //     new MUL_FP32_simple (c)
  //   } should be (true)
  // }

  "run MUL_INTEGER_simple" should "pass" in {
    chisel3.iotesters.Driver.execute(Array(
    "--backend-name", "firrtl",
    "--target-dir", targetDir+"_MULT_INT"
    ),
    () => new Mult ) { c =>
    new MUL_INTEGER_simple (c)
    } should be (true)
  }
}
