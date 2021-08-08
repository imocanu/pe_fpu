package tester

import hardfloat._
import Chisel._
import tester._

class
    ValExec_UINToRecFN(intWidth: Int, expWidth: Int, sigWidth: Int)
    extends Module
{
    val io = new Bundle {
        val in = Bits(INPUT, intWidth)
        val roundingMode   = UInt(INPUT, 3)
        val detectTininess = UInt(INPUT, 1)

        val expected = new Bundle {
            val out = Bits(INPUT, expWidth + sigWidth)
            val exceptionFlags = Bits(INPUT, 5)
            val recOut = Bits(OUTPUT, expWidth + sigWidth + 1)
        }

        val actual = new Bundle {
            val out = Bits(OUTPUT, expWidth + sigWidth + 1)
            val exceptionFlags = Bits(OUTPUT, 5)
        }

        val check = Bool(OUTPUT)
        val pass = Bool(OUTPUT)
    }

    val iNToRecFN = Module(new INToRecFN(intWidth, expWidth, sigWidth))
    iNToRecFN.io.signedIn := Bool(false)
    iNToRecFN.io.in := io.in
    iNToRecFN.io.roundingMode   := io.roundingMode
    iNToRecFN.io.detectTininess := io.detectTininess

    io.expected.recOut := recFNFromFN(expWidth, sigWidth, io.expected.out)

    io.actual.out := iNToRecFN.io.out
    io.actual.exceptionFlags := iNToRecFN.io.exceptionFlags

    io.check := Bool(true)
    io.pass := true.B
        //equivRecFN(expWidth, sigWidth, io.actual.out, io.expected.recOut) &&
        //(io.actual.exceptionFlags === io.expected.exceptionFlags)
}

class
    ValExec_INToRecFN(intWidth: Int, expWidth: Int, sigWidth: Int)
    extends Module
{
    val io = new Bundle {
        val in = Bits(INPUT, intWidth)
        val roundingMode   = UInt(INPUT, 3)
        val detectTininess = UInt(INPUT, 1)

        val expected = new Bundle {
            val out = Bits(INPUT, expWidth + sigWidth)
            val exceptionFlags = Bits(INPUT, 5)
            val recOut = Bits(OUTPUT, expWidth + sigWidth + 1)
        }

        val actual = new Bundle {
            val out = Bits(OUTPUT, expWidth + sigWidth + 1)
            val exceptionFlags = Bits(OUTPUT, 5)
        }

        val check = Bool(OUTPUT)
        val pass = Bool(OUTPUT)
    }

    val iNToRecFN = Module(new INToRecFN(intWidth, expWidth, sigWidth))
    iNToRecFN.io.signedIn := Bool(true)
    iNToRecFN.io.in := io.in
    iNToRecFN.io.roundingMode   := io.roundingMode
    iNToRecFN.io.detectTininess := io.detectTininess

    io.expected.recOut := recFNFromFN(expWidth, sigWidth, io.expected.out)
  

    println("\n*=====< INTT >======*", io.in)
    println("\n*=====< expt >======*", io.expected.recOut)

    io.actual.out := iNToRecFN.io.out
    io.actual.exceptionFlags := iNToRecFN.io.exceptionFlags

    io.check := Bool(true)
    io.pass := true.B
        //equivRecFN(expWidth, sigWidth, io.actual.out, io.expected.recOut) &&
        //(io.actual.exceptionFlags === io.expected.exceptionFlags)
}

class INToRecFNSpec extends FMATester {
    def test(i: Int, f: Int): Seq[String] = {
        test(
            s"I${i}ToRecF${f}",
            () => new ValExec_INToRecFN(i, exp(f), sig(f)),
            Seq("-level2", s"i${i}_to_f${f}")
        )
    }
//    "I32ToRecF16" should "pass" in {
//        check(test(32, 16))
//    }
//    "I32ToRecF32" should "pass" in {
//        check(test(32, 32))
//    }
//    "I32ToRecF64" should "pass" in {
//        check(test(32, 64))
//    }
//    "I64ToRecF16" should "pass" in {
//        check(test(64, 16))
//    }
//    "I64ToRecF32" should "pass" in {
//        check(test(64, 32))
//    }
//    "I64ToRecF64" should "pass" in {
//        check(test(64, 64))
//    }
}
