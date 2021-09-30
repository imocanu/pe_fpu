module MuxPE(
  input         clock,
  input         reset,
  input  [1:0]  io_sel,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [31:0] io_in_2,
  input  [31:0] io_in_3,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] in_0; // @[MuxPE.scala 21:21]
  reg [31:0] in_1; // @[MuxPE.scala 22:21]
  reg [31:0] in_2; // @[MuxPE.scala 23:21]
  reg [31:0] in_3; // @[MuxPE.scala 24:21]
  reg [31:0] out; // @[MuxPE.scala 25:21]
  wire  _T = io_sel == 2'h0; // @[MuxPE.scala 27:17]
  wire  _T_1 = io_sel == 2'h1; // @[MuxPE.scala 31:23]
  wire  _T_2 = io_sel == 2'h2; // @[MuxPE.scala 35:23]
  assign io_out = out; // @[MuxPE.scala 44:10]
  always @(posedge clock) begin
    in_0 <= io_in_0; // @[MuxPE.scala 21:21]
    in_1 <= io_in_1; // @[MuxPE.scala 22:21]
    in_2 <= io_in_2; // @[MuxPE.scala 23:21]
    in_3 <= io_in_3; // @[MuxPE.scala 24:21]
    if (reset) begin // @[MuxPE.scala 25:21]
      out <= 32'h0; // @[MuxPE.scala 25:21]
    end else if (_T) begin // @[MuxPE.scala 28:3]
      out <= in_0; // @[MuxPE.scala 29:9]
    end else if (_T_1) begin // @[MuxPE.scala 32:3]
      out <= in_1; // @[MuxPE.scala 33:9]
    end else if (_T_2) begin // @[MuxPE.scala 36:3]
      out <= in_2; // @[MuxPE.scala 37:9]
    end else begin
      out <= in_3; // @[MuxPE.scala 41:9]
    end
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
  in_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  in_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  in_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  in_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  out = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
