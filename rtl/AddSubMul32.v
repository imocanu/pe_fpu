module AddSubMul32(
  input         clock,
  input         reset,
  input  [31:0] io_in0,
  input  [31:0] io_in1,
  output [32:0] io_outAdd,
  output [32:0] io_outSub,
  output [32:0] io_outMul
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] input_0; // @[AddSubMul32.scala 19:25]
  reg [31:0] input_1; // @[AddSubMul32.scala 20:25]
  wire [31:0] _io_outAdd_T_2 = $signed(input_0) + $signed(input_1); // @[AddSubMul32.scala 22:24]
  wire [31:0] _io_outSub_T_2 = $signed(input_0) - $signed(input_1); // @[AddSubMul32.scala 23:24]
  wire [63:0] _io_outMul_T = $signed(input_0) * $signed(input_1); // @[AddSubMul32.scala 24:24]
  assign io_outAdd = {{1{_io_outAdd_T_2[31]}},_io_outAdd_T_2}; // @[AddSubMul32.scala 22:24]
  assign io_outSub = {{1{_io_outSub_T_2[31]}},_io_outSub_T_2}; // @[AddSubMul32.scala 23:24]
  assign io_outMul = _io_outMul_T[32:0]; // @[AddSubMul32.scala 24:13]
  always @(posedge clock) begin
    input_0 <= io_in0; // @[AddSubMul32.scala 19:25]
    input_1 <= io_in1; // @[AddSubMul32.scala 20:25]
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
  input_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  input_1 = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
