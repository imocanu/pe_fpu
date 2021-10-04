module PE_CTRL(
  input        clock,
  input        reset,
  input  [1:0] io_op_type,
  input        io_use_int,
  output [1:0] io_m_0_sel,
  output [1:0] io_m_1_sel,
  output [1:0] io_m_2_sel,
  output [1:0] io_m_3_sel,
  output [1:0] io_m_4_sel,
  output [1:0] io_m_5_sel,
  output [1:0] io_m_6_sel,
  output [1:0] io_m_7_sel,
  output [1:0] io_m_8_sel,
  output [1:0] io_m_9_sel,
  output [1:0] io_addsub_0_op,
  output [1:0] io_addsub_1_op
);
  assign io_m_0_sel = 2'h0; // @[PE_CTRL.scala 48:14]
  assign io_m_1_sel = 2'h0; // @[PE_CTRL.scala 49:14]
  assign io_m_2_sel = 2'h0; // @[PE_CTRL.scala 50:14]
  assign io_m_3_sel = 2'h0; // @[PE_CTRL.scala 51:14]
  assign io_m_4_sel = 2'h0; // @[PE_CTRL.scala 52:14]
  assign io_m_5_sel = 2'h0; // @[PE_CTRL.scala 53:14]
  assign io_m_6_sel = 2'h0; // @[PE_CTRL.scala 54:14]
  assign io_m_7_sel = 2'h0; // @[PE_CTRL.scala 55:14]
  assign io_m_8_sel = 2'h0; // @[PE_CTRL.scala 56:14]
  assign io_m_9_sel = 2'h0; // @[PE_CTRL.scala 57:14]
  assign io_addsub_0_op = 2'h0; // @[PE_CTRL.scala 65:18]
  assign io_addsub_1_op = 2'h0; // @[PE_CTRL.scala 66:18]
endmodule
