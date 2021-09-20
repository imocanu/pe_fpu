module MuxPE(
  input         clock,
  input         reset,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [31:0] io_in_2,
  input  [31:0] io_in_3,
  input  [1:0]  io_sel,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] sel; // @[MuxPE.scala 20:21]
  reg [31:0] in_0; // @[MuxPE.scala 21:21]
  reg [31:0] in_1; // @[MuxPE.scala 22:21]
  reg [31:0] in_2; // @[MuxPE.scala 23:21]
  reg [31:0] in_3; // @[MuxPE.scala 24:21]
  wire  _T = sel == 2'h0; // @[MuxPE.scala 26:14]
  wire  _T_1 = sel == 2'h1; // @[MuxPE.scala 30:20]
  wire  _T_2 = sel == 2'h2; // @[MuxPE.scala 34:20]
  wire [31:0] _GEN_0 = _T_2 ? in_2 : in_3; // @[MuxPE.scala 35:3 36:12 40:12]
  wire [31:0] _GEN_1 = _T_1 ? in_1 : _GEN_0; // @[MuxPE.scala 31:3 32:12]
  assign io_out = _T ? in_0 : _GEN_1; // @[MuxPE.scala 27:3 28:12]
  always @(posedge clock) begin
    sel <= io_sel; // @[MuxPE.scala 20:21]
    in_0 <= io_in_0; // @[MuxPE.scala 21:21]
    in_1 <= io_in_1; // @[MuxPE.scala 22:21]
    in_2 <= io_in_2; // @[MuxPE.scala 23:21]
    in_3 <= io_in_3; // @[MuxPE.scala 24:21]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sel = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  in_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  in_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  in_3 = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
