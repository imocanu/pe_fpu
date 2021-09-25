module MuxPE(
  input         clock,
  input         reset,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [1:0]  io_sel,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] in_0; // @[MuxPE.scala 21:21]
  reg [31:0] in_1; // @[MuxPE.scala 22:21]
  reg [31:0] out; // @[MuxPE.scala 25:21]
  wire  _T = io_sel == 2'h0; // @[MuxPE.scala 27:17]
  wire  _T_1 = io_sel == 2'h1; // @[MuxPE.scala 31:23]
  assign io_out = out; // @[MuxPE.scala 44:10]
  always @(posedge clock) begin
    in_0 <= io_in_0; // @[MuxPE.scala 21:21]
    in_1 <= io_in_1; // @[MuxPE.scala 22:21]
    if (reset) begin // @[MuxPE.scala 25:21]
      out <= 32'h0; // @[MuxPE.scala 25:21]
    end else if (_T) begin // @[MuxPE.scala 28:3]
      out <= in_0; // @[MuxPE.scala 29:9]
    end else if (_T_1) begin // @[MuxPE.scala 32:3]
      out <= in_1; // @[MuxPE.scala 33:9]
    end else begin
      out <= 32'h0;
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
  out = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultPE(
  input         clock,
  input         reset,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [32:0] module_out; // @[MultPE.scala 27:27]
  reg [31:0] sign_in_0; // @[MultPE.scala 31:29]
  reg [31:0] sign_in_1; // @[MultPE.scala 32:29]
  wire [63:0] _module_out_T_1 = $signed(sign_in_0) * $signed(sign_in_1); // @[MultPE.scala 35:49]
  wire [63:0] _GEN_10 = reset ? 64'h0 : _module_out_T_1; // @[MultPE.scala 27:{27,27}]
  assign io_out = module_out[31:0];
  always @(posedge clock) begin
    module_out <= _GEN_10[32:0]; // @[MultPE.scala 27:{27,27}]
    sign_in_0 <= io_in_0; // @[MultPE.scala 31:44]
    sign_in_1 <= io_in_1; // @[MultPE.scala 32:44]
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
  _RAND_0 = {2{`RANDOM}};
  module_out = _RAND_0[32:0];
  _RAND_1 = {1{`RANDOM}};
  sign_in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  sign_in_1 = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddSubPE(
  input         clock,
  input         reset,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [32:0] module_out; // @[AddSubPE.scala 30:27]
  reg [31:0] sign_in_0; // @[AddSubPE.scala 34:29]
  reg [31:0] sign_in_1; // @[AddSubPE.scala 35:29]
  wire [31:0] _module_out_T_7 = $signed(sign_in_0) + $signed(sign_in_1); // @[AddSubPE.scala 41:51]
  wire [32:0] _GEN_1 = {{1'd0}, _module_out_T_7}; // @[AddSubPE.scala 32:16 64:16]
  assign io_out = module_out[31:0];
  always @(posedge clock) begin
    if (reset) begin // @[AddSubPE.scala 30:27]
      module_out <= 33'h0; // @[AddSubPE.scala 30:27]
    end else begin
      module_out <= _GEN_1;
    end
    sign_in_0 <= io_in_0; // @[AddSubPE.scala 34:44]
    sign_in_1 <= io_in_1; // @[AddSubPE.scala 35:44]
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
  _RAND_0 = {2{`RANDOM}};
  module_out = _RAND_0[32:0];
  _RAND_1 = {1{`RANDOM}};
  sign_in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  sign_in_1 = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  input  [1:0]  io_m_5_sel,
  input  [1:0]  io_m_6_sel,
  input  [1:0]  io_m_7_sel,
  input  [1:0]  io_m_8_sel,
  input  [1:0]  io_m_9_sel,
  output [32:0] io_out_0,
  output [32:0] io_out_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
`endif // RANDOMIZE_REG_INIT
  wire  m_0_clock; // @[PE.scala 108:19]
  wire  m_0_reset; // @[PE.scala 108:19]
  wire [31:0] m_0_io_in_0; // @[PE.scala 108:19]
  wire [31:0] m_0_io_in_1; // @[PE.scala 108:19]
  wire [1:0] m_0_io_sel; // @[PE.scala 108:19]
  wire [31:0] m_0_io_out; // @[PE.scala 108:19]
  wire  m_1_clock; // @[PE.scala 109:19]
  wire  m_1_reset; // @[PE.scala 109:19]
  wire [31:0] m_1_io_in_0; // @[PE.scala 109:19]
  wire [31:0] m_1_io_in_1; // @[PE.scala 109:19]
  wire [1:0] m_1_io_sel; // @[PE.scala 109:19]
  wire [31:0] m_1_io_out; // @[PE.scala 109:19]
  wire  m_2_clock; // @[PE.scala 110:19]
  wire  m_2_reset; // @[PE.scala 110:19]
  wire [31:0] m_2_io_in_0; // @[PE.scala 110:19]
  wire [31:0] m_2_io_in_1; // @[PE.scala 110:19]
  wire [1:0] m_2_io_sel; // @[PE.scala 110:19]
  wire [31:0] m_2_io_out; // @[PE.scala 110:19]
  wire  m_3_clock; // @[PE.scala 111:19]
  wire  m_3_reset; // @[PE.scala 111:19]
  wire [31:0] m_3_io_in_0; // @[PE.scala 111:19]
  wire [31:0] m_3_io_in_1; // @[PE.scala 111:19]
  wire [1:0] m_3_io_sel; // @[PE.scala 111:19]
  wire [31:0] m_3_io_out; // @[PE.scala 111:19]
  wire  m_4_clock; // @[PE.scala 112:19]
  wire  m_4_reset; // @[PE.scala 112:19]
  wire [31:0] m_4_io_in_0; // @[PE.scala 112:19]
  wire [31:0] m_4_io_in_1; // @[PE.scala 112:19]
  wire [1:0] m_4_io_sel; // @[PE.scala 112:19]
  wire [31:0] m_4_io_out; // @[PE.scala 112:19]
  wire  m_5_clock; // @[PE.scala 113:19]
  wire  m_5_reset; // @[PE.scala 113:19]
  wire [31:0] m_5_io_in_0; // @[PE.scala 113:19]
  wire [31:0] m_5_io_in_1; // @[PE.scala 113:19]
  wire [1:0] m_5_io_sel; // @[PE.scala 113:19]
  wire [31:0] m_5_io_out; // @[PE.scala 113:19]
  wire  m_6_clock; // @[PE.scala 114:19]
  wire  m_6_reset; // @[PE.scala 114:19]
  wire [31:0] m_6_io_in_0; // @[PE.scala 114:19]
  wire [31:0] m_6_io_in_1; // @[PE.scala 114:19]
  wire [1:0] m_6_io_sel; // @[PE.scala 114:19]
  wire [31:0] m_6_io_out; // @[PE.scala 114:19]
  wire  m_7_clock; // @[PE.scala 115:19]
  wire  m_7_reset; // @[PE.scala 115:19]
  wire [31:0] m_7_io_in_0; // @[PE.scala 115:19]
  wire [31:0] m_7_io_in_1; // @[PE.scala 115:19]
  wire [1:0] m_7_io_sel; // @[PE.scala 115:19]
  wire [31:0] m_7_io_out; // @[PE.scala 115:19]
  wire  m_8_clock; // @[PE.scala 116:19]
  wire  m_8_reset; // @[PE.scala 116:19]
  wire [31:0] m_8_io_in_0; // @[PE.scala 116:19]
  wire [31:0] m_8_io_in_1; // @[PE.scala 116:19]
  wire [1:0] m_8_io_sel; // @[PE.scala 116:19]
  wire [31:0] m_8_io_out; // @[PE.scala 116:19]
  wire  m_9_clock; // @[PE.scala 117:19]
  wire  m_9_reset; // @[PE.scala 117:19]
  wire [31:0] m_9_io_in_0; // @[PE.scala 117:19]
  wire [31:0] m_9_io_in_1; // @[PE.scala 117:19]
  wire [1:0] m_9_io_sel; // @[PE.scala 117:19]
  wire [31:0] m_9_io_out; // @[PE.scala 117:19]
  wire  multModule_0_clock; // @[PE.scala 119:28]
  wire  multModule_0_reset; // @[PE.scala 119:28]
  wire [31:0] multModule_0_io_in_0; // @[PE.scala 119:28]
  wire [31:0] multModule_0_io_in_1; // @[PE.scala 119:28]
  wire [31:0] multModule_0_io_out; // @[PE.scala 119:28]
  wire  multModule_1_clock; // @[PE.scala 120:28]
  wire  multModule_1_reset; // @[PE.scala 120:28]
  wire [31:0] multModule_1_io_in_0; // @[PE.scala 120:28]
  wire [31:0] multModule_1_io_in_1; // @[PE.scala 120:28]
  wire [31:0] multModule_1_io_out; // @[PE.scala 120:28]
  wire  addsubModule_0_clock; // @[PE.scala 122:30]
  wire  addsubModule_0_reset; // @[PE.scala 122:30]
  wire [31:0] addsubModule_0_io_in_0; // @[PE.scala 122:30]
  wire [31:0] addsubModule_0_io_in_1; // @[PE.scala 122:30]
  wire [31:0] addsubModule_0_io_out; // @[PE.scala 122:30]
  wire  addsubModule_1_clock; // @[PE.scala 123:30]
  wire  addsubModule_1_reset; // @[PE.scala 123:30]
  wire [31:0] addsubModule_1_io_in_0; // @[PE.scala 123:30]
  wire [31:0] addsubModule_1_io_in_1; // @[PE.scala 123:30]
  wire [31:0] addsubModule_1_io_out; // @[PE.scala 123:30]
  reg [31:0] Xi_0; // @[PE.scala 47:22]
  reg [31:0] Yi_0; // @[PE.scala 48:22]
  reg [31:0] Xi_1; // @[PE.scala 50:22]
  reg [31:0] Yi_1; // @[PE.scala 51:22]
  reg [1:0] m_0_sel; // @[PE.scala 65:25]
  reg [1:0] m_1_sel; // @[PE.scala 66:25]
  reg [1:0] m_2_sel; // @[PE.scala 67:25]
  reg [1:0] m_3_sel; // @[PE.scala 68:25]
  reg [1:0] m_5_sel; // @[PE.scala 70:25]
  reg [1:0] m_6_sel; // @[PE.scala 71:25]
  reg [1:0] m_7_sel; // @[PE.scala 72:25]
  reg [1:0] m_8_sel; // @[PE.scala 73:25]
  reg [1:0] m_9_sel; // @[PE.scala 74:25]
  reg [32:0] addsubModule_0_out; // @[PE.scala 89:36]
  reg [32:0] addsubModule_1_out; // @[PE.scala 90:36]
  reg [32:0] multModule_0_out; // @[PE.scala 91:36]
  reg [32:0] multModule_1_out; // @[PE.scala 92:36]
  reg [32:0] m_0_out; // @[PE.scala 94:24]
  reg [32:0] m_1_out; // @[PE.scala 95:24]
  reg [32:0] m_2_out; // @[PE.scala 96:24]
  reg [32:0] m_3_out; // @[PE.scala 97:24]
  reg [32:0] m_4_out; // @[PE.scala 98:24]
  reg [32:0] m_5_out; // @[PE.scala 99:24]
  reg [32:0] m_6_out; // @[PE.scala 100:24]
  reg [32:0] m_7_out; // @[PE.scala 101:24]
  reg [32:0] m_8_out; // @[PE.scala 102:24]
  reg [32:0] m_9_out; // @[PE.scala 103:24]
  MuxPE m_0 ( // @[PE.scala 108:19]
    .clock(m_0_clock),
    .reset(m_0_reset),
    .io_in_0(m_0_io_in_0),
    .io_in_1(m_0_io_in_1),
    .io_sel(m_0_io_sel),
    .io_out(m_0_io_out)
  );
  MuxPE m_1 ( // @[PE.scala 109:19]
    .clock(m_1_clock),
    .reset(m_1_reset),
    .io_in_0(m_1_io_in_0),
    .io_in_1(m_1_io_in_1),
    .io_sel(m_1_io_sel),
    .io_out(m_1_io_out)
  );
  MuxPE m_2 ( // @[PE.scala 110:19]
    .clock(m_2_clock),
    .reset(m_2_reset),
    .io_in_0(m_2_io_in_0),
    .io_in_1(m_2_io_in_1),
    .io_sel(m_2_io_sel),
    .io_out(m_2_io_out)
  );
  MuxPE m_3 ( // @[PE.scala 111:19]
    .clock(m_3_clock),
    .reset(m_3_reset),
    .io_in_0(m_3_io_in_0),
    .io_in_1(m_3_io_in_1),
    .io_sel(m_3_io_sel),
    .io_out(m_3_io_out)
  );
  MuxPE m_4 ( // @[PE.scala 112:19]
    .clock(m_4_clock),
    .reset(m_4_reset),
    .io_in_0(m_4_io_in_0),
    .io_in_1(m_4_io_in_1),
    .io_sel(m_4_io_sel),
    .io_out(m_4_io_out)
  );
  MuxPE m_5 ( // @[PE.scala 113:19]
    .clock(m_5_clock),
    .reset(m_5_reset),
    .io_in_0(m_5_io_in_0),
    .io_in_1(m_5_io_in_1),
    .io_sel(m_5_io_sel),
    .io_out(m_5_io_out)
  );
  MuxPE m_6 ( // @[PE.scala 114:19]
    .clock(m_6_clock),
    .reset(m_6_reset),
    .io_in_0(m_6_io_in_0),
    .io_in_1(m_6_io_in_1),
    .io_sel(m_6_io_sel),
    .io_out(m_6_io_out)
  );
  MuxPE m_7 ( // @[PE.scala 115:19]
    .clock(m_7_clock),
    .reset(m_7_reset),
    .io_in_0(m_7_io_in_0),
    .io_in_1(m_7_io_in_1),
    .io_sel(m_7_io_sel),
    .io_out(m_7_io_out)
  );
  MuxPE m_8 ( // @[PE.scala 116:19]
    .clock(m_8_clock),
    .reset(m_8_reset),
    .io_in_0(m_8_io_in_0),
    .io_in_1(m_8_io_in_1),
    .io_sel(m_8_io_sel),
    .io_out(m_8_io_out)
  );
  MuxPE m_9 ( // @[PE.scala 117:19]
    .clock(m_9_clock),
    .reset(m_9_reset),
    .io_in_0(m_9_io_in_0),
    .io_in_1(m_9_io_in_1),
    .io_sel(m_9_io_sel),
    .io_out(m_9_io_out)
  );
  MultPE multModule_0 ( // @[PE.scala 119:28]
    .clock(multModule_0_clock),
    .reset(multModule_0_reset),
    .io_in_0(multModule_0_io_in_0),
    .io_in_1(multModule_0_io_in_1),
    .io_out(multModule_0_io_out)
  );
  MultPE multModule_1 ( // @[PE.scala 120:28]
    .clock(multModule_1_clock),
    .reset(multModule_1_reset),
    .io_in_0(multModule_1_io_in_0),
    .io_in_1(multModule_1_io_in_1),
    .io_out(multModule_1_io_out)
  );
  AddSubPE addsubModule_0 ( // @[PE.scala 122:30]
    .clock(addsubModule_0_clock),
    .reset(addsubModule_0_reset),
    .io_in_0(addsubModule_0_io_in_0),
    .io_in_1(addsubModule_0_io_in_1),
    .io_out(addsubModule_0_io_out)
  );
  AddSubPE addsubModule_1 ( // @[PE.scala 123:30]
    .clock(addsubModule_1_clock),
    .reset(addsubModule_1_reset),
    .io_in_0(addsubModule_1_io_in_0),
    .io_in_1(addsubModule_1_io_in_1),
    .io_out(addsubModule_1_io_out)
  );
  assign io_out_0 = m_8_out; // @[PE.scala 247:12]
  assign io_out_1 = m_9_out; // @[PE.scala 248:12]
  assign m_0_clock = clock;
  assign m_0_reset = reset;
  assign m_0_io_in_0 = Xi_0; // @[PE.scala 140:15]
  assign m_0_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 141:15]
  assign m_0_io_sel = m_0_sel; // @[PE.scala 128:14]
  assign m_1_clock = clock;
  assign m_1_reset = reset;
  assign m_1_io_in_0 = Yi_0; // @[PE.scala 146:15]
  assign m_1_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 147:15]
  assign m_1_io_sel = m_1_sel; // @[PE.scala 129:14]
  assign m_2_clock = clock;
  assign m_2_reset = reset;
  assign m_2_io_in_0 = Xi_1; // @[PE.scala 152:15]
  assign m_2_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 153:15]
  assign m_2_io_sel = m_2_sel; // @[PE.scala 130:14]
  assign m_3_clock = clock;
  assign m_3_reset = reset;
  assign m_3_io_in_0 = Yi_1; // @[PE.scala 158:15]
  assign m_3_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 159:15]
  assign m_3_io_sel = m_3_sel; // @[PE.scala 131:14]
  assign m_4_clock = clock;
  assign m_4_reset = reset;
  assign m_4_io_in_0 = Xi_0; // @[PE.scala 185:15]
  assign m_4_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 186:15]
  assign m_4_io_sel = 2'h0; // @[PE.scala 132:14]
  assign m_5_clock = clock;
  assign m_5_reset = reset;
  assign m_5_io_in_0 = Yi_0; // @[PE.scala 191:15]
  assign m_5_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 192:15]
  assign m_5_io_sel = m_5_sel; // @[PE.scala 133:14]
  assign m_6_clock = clock;
  assign m_6_reset = reset;
  assign m_6_io_in_0 = Xi_1; // @[PE.scala 197:15]
  assign m_6_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 198:15]
  assign m_6_io_sel = m_6_sel; // @[PE.scala 134:14]
  assign m_7_clock = clock;
  assign m_7_reset = reset;
  assign m_7_io_in_0 = Yi_1; // @[PE.scala 203:15]
  assign m_7_io_in_1 = 32'h0; // @[PE.scala 204:15]
  assign m_7_io_sel = m_7_sel; // @[PE.scala 135:14]
  assign m_8_clock = clock;
  assign m_8_reset = reset;
  assign m_8_io_in_0 = addsubModule_0_out[31:0]; // @[PE.scala 232:15]
  assign m_8_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 233:15]
  assign m_8_io_sel = m_8_sel; // @[PE.scala 136:14]
  assign m_9_clock = clock;
  assign m_9_reset = reset;
  assign m_9_io_in_0 = addsubModule_1_out[31:0]; // @[PE.scala 238:15]
  assign m_9_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 239:15]
  assign m_9_io_sel = m_9_sel; // @[PE.scala 137:14]
  assign multModule_0_clock = clock;
  assign multModule_0_reset = reset;
  assign multModule_0_io_in_0 = m_0_out[31:0]; // @[PE.scala 170:24]
  assign multModule_0_io_in_1 = m_1_out[31:0]; // @[PE.scala 171:24]
  assign multModule_1_clock = clock;
  assign multModule_1_reset = reset;
  assign multModule_1_io_in_0 = m_2_out[31:0]; // @[PE.scala 178:24]
  assign multModule_1_io_in_1 = m_3_out[31:0]; // @[PE.scala 179:24]
  assign addsubModule_0_clock = clock;
  assign addsubModule_0_reset = reset;
  assign addsubModule_0_io_in_0 = m_4_out[31:0]; // @[PE.scala 216:32]
  assign addsubModule_0_io_in_1 = m_5_out[31:0]; // @[PE.scala 217:32]
  assign addsubModule_1_clock = clock;
  assign addsubModule_1_reset = reset;
  assign addsubModule_1_io_in_0 = m_6_out[31:0]; // @[PE.scala 225:32]
  assign addsubModule_1_io_in_1 = m_7_out[31:0]; // @[PE.scala 226:32]
  always @(posedge clock) begin
    Xi_0 <= io_Xi_0; // @[PE.scala 47:22]
    Yi_0 <= io_Yi_0; // @[PE.scala 48:22]
    Xi_1 <= io_Xi_1; // @[PE.scala 50:22]
    Yi_1 <= io_Yi_1; // @[PE.scala 51:22]
    m_0_sel <= io_m_0_sel; // @[PE.scala 65:25]
    m_1_sel <= io_m_1_sel; // @[PE.scala 66:25]
    m_2_sel <= io_m_2_sel; // @[PE.scala 67:25]
    m_3_sel <= io_m_3_sel; // @[PE.scala 68:25]
    m_5_sel <= io_m_5_sel; // @[PE.scala 70:25]
    m_6_sel <= io_m_6_sel; // @[PE.scala 71:25]
    m_7_sel <= io_m_7_sel; // @[PE.scala 72:25]
    m_8_sel <= io_m_8_sel; // @[PE.scala 73:25]
    m_9_sel <= io_m_9_sel; // @[PE.scala 74:25]
    if (reset) begin // @[PE.scala 89:36]
      addsubModule_0_out <= 33'h0; // @[PE.scala 89:36]
    end else begin
      addsubModule_0_out <= {{1'd0}, addsubModule_0_io_out}; // @[PE.scala 218:23]
    end
    if (reset) begin // @[PE.scala 90:36]
      addsubModule_1_out <= 33'h0; // @[PE.scala 90:36]
    end else begin
      addsubModule_1_out <= {{1'd0}, addsubModule_1_io_out}; // @[PE.scala 227:23]
    end
    if (reset) begin // @[PE.scala 91:36]
      multModule_0_out <= 33'h0; // @[PE.scala 91:36]
    end else begin
      multModule_0_out <= {{1'd0}, multModule_0_io_out}; // @[PE.scala 172:21]
    end
    if (reset) begin // @[PE.scala 92:36]
      multModule_1_out <= 33'h0; // @[PE.scala 92:36]
    end else begin
      multModule_1_out <= {{1'd0}, multModule_1_io_out}; // @[PE.scala 180:21]
    end
    if (reset) begin // @[PE.scala 94:24]
      m_0_out <= 33'h0; // @[PE.scala 94:24]
    end else begin
      m_0_out <= {{1'd0}, m_0_io_out}; // @[PE.scala 144:11]
    end
    if (reset) begin // @[PE.scala 95:24]
      m_1_out <= 33'h0; // @[PE.scala 95:24]
    end else begin
      m_1_out <= {{1'd0}, m_1_io_out}; // @[PE.scala 150:11]
    end
    if (reset) begin // @[PE.scala 96:24]
      m_2_out <= 33'h0; // @[PE.scala 96:24]
    end else begin
      m_2_out <= {{1'd0}, m_2_io_out}; // @[PE.scala 156:11]
    end
    if (reset) begin // @[PE.scala 97:24]
      m_3_out <= 33'h0; // @[PE.scala 97:24]
    end else begin
      m_3_out <= {{1'd0}, m_3_io_out}; // @[PE.scala 162:11]
    end
    if (reset) begin // @[PE.scala 98:24]
      m_4_out <= 33'h0; // @[PE.scala 98:24]
    end else begin
      m_4_out <= {{1'd0}, m_4_io_out}; // @[PE.scala 189:15]
    end
    if (reset) begin // @[PE.scala 99:24]
      m_5_out <= 33'h0; // @[PE.scala 99:24]
    end else begin
      m_5_out <= {{1'd0}, m_5_io_out}; // @[PE.scala 195:15]
    end
    if (reset) begin // @[PE.scala 100:24]
      m_6_out <= 33'h0; // @[PE.scala 100:24]
    end else begin
      m_6_out <= {{1'd0}, m_6_io_out}; // @[PE.scala 201:15]
    end
    if (reset) begin // @[PE.scala 101:24]
      m_7_out <= 33'h0; // @[PE.scala 101:24]
    end else begin
      m_7_out <= {{1'd0}, m_7_io_out}; // @[PE.scala 207:15]
    end
    if (reset) begin // @[PE.scala 102:24]
      m_8_out <= 33'h0; // @[PE.scala 102:24]
    end else begin
      m_8_out <= {{1'd0}, m_8_io_out}; // @[PE.scala 236:15]
    end
    if (reset) begin // @[PE.scala 103:24]
      m_9_out <= 33'h0; // @[PE.scala 103:24]
    end else begin
      m_9_out <= {{1'd0}, m_9_io_out}; // @[PE.scala 242:15]
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
  Xi_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  Yi_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  Xi_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  Yi_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  m_0_sel = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  m_1_sel = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  m_2_sel = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  m_3_sel = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  m_5_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  m_6_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  m_7_sel = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  m_8_sel = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  m_9_sel = _RAND_12[1:0];
  _RAND_13 = {2{`RANDOM}};
  addsubModule_0_out = _RAND_13[32:0];
  _RAND_14 = {2{`RANDOM}};
  addsubModule_1_out = _RAND_14[32:0];
  _RAND_15 = {2{`RANDOM}};
  multModule_0_out = _RAND_15[32:0];
  _RAND_16 = {2{`RANDOM}};
  multModule_1_out = _RAND_16[32:0];
  _RAND_17 = {2{`RANDOM}};
  m_0_out = _RAND_17[32:0];
  _RAND_18 = {2{`RANDOM}};
  m_1_out = _RAND_18[32:0];
  _RAND_19 = {2{`RANDOM}};
  m_2_out = _RAND_19[32:0];
  _RAND_20 = {2{`RANDOM}};
  m_3_out = _RAND_20[32:0];
  _RAND_21 = {2{`RANDOM}};
  m_4_out = _RAND_21[32:0];
  _RAND_22 = {2{`RANDOM}};
  m_5_out = _RAND_22[32:0];
  _RAND_23 = {2{`RANDOM}};
  m_6_out = _RAND_23[32:0];
  _RAND_24 = {2{`RANDOM}};
  m_7_out = _RAND_24[32:0];
  _RAND_25 = {2{`RANDOM}};
  m_8_out = _RAND_25[32:0];
  _RAND_26 = {2{`RANDOM}};
  m_9_out = _RAND_26[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_8(
  input         clock,
  input         reset,
  input  [31:0] io_Xi_0_in_0,
  input  [31:0] io_Yi_0_in_0,
  input  [31:0] io_Xi_0_in_1,
  input  [31:0] io_Yi_0_in_1,
  input  [31:0] io_Xi_1_in_0,
  input  [31:0] io_Yi_1_in_0,
  input  [31:0] io_Xi_1_in_1,
  input  [31:0] io_Yi_1_in_1,
  input  [31:0] io_Xi_2_in_0,
  input  [31:0] io_Yi_2_in_0,
  input  [31:0] io_Xi_2_in_1,
  input  [31:0] io_Yi_2_in_1,
  input  [31:0] io_Xi_3_in_0,
  input  [31:0] io_Yi_3_in_0,
  input  [31:0] io_Xi_3_in_1,
  input  [31:0] io_Yi_3_in_1,
  input  [31:0] io_Xi_4_in_0,
  input  [31:0] io_Yi_4_in_0,
  input  [31:0] io_Xi_4_in_1,
  input  [31:0] io_Yi_4_in_1,
  input  [31:0] io_Xi_5_in_0,
  input  [31:0] io_Yi_5_in_0,
  input  [31:0] io_Xi_5_in_1,
  input  [31:0] io_Yi_5_in_1,
  input  [31:0] io_Xi_6_in_0,
  input  [31:0] io_Yi_6_in_0,
  input  [31:0] io_Xi_6_in_1,
  input  [31:0] io_Yi_6_in_1,
  input  [31:0] io_Xi_7_in_0,
  input  [31:0] io_Yi_7_in_0,
  input  [31:0] io_Xi_7_in_1,
  input  [31:0] io_Yi_7_in_1,
  input  [1:0]  io_op_type,
  input         io_use_int,
  input         io_tininess,
  input  [2:0]  io_rounding,
  output [31:0] io_out_0,
  output [31:0] io_out_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  wire  pe_0_clock; // @[PE_8.scala 250:20]
  wire  pe_0_reset; // @[PE_8.scala 250:20]
  wire [31:0] pe_0_io_Xi_0; // @[PE_8.scala 250:20]
  wire [31:0] pe_0_io_Yi_0; // @[PE_8.scala 250:20]
  wire [31:0] pe_0_io_Xi_1; // @[PE_8.scala 250:20]
  wire [31:0] pe_0_io_Yi_1; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_0_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_1_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_2_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_3_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_5_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_6_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_7_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_8_sel; // @[PE_8.scala 250:20]
  wire [1:0] pe_0_io_m_9_sel; // @[PE_8.scala 250:20]
  wire [32:0] pe_0_io_out_0; // @[PE_8.scala 250:20]
  wire [32:0] pe_0_io_out_1; // @[PE_8.scala 250:20]
  reg [31:0] Xi_0_in_0; // @[PE_8.scala 79:27]
  reg [31:0] Yi_0_in_0; // @[PE_8.scala 80:27]
  reg [31:0] Xi_0_in_1; // @[PE_8.scala 81:27]
  reg [31:0] Yi_0_in_1; // @[PE_8.scala 82:27]
  reg [1:0] m_0_sel; // @[PE_8.scala 154:25]
  reg [1:0] m_1_sel; // @[PE_8.scala 155:25]
  reg [1:0] m_2_sel; // @[PE_8.scala 156:25]
  reg [1:0] m_3_sel; // @[PE_8.scala 157:25]
  reg [1:0] m_5_sel; // @[PE_8.scala 159:25]
  reg [1:0] m_6_sel; // @[PE_8.scala 160:25]
  reg [1:0] m_7_sel; // @[PE_8.scala 161:25]
  reg [1:0] m_8_sel; // @[PE_8.scala 162:25]
  reg [1:0] m_9_sel; // @[PE_8.scala 163:25]
  reg [32:0] pe_0_out_0; // @[PE_8.scala 181:29]
  reg [32:0] pe_0_out_1; // @[PE_8.scala 182:29]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg [3:0] pe_step; // @[PE_8.scala 487:25]
  wire  wrap = value == 4'h8; // @[Counter.scala 72:24]
  wire [3:0] _value_T_1 = value + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_20 = wrap ? 4'h0 : _value_T_1; // @[Counter.scala 76:15 86:{20,28}]
  wire [3:0] _GEN_21 = wrap ? 4'h3 : pe_step; // @[PE_8.scala 586:61 587:17 487:25]
  wire [3:0] _GEN_22 = wrap ? 4'h0 : _GEN_20; // @[PE_8.scala 586:61 Counter.scala 97:11]
  wire  wrap_1 = value_1 == 4'h8; // @[Counter.scala 72:24]
  wire [3:0] _value_T_3 = value_1 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_23 = wrap_1 ? 4'h0 : _value_T_3; // @[Counter.scala 76:15 86:{20,28}]
  wire [3:0] _GEN_24 = wrap_1 ? 4'h0 : _GEN_23; // @[PE_8.scala 599:63 Counter.scala 97:11]
  wire [3:0] _GEN_25 = wrap_1 ? 4'h1 : pe_step; // @[PE_8.scala 599:63 601:17 487:25]
  wire [3:0] _GEN_27 = 4'h3 == pe_step ? _GEN_24 : value_1; // @[PE_8.scala 494:3 Counter.scala 60:40]
  wire [3:0] _GEN_28 = 4'h3 == pe_step ? _GEN_25 : pe_step; // @[PE_8.scala 487:25 494:3]
  wire [32:0] _GEN_29 = 4'h3 == pe_step ? pe_0_out_0 : 33'h0; // @[PE_8.scala 489:12 494:3 604:16]
  wire [32:0] _GEN_30 = 4'h3 == pe_step ? pe_0_out_1 : 33'h0; // @[PE_8.scala 490:12 494:3 605:16]
  wire [32:0] _GEN_35 = 4'h2 == pe_step ? 33'h0 : _GEN_29; // @[PE_8.scala 489:12 494:3]
  wire [32:0] _GEN_36 = 4'h2 == pe_step ? 33'h0 : _GEN_30; // @[PE_8.scala 490:12 494:3]
  wire [32:0] _GEN_54 = 4'h1 == pe_step ? 33'h0 : _GEN_35; // @[PE_8.scala 489:12 494:3]
  wire [32:0] _GEN_55 = 4'h1 == pe_step ? 33'h0 : _GEN_36; // @[PE_8.scala 490:12 494:3]
  wire [32:0] _GEN_73 = 4'h0 == pe_step ? 33'h0 : _GEN_54; // @[PE_8.scala 489:12 494:3]
  wire [32:0] _GEN_74 = 4'h0 == pe_step ? 33'h0 : _GEN_55; // @[PE_8.scala 490:12 494:3]
  PE pe_0 ( // @[PE_8.scala 250:20]
    .clock(pe_0_clock),
    .reset(pe_0_reset),
    .io_Xi_0(pe_0_io_Xi_0),
    .io_Yi_0(pe_0_io_Yi_0),
    .io_Xi_1(pe_0_io_Xi_1),
    .io_Yi_1(pe_0_io_Yi_1),
    .io_m_0_sel(pe_0_io_m_0_sel),
    .io_m_1_sel(pe_0_io_m_1_sel),
    .io_m_2_sel(pe_0_io_m_2_sel),
    .io_m_3_sel(pe_0_io_m_3_sel),
    .io_m_5_sel(pe_0_io_m_5_sel),
    .io_m_6_sel(pe_0_io_m_6_sel),
    .io_m_7_sel(pe_0_io_m_7_sel),
    .io_m_8_sel(pe_0_io_m_8_sel),
    .io_m_9_sel(pe_0_io_m_9_sel),
    .io_out_0(pe_0_io_out_0),
    .io_out_1(pe_0_io_out_1)
  );
  assign io_out_0 = _GEN_73[31:0];
  assign io_out_1 = _GEN_74[31:0];
  assign pe_0_clock = clock;
  assign pe_0_reset = reset;
  assign pe_0_io_Xi_0 = Xi_0_in_0; // @[PE_8.scala 251:16]
  assign pe_0_io_Yi_0 = Yi_0_in_0; // @[PE_8.scala 252:16]
  assign pe_0_io_Xi_1 = Xi_0_in_1; // @[PE_8.scala 253:16]
  assign pe_0_io_Yi_1 = Yi_0_in_1; // @[PE_8.scala 254:16]
  assign pe_0_io_m_0_sel = m_0_sel; // @[PE_8.scala 259:22]
  assign pe_0_io_m_1_sel = m_1_sel; // @[PE_8.scala 260:22]
  assign pe_0_io_m_2_sel = m_2_sel; // @[PE_8.scala 261:22]
  assign pe_0_io_m_3_sel = m_3_sel; // @[PE_8.scala 262:22]
  assign pe_0_io_m_5_sel = m_5_sel; // @[PE_8.scala 264:22]
  assign pe_0_io_m_6_sel = m_6_sel; // @[PE_8.scala 265:22]
  assign pe_0_io_m_7_sel = m_7_sel; // @[PE_8.scala 266:22]
  assign pe_0_io_m_8_sel = m_8_sel; // @[PE_8.scala 267:22]
  assign pe_0_io_m_9_sel = m_9_sel; // @[PE_8.scala 268:22]
  always @(posedge clock) begin
    Xi_0_in_0 <= io_Xi_0_in_0; // @[PE_8.scala 79:27]
    Yi_0_in_0 <= io_Yi_0_in_0; // @[PE_8.scala 80:27]
    Xi_0_in_1 <= io_Xi_0_in_1; // @[PE_8.scala 81:27]
    Yi_0_in_1 <= io_Yi_0_in_1; // @[PE_8.scala 82:27]
    if (reset) begin // @[PE_8.scala 154:25]
      m_0_sel <= 2'h1; // @[PE_8.scala 154:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_0_sel <= 2'h0; // @[PE_8.scala 508:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_0_sel <= 2'h1;
    end
    if (reset) begin // @[PE_8.scala 155:25]
      m_1_sel <= 2'h1; // @[PE_8.scala 155:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_1_sel <= 2'h0; // @[PE_8.scala 509:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_1_sel <= 2'h1;
    end
    if (reset) begin // @[PE_8.scala 156:25]
      m_2_sel <= 2'h1; // @[PE_8.scala 156:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_2_sel <= 2'h0; // @[PE_8.scala 510:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_2_sel <= 2'h1;
    end
    if (reset) begin // @[PE_8.scala 157:25]
      m_3_sel <= 2'h1; // @[PE_8.scala 157:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_3_sel <= 2'h0; // @[PE_8.scala 511:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_3_sel <= 2'h1;
    end
    if (reset) begin // @[PE_8.scala 159:25]
      m_5_sel <= 2'h1; // @[PE_8.scala 159:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_5_sel <= 2'h0; // @[PE_8.scala 513:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_5_sel <= 2'h0;
    end
    if (reset) begin // @[PE_8.scala 160:25]
      m_6_sel <= 2'h1; // @[PE_8.scala 160:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_6_sel <= 2'h0; // @[PE_8.scala 514:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_6_sel <= 2'h0;
    end
    if (reset) begin // @[PE_8.scala 161:25]
      m_7_sel <= 2'h1; // @[PE_8.scala 161:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_7_sel <= 2'h0; // @[PE_8.scala 515:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_7_sel <= 2'h0;
    end
    if (reset) begin // @[PE_8.scala 162:25]
      m_8_sel <= 2'h1; // @[PE_8.scala 162:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_8_sel <= 2'h0; // @[PE_8.scala 516:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_8_sel <= 2'h1;
    end
    if (reset) begin // @[PE_8.scala 163:25]
      m_9_sel <= 2'h1; // @[PE_8.scala 163:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      m_9_sel <= 2'h0; // @[PE_8.scala 517:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      m_9_sel <= 2'h1;
    end
    if (reset) begin // @[PE_8.scala 181:29]
      pe_0_out_0 <= 33'h0; // @[PE_8.scala 181:29]
    end else begin
      pe_0_out_0 <= pe_0_io_out_0; // @[PE_8.scala 274:14]
    end
    if (reset) begin // @[PE_8.scala 182:29]
      pe_0_out_1 <= 33'h0; // @[PE_8.scala 182:29]
    end else begin
      pe_0_out_1 <= pe_0_io_out_1; // @[PE_8.scala 275:14]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_8.scala 494:3]
      if (!(4'h1 == pe_step)) begin // @[PE_8.scala 494:3]
        if (4'h2 == pe_step) begin // @[PE_8.scala 494:3]
          value <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_8.scala 494:3]
      if (!(4'h1 == pe_step)) begin // @[PE_8.scala 494:3]
        if (!(4'h2 == pe_step)) begin // @[PE_8.scala 494:3]
          value_1 <= _GEN_27;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 487:25]
      pe_step <= 4'h0; // @[PE_8.scala 487:25]
    end else if (4'h0 == pe_step) begin // @[PE_8.scala 494:3]
      pe_step <= 4'h1; // @[PE_8.scala 520:19]
    end else if (4'h1 == pe_step) begin // @[PE_8.scala 494:3]
      pe_step <= 4'h2;
    end else if (4'h2 == pe_step) begin // @[PE_8.scala 494:3]
      pe_step <= _GEN_21;
    end else begin
      pe_step <= _GEN_28;
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
  Xi_0_in_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  Yi_0_in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  Xi_0_in_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  Yi_0_in_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  m_0_sel = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  m_1_sel = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  m_2_sel = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  m_3_sel = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  m_5_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  m_6_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  m_7_sel = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  m_8_sel = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  m_9_sel = _RAND_12[1:0];
  _RAND_13 = {2{`RANDOM}};
  pe_0_out_0 = _RAND_13[32:0];
  _RAND_14 = {2{`RANDOM}};
  pe_0_out_1 = _RAND_14[32:0];
  _RAND_15 = {1{`RANDOM}};
  value = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  value_1 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  pe_step = _RAND_17[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
