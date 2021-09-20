package modules

import chisel3._
import utils._

class Mem1R1W() extends Module {
  val io = IO(new Bundle {
    val WR_FLAG      = Input(Bool())
    val RD_FLAG      = Input(Bool())
    val RD_ADDR      = Input(UInt(Config.MEM_ADDR_WIDTH.W))
    val RD_DATA      = Output(UInt(Config.WIDTH.W))
    val WR_DATA      = Input(UInt(Config.WIDTH.W))
    val WR_ADDR      = Input(UInt(Config.MEM_ADDR_WIDTH.W))
  })
  val mem = SyncReadMem(Config.MEM_INIT, UInt(Config.MEM_ADDR_WIDTH.W))

  val wrDataReg = RegNext(io.WR_DATA)
  val rdDataReg = mem.read(io.RD_ADDR)

  val doForwardReg = RegNext(io.WR_ADDR === io.RD_ADDR && io.WR_FLAG)

  when(io.WR_FLAG) {
    mem.write(io.WR_ADDR, io.WR_DATA)
  }

  when(io.RD_FLAG) {
    io.RD_DATA := mem.read(io.RD_ADDR)
  } otherwise
    {
      io.RD_DATA := rdDataReg
    }

  //printf("\n[DEBUG] readData : %d", io.RD_DATA)
  //printf("\n[DEBUG] writeData : %d", io.WR_DATA)
}

