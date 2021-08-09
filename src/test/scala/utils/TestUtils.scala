package utils

import scala.io.Source
import scala.collection.mutable.ArrayBuffer
import chisel3._
import chisel3.util.{is, switch}

object TestUtils {

    def round_near_even   = "b000".asUInt(3.W)
    def round_minMag      = "b001".asUInt(3.W)
    def round_min         = "b010".asUInt(3.W)
    def round_max         = "b011".asUInt(3.W)
    def round_near_maxMag = "b100".asUInt(3.W)
    def round_odd         = "b110".asUInt(3.W)

    var round_near_even_UINT   = "b000".asUInt(3.W)
    var round_minMag_UINT      = "b000".asUInt(3.W)
    var round_min_UINT         = "b000".asUInt(3.W)
    var round_max_UINT         = "b000".asUInt(3.W)
    var round_near_maxMag_UINT = "b000".asUInt(3.W)
    var round_odd_UINT         = "b000".asUInt(3.W)

    val rootDir = "python/gen/"
    val INPUT_1 = rootDir+"fpu32_generated_1.txt"
    val INPUT_2 = rootDir+"fpu32_generated_2.txt"
    val ADD_RESULT = rootDir+"fpu32_ADD_result.txt"
    val SUB_RESULT = rootDir+"fpu32_SUB_result.txt"
    val MUL_RESULT = rootDir+"fpu32_MUL_result.txt"

    val INT_INPUT_1 = rootDir+"int32_generated_1.txt"
    val INT_INPUT_2 = rootDir+"int32_generated_2.txt"
    val INT_ADD_RESULT = rootDir+"int32_ADD_result.txt"
    val INT_SUB_RESULT = rootDir+"int32_SUB_result.txt"
    val INT_MUL_RESULT = rootDir+"int32_MUL_result.txt"

    // PE use cases
    val PE_FP32_TEST_3_RESULT  = rootDir+"pe_out_test3_FP32_result.txt"
    val PE_INT_TEST_3_RESULT   = rootDir+"pe_out_test3_INT_result.txt"
    val PE_FP32_TEST_4_RESULT  = rootDir+"pe_out_test4_FP32_result.txt"
    val PE_POW_TEST_4_RESULT   = rootDir+"pe_out_test4_POW_result.txt"

    def getPath(){
        println("=> ROOT dir <==================")
        println(System.getProperty("user.dir"))
        println("===============================")
    }
    def read(dir: String) : ArrayBuffer[String] = {
        var result = ArrayBuffer[String]()
        for (line <- Source.fromFile(dir).getLines) 
        {
            result += line
        }
        //println(result)
        result
    }

    def readEmpty() : ArrayBuffer[String] = {
        var result = ArrayBuffer[String]()
        result += "00000000000000000000000000000000"
        result
    }

    def getRound(roundSel: UInt) : UInt = {
        def roundResult   = "b000".asUInt(3.W) 
        if(roundSel == TestUtils.round_near_even_UINT)
        {
            println(" ----->  round_near_even_UINT")
            TestUtils.round_near_even
        }
        else  if(roundSel == TestUtils.round_minMag_UINT)
        {
            println(" ----->  round_minMag_UINT")
            TestUtils.round_minMag
        } 
        else  if(roundSel == TestUtils.round_min_UINT)
        {
            println(" ----->  round_min_UINT")
            TestUtils.round_min
        } 
        else  if(roundSel == TestUtils.round_max_UINT)
        {
            println(" ----->  round_max_UINT")
            TestUtils.round_max
        } 
        else  if(roundSel == TestUtils.round_near_maxMag_UINT)
        {
            println(" ----->  round_near_maxMag")
            TestUtils.round_near_maxMag
        } 
        else if(roundSel == TestUtils.round_odd_UINT)
        {
            println(" ----->  round_odd_UINT")
            TestUtils.round_odd
        } 
        else
        {
            println(" ----->  round value is Invalid")
            println(" ----->  Default is : round_near_maxMag")
            TestUtils.round_near_maxMag
        } 
    }
}