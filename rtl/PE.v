module PE(
  input         clock,
  input         reset,
  input  [31:0] io_Xi_0,
  input  [31:0] io_Yi_0,
  input  [31:0] io_Xi_1,
  input  [31:0] io_Yi_1,
  input  [1:0]  io_m_0_sel,
  input  [1:0]  io_m_1_sel,
  input  [1:0]  io_m_2_sel,
  input  [1:0]  io_m_3_sel,
  input  [1:0]  io_m_4_sel,
  input  [1:0]  io_m_5_sel,
  input  [1:0]  io_m_6_sel,
  input  [1:0]  io_m_7_sel,
  input  [1:0]  io_m_8_sel,
  input  [1:0]  io_m_9_sel,
  input         io_addsub_0_op,
  input         io_addsub_1_op,
  input         io_use_int,
  input  [2:0]  io_round,
  output [31:0] io_addsub_0_out,
  output [31:0] io_addsub_1_out
);
  assign io_addsub_0_out = 32'h0;
  assign io_addsub_1_out = 32'h0;
endmodule
