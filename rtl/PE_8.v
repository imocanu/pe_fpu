module MuxPE(
  input         clock,
  input         reset,
  input  [1:0]  io_sel,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [31:0] io_in_2,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] in_0; // @[MuxPE.scala 21:21]
  reg [31:0] in_1; // @[MuxPE.scala 22:21]
  reg [31:0] in_2; // @[MuxPE.scala 23:21]
  reg [31:0] out; // @[MuxPE.scala 25:21]
  wire  _T = io_sel == 2'h0; // @[MuxPE.scala 27:17]
  wire  _T_1 = io_sel == 2'h1; // @[MuxPE.scala 31:23]
  wire  _T_2 = io_sel == 2'h2; // @[MuxPE.scala 35:23]
  assign io_out = out; // @[MuxPE.scala 44:10]
  always @(posedge clock) begin
    in_0 <= io_in_0; // @[MuxPE.scala 21:21]
    in_1 <= io_in_1; // @[MuxPE.scala 22:21]
    in_2 <= io_in_2; // @[MuxPE.scala 23:21]
    if (reset) begin // @[MuxPE.scala 25:21]
      out <= 32'h0; // @[MuxPE.scala 25:21]
    end else if (_T) begin // @[MuxPE.scala 28:3]
      out <= in_0; // @[MuxPE.scala 29:9]
    end else if (_T_1) begin // @[MuxPE.scala 32:3]
      out <= in_1; // @[MuxPE.scala 33:9]
    end else if (_T_2) begin // @[MuxPE.scala 36:3]
      out <= in_2; // @[MuxPE.scala 37:9]
    end else begin
      out <= 32'h0; // @[MuxPE.scala 41:9]
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
  out = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MulFullRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [47:0] io_rawOut_sig
);
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isZero | io_a_isZero & io_b_isInf; // @[MulRecFN.scala 58:60]
  wire [9:0] _common_sExpOut_T_2 = $signed(io_a_sExp) + $signed(io_b_sExp); // @[MulRecFN.scala 62:36]
  wire [49:0] _common_sigOut_T = io_a_sig * io_b_sig; // @[MulRecFN.scala 63:35]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[22]; // @[common.scala 84:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[22]; // @[common.scala 84:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[MulRecFN.scala 66:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[MulRecFN.scala 70:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[MulRecFN.scala 59:38]
  assign io_rawOut_isZero = io_a_isZero | io_b_isZero; // @[MulRecFN.scala 60:40]
  assign io_rawOut_sign = io_a_sign ^ io_b_sign; // @[MulRecFN.scala 61:36]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - 10'sh100; // @[MulRecFN.scala 62:48]
  assign io_rawOut_sig = _common_sigOut_T[47:0]; // @[MulRecFN.scala 63:46]
endmodule
module MulRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  mulFullRaw_io_a_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_a_sExp; // @[MulRecFN.scala 84:28]
  wire [24:0] mulFullRaw_io_a_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_b_sExp; // @[MulRecFN.scala 84:28]
  wire [24:0] mulFullRaw_io_b_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_invalidExc; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 84:28]
  wire [47:0] mulFullRaw_io_rawOut_sig; // @[MulRecFN.scala 84:28]
  wire  _io_rawOut_sig_T_2 = |mulFullRaw_io_rawOut_sig[21:0]; // @[MulRecFN.scala 93:55]
  MulFullRawFN mulFullRaw ( // @[MulRecFN.scala 84:28]
    .io_a_isNaN(mulFullRaw_io_a_isNaN),
    .io_a_isInf(mulFullRaw_io_a_isInf),
    .io_a_isZero(mulFullRaw_io_a_isZero),
    .io_a_sign(mulFullRaw_io_a_sign),
    .io_a_sExp(mulFullRaw_io_a_sExp),
    .io_a_sig(mulFullRaw_io_a_sig),
    .io_b_isNaN(mulFullRaw_io_b_isNaN),
    .io_b_isInf(mulFullRaw_io_b_isInf),
    .io_b_isZero(mulFullRaw_io_b_isZero),
    .io_b_sign(mulFullRaw_io_b_sign),
    .io_b_sExp(mulFullRaw_io_b_sExp),
    .io_b_sig(mulFullRaw_io_b_sig),
    .io_invalidExc(mulFullRaw_io_invalidExc),
    .io_rawOut_isNaN(mulFullRaw_io_rawOut_isNaN),
    .io_rawOut_isInf(mulFullRaw_io_rawOut_isInf),
    .io_rawOut_isZero(mulFullRaw_io_rawOut_isZero),
    .io_rawOut_sign(mulFullRaw_io_rawOut_sign),
    .io_rawOut_sExp(mulFullRaw_io_rawOut_sExp),
    .io_rawOut_sig(mulFullRaw_io_rawOut_sig)
  );
  assign io_invalidExc = mulFullRaw_io_invalidExc; // @[MulRecFN.scala 89:19]
  assign io_rawOut_isNaN = mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isInf = mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isZero = mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sign = mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sExp = mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sig = {mulFullRaw_io_rawOut_sig[47:22],_io_rawOut_sig_T_2}; // @[Cat.scala 30:58]
  assign mulFullRaw_io_a_isNaN = io_a_isNaN; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isInf = io_a_isInf; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isZero = io_a_isZero; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sign = io_a_sign; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sExp = io_a_sExp; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sig = io_a_sig; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_b_isNaN = io_b_isNaN; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isInf = io_b_isInf; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isZero = io_b_isZero; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sign = io_b_sign; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sExp = io_b_sExp; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sig = io_b_sig; // @[MulRecFN.scala 87:21]
endmodule
module RoundAnyRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RoundAnyRawFNToRecFN.scala 88:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RoundAnyRawFNToRecFN.scala 90:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RoundAnyRawFNToRecFN.scala 91:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RoundAnyRawFNToRecFN.scala 92:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RoundAnyRawFNToRecFN.scala 93:53]
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign; // @[RoundAnyRawFNToRecFN.scala 96:42]
  wire  doShiftSigDown1 = io_in_sig[26]; // @[RoundAnyRawFNToRecFN.scala 118:61]
  wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0]; // @[primitives.scala 51:21]
  wire  roundMask_msb = _roundMask_T_1[8]; // @[primitives.scala 57:25]
  wire [7:0] roundMask_lsbs = _roundMask_T_1[7:0]; // @[primitives.scala 58:26]
  wire  roundMask_msb_1 = roundMask_lsbs[7]; // @[primitives.scala 57:25]
  wire [6:0] roundMask_lsbs_1 = roundMask_lsbs[6:0]; // @[primitives.scala 58:26]
  wire  roundMask_msb_2 = roundMask_lsbs_1[6]; // @[primitives.scala 57:25]
  wire [5:0] roundMask_lsbs_2 = roundMask_lsbs_1[5:0]; // @[primitives.scala 58:26]
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> roundMask_lsbs_2; // @[primitives.scala 77:58]
  wire [15:0] _GEN_0 = {{8'd0}, roundMask_shift[57:50]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_7 = _GEN_0 & 16'hff; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_9 = {roundMask_shift[49:42], 8'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_11 = _roundMask_T_9 & 16'hff00; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_1 = {{4'd0}, _roundMask_T_12[15:4]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_17 = _GEN_1 & 16'hf0f; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_19 = {_roundMask_T_12[11:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_21 = _roundMask_T_19 & 16'hf0f0; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_2 = {{2'd0}, _roundMask_T_22[15:2]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_27 = _GEN_2 & 16'h3333; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_29 = {_roundMask_T_22[13:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_31 = _roundMask_T_29 & 16'hcccc; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_32 = _roundMask_T_27 | _roundMask_T_31; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_3 = {{1'd0}, _roundMask_T_32[15:1]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_37 = _GEN_3 & 16'h5555; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_39 = {_roundMask_T_32[14:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_41 = _roundMask_T_39 & 16'haaaa; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_42 = _roundMask_T_37 | _roundMask_T_41; // @[Bitwise.scala 103:39]
  wire [21:0] _roundMask_T_59 = {_roundMask_T_42,roundMask_shift[58],roundMask_shift[59],roundMask_shift[60],
    roundMask_shift[61],roundMask_shift[62],roundMask_shift[63]}; // @[Cat.scala 30:58]
  wire [21:0] _roundMask_T_60 = ~_roundMask_T_59; // @[primitives.scala 74:36]
  wire [21:0] _roundMask_T_61 = roundMask_msb_2 ? 22'h0 : _roundMask_T_60; // @[primitives.scala 74:21]
  wire [21:0] _roundMask_T_62 = ~_roundMask_T_61; // @[primitives.scala 74:17]
  wire [24:0] _roundMask_T_63 = {_roundMask_T_62,3'h7}; // @[Cat.scala 30:58]
  wire [2:0] _roundMask_T_70 = {roundMask_shift[0],roundMask_shift[1],roundMask_shift[2]}; // @[Cat.scala 30:58]
  wire [2:0] _roundMask_T_71 = roundMask_msb_2 ? _roundMask_T_70 : 3'h0; // @[primitives.scala 61:24]
  wire [24:0] _roundMask_T_72 = roundMask_msb_1 ? _roundMask_T_63 : {{22'd0}, _roundMask_T_71}; // @[primitives.scala 66:24]
  wire [24:0] _roundMask_T_73 = roundMask_msb ? _roundMask_T_72 : 25'h0; // @[primitives.scala 61:24]
  wire [24:0] _GEN_4 = {{24'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [24:0] _roundMask_T_74 = _roundMask_T_73 | _GEN_4; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [26:0] roundMask = {_roundMask_T_74,2'h3}; // @[Cat.scala 30:58]
  wire [26:0] shiftedRoundMask = {1'h0,roundMask[26:1]}; // @[Cat.scala 30:58]
  wire [26:0] _roundPosMask_T = ~shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 161:28]
  wire [26:0] roundPosMask = _roundPosMask_T & roundMask; // @[RoundAnyRawFNToRecFN.scala 161:46]
  wire [26:0] _roundPosBit_T = io_in_sig & roundPosMask; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [26:0] _anyRoundExtra_T = io_in_sig & shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire  anyRound = roundPosBit | anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 164:36]
  wire  _roundIncr_T = roundingMode_near_even | roundingMode_near_maxMag; // @[RoundAnyRawFNToRecFN.scala 167:38]
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit; // @[RoundAnyRawFNToRecFN.scala 167:67]
  wire  _roundIncr_T_2 = roundMagUp & anyRound; // @[RoundAnyRawFNToRecFN.scala 169:29]
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2; // @[RoundAnyRawFNToRecFN.scala 168:31]
  wire [26:0] _roundedSig_T = io_in_sig | roundMask; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [25:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? roundMask[26:1] : 26'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [26:0] _roundedSig_T_10 = ~roundMask; // @[RoundAnyRawFNToRecFN.scala 178:32]
  wire [26:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [25:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? roundPosMask[26:1] : 26'h0; // @[RoundAnyRawFNToRecFN.scala 179:24]
  wire [25:0] _GEN_5 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] _roundedSig_T_16 = _GEN_5 | _roundedSig_T_15; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [9:0] _GEN_6 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [10:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_6); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [22:0] common_fractOut = doShiftSigDown1 ? roundedSig[23:1] : roundedSig[22:0]; // @[RoundAnyRawFNToRecFN.scala 187:16]
  wire [3:0] _common_overflow_T = sRoundedExp[10:7]; // @[RoundAnyRawFNToRecFN.scala 194:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 194:50]
  wire  common_totalUnderflow = $signed(sRoundedExp) < 11'sh6b; // @[RoundAnyRawFNToRecFN.scala 198:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 236:32]
  wire  overflow_roundMagUp = _roundIncr_T | roundMagUp; // @[RoundAnyRawFNToRecFN.scala 241:60]
  wire  pegMinNonzeroMagOut = commonCase & common_totalUnderflow & (roundMagUp | roundingMode_odd); // @[RoundAnyRawFNToRecFN.scala 243:45]
  wire  pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 244:39]
  wire  notNaN_isInfOut = io_in_isInf | overflow & overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 246:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [8:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [8:0] _expOut_T_5 = pegMinNonzeroMagOut ? 9'h194 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 255:18]
  wire [8:0] _expOut_T_6 = ~_expOut_T_5; // @[RoundAnyRawFNToRecFN.scala 255:14]
  wire [8:0] _expOut_T_7 = _expOut_T_3 & _expOut_T_6; // @[RoundAnyRawFNToRecFN.scala 254:17]
  wire [8:0] _expOut_T_8 = pegMaxFiniteMagOut ? 9'h80 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 259:18]
  wire [8:0] _expOut_T_9 = ~_expOut_T_8; // @[RoundAnyRawFNToRecFN.scala 259:14]
  wire [8:0] _expOut_T_10 = _expOut_T_7 & _expOut_T_9; // @[RoundAnyRawFNToRecFN.scala 258:17]
  wire [8:0] _expOut_T_11 = notNaN_isInfOut ? 9'h40 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [8:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [8:0] _expOut_T_13 = _expOut_T_10 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [8:0] _expOut_T_14 = pegMinNonzeroMagOut ? 9'h6b : 9'h0; // @[RoundAnyRawFNToRecFN.scala 267:16]
  wire [8:0] _expOut_T_15 = _expOut_T_13 | _expOut_T_14; // @[RoundAnyRawFNToRecFN.scala 266:18]
  wire [8:0] _expOut_T_16 = pegMaxFiniteMagOut ? 9'h17f : 9'h0; // @[RoundAnyRawFNToRecFN.scala 271:16]
  wire [8:0] _expOut_T_17 = _expOut_T_15 | _expOut_T_16; // @[RoundAnyRawFNToRecFN.scala 270:15]
  wire [8:0] _expOut_T_18 = notNaN_isInfOut ? 9'h180 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [8:0] _expOut_T_19 = _expOut_T_17 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [22:0] _fractOut_T_2 = isNaNOut ? 23'h400000 : 23'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [22:0] _fractOut_T_3 = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [22:0] _fractOut_T_5 = pegMaxFiniteMagOut ? 23'h7fffff : 23'h0; // @[Bitwise.scala 72:12]
  wire [22:0] fractOut = _fractOut_T_3 | _fractOut_T_5; // @[RoundAnyRawFNToRecFN.scala 281:11]
  wire [9:0] io_out_hi = {signOut,expOut}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
endmodule
module RoundRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [9:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [26:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [32:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 307:15]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[RoundAnyRawFNToRecFN.scala 307:15]
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundAnyRawFNToRecFN_io_roundingMode),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 315:23]
  assign roundAnyRawFNToRecFN_io_invalidExc = io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 310:44]
  assign roundAnyRawFNToRecFN_io_in_isNaN = io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_isInf = io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_isZero = io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in_sign; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sExp = io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sig = io_in_sig; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; // @[RoundAnyRawFNToRecFN.scala 313:44]
endmodule
module MulRecFN(
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  mulRawFN__io_a_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_a_sExp; // @[MulRecFN.scala 113:26]
  wire [24:0] mulRawFN__io_a_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_b_sExp; // @[MulRecFN.scala 113:26]
  wire [24:0] mulRawFN__io_b_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_invalidExc; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 113:26]
  wire [26:0] mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 113:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[MulRecFN.scala 121:15]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[MulRecFN.scala 121:15]
  wire [26:0] roundRawFNToRecFN_io_in_sig; // @[MulRecFN.scala 121:15]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[MulRecFN.scala 121:15]
  wire [32:0] roundRawFNToRecFN_io_out; // @[MulRecFN.scala 121:15]
  wire [8:0] mulRawFN_io_a_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  mulRawFN_io_a_isZero = mulRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  mulRawFN_io_a_isSpecial = mulRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _mulRawFN_io_a_out_sig_T = ~mulRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] mulRawFN_io_a_out_sig_hi = {1'h0,_mulRawFN_io_a_out_sig_T}; // @[Cat.scala 30:58]
  wire [8:0] mulRawFN_io_b_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  mulRawFN_io_b_isZero = mulRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  mulRawFN_io_b_isSpecial = mulRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _mulRawFN_io_b_out_sig_T = ~mulRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] mulRawFN_io_b_out_sig_hi = {1'h0,_mulRawFN_io_b_out_sig_T}; // @[Cat.scala 30:58]
  MulRawFN mulRawFN_ ( // @[MulRecFN.scala 113:26]
    .io_a_isNaN(mulRawFN__io_a_isNaN),
    .io_a_isInf(mulRawFN__io_a_isInf),
    .io_a_isZero(mulRawFN__io_a_isZero),
    .io_a_sign(mulRawFN__io_a_sign),
    .io_a_sExp(mulRawFN__io_a_sExp),
    .io_a_sig(mulRawFN__io_a_sig),
    .io_b_isNaN(mulRawFN__io_b_isNaN),
    .io_b_isInf(mulRawFN__io_b_isInf),
    .io_b_isZero(mulRawFN__io_b_isZero),
    .io_b_sign(mulRawFN__io_b_sign),
    .io_b_sExp(mulRawFN__io_b_sExp),
    .io_b_sig(mulRawFN__io_b_sig),
    .io_invalidExc(mulRawFN__io_invalidExc),
    .io_rawOut_isNaN(mulRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(mulRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(mulRawFN__io_rawOut_isZero),
    .io_rawOut_sign(mulRawFN__io_rawOut_sign),
    .io_rawOut_sExp(mulRawFN__io_rawOut_sExp),
    .io_rawOut_sig(mulRawFN__io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[MulRecFN.scala 121:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[MulRecFN.scala 127:23]
  assign mulRawFN__io_a_isNaN = mulRawFN_io_a_isSpecial & mulRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN__io_a_isInf = mulRawFN_io_a_isSpecial & ~mulRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_a_isZero = mulRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN__io_a_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN__io_a_sExp = {1'b0,$signed(mulRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN__io_a_sig = {mulRawFN_io_a_out_sig_hi,io_a[22:0]}; // @[Cat.scala 30:58]
  assign mulRawFN__io_b_isNaN = mulRawFN_io_b_isSpecial & mulRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN__io_b_isInf = mulRawFN_io_b_isSpecial & ~mulRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_b_isZero = mulRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN__io_b_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN__io_b_sExp = {1'b0,$signed(mulRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN__io_b_sig = {mulRawFN_io_b_out_sig_hi,io_b[22:0]}; // @[Cat.scala 30:58]
  assign roundRawFNToRecFN_io_invalidExc = mulRawFN__io_invalidExc; // @[MulRecFN.scala 122:39]
  assign roundRawFNToRecFN_io_in_isNaN = mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isInf = mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isZero = mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sign = mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sExp = mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sig = mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_roundingMode = io_roundingMode; // @[MulRecFN.scala 125:39]
endmodule
module MultPE(
  input         clock,
  input         reset,
  input         io_use_int,
  input  [2:0]  io_rounding,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] mulRecFN_io_a; // @[MultPE.scala 50:26]
  wire [32:0] mulRecFN_io_b; // @[MultPE.scala 50:26]
  wire [2:0] mulRecFN_io_roundingMode; // @[MultPE.scala 50:26]
  wire [32:0] mulRecFN_io_out; // @[MultPE.scala 50:26]
  reg [2:0] rounding; // @[MultPE.scala 21:26]
  reg  use_int; // @[MultPE.scala 25:26]
  reg [32:0] module_out; // @[MultPE.scala 27:27]
  reg [31:0] sign_in_0; // @[MultPE.scala 31:29]
  reg [31:0] sign_in_1; // @[MultPE.scala 32:29]
  wire [63:0] _module_out_T_1 = $signed(sign_in_0) * $signed(sign_in_1); // @[MultPE.scala 35:49]
  reg [31:0] fN_in_0; // @[MultPE.scala 42:27]
  reg [31:0] fN_in_1; // @[MultPE.scala 43:27]
  wire  recFN_from_fN_in_0_rawIn_sign = fN_in_0[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_0_rawIn_expIn = fN_in_0[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_0_rawIn_fractIn = fN_in_0[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_0_rawIn_isZeroExpIn = recFN_from_fN_in_0_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_0_rawIn_isZeroFractIn = recFN_from_fN_in_0_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_23 = recFN_from_fN_in_0_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_24 = recFN_from_fN_in_0_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_0_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_25 = recFN_from_fN_in_0_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_0_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_26 = recFN_from_fN_in_0_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_0_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_27 = recFN_from_fN_in_0_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_0_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_28 = recFN_from_fN_in_0_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_0_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_29 = recFN_from_fN_in_0_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_0_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_30 = recFN_from_fN_in_0_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_0_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_31 = recFN_from_fN_in_0_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_0_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_32 = recFN_from_fN_in_0_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_0_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_33 = recFN_from_fN_in_0_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_0_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_34 = recFN_from_fN_in_0_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_0_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_35 = recFN_from_fN_in_0_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_0_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_36 = recFN_from_fN_in_0_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_0_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_37 = recFN_from_fN_in_0_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_0_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_38 = recFN_from_fN_in_0_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_0_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_39 = recFN_from_fN_in_0_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_0_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_40 = recFN_from_fN_in_0_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_0_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_41 = recFN_from_fN_in_0_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_0_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_42 = recFN_from_fN_in_0_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_0_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_43 = recFN_from_fN_in_0_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_0_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_0_rawIn_normDist = recFN_from_fN_in_0_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_0_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_11 = {{31'd0}, recFN_from_fN_in_0_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_0_rawIn_subnormFract_T = _GEN_11 << recFN_from_fN_in_0_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_0_rawIn_subnormFract = {_recFN_from_fN_in_0_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_2 = {{4'd0}, recFN_from_fN_in_0_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T = _GEN_2 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_0_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_0_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_2 = recFN_from_fN_in_0_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_3 = {{6'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_3; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_4 = {{1'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_0_rawIn_adjustedExp = _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 + _GEN_4; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_0_rawIn_isZero = recFN_from_fN_in_0_rawIn_isZeroExpIn & recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_0_rawIn_isSpecial = recFN_from_fN_in_0_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_0_rawIn__isNaN = recFN_from_fN_in_0_rawIn_isSpecial & ~recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_0_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_0_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_0_rawIn_out_sig_T = ~recFN_from_fN_in_0_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_0_rawIn_out_sig_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    recFN_from_fN_in_0_rawIn_subnormFract : recFN_from_fN_in_0_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_0_rawIn__sig = {1'h0,_recFN_from_fN_in_0_rawIn_out_sig_T,
    _recFN_from_fN_in_0_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_0_T_1 = recFN_from_fN_in_0_rawIn_isZero ? 3'h0 : recFN_from_fN_in_0_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_5 = {{2'd0}, recFN_from_fN_in_0_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_0_T_3 = _recFN_from_fN_in_0_T_1 | _GEN_5; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_0_lo = {recFN_from_fN_in_0_rawIn__sExp[5:0],recFN_from_fN_in_0_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_0_hi = {recFN_from_fN_in_0_rawIn_sign,_recFN_from_fN_in_0_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_0; // @[MultPE.scala 46:37]
  wire  recFN_from_fN_in_1_rawIn_sign = fN_in_1[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_1_rawIn_expIn = fN_in_1[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_1_rawIn_fractIn = fN_in_1[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_1_rawIn_isZeroExpIn = recFN_from_fN_in_1_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_1_rawIn_isZeroFractIn = recFN_from_fN_in_1_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_23 = recFN_from_fN_in_1_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_24 = recFN_from_fN_in_1_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_1_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_25 = recFN_from_fN_in_1_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_1_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_26 = recFN_from_fN_in_1_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_1_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_27 = recFN_from_fN_in_1_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_1_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_28 = recFN_from_fN_in_1_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_1_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_29 = recFN_from_fN_in_1_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_1_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_30 = recFN_from_fN_in_1_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_1_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_31 = recFN_from_fN_in_1_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_1_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_32 = recFN_from_fN_in_1_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_1_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_33 = recFN_from_fN_in_1_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_1_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_34 = recFN_from_fN_in_1_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_1_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_35 = recFN_from_fN_in_1_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_1_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_36 = recFN_from_fN_in_1_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_1_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_37 = recFN_from_fN_in_1_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_1_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_38 = recFN_from_fN_in_1_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_1_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_39 = recFN_from_fN_in_1_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_1_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_40 = recFN_from_fN_in_1_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_1_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_41 = recFN_from_fN_in_1_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_1_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_42 = recFN_from_fN_in_1_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_1_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_43 = recFN_from_fN_in_1_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_1_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_1_rawIn_normDist = recFN_from_fN_in_1_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_1_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_12 = {{31'd0}, recFN_from_fN_in_1_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_1_rawIn_subnormFract_T = _GEN_12 << recFN_from_fN_in_1_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_1_rawIn_subnormFract = {_recFN_from_fN_in_1_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_6 = {{4'd0}, recFN_from_fN_in_1_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T = _GEN_6 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_1_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_1_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_2 = recFN_from_fN_in_1_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_7 = {{6'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_7; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_8 = {{1'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_1_rawIn_adjustedExp = _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 + _GEN_8; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_1_rawIn_isZero = recFN_from_fN_in_1_rawIn_isZeroExpIn & recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_1_rawIn_isSpecial = recFN_from_fN_in_1_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_1_rawIn__isNaN = recFN_from_fN_in_1_rawIn_isSpecial & ~recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_1_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_1_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_1_rawIn_out_sig_T = ~recFN_from_fN_in_1_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_1_rawIn_out_sig_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    recFN_from_fN_in_1_rawIn_subnormFract : recFN_from_fN_in_1_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_1_rawIn__sig = {1'h0,_recFN_from_fN_in_1_rawIn_out_sig_T,
    _recFN_from_fN_in_1_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_1_T_1 = recFN_from_fN_in_1_rawIn_isZero ? 3'h0 : recFN_from_fN_in_1_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_9 = {{2'd0}, recFN_from_fN_in_1_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_1_T_3 = _recFN_from_fN_in_1_T_1 | _GEN_9; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_1_lo = {recFN_from_fN_in_1_rawIn__sExp[5:0],recFN_from_fN_in_1_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_1_hi = {recFN_from_fN_in_1_rawIn_sign,_recFN_from_fN_in_1_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_1; // @[MultPE.scala 47:37]
  wire [8:0] io_out_rawIn_exp = mulRecFN_io_out[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  io_out_rawIn_isZero = io_out_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  io_out_rawIn_isSpecial = io_out_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  io_out_rawIn__isNaN = io_out_rawIn_isSpecial & io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  io_out_rawIn__isInf = io_out_rawIn_isSpecial & ~io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  io_out_rawIn__sign = mulRecFN_io_out[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] io_out_rawIn__sExp = {1'b0,$signed(io_out_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _io_out_rawIn_out_sig_T = ~io_out_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [24:0] io_out_rawIn__sig = {1'h0,_io_out_rawIn_out_sig_T,mulRecFN_io_out[22:0]}; // @[Cat.scala 30:58]
  wire  io_out_isSubnormal = $signed(io_out_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] io_out_denormShiftDist = 5'h1 - io_out_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _io_out_denormFract_T_1 = io_out_rawIn__sig[24:1] >> io_out_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] io_out_denormFract = _io_out_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _io_out_expOut_T_2 = io_out_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _io_out_expOut_T_3 = io_out_isSubnormal ? 8'h0 : _io_out_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _io_out_expOut_T_4 = io_out_rawIn__isNaN | io_out_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _io_out_expOut_T_6 = _io_out_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_out_expOut = _io_out_expOut_T_3 | _io_out_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _io_out_fractOut_T_1 = io_out_rawIn__isInf ? 23'h0 : io_out_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] io_out_fractOut = io_out_isSubnormal ? io_out_denormFract : _io_out_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] _io_out_T = {io_out_rawIn__sign,io_out_expOut,io_out_fractOut}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_0 = use_int ? _module_out_T_1 : {{31'd0}, module_out}; // @[MultPE.scala 29:16 35:16 27:27]
  wire [32:0] _GEN_1 = use_int ? module_out : {{1'd0}, _io_out_T}; // @[MultPE.scala 29:16 37:12 57:12]
  wire [63:0] _GEN_10 = reset ? 64'h0 : _GEN_0; // @[MultPE.scala 27:{27,27}]
  MulRecFN mulRecFN ( // @[MultPE.scala 50:26]
    .io_a(mulRecFN_io_a),
    .io_b(mulRecFN_io_b),
    .io_roundingMode(mulRecFN_io_roundingMode),
    .io_out(mulRecFN_io_out)
  );
  assign io_out = _GEN_1[31:0];
  assign mulRecFN_io_a = recFN_from_fN_in_0; // @[MultPE.scala 53:19]
  assign mulRecFN_io_b = recFN_from_fN_in_1; // @[MultPE.scala 54:19]
  assign mulRecFN_io_roundingMode = rounding; // @[MultPE.scala 51:32]
  always @(posedge clock) begin
    rounding <= io_rounding; // @[MultPE.scala 21:26]
    use_int <= io_use_int; // @[MultPE.scala 25:26]
    module_out <= _GEN_10[32:0]; // @[MultPE.scala 27:{27,27}]
    sign_in_0 <= io_in_0; // @[MultPE.scala 31:44]
    sign_in_1 <= io_in_1; // @[MultPE.scala 32:44]
    fN_in_0 <= io_in_0; // @[MultPE.scala 42:27]
    fN_in_1 <= io_in_1; // @[MultPE.scala 43:27]
    recFN_from_fN_in_0 <= {recFN_from_fN_in_0_hi,recFN_from_fN_in_0_lo}; // @[Cat.scala 30:58]
    recFN_from_fN_in_1 <= {recFN_from_fN_in_1_hi,recFN_from_fN_in_1_lo}; // @[Cat.scala 30:58]
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
  rounding = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  use_int = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  module_out = _RAND_2[32:0];
  _RAND_3 = {1{`RANDOM}};
  sign_in_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  sign_in_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  fN_in_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  fN_in_1 = _RAND_6[31:0];
  _RAND_7 = {2{`RANDOM}};
  recFN_from_fN_in_0 = _RAND_7[32:0];
  _RAND_8 = {2{`RANDOM}};
  recFN_from_fN_in_1 = _RAND_8[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddRawFN(
  input         io_subOp,
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  input  [2:0]  io_roundingMode,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  effSignB = io_b_sign ^ io_subOp; // @[AddRecFN.scala 60:30]
  wire  eqSigns = io_a_sign == effSignB; // @[AddRecFN.scala 61:29]
  wire  notEqSigns_signZero = io_roundingMode == 3'h2; // @[AddRecFN.scala 62:47]
  wire [9:0] sDiffExps = $signed(io_a_sExp) - $signed(io_b_sExp); // @[AddRecFN.scala 63:31]
  wire  _modNatAlignDist_T = $signed(sDiffExps) < 10'sh0; // @[AddRecFN.scala 64:41]
  wire [9:0] _modNatAlignDist_T_3 = $signed(io_b_sExp) - $signed(io_a_sExp); // @[AddRecFN.scala 64:58]
  wire [9:0] _modNatAlignDist_T_4 = $signed(sDiffExps) < 10'sh0 ? $signed(_modNatAlignDist_T_3) : $signed(sDiffExps); // @[AddRecFN.scala 64:30]
  wire [4:0] modNatAlignDist = _modNatAlignDist_T_4[4:0]; // @[AddRecFN.scala 64:81]
  wire [4:0] _isMaxAlign_T = sDiffExps[9:5]; // @[AddRecFN.scala 66:19]
  wire  _isMaxAlign_T_6 = $signed(_isMaxAlign_T) != -5'sh1 | sDiffExps[4:0] == 5'h0; // @[AddRecFN.scala 67:51]
  wire  isMaxAlign = $signed(_isMaxAlign_T) != 5'sh0 & _isMaxAlign_T_6; // @[AddRecFN.scala 66:45]
  wire [4:0] alignDist = isMaxAlign ? 5'h1f : modNatAlignDist; // @[AddRecFN.scala 68:24]
  wire  _closeSubMags_T = ~eqSigns; // @[AddRecFN.scala 69:24]
  wire  closeSubMags = ~eqSigns & ~isMaxAlign & modNatAlignDist <= 5'h1; // @[AddRecFN.scala 69:48]
  wire  _close_alignedSigA_T = 10'sh0 <= $signed(sDiffExps); // @[AddRecFN.scala 73:18]
  wire [26:0] _close_alignedSigA_T_3 = {io_a_sig, 2'h0}; // @[AddRecFN.scala 73:58]
  wire [26:0] _close_alignedSigA_T_4 = 10'sh0 <= $signed(sDiffExps) & sDiffExps[0] ? _close_alignedSigA_T_3 : 27'h0; // @[AddRecFN.scala 73:12]
  wire [25:0] _close_alignedSigA_T_9 = {io_a_sig, 1'h0}; // @[AddRecFN.scala 74:58]
  wire [25:0] _close_alignedSigA_T_10 = _close_alignedSigA_T & ~sDiffExps[0] ? _close_alignedSigA_T_9 : 26'h0; // @[AddRecFN.scala 74:12]
  wire [26:0] _GEN_0 = {{1'd0}, _close_alignedSigA_T_10}; // @[AddRecFN.scala 73:68]
  wire [26:0] _close_alignedSigA_T_11 = _close_alignedSigA_T_4 | _GEN_0; // @[AddRecFN.scala 73:68]
  wire [24:0] _close_alignedSigA_T_13 = _modNatAlignDist_T ? io_a_sig : 25'h0; // @[AddRecFN.scala 75:12]
  wire [26:0] _GEN_1 = {{2'd0}, _close_alignedSigA_T_13}; // @[AddRecFN.scala 74:68]
  wire [26:0] _close_sSigSum_T = _close_alignedSigA_T_11 | _GEN_1; // @[AddRecFN.scala 76:43]
  wire [25:0] _close_sSigSum_T_2 = {io_b_sig, 1'h0}; // @[AddRecFN.scala 76:66]
  wire [26:0] _GEN_2 = {{1{_close_sSigSum_T_2[25]}},_close_sSigSum_T_2}; // @[AddRecFN.scala 76:50]
  wire [26:0] close_sSigSum = $signed(_close_sSigSum_T) - $signed(_GEN_2); // @[AddRecFN.scala 76:50]
  wire  _close_sigSum_T = $signed(close_sSigSum) < 27'sh0; // @[AddRecFN.scala 77:42]
  wire [26:0] _close_sigSum_T_3 = 27'sh0 - $signed(close_sSigSum); // @[AddRecFN.scala 77:49]
  wire [26:0] _close_sigSum_T_4 = $signed(close_sSigSum) < 27'sh0 ? $signed(_close_sigSum_T_3) : $signed(close_sSigSum); // @[AddRecFN.scala 77:27]
  wire [25:0] close_sigSum = _close_sigSum_T_4[25:0]; // @[AddRecFN.scala 77:79]
  wire  close_reduced2SigSum_reducedVec_0 = |close_sigSum[1:0]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_1 = |close_sigSum[3:2]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_2 = |close_sigSum[5:4]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_3 = |close_sigSum[7:6]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_4 = |close_sigSum[9:8]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_5 = |close_sigSum[11:10]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_6 = |close_sigSum[13:12]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_7 = |close_sigSum[15:14]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_8 = |close_sigSum[17:16]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_9 = |close_sigSum[19:18]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_10 = |close_sigSum[21:20]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_11 = |close_sigSum[23:22]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_12 = |close_sigSum[25:24]; // @[primitives.scala 107:57]
  wire [5:0] close_reduced2SigSum_lo = {close_reduced2SigSum_reducedVec_5,close_reduced2SigSum_reducedVec_4,
    close_reduced2SigSum_reducedVec_3,close_reduced2SigSum_reducedVec_2,close_reduced2SigSum_reducedVec_1,
    close_reduced2SigSum_reducedVec_0}; // @[primitives.scala 108:20]
  wire [12:0] close_reduced2SigSum = {close_reduced2SigSum_reducedVec_12,close_reduced2SigSum_reducedVec_11,
    close_reduced2SigSum_reducedVec_10,close_reduced2SigSum_reducedVec_9,close_reduced2SigSum_reducedVec_8,
    close_reduced2SigSum_reducedVec_7,close_reduced2SigSum_reducedVec_6,close_reduced2SigSum_lo}; // @[primitives.scala 108:20]
  wire [3:0] _close_normDistReduced2_T_13 = close_reduced2SigSum[1] ? 4'hb : 4'hc; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_14 = close_reduced2SigSum[2] ? 4'ha : _close_normDistReduced2_T_13; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_15 = close_reduced2SigSum[3] ? 4'h9 : _close_normDistReduced2_T_14; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_16 = close_reduced2SigSum[4] ? 4'h8 : _close_normDistReduced2_T_15; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_17 = close_reduced2SigSum[5] ? 4'h7 : _close_normDistReduced2_T_16; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_18 = close_reduced2SigSum[6] ? 4'h6 : _close_normDistReduced2_T_17; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_19 = close_reduced2SigSum[7] ? 4'h5 : _close_normDistReduced2_T_18; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_20 = close_reduced2SigSum[8] ? 4'h4 : _close_normDistReduced2_T_19; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_21 = close_reduced2SigSum[9] ? 4'h3 : _close_normDistReduced2_T_20; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_22 = close_reduced2SigSum[10] ? 4'h2 : _close_normDistReduced2_T_21; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_23 = close_reduced2SigSum[11] ? 4'h1 : _close_normDistReduced2_T_22; // @[Mux.scala 47:69]
  wire [3:0] close_normDistReduced2 = close_reduced2SigSum[12] ? 4'h0 : _close_normDistReduced2_T_23; // @[Mux.scala 47:69]
  wire [4:0] close_nearNormDist = {close_normDistReduced2, 1'h0}; // @[AddRecFN.scala 81:53]
  wire [56:0] _GEN_7 = {{31'd0}, close_sigSum}; // @[AddRecFN.scala 82:38]
  wire [56:0] _close_sigOut_T = _GEN_7 << close_nearNormDist; // @[AddRecFN.scala 82:38]
  wire [57:0] _close_sigOut_T_1 = {_close_sigOut_T, 1'h0}; // @[AddRecFN.scala 82:59]
  wire [26:0] close_sigOut = _close_sigOut_T_1[26:0]; // @[AddRecFN.scala 82:63]
  wire  close_totalCancellation = ~(|close_sigOut[26:25]); // @[AddRecFN.scala 83:35]
  wire  close_notTotalCancellation_signOut = io_a_sign ^ _close_sigSum_T; // @[AddRecFN.scala 84:56]
  wire  far_signOut = _modNatAlignDist_T ? effSignB : io_a_sign; // @[AddRecFN.scala 87:26]
  wire [24:0] _far_sigLarger_T_1 = _modNatAlignDist_T ? io_b_sig : io_a_sig; // @[AddRecFN.scala 88:29]
  wire [23:0] far_sigLarger = _far_sigLarger_T_1[23:0]; // @[AddRecFN.scala 88:66]
  wire [24:0] _far_sigSmaller_T_1 = _modNatAlignDist_T ? io_a_sig : io_b_sig; // @[AddRecFN.scala 89:29]
  wire [23:0] far_sigSmaller = _far_sigSmaller_T_1[23:0]; // @[AddRecFN.scala 89:66]
  wire [28:0] _far_mainAlignedSigSmaller_T = {far_sigSmaller, 5'h0}; // @[AddRecFN.scala 90:52]
  wire [28:0] far_mainAlignedSigSmaller = _far_mainAlignedSigSmaller_T >> alignDist; // @[AddRecFN.scala 90:56]
  wire [25:0] _far_reduced4SigSmaller_T = {far_sigSmaller, 2'h0}; // @[AddRecFN.scala 91:60]
  wire  far_reduced4SigSmaller_reducedVec_0 = |_far_reduced4SigSmaller_T[3:0]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_1 = |_far_reduced4SigSmaller_T[7:4]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_2 = |_far_reduced4SigSmaller_T[11:8]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_3 = |_far_reduced4SigSmaller_T[15:12]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_4 = |_far_reduced4SigSmaller_T[19:16]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_5 = |_far_reduced4SigSmaller_T[23:20]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_6 = |_far_reduced4SigSmaller_T[25:24]; // @[primitives.scala 124:57]
  wire [6:0] far_reduced4SigSmaller = {far_reduced4SigSmaller_reducedVec_6,far_reduced4SigSmaller_reducedVec_5,
    far_reduced4SigSmaller_reducedVec_4,far_reduced4SigSmaller_reducedVec_3,far_reduced4SigSmaller_reducedVec_2,
    far_reduced4SigSmaller_reducedVec_1,far_reduced4SigSmaller_reducedVec_0}; // @[primitives.scala 125:20]
  wire [8:0] far_roundExtraMask_shift = 9'sh100 >>> alignDist[4:2]; // @[primitives.scala 77:58]
  wire [6:0] far_roundExtraMask = {far_roundExtraMask_shift[1],far_roundExtraMask_shift[2],far_roundExtraMask_shift[3],
    far_roundExtraMask_shift[4],far_roundExtraMask_shift[5],far_roundExtraMask_shift[6],far_roundExtraMask_shift[7]}; // @[Cat.scala 30:58]
  wire [6:0] _far_alignedSigSmaller_T_3 = far_reduced4SigSmaller & far_roundExtraMask; // @[AddRecFN.scala 95:76]
  wire  _far_alignedSigSmaller_T_5 = |far_mainAlignedSigSmaller[2:0] | |_far_alignedSigSmaller_T_3; // @[AddRecFN.scala 95:49]
  wire [26:0] far_alignedSigSmaller = {far_mainAlignedSigSmaller[28:3],_far_alignedSigSmaller_T_5}; // @[Cat.scala 30:58]
  wire [26:0] _far_negAlignedSigSmaller_T = ~far_alignedSigSmaller; // @[AddRecFN.scala 97:62]
  wire [27:0] _far_negAlignedSigSmaller_T_1 = {1'h1,_far_negAlignedSigSmaller_T}; // @[Cat.scala 30:58]
  wire [27:0] far_negAlignedSigSmaller = _closeSubMags_T ? _far_negAlignedSigSmaller_T_1 : {{1'd0},
    far_alignedSigSmaller}; // @[AddRecFN.scala 97:39]
  wire [26:0] _far_sigSum_T = {far_sigLarger, 3'h0}; // @[AddRecFN.scala 98:36]
  wire [27:0] _GEN_3 = {{1'd0}, _far_sigSum_T}; // @[AddRecFN.scala 98:41]
  wire [27:0] _far_sigSum_T_2 = _GEN_3 + far_negAlignedSigSmaller; // @[AddRecFN.scala 98:41]
  wire [27:0] _GEN_4 = {{27'd0}, _closeSubMags_T}; // @[AddRecFN.scala 98:68]
  wire [27:0] far_sigSum = _far_sigSum_T_2 + _GEN_4; // @[AddRecFN.scala 98:68]
  wire [26:0] _GEN_5 = {{26'd0}, far_sigSum[0]}; // @[AddRecFN.scala 99:67]
  wire [26:0] _far_sigOut_T_2 = far_sigSum[27:1] | _GEN_5; // @[AddRecFN.scala 99:67]
  wire [27:0] _far_sigOut_T_3 = _closeSubMags_T ? far_sigSum : {{1'd0}, _far_sigOut_T_2}; // @[AddRecFN.scala 99:25]
  wire [26:0] far_sigOut = _far_sigOut_T_3[26:0]; // @[AddRecFN.scala 99:83]
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isInf & _closeSubMags_T; // @[AddRecFN.scala 102:57]
  wire  notNaN_isInfOut = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  wire  addZeros = io_a_isZero & io_b_isZero; // @[AddRecFN.scala 104:32]
  wire  notNaN_specialCase = notNaN_isInfOut | addZeros; // @[AddRecFN.scala 105:46]
  wire  notNaN_isZeroOut = addZeros | ~notNaN_isInfOut & closeSubMags & close_totalCancellation; // @[AddRecFN.scala 106:37]
  wire  _notNaN_signOut_T_1 = io_a_isInf & io_a_sign; // @[AddRecFN.scala 109:39]
  wire  _notNaN_signOut_T_2 = eqSigns & io_a_sign | _notNaN_signOut_T_1; // @[AddRecFN.scala 108:63]
  wire  _notNaN_signOut_T_3 = io_b_isInf & effSignB; // @[AddRecFN.scala 110:39]
  wire  _notNaN_signOut_T_4 = _notNaN_signOut_T_2 | _notNaN_signOut_T_3; // @[AddRecFN.scala 109:63]
  wire  _notNaN_signOut_T_7 = notNaN_isZeroOut & _closeSubMags_T & notEqSigns_signZero; // @[AddRecFN.scala 111:39]
  wire  _notNaN_signOut_T_8 = _notNaN_signOut_T_4 | _notNaN_signOut_T_7; // @[AddRecFN.scala 110:63]
  wire  _notNaN_signOut_T_9 = ~notNaN_specialCase; // @[AddRecFN.scala 112:10]
  wire  _notNaN_signOut_T_12 = ~notNaN_specialCase & closeSubMags & ~close_totalCancellation; // @[AddRecFN.scala 112:46]
  wire  _notNaN_signOut_T_13 = _notNaN_signOut_T_12 & close_notTotalCancellation_signOut; // @[AddRecFN.scala 113:38]
  wire  _notNaN_signOut_T_14 = _notNaN_signOut_T_8 | _notNaN_signOut_T_13; // @[AddRecFN.scala 111:63]
  wire  _notNaN_signOut_T_18 = _notNaN_signOut_T_9 & ~closeSubMags & far_signOut; // @[AddRecFN.scala 114:47]
  wire [9:0] _common_sExpOut_T_2 = closeSubMags | _modNatAlignDist_T ? $signed(io_b_sExp) : $signed(io_a_sExp); // @[AddRecFN.scala 116:13]
  wire [4:0] _common_sExpOut_T_3 = closeSubMags ? close_nearNormDist : {{4'd0}, _closeSubMags_T}; // @[AddRecFN.scala 117:18]
  wire [5:0] _common_sExpOut_T_4 = {1'b0,$signed(_common_sExpOut_T_3)}; // @[AddRecFN.scala 117:66]
  wire [9:0] _GEN_6 = {{4{_common_sExpOut_T_4[5]}},_common_sExpOut_T_4}; // @[AddRecFN.scala 117:13]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[22]; // @[common.scala 84:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[22]; // @[common.scala 84:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[AddRecFN.scala 121:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[AddRecFN.scala 125:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  assign io_rawOut_isZero = addZeros | ~notNaN_isInfOut & closeSubMags & close_totalCancellation; // @[AddRecFN.scala 106:37]
  assign io_rawOut_sign = _notNaN_signOut_T_14 | _notNaN_signOut_T_18; // @[AddRecFN.scala 113:77]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - $signed(_GEN_6); // @[AddRecFN.scala 117:13]
  assign io_rawOut_sig = closeSubMags ? close_sigOut : far_sigOut; // @[AddRecFN.scala 118:28]
endmodule
module AddRecFN(
  input         io_subOp,
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  addRawFN__io_subOp; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_sign; // @[AddRecFN.scala 147:26]
  wire [9:0] addRawFN__io_a_sExp; // @[AddRecFN.scala 147:26]
  wire [24:0] addRawFN__io_a_sig; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_sign; // @[AddRecFN.scala 147:26]
  wire [9:0] addRawFN__io_b_sExp; // @[AddRecFN.scala 147:26]
  wire [24:0] addRawFN__io_b_sig; // @[AddRecFN.scala 147:26]
  wire [2:0] addRawFN__io_roundingMode; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_invalidExc; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_sign; // @[AddRecFN.scala 147:26]
  wire [9:0] addRawFN__io_rawOut_sExp; // @[AddRecFN.scala 147:26]
  wire [26:0] addRawFN__io_rawOut_sig; // @[AddRecFN.scala 147:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[AddRecFN.scala 157:15]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[AddRecFN.scala 157:15]
  wire [26:0] roundRawFNToRecFN_io_in_sig; // @[AddRecFN.scala 157:15]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[AddRecFN.scala 157:15]
  wire [32:0] roundRawFNToRecFN_io_out; // @[AddRecFN.scala 157:15]
  wire [8:0] addRawFN_io_a_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  addRawFN_io_a_isZero = addRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  addRawFN_io_a_isSpecial = addRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _addRawFN_io_a_out_sig_T = ~addRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] addRawFN_io_a_out_sig_hi = {1'h0,_addRawFN_io_a_out_sig_T}; // @[Cat.scala 30:58]
  wire [8:0] addRawFN_io_b_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  addRawFN_io_b_isZero = addRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  addRawFN_io_b_isSpecial = addRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _addRawFN_io_b_out_sig_T = ~addRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] addRawFN_io_b_out_sig_hi = {1'h0,_addRawFN_io_b_out_sig_T}; // @[Cat.scala 30:58]
  AddRawFN addRawFN_ ( // @[AddRecFN.scala 147:26]
    .io_subOp(addRawFN__io_subOp),
    .io_a_isNaN(addRawFN__io_a_isNaN),
    .io_a_isInf(addRawFN__io_a_isInf),
    .io_a_isZero(addRawFN__io_a_isZero),
    .io_a_sign(addRawFN__io_a_sign),
    .io_a_sExp(addRawFN__io_a_sExp),
    .io_a_sig(addRawFN__io_a_sig),
    .io_b_isNaN(addRawFN__io_b_isNaN),
    .io_b_isInf(addRawFN__io_b_isInf),
    .io_b_isZero(addRawFN__io_b_isZero),
    .io_b_sign(addRawFN__io_b_sign),
    .io_b_sExp(addRawFN__io_b_sExp),
    .io_b_sig(addRawFN__io_b_sig),
    .io_roundingMode(addRawFN__io_roundingMode),
    .io_invalidExc(addRawFN__io_invalidExc),
    .io_rawOut_isNaN(addRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(addRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(addRawFN__io_rawOut_isZero),
    .io_rawOut_sign(addRawFN__io_rawOut_sign),
    .io_rawOut_sExp(addRawFN__io_rawOut_sExp),
    .io_rawOut_sig(addRawFN__io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[AddRecFN.scala 157:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[AddRecFN.scala 163:23]
  assign addRawFN__io_subOp = io_subOp; // @[AddRecFN.scala 149:30]
  assign addRawFN__io_a_isNaN = addRawFN_io_a_isSpecial & addRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN__io_a_isInf = addRawFN_io_a_isSpecial & ~addRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN__io_a_isZero = addRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN__io_a_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN__io_a_sExp = {1'b0,$signed(addRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN__io_a_sig = {addRawFN_io_a_out_sig_hi,io_a[22:0]}; // @[Cat.scala 30:58]
  assign addRawFN__io_b_isNaN = addRawFN_io_b_isSpecial & addRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN__io_b_isInf = addRawFN_io_b_isSpecial & ~addRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN__io_b_isZero = addRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN__io_b_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN__io_b_sExp = {1'b0,$signed(addRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN__io_b_sig = {addRawFN_io_b_out_sig_hi,io_b[22:0]}; // @[Cat.scala 30:58]
  assign addRawFN__io_roundingMode = io_roundingMode; // @[AddRecFN.scala 152:30]
  assign roundRawFNToRecFN_io_invalidExc = addRawFN__io_invalidExc; // @[AddRecFN.scala 158:39]
  assign roundRawFNToRecFN_io_in_isNaN = addRawFN__io_rawOut_isNaN; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isInf = addRawFN__io_rawOut_isInf; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isZero = addRawFN__io_rawOut_isZero; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sign = addRawFN__io_rawOut_sign; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sExp = addRawFN__io_rawOut_sExp; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sig = addRawFN__io_rawOut_sig; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_roundingMode = io_roundingMode; // @[AddRecFN.scala 161:39]
endmodule
module AddSubPE(
  input         clock,
  input         reset,
  input         io_use_int,
  input         io_op,
  input  [2:0]  io_rounding,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  addRecFN_io_subOp; // @[AddSubPE.scala 57:26]
  wire [32:0] addRecFN_io_a; // @[AddSubPE.scala 57:26]
  wire [32:0] addRecFN_io_b; // @[AddSubPE.scala 57:26]
  wire [2:0] addRecFN_io_roundingMode; // @[AddSubPE.scala 57:26]
  wire [32:0] addRecFN_io_out; // @[AddSubPE.scala 57:26]
  reg [2:0] rounding; // @[AddSubPE.scala 22:26]
  reg  op; // @[AddSubPE.scala 26:27]
  reg  use_int; // @[AddSubPE.scala 28:27]
  reg [32:0] module_out; // @[AddSubPE.scala 30:27]
  reg [31:0] sign_in_0; // @[AddSubPE.scala 34:29]
  reg [31:0] sign_in_1; // @[AddSubPE.scala 35:29]
  wire [31:0] _module_out_T_3 = $signed(sign_in_0) - $signed(sign_in_1); // @[AddSubPE.scala 39:51]
  wire [31:0] _module_out_T_7 = $signed(sign_in_0) + $signed(sign_in_1); // @[AddSubPE.scala 41:51]
  wire [31:0] _GEN_0 = op ? _module_out_T_3 : _module_out_T_7; // @[AddSubPE.scala 38:17 39:18 41:18]
  reg [31:0] fN_in_0; // @[AddSubPE.scala 49:27]
  reg [31:0] fN_in_1; // @[AddSubPE.scala 50:27]
  wire  recFN_from_fN_in_0_rawIn_sign = fN_in_0[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_0_rawIn_expIn = fN_in_0[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_0_rawIn_fractIn = fN_in_0[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_0_rawIn_isZeroExpIn = recFN_from_fN_in_0_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_0_rawIn_isZeroFractIn = recFN_from_fN_in_0_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_23 = recFN_from_fN_in_0_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_24 = recFN_from_fN_in_0_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_0_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_25 = recFN_from_fN_in_0_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_0_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_26 = recFN_from_fN_in_0_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_0_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_27 = recFN_from_fN_in_0_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_0_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_28 = recFN_from_fN_in_0_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_0_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_29 = recFN_from_fN_in_0_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_0_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_30 = recFN_from_fN_in_0_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_0_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_31 = recFN_from_fN_in_0_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_0_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_32 = recFN_from_fN_in_0_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_0_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_33 = recFN_from_fN_in_0_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_0_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_34 = recFN_from_fN_in_0_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_0_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_35 = recFN_from_fN_in_0_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_0_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_36 = recFN_from_fN_in_0_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_0_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_37 = recFN_from_fN_in_0_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_0_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_38 = recFN_from_fN_in_0_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_0_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_39 = recFN_from_fN_in_0_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_0_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_40 = recFN_from_fN_in_0_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_0_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_41 = recFN_from_fN_in_0_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_0_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_42 = recFN_from_fN_in_0_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_0_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_43 = recFN_from_fN_in_0_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_0_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_0_rawIn_normDist = recFN_from_fN_in_0_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_0_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_11 = {{31'd0}, recFN_from_fN_in_0_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_0_rawIn_subnormFract_T = _GEN_11 << recFN_from_fN_in_0_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_0_rawIn_subnormFract = {_recFN_from_fN_in_0_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_3 = {{4'd0}, recFN_from_fN_in_0_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T = _GEN_3 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_0_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_0_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_2 = recFN_from_fN_in_0_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_4 = {{6'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_4; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_5 = {{1'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_0_rawIn_adjustedExp = _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 + _GEN_5; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_0_rawIn_isZero = recFN_from_fN_in_0_rawIn_isZeroExpIn & recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_0_rawIn_isSpecial = recFN_from_fN_in_0_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_0_rawIn__isNaN = recFN_from_fN_in_0_rawIn_isSpecial & ~recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_0_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_0_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_0_rawIn_out_sig_T = ~recFN_from_fN_in_0_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_0_rawIn_out_sig_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    recFN_from_fN_in_0_rawIn_subnormFract : recFN_from_fN_in_0_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_0_rawIn__sig = {1'h0,_recFN_from_fN_in_0_rawIn_out_sig_T,
    _recFN_from_fN_in_0_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_0_T_1 = recFN_from_fN_in_0_rawIn_isZero ? 3'h0 : recFN_from_fN_in_0_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_6 = {{2'd0}, recFN_from_fN_in_0_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_0_T_3 = _recFN_from_fN_in_0_T_1 | _GEN_6; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_0_lo = {recFN_from_fN_in_0_rawIn__sExp[5:0],recFN_from_fN_in_0_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_0_hi = {recFN_from_fN_in_0_rawIn_sign,_recFN_from_fN_in_0_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_0; // @[AddSubPE.scala 53:37]
  wire  recFN_from_fN_in_1_rawIn_sign = fN_in_1[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_1_rawIn_expIn = fN_in_1[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_1_rawIn_fractIn = fN_in_1[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_1_rawIn_isZeroExpIn = recFN_from_fN_in_1_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_1_rawIn_isZeroFractIn = recFN_from_fN_in_1_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_23 = recFN_from_fN_in_1_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_24 = recFN_from_fN_in_1_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_1_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_25 = recFN_from_fN_in_1_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_1_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_26 = recFN_from_fN_in_1_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_1_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_27 = recFN_from_fN_in_1_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_1_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_28 = recFN_from_fN_in_1_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_1_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_29 = recFN_from_fN_in_1_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_1_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_30 = recFN_from_fN_in_1_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_1_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_31 = recFN_from_fN_in_1_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_1_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_32 = recFN_from_fN_in_1_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_1_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_33 = recFN_from_fN_in_1_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_1_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_34 = recFN_from_fN_in_1_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_1_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_35 = recFN_from_fN_in_1_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_1_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_36 = recFN_from_fN_in_1_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_1_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_37 = recFN_from_fN_in_1_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_1_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_38 = recFN_from_fN_in_1_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_1_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_39 = recFN_from_fN_in_1_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_1_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_40 = recFN_from_fN_in_1_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_1_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_41 = recFN_from_fN_in_1_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_1_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_42 = recFN_from_fN_in_1_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_1_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_43 = recFN_from_fN_in_1_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_1_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_1_rawIn_normDist = recFN_from_fN_in_1_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_1_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_12 = {{31'd0}, recFN_from_fN_in_1_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_1_rawIn_subnormFract_T = _GEN_12 << recFN_from_fN_in_1_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_1_rawIn_subnormFract = {_recFN_from_fN_in_1_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_7 = {{4'd0}, recFN_from_fN_in_1_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T = _GEN_7 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_1_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_1_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_2 = recFN_from_fN_in_1_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_8 = {{6'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_8; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_9 = {{1'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_1_rawIn_adjustedExp = _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 + _GEN_9; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_1_rawIn_isZero = recFN_from_fN_in_1_rawIn_isZeroExpIn & recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_1_rawIn_isSpecial = recFN_from_fN_in_1_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_1_rawIn__isNaN = recFN_from_fN_in_1_rawIn_isSpecial & ~recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_1_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_1_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_1_rawIn_out_sig_T = ~recFN_from_fN_in_1_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_1_rawIn_out_sig_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    recFN_from_fN_in_1_rawIn_subnormFract : recFN_from_fN_in_1_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_1_rawIn__sig = {1'h0,_recFN_from_fN_in_1_rawIn_out_sig_T,
    _recFN_from_fN_in_1_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_1_T_1 = recFN_from_fN_in_1_rawIn_isZero ? 3'h0 : recFN_from_fN_in_1_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_10 = {{2'd0}, recFN_from_fN_in_1_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_1_T_3 = _recFN_from_fN_in_1_T_1 | _GEN_10; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_1_lo = {recFN_from_fN_in_1_rawIn__sExp[5:0],recFN_from_fN_in_1_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_1_hi = {recFN_from_fN_in_1_rawIn_sign,_recFN_from_fN_in_1_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_1; // @[AddSubPE.scala 54:37]
  wire [8:0] io_out_rawIn_exp = addRecFN_io_out[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  io_out_rawIn_isZero = io_out_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  io_out_rawIn_isSpecial = io_out_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  io_out_rawIn__isNaN = io_out_rawIn_isSpecial & io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  io_out_rawIn__isInf = io_out_rawIn_isSpecial & ~io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  io_out_rawIn__sign = addRecFN_io_out[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] io_out_rawIn__sExp = {1'b0,$signed(io_out_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _io_out_rawIn_out_sig_T = ~io_out_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [24:0] io_out_rawIn__sig = {1'h0,_io_out_rawIn_out_sig_T,addRecFN_io_out[22:0]}; // @[Cat.scala 30:58]
  wire  io_out_isSubnormal = $signed(io_out_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] io_out_denormShiftDist = 5'h1 - io_out_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _io_out_denormFract_T_1 = io_out_rawIn__sig[24:1] >> io_out_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] io_out_denormFract = _io_out_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _io_out_expOut_T_2 = io_out_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _io_out_expOut_T_3 = io_out_isSubnormal ? 8'h0 : _io_out_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _io_out_expOut_T_4 = io_out_rawIn__isNaN | io_out_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _io_out_expOut_T_6 = _io_out_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_out_expOut = _io_out_expOut_T_3 | _io_out_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _io_out_fractOut_T_1 = io_out_rawIn__isInf ? 23'h0 : io_out_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] io_out_fractOut = io_out_isSubnormal ? io_out_denormFract : _io_out_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] _io_out_T = {io_out_rawIn__sign,io_out_expOut,io_out_fractOut}; // @[Cat.scala 30:58]
  wire [32:0] _GEN_2 = use_int ? module_out : {{1'd0}, _io_out_T}; // @[AddSubPE.scala 32:16 44:12 65:12]
  AddRecFN addRecFN ( // @[AddSubPE.scala 57:26]
    .io_subOp(addRecFN_io_subOp),
    .io_a(addRecFN_io_a),
    .io_b(addRecFN_io_b),
    .io_roundingMode(addRecFN_io_roundingMode),
    .io_out(addRecFN_io_out)
  );
  assign io_out = _GEN_2[31:0];
  assign addRecFN_io_subOp = op; // @[AddSubPE.scala 58:23]
  assign addRecFN_io_a = recFN_from_fN_in_0; // @[AddSubPE.scala 61:19]
  assign addRecFN_io_b = recFN_from_fN_in_1; // @[AddSubPE.scala 62:19]
  assign addRecFN_io_roundingMode = rounding; // @[AddSubPE.scala 59:32]
  always @(posedge clock) begin
    rounding <= io_rounding; // @[AddSubPE.scala 22:26]
    op <= io_op; // @[AddSubPE.scala 26:27]
    use_int <= io_use_int; // @[AddSubPE.scala 28:27]
    if (reset) begin // @[AddSubPE.scala 30:27]
      module_out <= 33'h0; // @[AddSubPE.scala 30:27]
    end else if (use_int) begin // @[AddSubPE.scala 32:16]
      module_out <= {{1'd0}, _GEN_0};
    end
    sign_in_0 <= io_in_0; // @[AddSubPE.scala 34:44]
    sign_in_1 <= io_in_1; // @[AddSubPE.scala 35:44]
    fN_in_0 <= io_in_0; // @[AddSubPE.scala 49:27]
    fN_in_1 <= io_in_1; // @[AddSubPE.scala 50:27]
    recFN_from_fN_in_0 <= {recFN_from_fN_in_0_hi,recFN_from_fN_in_0_lo}; // @[Cat.scala 30:58]
    recFN_from_fN_in_1 <= {recFN_from_fN_in_1_hi,recFN_from_fN_in_1_lo}; // @[Cat.scala 30:58]
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
  rounding = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  op = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  use_int = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  module_out = _RAND_3[32:0];
  _RAND_4 = {1{`RANDOM}};
  sign_in_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  sign_in_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  fN_in_0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  fN_in_1 = _RAND_7[31:0];
  _RAND_8 = {2{`RANDOM}};
  recFN_from_fN_in_0 = _RAND_8[32:0];
  _RAND_9 = {2{`RANDOM}};
  recFN_from_fN_in_1 = _RAND_9[32:0];
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
  input  [31:0] io_aggr_0,
  input  [31:0] io_aggr_1,
  input  [31:0] io_aggr_2,
  input  [31:0] io_aggr_3,
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
  input  [2:0]  io_rounding,
  input         io_use_int,
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
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_REG_INIT
  wire  m_0_clock; // @[PE.scala 106:19]
  wire  m_0_reset; // @[PE.scala 106:19]
  wire [1:0] m_0_io_sel; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_0; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_1; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_2; // @[PE.scala 106:19]
  wire [31:0] m_0_io_out; // @[PE.scala 106:19]
  wire  m_1_clock; // @[PE.scala 107:19]
  wire  m_1_reset; // @[PE.scala 107:19]
  wire [1:0] m_1_io_sel; // @[PE.scala 107:19]
  wire [31:0] m_1_io_in_0; // @[PE.scala 107:19]
  wire [31:0] m_1_io_in_1; // @[PE.scala 107:19]
  wire [31:0] m_1_io_in_2; // @[PE.scala 107:19]
  wire [31:0] m_1_io_out; // @[PE.scala 107:19]
  wire  m_2_clock; // @[PE.scala 108:19]
  wire  m_2_reset; // @[PE.scala 108:19]
  wire [1:0] m_2_io_sel; // @[PE.scala 108:19]
  wire [31:0] m_2_io_in_0; // @[PE.scala 108:19]
  wire [31:0] m_2_io_in_1; // @[PE.scala 108:19]
  wire [31:0] m_2_io_in_2; // @[PE.scala 108:19]
  wire [31:0] m_2_io_out; // @[PE.scala 108:19]
  wire  m_3_clock; // @[PE.scala 109:19]
  wire  m_3_reset; // @[PE.scala 109:19]
  wire [1:0] m_3_io_sel; // @[PE.scala 109:19]
  wire [31:0] m_3_io_in_0; // @[PE.scala 109:19]
  wire [31:0] m_3_io_in_1; // @[PE.scala 109:19]
  wire [31:0] m_3_io_in_2; // @[PE.scala 109:19]
  wire [31:0] m_3_io_out; // @[PE.scala 109:19]
  wire  m_4_clock; // @[PE.scala 110:19]
  wire  m_4_reset; // @[PE.scala 110:19]
  wire [1:0] m_4_io_sel; // @[PE.scala 110:19]
  wire [31:0] m_4_io_in_0; // @[PE.scala 110:19]
  wire [31:0] m_4_io_in_1; // @[PE.scala 110:19]
  wire [31:0] m_4_io_in_2; // @[PE.scala 110:19]
  wire [31:0] m_4_io_out; // @[PE.scala 110:19]
  wire  m_5_clock; // @[PE.scala 111:19]
  wire  m_5_reset; // @[PE.scala 111:19]
  wire [1:0] m_5_io_sel; // @[PE.scala 111:19]
  wire [31:0] m_5_io_in_0; // @[PE.scala 111:19]
  wire [31:0] m_5_io_in_1; // @[PE.scala 111:19]
  wire [31:0] m_5_io_in_2; // @[PE.scala 111:19]
  wire [31:0] m_5_io_out; // @[PE.scala 111:19]
  wire  m_6_clock; // @[PE.scala 112:19]
  wire  m_6_reset; // @[PE.scala 112:19]
  wire [1:0] m_6_io_sel; // @[PE.scala 112:19]
  wire [31:0] m_6_io_in_0; // @[PE.scala 112:19]
  wire [31:0] m_6_io_in_1; // @[PE.scala 112:19]
  wire [31:0] m_6_io_in_2; // @[PE.scala 112:19]
  wire [31:0] m_6_io_out; // @[PE.scala 112:19]
  wire  m_7_clock; // @[PE.scala 113:19]
  wire  m_7_reset; // @[PE.scala 113:19]
  wire [1:0] m_7_io_sel; // @[PE.scala 113:19]
  wire [31:0] m_7_io_in_0; // @[PE.scala 113:19]
  wire [31:0] m_7_io_in_1; // @[PE.scala 113:19]
  wire [31:0] m_7_io_in_2; // @[PE.scala 113:19]
  wire [31:0] m_7_io_out; // @[PE.scala 113:19]
  wire  m_8_clock; // @[PE.scala 114:19]
  wire  m_8_reset; // @[PE.scala 114:19]
  wire [1:0] m_8_io_sel; // @[PE.scala 114:19]
  wire [31:0] m_8_io_in_0; // @[PE.scala 114:19]
  wire [31:0] m_8_io_in_1; // @[PE.scala 114:19]
  wire [31:0] m_8_io_in_2; // @[PE.scala 114:19]
  wire [31:0] m_8_io_out; // @[PE.scala 114:19]
  wire  m_9_clock; // @[PE.scala 115:19]
  wire  m_9_reset; // @[PE.scala 115:19]
  wire [1:0] m_9_io_sel; // @[PE.scala 115:19]
  wire [31:0] m_9_io_in_0; // @[PE.scala 115:19]
  wire [31:0] m_9_io_in_1; // @[PE.scala 115:19]
  wire [31:0] m_9_io_in_2; // @[PE.scala 115:19]
  wire [31:0] m_9_io_out; // @[PE.scala 115:19]
  wire  multModule_0_clock; // @[PE.scala 117:28]
  wire  multModule_0_reset; // @[PE.scala 117:28]
  wire  multModule_0_io_use_int; // @[PE.scala 117:28]
  wire [2:0] multModule_0_io_rounding; // @[PE.scala 117:28]
  wire [31:0] multModule_0_io_in_0; // @[PE.scala 117:28]
  wire [31:0] multModule_0_io_in_1; // @[PE.scala 117:28]
  wire [31:0] multModule_0_io_out; // @[PE.scala 117:28]
  wire  multModule_1_clock; // @[PE.scala 118:28]
  wire  multModule_1_reset; // @[PE.scala 118:28]
  wire  multModule_1_io_use_int; // @[PE.scala 118:28]
  wire [2:0] multModule_1_io_rounding; // @[PE.scala 118:28]
  wire [31:0] multModule_1_io_in_0; // @[PE.scala 118:28]
  wire [31:0] multModule_1_io_in_1; // @[PE.scala 118:28]
  wire [31:0] multModule_1_io_out; // @[PE.scala 118:28]
  wire  addsubModule_0_clock; // @[PE.scala 120:30]
  wire  addsubModule_0_reset; // @[PE.scala 120:30]
  wire  addsubModule_0_io_use_int; // @[PE.scala 120:30]
  wire  addsubModule_0_io_op; // @[PE.scala 120:30]
  wire [2:0] addsubModule_0_io_rounding; // @[PE.scala 120:30]
  wire [31:0] addsubModule_0_io_in_0; // @[PE.scala 120:30]
  wire [31:0] addsubModule_0_io_in_1; // @[PE.scala 120:30]
  wire [31:0] addsubModule_0_io_out; // @[PE.scala 120:30]
  wire  addsubModule_1_clock; // @[PE.scala 121:30]
  wire  addsubModule_1_reset; // @[PE.scala 121:30]
  wire  addsubModule_1_io_use_int; // @[PE.scala 121:30]
  wire  addsubModule_1_io_op; // @[PE.scala 121:30]
  wire [2:0] addsubModule_1_io_rounding; // @[PE.scala 121:30]
  wire [31:0] addsubModule_1_io_in_0; // @[PE.scala 121:30]
  wire [31:0] addsubModule_1_io_in_1; // @[PE.scala 121:30]
  wire [31:0] addsubModule_1_io_out; // @[PE.scala 121:30]
  reg [31:0] Xi_0; // @[PE.scala 47:22]
  reg [31:0] Yi_0; // @[PE.scala 48:22]
  reg [31:0] Xi_1; // @[PE.scala 49:22]
  reg [31:0] Yi_1; // @[PE.scala 50:22]
  reg [31:0] aggr_0; // @[PE.scala 55:24]
  reg [31:0] aggr_1; // @[PE.scala 56:24]
  reg [31:0] aggr_2; // @[PE.scala 57:24]
  reg [31:0] aggr_3; // @[PE.scala 58:24]
  reg [1:0] m_0_sel; // @[PE.scala 63:25]
  reg [1:0] m_1_sel; // @[PE.scala 64:25]
  reg [1:0] m_2_sel; // @[PE.scala 65:25]
  reg [1:0] m_3_sel; // @[PE.scala 66:25]
  reg [1:0] m_4_sel; // @[PE.scala 67:25]
  reg [1:0] m_5_sel; // @[PE.scala 68:25]
  reg [1:0] m_6_sel; // @[PE.scala 69:25]
  reg [1:0] m_7_sel; // @[PE.scala 70:25]
  reg [1:0] m_8_sel; // @[PE.scala 71:25]
  reg [1:0] m_9_sel; // @[PE.scala 72:25]
  reg  addsub_0_op; // @[PE.scala 74:29]
  reg  addsub_1_op; // @[PE.scala 75:29]
  reg [2:0] rounding; // @[PE.scala 78:29]
  reg  use_int; // @[PE.scala 82:29]
  reg [32:0] addsubModule_0_out; // @[PE.scala 87:36]
  reg [32:0] addsubModule_1_out; // @[PE.scala 88:36]
  reg [32:0] multModule_0_out; // @[PE.scala 89:36]
  reg [32:0] multModule_1_out; // @[PE.scala 90:36]
  reg [31:0] m_0_out; // @[PE.scala 92:24]
  reg [31:0] m_1_out; // @[PE.scala 93:24]
  reg [31:0] m_2_out; // @[PE.scala 94:24]
  reg [31:0] m_3_out; // @[PE.scala 95:24]
  reg [31:0] m_4_out; // @[PE.scala 96:24]
  reg [31:0] m_5_out; // @[PE.scala 97:24]
  reg [31:0] m_6_out; // @[PE.scala 98:24]
  reg [31:0] m_7_out; // @[PE.scala 99:24]
  reg [31:0] m_8_out; // @[PE.scala 100:24]
  reg [31:0] m_9_out; // @[PE.scala 101:24]
  MuxPE m_0 ( // @[PE.scala 106:19]
    .clock(m_0_clock),
    .reset(m_0_reset),
    .io_sel(m_0_io_sel),
    .io_in_0(m_0_io_in_0),
    .io_in_1(m_0_io_in_1),
    .io_in_2(m_0_io_in_2),
    .io_out(m_0_io_out)
  );
  MuxPE m_1 ( // @[PE.scala 107:19]
    .clock(m_1_clock),
    .reset(m_1_reset),
    .io_sel(m_1_io_sel),
    .io_in_0(m_1_io_in_0),
    .io_in_1(m_1_io_in_1),
    .io_in_2(m_1_io_in_2),
    .io_out(m_1_io_out)
  );
  MuxPE m_2 ( // @[PE.scala 108:19]
    .clock(m_2_clock),
    .reset(m_2_reset),
    .io_sel(m_2_io_sel),
    .io_in_0(m_2_io_in_0),
    .io_in_1(m_2_io_in_1),
    .io_in_2(m_2_io_in_2),
    .io_out(m_2_io_out)
  );
  MuxPE m_3 ( // @[PE.scala 109:19]
    .clock(m_3_clock),
    .reset(m_3_reset),
    .io_sel(m_3_io_sel),
    .io_in_0(m_3_io_in_0),
    .io_in_1(m_3_io_in_1),
    .io_in_2(m_3_io_in_2),
    .io_out(m_3_io_out)
  );
  MuxPE m_4 ( // @[PE.scala 110:19]
    .clock(m_4_clock),
    .reset(m_4_reset),
    .io_sel(m_4_io_sel),
    .io_in_0(m_4_io_in_0),
    .io_in_1(m_4_io_in_1),
    .io_in_2(m_4_io_in_2),
    .io_out(m_4_io_out)
  );
  MuxPE m_5 ( // @[PE.scala 111:19]
    .clock(m_5_clock),
    .reset(m_5_reset),
    .io_sel(m_5_io_sel),
    .io_in_0(m_5_io_in_0),
    .io_in_1(m_5_io_in_1),
    .io_in_2(m_5_io_in_2),
    .io_out(m_5_io_out)
  );
  MuxPE m_6 ( // @[PE.scala 112:19]
    .clock(m_6_clock),
    .reset(m_6_reset),
    .io_sel(m_6_io_sel),
    .io_in_0(m_6_io_in_0),
    .io_in_1(m_6_io_in_1),
    .io_in_2(m_6_io_in_2),
    .io_out(m_6_io_out)
  );
  MuxPE m_7 ( // @[PE.scala 113:19]
    .clock(m_7_clock),
    .reset(m_7_reset),
    .io_sel(m_7_io_sel),
    .io_in_0(m_7_io_in_0),
    .io_in_1(m_7_io_in_1),
    .io_in_2(m_7_io_in_2),
    .io_out(m_7_io_out)
  );
  MuxPE m_8 ( // @[PE.scala 114:19]
    .clock(m_8_clock),
    .reset(m_8_reset),
    .io_sel(m_8_io_sel),
    .io_in_0(m_8_io_in_0),
    .io_in_1(m_8_io_in_1),
    .io_in_2(m_8_io_in_2),
    .io_out(m_8_io_out)
  );
  MuxPE m_9 ( // @[PE.scala 115:19]
    .clock(m_9_clock),
    .reset(m_9_reset),
    .io_sel(m_9_io_sel),
    .io_in_0(m_9_io_in_0),
    .io_in_1(m_9_io_in_1),
    .io_in_2(m_9_io_in_2),
    .io_out(m_9_io_out)
  );
  MultPE multModule_0 ( // @[PE.scala 117:28]
    .clock(multModule_0_clock),
    .reset(multModule_0_reset),
    .io_use_int(multModule_0_io_use_int),
    .io_rounding(multModule_0_io_rounding),
    .io_in_0(multModule_0_io_in_0),
    .io_in_1(multModule_0_io_in_1),
    .io_out(multModule_0_io_out)
  );
  MultPE multModule_1 ( // @[PE.scala 118:28]
    .clock(multModule_1_clock),
    .reset(multModule_1_reset),
    .io_use_int(multModule_1_io_use_int),
    .io_rounding(multModule_1_io_rounding),
    .io_in_0(multModule_1_io_in_0),
    .io_in_1(multModule_1_io_in_1),
    .io_out(multModule_1_io_out)
  );
  AddSubPE addsubModule_0 ( // @[PE.scala 120:30]
    .clock(addsubModule_0_clock),
    .reset(addsubModule_0_reset),
    .io_use_int(addsubModule_0_io_use_int),
    .io_op(addsubModule_0_io_op),
    .io_rounding(addsubModule_0_io_rounding),
    .io_in_0(addsubModule_0_io_in_0),
    .io_in_1(addsubModule_0_io_in_1),
    .io_out(addsubModule_0_io_out)
  );
  AddSubPE addsubModule_1 ( // @[PE.scala 121:30]
    .clock(addsubModule_1_clock),
    .reset(addsubModule_1_reset),
    .io_use_int(addsubModule_1_io_use_int),
    .io_op(addsubModule_1_io_op),
    .io_rounding(addsubModule_1_io_rounding),
    .io_in_0(addsubModule_1_io_in_0),
    .io_in_1(addsubModule_1_io_in_1),
    .io_out(addsubModule_1_io_out)
  );
  assign io_out_0 = m_8_out; // @[PE.scala 245:12]
  assign io_out_1 = m_9_out; // @[PE.scala 246:12]
  assign m_0_clock = clock;
  assign m_0_reset = reset;
  assign m_0_io_sel = m_0_sel; // @[PE.scala 126:14]
  assign m_0_io_in_0 = Xi_0; // @[PE.scala 138:15]
  assign m_0_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 139:15]
  assign m_0_io_in_2 = 32'h0; // @[PE.scala 140:15]
  assign m_1_clock = clock;
  assign m_1_reset = reset;
  assign m_1_io_sel = m_1_sel; // @[PE.scala 127:14]
  assign m_1_io_in_0 = Yi_0; // @[PE.scala 144:15]
  assign m_1_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 145:15]
  assign m_1_io_in_2 = 32'h0; // @[PE.scala 146:15]
  assign m_2_clock = clock;
  assign m_2_reset = reset;
  assign m_2_io_sel = m_2_sel; // @[PE.scala 128:14]
  assign m_2_io_in_0 = Xi_1; // @[PE.scala 150:15]
  assign m_2_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 151:15]
  assign m_2_io_in_2 = 32'h0; // @[PE.scala 152:15]
  assign m_3_clock = clock;
  assign m_3_reset = reset;
  assign m_3_io_sel = m_3_sel; // @[PE.scala 129:14]
  assign m_3_io_in_0 = Yi_1; // @[PE.scala 156:15]
  assign m_3_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 157:15]
  assign m_3_io_in_2 = 32'h0; // @[PE.scala 158:15]
  assign m_4_clock = clock;
  assign m_4_reset = reset;
  assign m_4_io_sel = m_4_sel; // @[PE.scala 130:14]
  assign m_4_io_in_0 = Xi_0; // @[PE.scala 183:15]
  assign m_4_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 184:15]
  assign m_4_io_in_2 = aggr_0; // @[PE.scala 185:15]
  assign m_5_clock = clock;
  assign m_5_reset = reset;
  assign m_5_io_sel = m_5_sel; // @[PE.scala 131:14]
  assign m_5_io_in_0 = Yi_0; // @[PE.scala 189:15]
  assign m_5_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 190:15]
  assign m_5_io_in_2 = aggr_1; // @[PE.scala 191:15]
  assign m_6_clock = clock;
  assign m_6_reset = reset;
  assign m_6_io_sel = m_6_sel; // @[PE.scala 132:14]
  assign m_6_io_in_0 = Xi_1; // @[PE.scala 195:15]
  assign m_6_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 196:15]
  assign m_6_io_in_2 = aggr_2; // @[PE.scala 197:15]
  assign m_7_clock = clock;
  assign m_7_reset = reset;
  assign m_7_io_sel = m_7_sel; // @[PE.scala 133:14]
  assign m_7_io_in_0 = Yi_1; // @[PE.scala 201:15]
  assign m_7_io_in_1 = 32'h0; // @[PE.scala 202:15]
  assign m_7_io_in_2 = aggr_3; // @[PE.scala 203:15]
  assign m_8_clock = clock;
  assign m_8_reset = reset;
  assign m_8_io_sel = m_8_sel; // @[PE.scala 134:14]
  assign m_8_io_in_0 = addsubModule_0_out[31:0]; // @[PE.scala 230:15]
  assign m_8_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 231:15]
  assign m_8_io_in_2 = 32'h0; // @[PE.scala 232:15]
  assign m_9_clock = clock;
  assign m_9_reset = reset;
  assign m_9_io_sel = m_9_sel; // @[PE.scala 135:14]
  assign m_9_io_in_0 = addsubModule_1_out[31:0]; // @[PE.scala 236:15]
  assign m_9_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 237:15]
  assign m_9_io_in_2 = 32'h0; // @[PE.scala 238:15]
  assign multModule_0_clock = clock;
  assign multModule_0_reset = reset;
  assign multModule_0_io_use_int = use_int; // @[PE.scala 167:30]
  assign multModule_0_io_rounding = rounding; // @[PE.scala 165:30]
  assign multModule_0_io_in_0 = m_0_out; // @[PE.scala 168:24]
  assign multModule_0_io_in_1 = m_1_out; // @[PE.scala 169:24]
  assign multModule_1_clock = clock;
  assign multModule_1_reset = reset;
  assign multModule_1_io_use_int = use_int; // @[PE.scala 175:30]
  assign multModule_1_io_rounding = rounding; // @[PE.scala 173:30]
  assign multModule_1_io_in_0 = m_2_out; // @[PE.scala 176:24]
  assign multModule_1_io_in_1 = m_3_out; // @[PE.scala 177:24]
  assign addsubModule_0_clock = clock;
  assign addsubModule_0_reset = reset;
  assign addsubModule_0_io_use_int = use_int; // @[PE.scala 213:32]
  assign addsubModule_0_io_op = addsub_0_op; // @[PE.scala 210:32]
  assign addsubModule_0_io_rounding = rounding; // @[PE.scala 211:32]
  assign addsubModule_0_io_in_0 = m_4_out; // @[PE.scala 214:32]
  assign addsubModule_0_io_in_1 = m_5_out; // @[PE.scala 215:32]
  assign addsubModule_1_clock = clock;
  assign addsubModule_1_reset = reset;
  assign addsubModule_1_io_use_int = use_int; // @[PE.scala 222:32]
  assign addsubModule_1_io_op = addsub_1_op; // @[PE.scala 219:32]
  assign addsubModule_1_io_rounding = rounding; // @[PE.scala 220:32]
  assign addsubModule_1_io_in_0 = m_6_out; // @[PE.scala 223:32]
  assign addsubModule_1_io_in_1 = m_7_out; // @[PE.scala 224:32]
  always @(posedge clock) begin
    Xi_0 <= io_Xi_0; // @[PE.scala 47:22]
    Yi_0 <= io_Yi_0; // @[PE.scala 48:22]
    Xi_1 <= io_Xi_1; // @[PE.scala 49:22]
    Yi_1 <= io_Yi_1; // @[PE.scala 50:22]
    aggr_0 <= io_aggr_0; // @[PE.scala 55:24]
    aggr_1 <= io_aggr_1; // @[PE.scala 56:24]
    aggr_2 <= io_aggr_2; // @[PE.scala 57:24]
    aggr_3 <= io_aggr_3; // @[PE.scala 58:24]
    m_0_sel <= io_m_0_sel; // @[PE.scala 63:25]
    m_1_sel <= io_m_1_sel; // @[PE.scala 64:25]
    m_2_sel <= io_m_2_sel; // @[PE.scala 65:25]
    m_3_sel <= io_m_3_sel; // @[PE.scala 66:25]
    m_4_sel <= io_m_4_sel; // @[PE.scala 67:25]
    m_5_sel <= io_m_5_sel; // @[PE.scala 68:25]
    m_6_sel <= io_m_6_sel; // @[PE.scala 69:25]
    m_7_sel <= io_m_7_sel; // @[PE.scala 70:25]
    m_8_sel <= io_m_8_sel; // @[PE.scala 71:25]
    m_9_sel <= io_m_9_sel; // @[PE.scala 72:25]
    addsub_0_op <= io_addsub_0_op; // @[PE.scala 74:29]
    addsub_1_op <= io_addsub_1_op; // @[PE.scala 75:29]
    rounding <= io_rounding; // @[PE.scala 78:29]
    use_int <= io_use_int; // @[PE.scala 82:29]
    if (reset) begin // @[PE.scala 87:36]
      addsubModule_0_out <= 33'h0; // @[PE.scala 87:36]
    end else begin
      addsubModule_0_out <= {{1'd0}, addsubModule_0_io_out}; // @[PE.scala 216:23]
    end
    if (reset) begin // @[PE.scala 88:36]
      addsubModule_1_out <= 33'h0; // @[PE.scala 88:36]
    end else begin
      addsubModule_1_out <= {{1'd0}, addsubModule_1_io_out}; // @[PE.scala 225:23]
    end
    if (reset) begin // @[PE.scala 89:36]
      multModule_0_out <= 33'h0; // @[PE.scala 89:36]
    end else begin
      multModule_0_out <= {{1'd0}, multModule_0_io_out}; // @[PE.scala 170:21]
    end
    if (reset) begin // @[PE.scala 90:36]
      multModule_1_out <= 33'h0; // @[PE.scala 90:36]
    end else begin
      multModule_1_out <= {{1'd0}, multModule_1_io_out}; // @[PE.scala 178:21]
    end
    if (reset) begin // @[PE.scala 92:24]
      m_0_out <= 32'h0; // @[PE.scala 92:24]
    end else begin
      m_0_out <= m_0_io_out; // @[PE.scala 142:11]
    end
    if (reset) begin // @[PE.scala 93:24]
      m_1_out <= 32'h0; // @[PE.scala 93:24]
    end else begin
      m_1_out <= m_1_io_out; // @[PE.scala 148:11]
    end
    if (reset) begin // @[PE.scala 94:24]
      m_2_out <= 32'h0; // @[PE.scala 94:24]
    end else begin
      m_2_out <= m_2_io_out; // @[PE.scala 154:11]
    end
    if (reset) begin // @[PE.scala 95:24]
      m_3_out <= 32'h0; // @[PE.scala 95:24]
    end else begin
      m_3_out <= m_3_io_out; // @[PE.scala 160:11]
    end
    if (reset) begin // @[PE.scala 96:24]
      m_4_out <= 32'h0; // @[PE.scala 96:24]
    end else begin
      m_4_out <= m_4_io_out; // @[PE.scala 187:15]
    end
    if (reset) begin // @[PE.scala 97:24]
      m_5_out <= 32'h0; // @[PE.scala 97:24]
    end else begin
      m_5_out <= m_5_io_out; // @[PE.scala 193:15]
    end
    if (reset) begin // @[PE.scala 98:24]
      m_6_out <= 32'h0; // @[PE.scala 98:24]
    end else begin
      m_6_out <= m_6_io_out; // @[PE.scala 199:15]
    end
    if (reset) begin // @[PE.scala 99:24]
      m_7_out <= 32'h0; // @[PE.scala 99:24]
    end else begin
      m_7_out <= m_7_io_out; // @[PE.scala 205:15]
    end
    if (reset) begin // @[PE.scala 100:24]
      m_8_out <= 32'h0; // @[PE.scala 100:24]
    end else begin
      m_8_out <= m_8_io_out; // @[PE.scala 234:15]
    end
    if (reset) begin // @[PE.scala 101:24]
      m_9_out <= 32'h0; // @[PE.scala 101:24]
    end else begin
      m_9_out <= m_9_io_out; // @[PE.scala 240:15]
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
  aggr_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  aggr_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  aggr_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  aggr_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  m_0_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  m_1_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  m_2_sel = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  m_3_sel = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  m_4_sel = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  m_5_sel = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  m_6_sel = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  m_7_sel = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  m_8_sel = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  m_9_sel = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  addsub_0_op = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  addsub_1_op = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  rounding = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  use_int = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  addsubModule_0_out = _RAND_22[32:0];
  _RAND_23 = {2{`RANDOM}};
  addsubModule_1_out = _RAND_23[32:0];
  _RAND_24 = {2{`RANDOM}};
  multModule_0_out = _RAND_24[32:0];
  _RAND_25 = {2{`RANDOM}};
  multModule_1_out = _RAND_25[32:0];
  _RAND_26 = {1{`RANDOM}};
  m_0_out = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  m_1_out = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  m_2_out = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  m_3_out = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  m_4_out = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  m_5_out = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  m_6_out = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  m_7_out = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  m_8_out = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  m_9_out = _RAND_35[31:0];
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
  output [31:0] io_out
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
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
`endif // RANDOMIZE_REG_INIT
  wire  pe_0_clock; // @[PE_8.scala 201:20]
  wire  pe_0_reset; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_Xi_0; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_Yi_0; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_Xi_1; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_Yi_1; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_aggr_0; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_aggr_1; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_aggr_2; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_aggr_3; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_0_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_1_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_2_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_3_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_4_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_5_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_6_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_7_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_8_sel; // @[PE_8.scala 201:20]
  wire [1:0] pe_0_io_m_9_sel; // @[PE_8.scala 201:20]
  wire  pe_0_io_addsub_0_op; // @[PE_8.scala 201:20]
  wire  pe_0_io_addsub_1_op; // @[PE_8.scala 201:20]
  wire [2:0] pe_0_io_rounding; // @[PE_8.scala 201:20]
  wire  pe_0_io_use_int; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_out_0; // @[PE_8.scala 201:20]
  wire [31:0] pe_0_io_out_1; // @[PE_8.scala 201:20]
  wire  pe_1_clock; // @[PE_8.scala 229:20]
  wire  pe_1_reset; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_Xi_0; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_Yi_0; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_Xi_1; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_Yi_1; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_aggr_0; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_aggr_1; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_aggr_2; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_aggr_3; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_0_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_1_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_2_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_3_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_4_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_5_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_6_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_7_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_8_sel; // @[PE_8.scala 229:20]
  wire [1:0] pe_1_io_m_9_sel; // @[PE_8.scala 229:20]
  wire  pe_1_io_addsub_0_op; // @[PE_8.scala 229:20]
  wire  pe_1_io_addsub_1_op; // @[PE_8.scala 229:20]
  wire [2:0] pe_1_io_rounding; // @[PE_8.scala 229:20]
  wire  pe_1_io_use_int; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_out_0; // @[PE_8.scala 229:20]
  wire [31:0] pe_1_io_out_1; // @[PE_8.scala 229:20]
  wire  pe_2_clock; // @[PE_8.scala 257:20]
  wire  pe_2_reset; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_Xi_0; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_Yi_0; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_Xi_1; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_Yi_1; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_aggr_0; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_aggr_1; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_aggr_2; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_aggr_3; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_0_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_1_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_2_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_3_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_4_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_5_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_6_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_7_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_8_sel; // @[PE_8.scala 257:20]
  wire [1:0] pe_2_io_m_9_sel; // @[PE_8.scala 257:20]
  wire  pe_2_io_addsub_0_op; // @[PE_8.scala 257:20]
  wire  pe_2_io_addsub_1_op; // @[PE_8.scala 257:20]
  wire [2:0] pe_2_io_rounding; // @[PE_8.scala 257:20]
  wire  pe_2_io_use_int; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_out_0; // @[PE_8.scala 257:20]
  wire [31:0] pe_2_io_out_1; // @[PE_8.scala 257:20]
  wire  pe_3_clock; // @[PE_8.scala 284:20]
  wire  pe_3_reset; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_Xi_0; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_Yi_0; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_Xi_1; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_Yi_1; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_aggr_0; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_aggr_1; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_aggr_2; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_aggr_3; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_0_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_1_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_2_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_3_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_4_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_5_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_6_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_7_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_8_sel; // @[PE_8.scala 284:20]
  wire [1:0] pe_3_io_m_9_sel; // @[PE_8.scala 284:20]
  wire  pe_3_io_addsub_0_op; // @[PE_8.scala 284:20]
  wire  pe_3_io_addsub_1_op; // @[PE_8.scala 284:20]
  wire [2:0] pe_3_io_rounding; // @[PE_8.scala 284:20]
  wire  pe_3_io_use_int; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_out_0; // @[PE_8.scala 284:20]
  wire [31:0] pe_3_io_out_1; // @[PE_8.scala 284:20]
  wire  pe_4_clock; // @[PE_8.scala 312:20]
  wire  pe_4_reset; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_Xi_0; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_Yi_0; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_Xi_1; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_Yi_1; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_aggr_0; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_aggr_1; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_aggr_2; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_aggr_3; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_0_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_1_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_2_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_3_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_4_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_5_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_6_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_7_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_8_sel; // @[PE_8.scala 312:20]
  wire [1:0] pe_4_io_m_9_sel; // @[PE_8.scala 312:20]
  wire  pe_4_io_addsub_0_op; // @[PE_8.scala 312:20]
  wire  pe_4_io_addsub_1_op; // @[PE_8.scala 312:20]
  wire [2:0] pe_4_io_rounding; // @[PE_8.scala 312:20]
  wire  pe_4_io_use_int; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_out_0; // @[PE_8.scala 312:20]
  wire [31:0] pe_4_io_out_1; // @[PE_8.scala 312:20]
  wire  pe_5_clock; // @[PE_8.scala 340:20]
  wire  pe_5_reset; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_Xi_0; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_Yi_0; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_Xi_1; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_Yi_1; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_aggr_0; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_aggr_1; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_aggr_2; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_aggr_3; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_0_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_1_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_2_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_3_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_4_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_5_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_6_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_7_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_8_sel; // @[PE_8.scala 340:20]
  wire [1:0] pe_5_io_m_9_sel; // @[PE_8.scala 340:20]
  wire  pe_5_io_addsub_0_op; // @[PE_8.scala 340:20]
  wire  pe_5_io_addsub_1_op; // @[PE_8.scala 340:20]
  wire [2:0] pe_5_io_rounding; // @[PE_8.scala 340:20]
  wire  pe_5_io_use_int; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_out_0; // @[PE_8.scala 340:20]
  wire [31:0] pe_5_io_out_1; // @[PE_8.scala 340:20]
  wire  pe_6_clock; // @[PE_8.scala 368:20]
  wire  pe_6_reset; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_Xi_0; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_Yi_0; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_Xi_1; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_Yi_1; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_aggr_0; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_aggr_1; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_aggr_2; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_aggr_3; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_0_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_1_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_2_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_3_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_4_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_5_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_6_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_7_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_8_sel; // @[PE_8.scala 368:20]
  wire [1:0] pe_6_io_m_9_sel; // @[PE_8.scala 368:20]
  wire  pe_6_io_addsub_0_op; // @[PE_8.scala 368:20]
  wire  pe_6_io_addsub_1_op; // @[PE_8.scala 368:20]
  wire [2:0] pe_6_io_rounding; // @[PE_8.scala 368:20]
  wire  pe_6_io_use_int; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_out_0; // @[PE_8.scala 368:20]
  wire [31:0] pe_6_io_out_1; // @[PE_8.scala 368:20]
  wire  pe_7_clock; // @[PE_8.scala 395:20]
  wire  pe_7_reset; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_Xi_0; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_Yi_0; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_Xi_1; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_Yi_1; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_aggr_0; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_aggr_1; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_aggr_2; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_aggr_3; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_0_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_1_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_2_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_3_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_4_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_5_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_6_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_7_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_8_sel; // @[PE_8.scala 395:20]
  wire [1:0] pe_7_io_m_9_sel; // @[PE_8.scala 395:20]
  wire  pe_7_io_addsub_0_op; // @[PE_8.scala 395:20]
  wire  pe_7_io_addsub_1_op; // @[PE_8.scala 395:20]
  wire [2:0] pe_7_io_rounding; // @[PE_8.scala 395:20]
  wire  pe_7_io_use_int; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_out_0; // @[PE_8.scala 395:20]
  wire [31:0] pe_7_io_out_1; // @[PE_8.scala 395:20]
  wire  addsubModule_0_clock; // @[PE_8.scala 451:30]
  wire  addsubModule_0_reset; // @[PE_8.scala 451:30]
  wire  addsubModule_0_io_use_int; // @[PE_8.scala 451:30]
  wire  addsubModule_0_io_op; // @[PE_8.scala 451:30]
  wire [2:0] addsubModule_0_io_rounding; // @[PE_8.scala 451:30]
  wire [31:0] addsubModule_0_io_in_0; // @[PE_8.scala 451:30]
  wire [31:0] addsubModule_0_io_in_1; // @[PE_8.scala 451:30]
  wire [31:0] addsubModule_0_io_out; // @[PE_8.scala 451:30]
  reg [31:0] Xi_0_in_0; // @[PE_8.scala 64:27]
  reg [31:0] Yi_0_in_0; // @[PE_8.scala 65:27]
  reg [31:0] Xi_0_in_1; // @[PE_8.scala 66:27]
  reg [31:0] Yi_0_in_1; // @[PE_8.scala 67:27]
  reg [31:0] aggr_0_in_0; // @[PE_8.scala 68:29]
  reg [31:0] aggr_0_in_1; // @[PE_8.scala 69:29]
  reg [31:0] aggr_0_in_2; // @[PE_8.scala 70:29]
  reg [31:0] aggr_0_in_3; // @[PE_8.scala 71:29]
  reg [31:0] Xi_1_in_0; // @[PE_8.scala 73:27]
  reg [31:0] Yi_1_in_0; // @[PE_8.scala 74:27]
  reg [31:0] Xi_1_in_1; // @[PE_8.scala 75:27]
  reg [31:0] Yi_1_in_1; // @[PE_8.scala 76:27]
  reg [31:0] aggr_1_in_0; // @[PE_8.scala 77:29]
  reg [31:0] aggr_1_in_1; // @[PE_8.scala 78:29]
  reg [31:0] aggr_1_in_2; // @[PE_8.scala 79:29]
  reg [31:0] aggr_1_in_3; // @[PE_8.scala 80:29]
  reg [31:0] Xi_2_in_0; // @[PE_8.scala 82:27]
  reg [31:0] Yi_2_in_0; // @[PE_8.scala 83:27]
  reg [31:0] Xi_2_in_1; // @[PE_8.scala 84:27]
  reg [31:0] Yi_2_in_1; // @[PE_8.scala 85:27]
  reg [31:0] aggr_2_in_0; // @[PE_8.scala 86:29]
  reg [31:0] aggr_2_in_1; // @[PE_8.scala 87:29]
  reg [31:0] aggr_2_in_2; // @[PE_8.scala 88:29]
  reg [31:0] aggr_2_in_3; // @[PE_8.scala 89:29]
  reg [31:0] Xi_3_in_0; // @[PE_8.scala 91:27]
  reg [31:0] Yi_3_in_0; // @[PE_8.scala 92:27]
  reg [31:0] Xi_3_in_1; // @[PE_8.scala 93:27]
  reg [31:0] Yi_3_in_1; // @[PE_8.scala 94:27]
  reg [31:0] aggr_3_in_0; // @[PE_8.scala 95:29]
  reg [31:0] aggr_3_in_1; // @[PE_8.scala 96:29]
  reg [31:0] aggr_3_in_2; // @[PE_8.scala 97:29]
  reg [31:0] aggr_3_in_3; // @[PE_8.scala 98:29]
  reg [31:0] Xi_4_in_0; // @[PE_8.scala 100:27]
  reg [31:0] Yi_4_in_0; // @[PE_8.scala 101:27]
  reg [31:0] Xi_4_in_1; // @[PE_8.scala 102:27]
  reg [31:0] Yi_4_in_1; // @[PE_8.scala 103:27]
  reg [31:0] Xi_5_in_0; // @[PE_8.scala 109:27]
  reg [31:0] Yi_5_in_0; // @[PE_8.scala 110:27]
  reg [31:0] Xi_5_in_1; // @[PE_8.scala 111:27]
  reg [31:0] Yi_5_in_1; // @[PE_8.scala 112:27]
  reg [31:0] Xi_6_in_0; // @[PE_8.scala 118:27]
  reg [31:0] Yi_6_in_0; // @[PE_8.scala 119:27]
  reg [31:0] Xi_6_in_1; // @[PE_8.scala 120:27]
  reg [31:0] Yi_6_in_1; // @[PE_8.scala 121:27]
  reg [31:0] Xi_7_in_0; // @[PE_8.scala 127:27]
  reg [31:0] Yi_7_in_0; // @[PE_8.scala 128:27]
  reg [31:0] Xi_7_in_1; // @[PE_8.scala 129:27]
  reg [31:0] Yi_7_in_1; // @[PE_8.scala 130:27]
  reg [1:0] m_0_sel; // @[PE_8.scala 139:25]
  reg [1:0] m_1_sel; // @[PE_8.scala 140:25]
  reg [1:0] m_2_sel; // @[PE_8.scala 141:25]
  reg [1:0] m_3_sel; // @[PE_8.scala 142:25]
  reg [1:0] m_4_sel; // @[PE_8.scala 143:25]
  reg [1:0] m_5_sel; // @[PE_8.scala 144:25]
  reg [1:0] m_6_sel; // @[PE_8.scala 145:25]
  reg [1:0] m_7_sel; // @[PE_8.scala 146:25]
  reg [1:0] m_8_sel; // @[PE_8.scala 147:25]
  reg [1:0] m_9_sel; // @[PE_8.scala 148:25]
  reg [1:0] op_type; // @[PE_8.scala 150:26]
  reg [1:0] addsub_0_op; // @[PE_8.scala 153:30]
  reg [1:0] addsub_1_op; // @[PE_8.scala 154:30]
  reg [2:0] rounding; // @[PE_8.scala 157:29]
  reg  use_int; // @[PE_8.scala 161:29]
  reg [31:0] pe_0_out_0; // @[PE_8.scala 166:29]
  reg [31:0] pe_0_out_1; // @[PE_8.scala 167:29]
  reg [31:0] pe_1_out_0; // @[PE_8.scala 168:29]
  reg [31:0] pe_1_out_1; // @[PE_8.scala 169:29]
  reg [31:0] pe_2_out_0; // @[PE_8.scala 170:29]
  reg [31:0] pe_2_out_1; // @[PE_8.scala 171:29]
  reg [31:0] pe_3_out_0; // @[PE_8.scala 172:29]
  reg [31:0] pe_3_out_1; // @[PE_8.scala 173:29]
  reg [31:0] pe_4_out_0; // @[PE_8.scala 174:29]
  reg [31:0] pe_4_out_1; // @[PE_8.scala 175:29]
  reg [31:0] pe_5_out_0; // @[PE_8.scala 176:29]
  reg [31:0] pe_5_out_1; // @[PE_8.scala 177:29]
  reg [31:0] pe_6_out_0; // @[PE_8.scala 178:29]
  reg [31:0] pe_6_out_1; // @[PE_8.scala 179:29]
  reg [31:0] pe_7_out_0; // @[PE_8.scala 180:29]
  reg [31:0] pe_7_out_1; // @[PE_8.scala 181:29]
  reg [31:0] out; // @[PE_8.scala 184:29]
  reg [31:0] addsum_in_0; // @[PE_8.scala 189:28]
  reg [31:0] addsum_in_1; // @[PE_8.scala 190:28]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg [3:0] value_2; // @[Counter.scala 60:40]
  reg [3:0] value_3; // @[Counter.scala 60:40]
  reg [5:0] value_4; // @[Counter.scala 60:40]
  reg [2:0] pe_step; // @[PE_8.scala 484:25]
  wire [1:0] _GEN_1 = 2'h3 == op_type ? 2'h0 : m_0_sel; // @[PE_8.scala 497:9 577:21 139:25]
  wire [1:0] _GEN_2 = 2'h3 == op_type ? 2'h0 : m_1_sel; // @[PE_8.scala 497:9 578:21 140:25]
  wire [1:0] _GEN_3 = 2'h3 == op_type ? 2'h0 : m_2_sel; // @[PE_8.scala 497:9 579:21 141:25]
  wire [1:0] _GEN_4 = 2'h3 == op_type ? 2'h0 : m_3_sel; // @[PE_8.scala 497:9 580:21 142:25]
  wire [1:0] _GEN_5 = 2'h3 == op_type ? 2'h1 : m_4_sel; // @[PE_8.scala 497:9 582:21 143:25]
  wire [1:0] _GEN_6 = 2'h3 == op_type ? 2'h1 : m_5_sel; // @[PE_8.scala 497:9 583:21 144:25]
  wire [1:0] _GEN_7 = 2'h3 == op_type ? 2'h3 : m_6_sel; // @[PE_8.scala 497:9 584:21 145:25]
  wire [1:0] _GEN_8 = 2'h3 == op_type ? 2'h3 : m_7_sel; // @[PE_8.scala 497:9 585:21 146:25]
  wire [1:0] _GEN_9 = 2'h3 == op_type ? 2'h0 : m_8_sel; // @[PE_8.scala 497:9 588:21 147:25]
  wire [1:0] _GEN_10 = 2'h3 == op_type ? 2'h0 : m_9_sel; // @[PE_8.scala 497:9 589:21 148:25]
  wire [2:0] _GEN_11 = 2'h3 == op_type ? 3'h5 : pe_step; // @[PE_8.scala 497:9 591:21 484:25]
  wire [1:0] _GEN_13 = 2'h2 == op_type ? 2'h0 : addsub_0_op; // @[PE_8.scala 497:9 552:25 153:30]
  wire [1:0] _GEN_14 = 2'h2 == op_type ? 2'h0 : addsub_1_op; // @[PE_8.scala 497:9 553:25 154:30]
  wire [1:0] _GEN_15 = 2'h2 == op_type ? 2'h2 : _GEN_1; // @[PE_8.scala 497:9 555:21]
  wire [1:0] _GEN_16 = 2'h2 == op_type ? 2'h2 : _GEN_2; // @[PE_8.scala 497:9 556:21]
  wire [1:0] _GEN_17 = 2'h2 == op_type ? 2'h2 : _GEN_3; // @[PE_8.scala 497:9 557:21]
  wire [1:0] _GEN_18 = 2'h2 == op_type ? 2'h2 : _GEN_4; // @[PE_8.scala 497:9 558:21]
  wire [1:0] _GEN_19 = 2'h2 == op_type ? 2'h0 : _GEN_5; // @[PE_8.scala 497:9 560:21]
  wire [1:0] _GEN_20 = 2'h2 == op_type ? 2'h0 : _GEN_6; // @[PE_8.scala 497:9 561:21]
  wire [1:0] _GEN_21 = 2'h2 == op_type ? 2'h0 : _GEN_7; // @[PE_8.scala 497:9 562:21]
  wire [1:0] _GEN_22 = 2'h2 == op_type ? 2'h0 : _GEN_8; // @[PE_8.scala 497:9 563:21]
  wire [1:0] _GEN_23 = 2'h2 == op_type ? 2'h1 : _GEN_9; // @[PE_8.scala 497:9 566:21]
  wire [1:0] _GEN_24 = 2'h2 == op_type ? 2'h1 : _GEN_10; // @[PE_8.scala 497:9 567:21]
  wire [2:0] _GEN_25 = 2'h2 == op_type ? 3'h4 : _GEN_11; // @[PE_8.scala 497:9 569:21]
  wire [1:0] _GEN_27 = 2'h1 == op_type ? 2'h1 : _GEN_13; // @[PE_8.scala 497:9 531:25]
  wire [1:0] _GEN_28 = 2'h1 == op_type ? 2'h1 : _GEN_14; // @[PE_8.scala 497:9 532:25]
  wire [1:0] _GEN_29 = 2'h1 == op_type ? 2'h0 : _GEN_19; // @[PE_8.scala 497:9 534:21]
  wire [1:0] _GEN_30 = 2'h1 == op_type ? 2'h0 : _GEN_20; // @[PE_8.scala 497:9 535:21]
  wire [1:0] _GEN_31 = 2'h1 == op_type ? 2'h0 : _GEN_21; // @[PE_8.scala 497:9 536:21]
  wire [1:0] _GEN_32 = 2'h1 == op_type ? 2'h0 : _GEN_22; // @[PE_8.scala 497:9 537:21]
  wire [1:0] _GEN_33 = 2'h1 == op_type ? 2'h0 : _GEN_23; // @[PE_8.scala 497:9 540:21]
  wire [1:0] _GEN_34 = 2'h1 == op_type ? 2'h0 : _GEN_24; // @[PE_8.scala 497:9 541:21]
  wire [2:0] _GEN_35 = 2'h1 == op_type ? 3'h3 : _GEN_25; // @[PE_8.scala 497:9 543:21]
  wire [1:0] _GEN_36 = 2'h1 == op_type ? m_0_sel : _GEN_15; // @[PE_8.scala 139:25 497:9]
  wire [1:0] _GEN_37 = 2'h1 == op_type ? m_1_sel : _GEN_16; // @[PE_8.scala 140:25 497:9]
  wire [1:0] _GEN_38 = 2'h1 == op_type ? m_2_sel : _GEN_17; // @[PE_8.scala 141:25 497:9]
  wire [1:0] _GEN_39 = 2'h1 == op_type ? m_3_sel : _GEN_18; // @[PE_8.scala 142:25 497:9]
  wire  wrap = value_1 == 4'he; // @[Counter.scala 72:24]
  wire [3:0] _value_T_1 = value_1 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_54 = wrap ? 4'h0 : _value_T_1; // @[Counter.scala 76:15 86:{20,28}]
  wire [2:0] _GEN_55 = wrap ? 3'h6 : pe_step; // @[PE_8.scala 599:53 600:17 484:25]
  wire [3:0] _GEN_56 = wrap ? 4'h0 : _GEN_54; // @[PE_8.scala 599:53 Counter.scala 97:11]
  wire  wrap_1 = value == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _value_T_3 = value + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_57 = wrap_1 ? 4'h0 : _value_T_3; // @[Counter.scala 76:15 86:{20,28}]
  wire [2:0] _GEN_58 = wrap_1 ? 3'h6 : pe_step; // @[PE_8.scala 609:53 610:17 484:25]
  wire [3:0] _GEN_59 = wrap_1 ? 4'h0 : _GEN_57; // @[PE_8.scala 609:53 Counter.scala 97:11]
  wire  wrap_2 = value_2 == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _value_T_5 = value_2 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_60 = wrap_2 ? 4'h0 : _value_T_5; // @[Counter.scala 76:15 86:{20,28}]
  wire [2:0] _GEN_61 = wrap_2 ? 3'h6 : pe_step; // @[PE_8.scala 619:55 620:17 484:25]
  wire [3:0] _GEN_62 = wrap_2 ? 4'h0 : _GEN_60; // @[PE_8.scala 619:55 Counter.scala 97:11]
  wire  wrap_3 = value_3 == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _value_T_7 = value_3 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_63 = wrap_3 ? 4'h0 : _value_T_7; // @[Counter.scala 76:15 86:{20,28}]
  wire [2:0] _GEN_64 = wrap_3 ? 3'h6 : pe_step; // @[PE_8.scala 629:55 630:17 484:25]
  wire [3:0] _GEN_65 = wrap_3 ? 4'h0 : _GEN_63; // @[PE_8.scala 629:55 Counter.scala 97:11]
  wire  wrap_4 = value_4 == 6'h24; // @[Counter.scala 72:24]
  wire [5:0] _value_T_9 = value_4 + 6'h1; // @[Counter.scala 76:24]
  wire [5:0] _GEN_66 = wrap_4 ? 6'h0 : _value_T_9; // @[Counter.scala 76:15 86:{20,28}]
  wire [31:0] _GEN_67 = wrap_4 ? pe_0_out_0 : addsum_in_0; // @[PE_8.scala 656:57 658:21 189:28]
  wire [31:0] _GEN_68 = wrap_4 ? pe_0_out_1 : addsum_in_1; // @[PE_8.scala 656:57 659:21 190:28]
  wire [1:0] _GEN_69 = wrap_4 ? 2'h3 : m_4_sel; // @[PE_8.scala 656:57 661:17 143:25]
  wire [1:0] _GEN_70 = wrap_4 ? 2'h3 : m_5_sel; // @[PE_8.scala 656:57 662:17 144:25]
  wire [1:0] _GEN_71 = wrap_4 ? 2'h3 : m_6_sel; // @[PE_8.scala 656:57 663:17 145:25]
  wire [1:0] _GEN_72 = wrap_4 ? 2'h3 : m_7_sel; // @[PE_8.scala 656:57 664:17 146:25]
  wire [1:0] _GEN_73 = wrap_4 ? 2'h2 : m_8_sel; // @[PE_8.scala 656:57 665:17 147:25]
  wire [1:0] _GEN_74 = wrap_4 ? 2'h2 : m_9_sel; // @[PE_8.scala 656:57 666:17 148:25]
  wire [2:0] _GEN_75 = wrap_4 ? 3'h1 : pe_step; // @[PE_8.scala 656:57 668:17 484:25]
  wire [5:0] _GEN_76 = wrap_4 ? 6'h0 : _GEN_66; // @[PE_8.scala 656:57 Counter.scala 97:11]
  wire [5:0] _GEN_78 = 3'h7 == pe_step ? _GEN_76 : value_4; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [31:0] _GEN_79 = 3'h7 == pe_step ? _GEN_67 : addsum_in_0; // @[PE_8.scala 189:28 487:3]
  wire [31:0] _GEN_80 = 3'h7 == pe_step ? _GEN_68 : addsum_in_1; // @[PE_8.scala 190:28 487:3]
  wire [1:0] _GEN_81 = 3'h7 == pe_step ? _GEN_69 : m_4_sel; // @[PE_8.scala 143:25 487:3]
  wire [1:0] _GEN_82 = 3'h7 == pe_step ? _GEN_70 : m_5_sel; // @[PE_8.scala 144:25 487:3]
  wire [1:0] _GEN_83 = 3'h7 == pe_step ? _GEN_71 : m_6_sel; // @[PE_8.scala 145:25 487:3]
  wire [1:0] _GEN_84 = 3'h7 == pe_step ? _GEN_72 : m_7_sel; // @[PE_8.scala 146:25 487:3]
  wire [1:0] _GEN_85 = 3'h7 == pe_step ? _GEN_73 : m_8_sel; // @[PE_8.scala 147:25 487:3]
  wire [1:0] _GEN_86 = 3'h7 == pe_step ? _GEN_74 : m_9_sel; // @[PE_8.scala 148:25 487:3]
  wire [2:0] _GEN_87 = 3'h7 == pe_step ? _GEN_75 : pe_step; // @[PE_8.scala 484:25 487:3]
  wire [1:0] _GEN_89 = 3'h6 == pe_step ? 2'h0 : addsub_0_op; // @[PE_8.scala 487:3 638:21 153:30]
  wire [1:0] _GEN_90 = 3'h6 == pe_step ? 2'h0 : addsub_1_op; // @[PE_8.scala 487:3 639:21 154:30]
  wire [1:0] _GEN_91 = 3'h6 == pe_step ? 2'h2 : _GEN_81; // @[PE_8.scala 487:3 641:17]
  wire [1:0] _GEN_92 = 3'h6 == pe_step ? 2'h2 : _GEN_82; // @[PE_8.scala 487:3 642:17]
  wire [1:0] _GEN_93 = 3'h6 == pe_step ? 2'h2 : _GEN_83; // @[PE_8.scala 487:3 643:17]
  wire [1:0] _GEN_94 = 3'h6 == pe_step ? 2'h2 : _GEN_84; // @[PE_8.scala 487:3 644:17]
  wire [1:0] _GEN_95 = 3'h6 == pe_step ? 2'h0 : _GEN_85; // @[PE_8.scala 487:3 646:17]
  wire [1:0] _GEN_96 = 3'h6 == pe_step ? 2'h0 : _GEN_86; // @[PE_8.scala 487:3 647:17]
  wire [2:0] _GEN_97 = 3'h6 == pe_step ? 3'h7 : _GEN_87; // @[PE_8.scala 487:3 649:17]
  wire [5:0] _GEN_98 = 3'h6 == pe_step ? value_4 : _GEN_78; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [31:0] _GEN_99 = 3'h6 == pe_step ? addsum_in_0 : _GEN_79; // @[PE_8.scala 189:28 487:3]
  wire [31:0] _GEN_100 = 3'h6 == pe_step ? addsum_in_1 : _GEN_80; // @[PE_8.scala 190:28 487:3]
  wire [3:0] _GEN_102 = 3'h5 == pe_step ? _GEN_65 : value_3; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [2:0] _GEN_103 = 3'h5 == pe_step ? _GEN_64 : _GEN_97; // @[PE_8.scala 487:3]
  wire [1:0] _GEN_104 = 3'h5 == pe_step ? addsub_0_op : _GEN_89; // @[PE_8.scala 487:3 153:30]
  wire [1:0] _GEN_105 = 3'h5 == pe_step ? addsub_1_op : _GEN_90; // @[PE_8.scala 487:3 154:30]
  wire [1:0] _GEN_106 = 3'h5 == pe_step ? m_4_sel : _GEN_91; // @[PE_8.scala 143:25 487:3]
  wire [1:0] _GEN_107 = 3'h5 == pe_step ? m_5_sel : _GEN_92; // @[PE_8.scala 144:25 487:3]
  wire [1:0] _GEN_108 = 3'h5 == pe_step ? m_6_sel : _GEN_93; // @[PE_8.scala 145:25 487:3]
  wire [1:0] _GEN_109 = 3'h5 == pe_step ? m_7_sel : _GEN_94; // @[PE_8.scala 146:25 487:3]
  wire [1:0] _GEN_110 = 3'h5 == pe_step ? m_8_sel : _GEN_95; // @[PE_8.scala 147:25 487:3]
  wire [1:0] _GEN_111 = 3'h5 == pe_step ? m_9_sel : _GEN_96; // @[PE_8.scala 148:25 487:3]
  wire [5:0] _GEN_112 = 3'h5 == pe_step ? value_4 : _GEN_98; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [31:0] _GEN_113 = 3'h5 == pe_step ? addsum_in_0 : _GEN_99; // @[PE_8.scala 189:28 487:3]
  wire [31:0] _GEN_114 = 3'h5 == pe_step ? addsum_in_1 : _GEN_100; // @[PE_8.scala 190:28 487:3]
  wire [3:0] _GEN_116 = 3'h4 == pe_step ? _GEN_62 : value_2; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [2:0] _GEN_117 = 3'h4 == pe_step ? _GEN_61 : _GEN_103; // @[PE_8.scala 487:3]
  wire [3:0] _GEN_118 = 3'h4 == pe_step ? value_3 : _GEN_102; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [1:0] _GEN_119 = 3'h4 == pe_step ? addsub_0_op : _GEN_104; // @[PE_8.scala 487:3 153:30]
  wire [1:0] _GEN_120 = 3'h4 == pe_step ? addsub_1_op : _GEN_105; // @[PE_8.scala 487:3 154:30]
  wire [1:0] _GEN_121 = 3'h4 == pe_step ? m_4_sel : _GEN_106; // @[PE_8.scala 143:25 487:3]
  wire [1:0] _GEN_122 = 3'h4 == pe_step ? m_5_sel : _GEN_107; // @[PE_8.scala 144:25 487:3]
  wire [1:0] _GEN_123 = 3'h4 == pe_step ? m_6_sel : _GEN_108; // @[PE_8.scala 145:25 487:3]
  wire [1:0] _GEN_124 = 3'h4 == pe_step ? m_7_sel : _GEN_109; // @[PE_8.scala 146:25 487:3]
  wire [1:0] _GEN_125 = 3'h4 == pe_step ? m_8_sel : _GEN_110; // @[PE_8.scala 147:25 487:3]
  wire [1:0] _GEN_126 = 3'h4 == pe_step ? m_9_sel : _GEN_111; // @[PE_8.scala 148:25 487:3]
  wire [5:0] _GEN_127 = 3'h4 == pe_step ? value_4 : _GEN_112; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [31:0] _GEN_128 = 3'h4 == pe_step ? addsum_in_0 : _GEN_113; // @[PE_8.scala 189:28 487:3]
  wire [31:0] _GEN_129 = 3'h4 == pe_step ? addsum_in_1 : _GEN_114; // @[PE_8.scala 190:28 487:3]
  wire [3:0] _GEN_131 = 3'h3 == pe_step ? _GEN_59 : value; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [2:0] _GEN_132 = 3'h3 == pe_step ? _GEN_58 : _GEN_117; // @[PE_8.scala 487:3]
  wire [3:0] _GEN_133 = 3'h3 == pe_step ? value_2 : _GEN_116; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [3:0] _GEN_134 = 3'h3 == pe_step ? value_3 : _GEN_118; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [1:0] _GEN_135 = 3'h3 == pe_step ? addsub_0_op : _GEN_119; // @[PE_8.scala 487:3 153:30]
  wire [1:0] _GEN_136 = 3'h3 == pe_step ? addsub_1_op : _GEN_120; // @[PE_8.scala 487:3 154:30]
  wire [1:0] _GEN_137 = 3'h3 == pe_step ? m_4_sel : _GEN_121; // @[PE_8.scala 143:25 487:3]
  wire [1:0] _GEN_138 = 3'h3 == pe_step ? m_5_sel : _GEN_122; // @[PE_8.scala 144:25 487:3]
  wire [1:0] _GEN_139 = 3'h3 == pe_step ? m_6_sel : _GEN_123; // @[PE_8.scala 145:25 487:3]
  wire [1:0] _GEN_140 = 3'h3 == pe_step ? m_7_sel : _GEN_124; // @[PE_8.scala 146:25 487:3]
  wire [1:0] _GEN_141 = 3'h3 == pe_step ? m_8_sel : _GEN_125; // @[PE_8.scala 147:25 487:3]
  wire [1:0] _GEN_142 = 3'h3 == pe_step ? m_9_sel : _GEN_126; // @[PE_8.scala 148:25 487:3]
  wire [5:0] _GEN_143 = 3'h3 == pe_step ? value_4 : _GEN_127; // @[PE_8.scala 487:3 Counter.scala 60:40]
  wire [31:0] _GEN_144 = 3'h3 == pe_step ? addsum_in_0 : _GEN_128; // @[PE_8.scala 189:28 487:3]
  wire [31:0] _GEN_145 = 3'h3 == pe_step ? addsum_in_1 : _GEN_129; // @[PE_8.scala 190:28 487:3]
  PE pe_0 ( // @[PE_8.scala 201:20]
    .clock(pe_0_clock),
    .reset(pe_0_reset),
    .io_Xi_0(pe_0_io_Xi_0),
    .io_Yi_0(pe_0_io_Yi_0),
    .io_Xi_1(pe_0_io_Xi_1),
    .io_Yi_1(pe_0_io_Yi_1),
    .io_aggr_0(pe_0_io_aggr_0),
    .io_aggr_1(pe_0_io_aggr_1),
    .io_aggr_2(pe_0_io_aggr_2),
    .io_aggr_3(pe_0_io_aggr_3),
    .io_m_0_sel(pe_0_io_m_0_sel),
    .io_m_1_sel(pe_0_io_m_1_sel),
    .io_m_2_sel(pe_0_io_m_2_sel),
    .io_m_3_sel(pe_0_io_m_3_sel),
    .io_m_4_sel(pe_0_io_m_4_sel),
    .io_m_5_sel(pe_0_io_m_5_sel),
    .io_m_6_sel(pe_0_io_m_6_sel),
    .io_m_7_sel(pe_0_io_m_7_sel),
    .io_m_8_sel(pe_0_io_m_8_sel),
    .io_m_9_sel(pe_0_io_m_9_sel),
    .io_addsub_0_op(pe_0_io_addsub_0_op),
    .io_addsub_1_op(pe_0_io_addsub_1_op),
    .io_rounding(pe_0_io_rounding),
    .io_use_int(pe_0_io_use_int),
    .io_out_0(pe_0_io_out_0),
    .io_out_1(pe_0_io_out_1)
  );
  PE pe_1 ( // @[PE_8.scala 229:20]
    .clock(pe_1_clock),
    .reset(pe_1_reset),
    .io_Xi_0(pe_1_io_Xi_0),
    .io_Yi_0(pe_1_io_Yi_0),
    .io_Xi_1(pe_1_io_Xi_1),
    .io_Yi_1(pe_1_io_Yi_1),
    .io_aggr_0(pe_1_io_aggr_0),
    .io_aggr_1(pe_1_io_aggr_1),
    .io_aggr_2(pe_1_io_aggr_2),
    .io_aggr_3(pe_1_io_aggr_3),
    .io_m_0_sel(pe_1_io_m_0_sel),
    .io_m_1_sel(pe_1_io_m_1_sel),
    .io_m_2_sel(pe_1_io_m_2_sel),
    .io_m_3_sel(pe_1_io_m_3_sel),
    .io_m_4_sel(pe_1_io_m_4_sel),
    .io_m_5_sel(pe_1_io_m_5_sel),
    .io_m_6_sel(pe_1_io_m_6_sel),
    .io_m_7_sel(pe_1_io_m_7_sel),
    .io_m_8_sel(pe_1_io_m_8_sel),
    .io_m_9_sel(pe_1_io_m_9_sel),
    .io_addsub_0_op(pe_1_io_addsub_0_op),
    .io_addsub_1_op(pe_1_io_addsub_1_op),
    .io_rounding(pe_1_io_rounding),
    .io_use_int(pe_1_io_use_int),
    .io_out_0(pe_1_io_out_0),
    .io_out_1(pe_1_io_out_1)
  );
  PE pe_2 ( // @[PE_8.scala 257:20]
    .clock(pe_2_clock),
    .reset(pe_2_reset),
    .io_Xi_0(pe_2_io_Xi_0),
    .io_Yi_0(pe_2_io_Yi_0),
    .io_Xi_1(pe_2_io_Xi_1),
    .io_Yi_1(pe_2_io_Yi_1),
    .io_aggr_0(pe_2_io_aggr_0),
    .io_aggr_1(pe_2_io_aggr_1),
    .io_aggr_2(pe_2_io_aggr_2),
    .io_aggr_3(pe_2_io_aggr_3),
    .io_m_0_sel(pe_2_io_m_0_sel),
    .io_m_1_sel(pe_2_io_m_1_sel),
    .io_m_2_sel(pe_2_io_m_2_sel),
    .io_m_3_sel(pe_2_io_m_3_sel),
    .io_m_4_sel(pe_2_io_m_4_sel),
    .io_m_5_sel(pe_2_io_m_5_sel),
    .io_m_6_sel(pe_2_io_m_6_sel),
    .io_m_7_sel(pe_2_io_m_7_sel),
    .io_m_8_sel(pe_2_io_m_8_sel),
    .io_m_9_sel(pe_2_io_m_9_sel),
    .io_addsub_0_op(pe_2_io_addsub_0_op),
    .io_addsub_1_op(pe_2_io_addsub_1_op),
    .io_rounding(pe_2_io_rounding),
    .io_use_int(pe_2_io_use_int),
    .io_out_0(pe_2_io_out_0),
    .io_out_1(pe_2_io_out_1)
  );
  PE pe_3 ( // @[PE_8.scala 284:20]
    .clock(pe_3_clock),
    .reset(pe_3_reset),
    .io_Xi_0(pe_3_io_Xi_0),
    .io_Yi_0(pe_3_io_Yi_0),
    .io_Xi_1(pe_3_io_Xi_1),
    .io_Yi_1(pe_3_io_Yi_1),
    .io_aggr_0(pe_3_io_aggr_0),
    .io_aggr_1(pe_3_io_aggr_1),
    .io_aggr_2(pe_3_io_aggr_2),
    .io_aggr_3(pe_3_io_aggr_3),
    .io_m_0_sel(pe_3_io_m_0_sel),
    .io_m_1_sel(pe_3_io_m_1_sel),
    .io_m_2_sel(pe_3_io_m_2_sel),
    .io_m_3_sel(pe_3_io_m_3_sel),
    .io_m_4_sel(pe_3_io_m_4_sel),
    .io_m_5_sel(pe_3_io_m_5_sel),
    .io_m_6_sel(pe_3_io_m_6_sel),
    .io_m_7_sel(pe_3_io_m_7_sel),
    .io_m_8_sel(pe_3_io_m_8_sel),
    .io_m_9_sel(pe_3_io_m_9_sel),
    .io_addsub_0_op(pe_3_io_addsub_0_op),
    .io_addsub_1_op(pe_3_io_addsub_1_op),
    .io_rounding(pe_3_io_rounding),
    .io_use_int(pe_3_io_use_int),
    .io_out_0(pe_3_io_out_0),
    .io_out_1(pe_3_io_out_1)
  );
  PE pe_4 ( // @[PE_8.scala 312:20]
    .clock(pe_4_clock),
    .reset(pe_4_reset),
    .io_Xi_0(pe_4_io_Xi_0),
    .io_Yi_0(pe_4_io_Yi_0),
    .io_Xi_1(pe_4_io_Xi_1),
    .io_Yi_1(pe_4_io_Yi_1),
    .io_aggr_0(pe_4_io_aggr_0),
    .io_aggr_1(pe_4_io_aggr_1),
    .io_aggr_2(pe_4_io_aggr_2),
    .io_aggr_3(pe_4_io_aggr_3),
    .io_m_0_sel(pe_4_io_m_0_sel),
    .io_m_1_sel(pe_4_io_m_1_sel),
    .io_m_2_sel(pe_4_io_m_2_sel),
    .io_m_3_sel(pe_4_io_m_3_sel),
    .io_m_4_sel(pe_4_io_m_4_sel),
    .io_m_5_sel(pe_4_io_m_5_sel),
    .io_m_6_sel(pe_4_io_m_6_sel),
    .io_m_7_sel(pe_4_io_m_7_sel),
    .io_m_8_sel(pe_4_io_m_8_sel),
    .io_m_9_sel(pe_4_io_m_9_sel),
    .io_addsub_0_op(pe_4_io_addsub_0_op),
    .io_addsub_1_op(pe_4_io_addsub_1_op),
    .io_rounding(pe_4_io_rounding),
    .io_use_int(pe_4_io_use_int),
    .io_out_0(pe_4_io_out_0),
    .io_out_1(pe_4_io_out_1)
  );
  PE pe_5 ( // @[PE_8.scala 340:20]
    .clock(pe_5_clock),
    .reset(pe_5_reset),
    .io_Xi_0(pe_5_io_Xi_0),
    .io_Yi_0(pe_5_io_Yi_0),
    .io_Xi_1(pe_5_io_Xi_1),
    .io_Yi_1(pe_5_io_Yi_1),
    .io_aggr_0(pe_5_io_aggr_0),
    .io_aggr_1(pe_5_io_aggr_1),
    .io_aggr_2(pe_5_io_aggr_2),
    .io_aggr_3(pe_5_io_aggr_3),
    .io_m_0_sel(pe_5_io_m_0_sel),
    .io_m_1_sel(pe_5_io_m_1_sel),
    .io_m_2_sel(pe_5_io_m_2_sel),
    .io_m_3_sel(pe_5_io_m_3_sel),
    .io_m_4_sel(pe_5_io_m_4_sel),
    .io_m_5_sel(pe_5_io_m_5_sel),
    .io_m_6_sel(pe_5_io_m_6_sel),
    .io_m_7_sel(pe_5_io_m_7_sel),
    .io_m_8_sel(pe_5_io_m_8_sel),
    .io_m_9_sel(pe_5_io_m_9_sel),
    .io_addsub_0_op(pe_5_io_addsub_0_op),
    .io_addsub_1_op(pe_5_io_addsub_1_op),
    .io_rounding(pe_5_io_rounding),
    .io_use_int(pe_5_io_use_int),
    .io_out_0(pe_5_io_out_0),
    .io_out_1(pe_5_io_out_1)
  );
  PE pe_6 ( // @[PE_8.scala 368:20]
    .clock(pe_6_clock),
    .reset(pe_6_reset),
    .io_Xi_0(pe_6_io_Xi_0),
    .io_Yi_0(pe_6_io_Yi_0),
    .io_Xi_1(pe_6_io_Xi_1),
    .io_Yi_1(pe_6_io_Yi_1),
    .io_aggr_0(pe_6_io_aggr_0),
    .io_aggr_1(pe_6_io_aggr_1),
    .io_aggr_2(pe_6_io_aggr_2),
    .io_aggr_3(pe_6_io_aggr_3),
    .io_m_0_sel(pe_6_io_m_0_sel),
    .io_m_1_sel(pe_6_io_m_1_sel),
    .io_m_2_sel(pe_6_io_m_2_sel),
    .io_m_3_sel(pe_6_io_m_3_sel),
    .io_m_4_sel(pe_6_io_m_4_sel),
    .io_m_5_sel(pe_6_io_m_5_sel),
    .io_m_6_sel(pe_6_io_m_6_sel),
    .io_m_7_sel(pe_6_io_m_7_sel),
    .io_m_8_sel(pe_6_io_m_8_sel),
    .io_m_9_sel(pe_6_io_m_9_sel),
    .io_addsub_0_op(pe_6_io_addsub_0_op),
    .io_addsub_1_op(pe_6_io_addsub_1_op),
    .io_rounding(pe_6_io_rounding),
    .io_use_int(pe_6_io_use_int),
    .io_out_0(pe_6_io_out_0),
    .io_out_1(pe_6_io_out_1)
  );
  PE pe_7 ( // @[PE_8.scala 395:20]
    .clock(pe_7_clock),
    .reset(pe_7_reset),
    .io_Xi_0(pe_7_io_Xi_0),
    .io_Yi_0(pe_7_io_Yi_0),
    .io_Xi_1(pe_7_io_Xi_1),
    .io_Yi_1(pe_7_io_Yi_1),
    .io_aggr_0(pe_7_io_aggr_0),
    .io_aggr_1(pe_7_io_aggr_1),
    .io_aggr_2(pe_7_io_aggr_2),
    .io_aggr_3(pe_7_io_aggr_3),
    .io_m_0_sel(pe_7_io_m_0_sel),
    .io_m_1_sel(pe_7_io_m_1_sel),
    .io_m_2_sel(pe_7_io_m_2_sel),
    .io_m_3_sel(pe_7_io_m_3_sel),
    .io_m_4_sel(pe_7_io_m_4_sel),
    .io_m_5_sel(pe_7_io_m_5_sel),
    .io_m_6_sel(pe_7_io_m_6_sel),
    .io_m_7_sel(pe_7_io_m_7_sel),
    .io_m_8_sel(pe_7_io_m_8_sel),
    .io_m_9_sel(pe_7_io_m_9_sel),
    .io_addsub_0_op(pe_7_io_addsub_0_op),
    .io_addsub_1_op(pe_7_io_addsub_1_op),
    .io_rounding(pe_7_io_rounding),
    .io_use_int(pe_7_io_use_int),
    .io_out_0(pe_7_io_out_0),
    .io_out_1(pe_7_io_out_1)
  );
  AddSubPE addsubModule_0 ( // @[PE_8.scala 451:30]
    .clock(addsubModule_0_clock),
    .reset(addsubModule_0_reset),
    .io_use_int(addsubModule_0_io_use_int),
    .io_op(addsubModule_0_io_op),
    .io_rounding(addsubModule_0_io_rounding),
    .io_in_0(addsubModule_0_io_in_0),
    .io_in_1(addsubModule_0_io_in_1),
    .io_out(addsubModule_0_io_out)
  );
  assign io_out = out; // @[PE_8.scala 460:10]
  assign pe_0_clock = clock;
  assign pe_0_reset = reset;
  assign pe_0_io_Xi_0 = Xi_0_in_0; // @[PE_8.scala 202:16]
  assign pe_0_io_Yi_0 = Yi_0_in_0; // @[PE_8.scala 203:16]
  assign pe_0_io_Xi_1 = Xi_0_in_1; // @[PE_8.scala 204:16]
  assign pe_0_io_Yi_1 = Yi_0_in_1; // @[PE_8.scala 205:16]
  assign pe_0_io_aggr_0 = aggr_0_in_0; // @[PE_8.scala 206:22]
  assign pe_0_io_aggr_1 = aggr_0_in_1; // @[PE_8.scala 207:22]
  assign pe_0_io_aggr_2 = aggr_0_in_2; // @[PE_8.scala 208:22]
  assign pe_0_io_aggr_3 = aggr_0_in_3; // @[PE_8.scala 209:22]
  assign pe_0_io_m_0_sel = m_0_sel; // @[PE_8.scala 210:22]
  assign pe_0_io_m_1_sel = m_1_sel; // @[PE_8.scala 211:22]
  assign pe_0_io_m_2_sel = m_2_sel; // @[PE_8.scala 212:22]
  assign pe_0_io_m_3_sel = m_3_sel; // @[PE_8.scala 213:22]
  assign pe_0_io_m_4_sel = m_4_sel; // @[PE_8.scala 214:22]
  assign pe_0_io_m_5_sel = m_5_sel; // @[PE_8.scala 215:22]
  assign pe_0_io_m_6_sel = m_6_sel; // @[PE_8.scala 216:22]
  assign pe_0_io_m_7_sel = m_7_sel; // @[PE_8.scala 217:22]
  assign pe_0_io_m_8_sel = m_8_sel; // @[PE_8.scala 218:22]
  assign pe_0_io_m_9_sel = m_9_sel; // @[PE_8.scala 219:22]
  assign pe_0_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 220:23]
  assign pe_0_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 221:23]
  assign pe_0_io_rounding = rounding; // @[PE_8.scala 222:23]
  assign pe_0_io_use_int = use_int; // @[PE_8.scala 224:23]
  assign pe_1_clock = clock;
  assign pe_1_reset = reset;
  assign pe_1_io_Xi_0 = Xi_1_in_0; // @[PE_8.scala 230:16]
  assign pe_1_io_Yi_0 = Yi_1_in_0; // @[PE_8.scala 231:16]
  assign pe_1_io_Xi_1 = Xi_1_in_1; // @[PE_8.scala 232:16]
  assign pe_1_io_Yi_1 = Yi_1_in_1; // @[PE_8.scala 233:16]
  assign pe_1_io_aggr_0 = aggr_1_in_0; // @[PE_8.scala 234:22]
  assign pe_1_io_aggr_1 = aggr_1_in_1; // @[PE_8.scala 235:22]
  assign pe_1_io_aggr_2 = aggr_1_in_2; // @[PE_8.scala 236:22]
  assign pe_1_io_aggr_3 = aggr_1_in_3; // @[PE_8.scala 237:22]
  assign pe_1_io_m_0_sel = m_0_sel; // @[PE_8.scala 238:23]
  assign pe_1_io_m_1_sel = m_1_sel; // @[PE_8.scala 239:23]
  assign pe_1_io_m_2_sel = m_2_sel; // @[PE_8.scala 240:23]
  assign pe_1_io_m_3_sel = m_3_sel; // @[PE_8.scala 241:23]
  assign pe_1_io_m_4_sel = m_4_sel; // @[PE_8.scala 242:23]
  assign pe_1_io_m_5_sel = m_5_sel; // @[PE_8.scala 243:23]
  assign pe_1_io_m_6_sel = m_6_sel; // @[PE_8.scala 244:23]
  assign pe_1_io_m_7_sel = m_7_sel; // @[PE_8.scala 245:23]
  assign pe_1_io_m_8_sel = m_8_sel; // @[PE_8.scala 246:23]
  assign pe_1_io_m_9_sel = m_9_sel; // @[PE_8.scala 247:23]
  assign pe_1_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 248:23]
  assign pe_1_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 249:23]
  assign pe_1_io_rounding = rounding; // @[PE_8.scala 250:23]
  assign pe_1_io_use_int = use_int; // @[PE_8.scala 252:23]
  assign pe_2_clock = clock;
  assign pe_2_reset = reset;
  assign pe_2_io_Xi_0 = Xi_2_in_0; // @[PE_8.scala 258:16]
  assign pe_2_io_Yi_0 = Yi_2_in_0; // @[PE_8.scala 259:16]
  assign pe_2_io_Xi_1 = Xi_2_in_1; // @[PE_8.scala 260:16]
  assign pe_2_io_Yi_1 = Yi_2_in_1; // @[PE_8.scala 261:16]
  assign pe_2_io_aggr_0 = aggr_2_in_0; // @[PE_8.scala 262:22]
  assign pe_2_io_aggr_1 = aggr_2_in_1; // @[PE_8.scala 263:22]
  assign pe_2_io_aggr_2 = aggr_2_in_2; // @[PE_8.scala 264:22]
  assign pe_2_io_aggr_3 = aggr_2_in_3; // @[PE_8.scala 265:22]
  assign pe_2_io_m_0_sel = m_0_sel; // @[PE_8.scala 266:23]
  assign pe_2_io_m_1_sel = m_1_sel; // @[PE_8.scala 267:23]
  assign pe_2_io_m_2_sel = m_2_sel; // @[PE_8.scala 268:23]
  assign pe_2_io_m_3_sel = m_3_sel; // @[PE_8.scala 269:23]
  assign pe_2_io_m_4_sel = m_4_sel; // @[PE_8.scala 270:23]
  assign pe_2_io_m_5_sel = m_5_sel; // @[PE_8.scala 271:23]
  assign pe_2_io_m_6_sel = m_6_sel; // @[PE_8.scala 272:23]
  assign pe_2_io_m_7_sel = m_7_sel; // @[PE_8.scala 273:23]
  assign pe_2_io_m_8_sel = m_8_sel; // @[PE_8.scala 274:23]
  assign pe_2_io_m_9_sel = m_9_sel; // @[PE_8.scala 275:23]
  assign pe_2_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 276:23]
  assign pe_2_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 277:23]
  assign pe_2_io_rounding = rounding; // @[PE_8.scala 278:23]
  assign pe_2_io_use_int = use_int; // @[PE_8.scala 280:23]
  assign pe_3_clock = clock;
  assign pe_3_reset = reset;
  assign pe_3_io_Xi_0 = Xi_3_in_0; // @[PE_8.scala 285:16]
  assign pe_3_io_Yi_0 = Yi_3_in_0; // @[PE_8.scala 286:16]
  assign pe_3_io_Xi_1 = Xi_3_in_1; // @[PE_8.scala 287:16]
  assign pe_3_io_Yi_1 = Yi_3_in_1; // @[PE_8.scala 288:16]
  assign pe_3_io_aggr_0 = aggr_3_in_0; // @[PE_8.scala 289:22]
  assign pe_3_io_aggr_1 = aggr_3_in_1; // @[PE_8.scala 290:22]
  assign pe_3_io_aggr_2 = aggr_3_in_2; // @[PE_8.scala 291:22]
  assign pe_3_io_aggr_3 = aggr_3_in_3; // @[PE_8.scala 292:22]
  assign pe_3_io_m_0_sel = m_0_sel; // @[PE_8.scala 293:23]
  assign pe_3_io_m_1_sel = m_1_sel; // @[PE_8.scala 294:23]
  assign pe_3_io_m_2_sel = m_2_sel; // @[PE_8.scala 295:23]
  assign pe_3_io_m_3_sel = m_3_sel; // @[PE_8.scala 296:23]
  assign pe_3_io_m_4_sel = m_4_sel; // @[PE_8.scala 297:23]
  assign pe_3_io_m_5_sel = m_5_sel; // @[PE_8.scala 298:23]
  assign pe_3_io_m_6_sel = m_6_sel; // @[PE_8.scala 299:23]
  assign pe_3_io_m_7_sel = m_7_sel; // @[PE_8.scala 300:23]
  assign pe_3_io_m_8_sel = m_8_sel; // @[PE_8.scala 301:23]
  assign pe_3_io_m_9_sel = m_9_sel; // @[PE_8.scala 302:23]
  assign pe_3_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 303:23]
  assign pe_3_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 304:23]
  assign pe_3_io_rounding = rounding; // @[PE_8.scala 305:23]
  assign pe_3_io_use_int = use_int; // @[PE_8.scala 307:23]
  assign pe_4_clock = clock;
  assign pe_4_reset = reset;
  assign pe_4_io_Xi_0 = Xi_4_in_0; // @[PE_8.scala 313:16]
  assign pe_4_io_Yi_0 = Yi_4_in_0; // @[PE_8.scala 314:16]
  assign pe_4_io_Xi_1 = Xi_4_in_1; // @[PE_8.scala 315:16]
  assign pe_4_io_Yi_1 = Yi_4_in_1; // @[PE_8.scala 316:16]
  assign pe_4_io_aggr_0 = 32'h0; // @[PE_8.scala 317:22]
  assign pe_4_io_aggr_1 = 32'h0; // @[PE_8.scala 318:22]
  assign pe_4_io_aggr_2 = 32'h0; // @[PE_8.scala 319:22]
  assign pe_4_io_aggr_3 = 32'h0; // @[PE_8.scala 320:22]
  assign pe_4_io_m_0_sel = m_0_sel; // @[PE_8.scala 321:22]
  assign pe_4_io_m_1_sel = m_1_sel; // @[PE_8.scala 322:22]
  assign pe_4_io_m_2_sel = m_2_sel; // @[PE_8.scala 323:22]
  assign pe_4_io_m_3_sel = m_3_sel; // @[PE_8.scala 324:22]
  assign pe_4_io_m_4_sel = m_4_sel; // @[PE_8.scala 325:22]
  assign pe_4_io_m_5_sel = m_5_sel; // @[PE_8.scala 326:22]
  assign pe_4_io_m_6_sel = m_6_sel; // @[PE_8.scala 327:22]
  assign pe_4_io_m_7_sel = m_7_sel; // @[PE_8.scala 328:22]
  assign pe_4_io_m_8_sel = m_8_sel; // @[PE_8.scala 329:22]
  assign pe_4_io_m_9_sel = m_9_sel; // @[PE_8.scala 330:22]
  assign pe_4_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 331:23]
  assign pe_4_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 332:23]
  assign pe_4_io_rounding = rounding; // @[PE_8.scala 333:23]
  assign pe_4_io_use_int = use_int; // @[PE_8.scala 335:23]
  assign pe_5_clock = clock;
  assign pe_5_reset = reset;
  assign pe_5_io_Xi_0 = Xi_5_in_0; // @[PE_8.scala 341:16]
  assign pe_5_io_Yi_0 = Yi_5_in_0; // @[PE_8.scala 342:16]
  assign pe_5_io_Xi_1 = Xi_5_in_1; // @[PE_8.scala 343:16]
  assign pe_5_io_Yi_1 = Yi_5_in_1; // @[PE_8.scala 344:16]
  assign pe_5_io_aggr_0 = 32'h0; // @[PE_8.scala 345:22]
  assign pe_5_io_aggr_1 = 32'h0; // @[PE_8.scala 346:22]
  assign pe_5_io_aggr_2 = 32'h0; // @[PE_8.scala 347:22]
  assign pe_5_io_aggr_3 = 32'h0; // @[PE_8.scala 348:22]
  assign pe_5_io_m_0_sel = m_0_sel; // @[PE_8.scala 349:23]
  assign pe_5_io_m_1_sel = m_1_sel; // @[PE_8.scala 350:23]
  assign pe_5_io_m_2_sel = m_2_sel; // @[PE_8.scala 351:23]
  assign pe_5_io_m_3_sel = m_3_sel; // @[PE_8.scala 352:23]
  assign pe_5_io_m_4_sel = m_4_sel; // @[PE_8.scala 353:23]
  assign pe_5_io_m_5_sel = m_5_sel; // @[PE_8.scala 354:23]
  assign pe_5_io_m_6_sel = m_6_sel; // @[PE_8.scala 355:23]
  assign pe_5_io_m_7_sel = m_7_sel; // @[PE_8.scala 356:23]
  assign pe_5_io_m_8_sel = m_8_sel; // @[PE_8.scala 357:23]
  assign pe_5_io_m_9_sel = m_9_sel; // @[PE_8.scala 358:23]
  assign pe_5_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 359:23]
  assign pe_5_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 360:23]
  assign pe_5_io_rounding = rounding; // @[PE_8.scala 361:23]
  assign pe_5_io_use_int = use_int; // @[PE_8.scala 363:23]
  assign pe_6_clock = clock;
  assign pe_6_reset = reset;
  assign pe_6_io_Xi_0 = Xi_6_in_0; // @[PE_8.scala 369:16]
  assign pe_6_io_Yi_0 = Yi_6_in_0; // @[PE_8.scala 370:16]
  assign pe_6_io_Xi_1 = Xi_6_in_1; // @[PE_8.scala 371:16]
  assign pe_6_io_Yi_1 = Yi_6_in_1; // @[PE_8.scala 372:16]
  assign pe_6_io_aggr_0 = 32'h0; // @[PE_8.scala 373:22]
  assign pe_6_io_aggr_1 = 32'h0; // @[PE_8.scala 374:22]
  assign pe_6_io_aggr_2 = 32'h0; // @[PE_8.scala 375:22]
  assign pe_6_io_aggr_3 = 32'h0; // @[PE_8.scala 376:22]
  assign pe_6_io_m_0_sel = m_0_sel; // @[PE_8.scala 377:23]
  assign pe_6_io_m_1_sel = m_1_sel; // @[PE_8.scala 378:23]
  assign pe_6_io_m_2_sel = m_2_sel; // @[PE_8.scala 379:23]
  assign pe_6_io_m_3_sel = m_3_sel; // @[PE_8.scala 380:23]
  assign pe_6_io_m_4_sel = m_4_sel; // @[PE_8.scala 381:23]
  assign pe_6_io_m_5_sel = m_5_sel; // @[PE_8.scala 382:23]
  assign pe_6_io_m_6_sel = m_6_sel; // @[PE_8.scala 383:23]
  assign pe_6_io_m_7_sel = m_7_sel; // @[PE_8.scala 384:23]
  assign pe_6_io_m_8_sel = m_8_sel; // @[PE_8.scala 385:23]
  assign pe_6_io_m_9_sel = m_9_sel; // @[PE_8.scala 386:23]
  assign pe_6_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 387:23]
  assign pe_6_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 388:23]
  assign pe_6_io_rounding = rounding; // @[PE_8.scala 389:23]
  assign pe_6_io_use_int = use_int; // @[PE_8.scala 391:23]
  assign pe_7_clock = clock;
  assign pe_7_reset = reset;
  assign pe_7_io_Xi_0 = Xi_7_in_0; // @[PE_8.scala 396:16]
  assign pe_7_io_Yi_0 = Yi_7_in_0; // @[PE_8.scala 397:16]
  assign pe_7_io_Xi_1 = Xi_7_in_1; // @[PE_8.scala 398:16]
  assign pe_7_io_Yi_1 = Yi_7_in_1; // @[PE_8.scala 399:16]
  assign pe_7_io_aggr_0 = 32'h0; // @[PE_8.scala 400:22]
  assign pe_7_io_aggr_1 = 32'h0; // @[PE_8.scala 401:22]
  assign pe_7_io_aggr_2 = 32'h0; // @[PE_8.scala 402:22]
  assign pe_7_io_aggr_3 = 32'h0; // @[PE_8.scala 403:22]
  assign pe_7_io_m_0_sel = m_0_sel; // @[PE_8.scala 404:23]
  assign pe_7_io_m_1_sel = m_1_sel; // @[PE_8.scala 405:23]
  assign pe_7_io_m_2_sel = m_2_sel; // @[PE_8.scala 406:23]
  assign pe_7_io_m_3_sel = m_3_sel; // @[PE_8.scala 407:23]
  assign pe_7_io_m_4_sel = m_4_sel; // @[PE_8.scala 408:23]
  assign pe_7_io_m_5_sel = m_5_sel; // @[PE_8.scala 409:23]
  assign pe_7_io_m_6_sel = m_6_sel; // @[PE_8.scala 410:23]
  assign pe_7_io_m_7_sel = m_7_sel; // @[PE_8.scala 411:23]
  assign pe_7_io_m_8_sel = m_8_sel; // @[PE_8.scala 412:23]
  assign pe_7_io_m_9_sel = m_9_sel; // @[PE_8.scala 413:23]
  assign pe_7_io_addsub_0_op = addsub_0_op[0]; // @[PE_8.scala 414:23]
  assign pe_7_io_addsub_1_op = addsub_1_op[0]; // @[PE_8.scala 415:23]
  assign pe_7_io_rounding = rounding; // @[PE_8.scala 416:23]
  assign pe_7_io_use_int = use_int; // @[PE_8.scala 418:23]
  assign addsubModule_0_clock = clock;
  assign addsubModule_0_reset = reset;
  assign addsubModule_0_io_use_int = use_int; // @[PE_8.scala 455:32]
  assign addsubModule_0_io_op = 1'h0; // @[PE_8.scala 452:32]
  assign addsubModule_0_io_rounding = rounding; // @[PE_8.scala 453:32]
  assign addsubModule_0_io_in_0 = addsum_in_0; // @[PE_8.scala 456:32]
  assign addsubModule_0_io_in_1 = addsum_in_1; // @[PE_8.scala 457:32]
  always @(posedge clock) begin
    Xi_0_in_0 <= io_Xi_0_in_0; // @[PE_8.scala 64:27]
    Yi_0_in_0 <= io_Yi_0_in_0; // @[PE_8.scala 65:27]
    Xi_0_in_1 <= io_Xi_0_in_1; // @[PE_8.scala 66:27]
    Yi_0_in_1 <= io_Yi_0_in_1; // @[PE_8.scala 67:27]
    if (reset) begin // @[PE_8.scala 68:29]
      aggr_0_in_0 <= 32'h0; // @[PE_8.scala 68:29]
    end else begin
      aggr_0_in_0 <= pe_0_out_0; // @[PE_8.scala 426:15]
    end
    if (reset) begin // @[PE_8.scala 69:29]
      aggr_0_in_1 <= 32'h0; // @[PE_8.scala 69:29]
    end else begin
      aggr_0_in_1 <= pe_1_out_1; // @[PE_8.scala 427:15]
    end
    if (reset) begin // @[PE_8.scala 70:29]
      aggr_0_in_2 <= 32'h0; // @[PE_8.scala 70:29]
    end else begin
      aggr_0_in_2 <= pe_0_out_1; // @[PE_8.scala 428:15]
    end
    if (reset) begin // @[PE_8.scala 71:29]
      aggr_0_in_3 <= 32'h0; // @[PE_8.scala 71:29]
    end else begin
      aggr_0_in_3 <= pe_1_out_0; // @[PE_8.scala 429:15]
    end
    Xi_1_in_0 <= io_Xi_1_in_0; // @[PE_8.scala 73:27]
    Yi_1_in_0 <= io_Yi_1_in_0; // @[PE_8.scala 74:27]
    Xi_1_in_1 <= io_Xi_1_in_1; // @[PE_8.scala 75:27]
    Yi_1_in_1 <= io_Yi_1_in_1; // @[PE_8.scala 76:27]
    if (reset) begin // @[PE_8.scala 77:29]
      aggr_1_in_0 <= 32'h0; // @[PE_8.scala 77:29]
    end else begin
      aggr_1_in_0 <= pe_2_out_0; // @[PE_8.scala 432:15]
    end
    if (reset) begin // @[PE_8.scala 78:29]
      aggr_1_in_1 <= 32'h0; // @[PE_8.scala 78:29]
    end else begin
      aggr_1_in_1 <= pe_2_out_1; // @[PE_8.scala 433:15]
    end
    if (reset) begin // @[PE_8.scala 79:29]
      aggr_1_in_2 <= 32'h0; // @[PE_8.scala 79:29]
    end else begin
      aggr_1_in_2 <= pe_3_out_0; // @[PE_8.scala 434:15]
    end
    if (reset) begin // @[PE_8.scala 80:29]
      aggr_1_in_3 <= 32'h0; // @[PE_8.scala 80:29]
    end else begin
      aggr_1_in_3 <= pe_3_out_1; // @[PE_8.scala 435:15]
    end
    Xi_2_in_0 <= io_Xi_2_in_0; // @[PE_8.scala 82:27]
    Yi_2_in_0 <= io_Yi_2_in_0; // @[PE_8.scala 83:27]
    Xi_2_in_1 <= io_Xi_2_in_1; // @[PE_8.scala 84:27]
    Yi_2_in_1 <= io_Yi_2_in_1; // @[PE_8.scala 85:27]
    if (reset) begin // @[PE_8.scala 86:29]
      aggr_2_in_0 <= 32'h0; // @[PE_8.scala 86:29]
    end else begin
      aggr_2_in_0 <= pe_4_out_0; // @[PE_8.scala 437:15]
    end
    if (reset) begin // @[PE_8.scala 87:29]
      aggr_2_in_1 <= 32'h0; // @[PE_8.scala 87:29]
    end else begin
      aggr_2_in_1 <= pe_4_out_1; // @[PE_8.scala 438:15]
    end
    if (reset) begin // @[PE_8.scala 88:29]
      aggr_2_in_2 <= 32'h0; // @[PE_8.scala 88:29]
    end else begin
      aggr_2_in_2 <= pe_5_out_0; // @[PE_8.scala 439:15]
    end
    if (reset) begin // @[PE_8.scala 89:29]
      aggr_2_in_3 <= 32'h0; // @[PE_8.scala 89:29]
    end else begin
      aggr_2_in_3 <= pe_5_out_1; // @[PE_8.scala 440:15]
    end
    Xi_3_in_0 <= io_Xi_3_in_0; // @[PE_8.scala 91:27]
    Yi_3_in_0 <= io_Yi_3_in_0; // @[PE_8.scala 92:27]
    Xi_3_in_1 <= io_Xi_3_in_1; // @[PE_8.scala 93:27]
    Yi_3_in_1 <= io_Yi_3_in_1; // @[PE_8.scala 94:27]
    if (reset) begin // @[PE_8.scala 95:29]
      aggr_3_in_0 <= 32'h0; // @[PE_8.scala 95:29]
    end else begin
      aggr_3_in_0 <= pe_6_out_0; // @[PE_8.scala 442:15]
    end
    if (reset) begin // @[PE_8.scala 96:29]
      aggr_3_in_1 <= 32'h0; // @[PE_8.scala 96:29]
    end else begin
      aggr_3_in_1 <= pe_6_out_1; // @[PE_8.scala 443:15]
    end
    if (reset) begin // @[PE_8.scala 97:29]
      aggr_3_in_2 <= 32'h0; // @[PE_8.scala 97:29]
    end else begin
      aggr_3_in_2 <= pe_7_out_0; // @[PE_8.scala 444:15]
    end
    if (reset) begin // @[PE_8.scala 98:29]
      aggr_3_in_3 <= 32'h0; // @[PE_8.scala 98:29]
    end else begin
      aggr_3_in_3 <= pe_7_out_1; // @[PE_8.scala 445:15]
    end
    Xi_4_in_0 <= io_Xi_4_in_0; // @[PE_8.scala 100:27]
    Yi_4_in_0 <= io_Yi_4_in_0; // @[PE_8.scala 101:27]
    Xi_4_in_1 <= io_Xi_4_in_1; // @[PE_8.scala 102:27]
    Yi_4_in_1 <= io_Yi_4_in_1; // @[PE_8.scala 103:27]
    Xi_5_in_0 <= io_Xi_5_in_0; // @[PE_8.scala 109:27]
    Yi_5_in_0 <= io_Yi_5_in_0; // @[PE_8.scala 110:27]
    Xi_5_in_1 <= io_Xi_5_in_1; // @[PE_8.scala 111:27]
    Yi_5_in_1 <= io_Yi_5_in_1; // @[PE_8.scala 112:27]
    Xi_6_in_0 <= io_Xi_6_in_0; // @[PE_8.scala 118:27]
    Yi_6_in_0 <= io_Yi_6_in_0; // @[PE_8.scala 119:27]
    Xi_6_in_1 <= io_Xi_6_in_1; // @[PE_8.scala 120:27]
    Yi_6_in_1 <= io_Yi_6_in_1; // @[PE_8.scala 121:27]
    Xi_7_in_0 <= io_Xi_7_in_0; // @[PE_8.scala 127:27]
    Yi_7_in_0 <= io_Yi_7_in_0; // @[PE_8.scala 128:27]
    Xi_7_in_1 <= io_Xi_7_in_1; // @[PE_8.scala 129:27]
    Yi_7_in_1 <= io_Yi_7_in_1; // @[PE_8.scala 130:27]
    if (reset) begin // @[PE_8.scala 139:25]
      m_0_sel <= 2'h0; // @[PE_8.scala 139:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_0_sel <= 2'h1; // @[PE_8.scala 508:21]
        end else begin
          m_0_sel <= _GEN_36;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 140:25]
      m_1_sel <= 2'h0; // @[PE_8.scala 140:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_1_sel <= 2'h1; // @[PE_8.scala 509:21]
        end else begin
          m_1_sel <= _GEN_37;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 141:25]
      m_2_sel <= 2'h0; // @[PE_8.scala 141:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_2_sel <= 2'h1; // @[PE_8.scala 510:21]
        end else begin
          m_2_sel <= _GEN_38;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 142:25]
      m_3_sel <= 2'h0; // @[PE_8.scala 142:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_3_sel <= 2'h1; // @[PE_8.scala 511:21]
        end else begin
          m_3_sel <= _GEN_39;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 143:25]
      m_4_sel <= 2'h0; // @[PE_8.scala 143:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_4_sel <= 2'h0; // @[PE_8.scala 513:21]
        end else begin
          m_4_sel <= _GEN_29;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        m_4_sel <= _GEN_137;
      end
    end
    if (reset) begin // @[PE_8.scala 144:25]
      m_5_sel <= 2'h0; // @[PE_8.scala 144:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_5_sel <= 2'h0; // @[PE_8.scala 514:21]
        end else begin
          m_5_sel <= _GEN_30;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        m_5_sel <= _GEN_138;
      end
    end
    if (reset) begin // @[PE_8.scala 145:25]
      m_6_sel <= 2'h0; // @[PE_8.scala 145:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_6_sel <= 2'h0; // @[PE_8.scala 515:21]
        end else begin
          m_6_sel <= _GEN_31;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        m_6_sel <= _GEN_139;
      end
    end
    if (reset) begin // @[PE_8.scala 146:25]
      m_7_sel <= 2'h0; // @[PE_8.scala 146:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_7_sel <= 2'h0; // @[PE_8.scala 516:21]
        end else begin
          m_7_sel <= _GEN_32;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        m_7_sel <= _GEN_140;
      end
    end
    if (reset) begin // @[PE_8.scala 147:25]
      m_8_sel <= 2'h0; // @[PE_8.scala 147:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_8_sel <= 2'h1; // @[PE_8.scala 519:21]
        end else begin
          m_8_sel <= _GEN_33;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        m_8_sel <= _GEN_141;
      end
    end
    if (reset) begin // @[PE_8.scala 148:25]
      m_9_sel <= 2'h0; // @[PE_8.scala 148:25]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          m_9_sel <= 2'h1; // @[PE_8.scala 520:21]
        end else begin
          m_9_sel <= _GEN_34;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        m_9_sel <= _GEN_142;
      end
    end
    op_type <= io_op_type; // @[PE_8.scala 150:26]
    if (reset) begin // @[PE_8.scala 153:30]
      addsub_0_op <= 2'h3; // @[PE_8.scala 153:30]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          addsub_0_op <= 2'h1; // @[PE_8.scala 505:25]
        end else begin
          addsub_0_op <= _GEN_27;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        addsub_0_op <= _GEN_135;
      end
    end
    if (reset) begin // @[PE_8.scala 154:30]
      addsub_1_op <= 2'h3; // @[PE_8.scala 154:30]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
        if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
          addsub_1_op <= 2'h1; // @[PE_8.scala 506:25]
        end else begin
          addsub_1_op <= _GEN_28;
        end
      end else if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
        addsub_1_op <= _GEN_136;
      end
    end
    rounding <= io_rounding; // @[PE_8.scala 157:29]
    use_int <= io_use_int; // @[PE_8.scala 161:29]
    if (reset) begin // @[PE_8.scala 166:29]
      pe_0_out_0 <= 32'h0; // @[PE_8.scala 166:29]
    end else begin
      pe_0_out_0 <= pe_0_io_out_0; // @[PE_8.scala 225:14]
    end
    if (reset) begin // @[PE_8.scala 167:29]
      pe_0_out_1 <= 32'h0; // @[PE_8.scala 167:29]
    end else begin
      pe_0_out_1 <= pe_0_io_out_1; // @[PE_8.scala 226:14]
    end
    if (reset) begin // @[PE_8.scala 168:29]
      pe_1_out_0 <= 32'h0; // @[PE_8.scala 168:29]
    end else begin
      pe_1_out_0 <= pe_1_io_out_0; // @[PE_8.scala 253:14]
    end
    if (reset) begin // @[PE_8.scala 169:29]
      pe_1_out_1 <= 32'h0; // @[PE_8.scala 169:29]
    end else begin
      pe_1_out_1 <= pe_1_io_out_1; // @[PE_8.scala 254:14]
    end
    if (reset) begin // @[PE_8.scala 170:29]
      pe_2_out_0 <= 32'h0; // @[PE_8.scala 170:29]
    end else begin
      pe_2_out_0 <= pe_2_io_out_0; // @[PE_8.scala 281:14]
    end
    if (reset) begin // @[PE_8.scala 171:29]
      pe_2_out_1 <= 32'h0; // @[PE_8.scala 171:29]
    end else begin
      pe_2_out_1 <= pe_2_io_out_1; // @[PE_8.scala 282:14]
    end
    if (reset) begin // @[PE_8.scala 172:29]
      pe_3_out_0 <= 32'h0; // @[PE_8.scala 172:29]
    end else begin
      pe_3_out_0 <= pe_3_io_out_0; // @[PE_8.scala 308:14]
    end
    if (reset) begin // @[PE_8.scala 173:29]
      pe_3_out_1 <= 32'h0; // @[PE_8.scala 173:29]
    end else begin
      pe_3_out_1 <= pe_3_io_out_1; // @[PE_8.scala 309:14]
    end
    if (reset) begin // @[PE_8.scala 174:29]
      pe_4_out_0 <= 32'h0; // @[PE_8.scala 174:29]
    end else begin
      pe_4_out_0 <= pe_4_io_out_0; // @[PE_8.scala 336:14]
    end
    if (reset) begin // @[PE_8.scala 175:29]
      pe_4_out_1 <= 32'h0; // @[PE_8.scala 175:29]
    end else begin
      pe_4_out_1 <= pe_4_io_out_1; // @[PE_8.scala 337:14]
    end
    if (reset) begin // @[PE_8.scala 176:29]
      pe_5_out_0 <= 32'h0; // @[PE_8.scala 176:29]
    end else begin
      pe_5_out_0 <= pe_5_io_out_0; // @[PE_8.scala 364:14]
    end
    if (reset) begin // @[PE_8.scala 177:29]
      pe_5_out_1 <= 32'h0; // @[PE_8.scala 177:29]
    end else begin
      pe_5_out_1 <= pe_5_io_out_1; // @[PE_8.scala 365:14]
    end
    if (reset) begin // @[PE_8.scala 178:29]
      pe_6_out_0 <= 32'h0; // @[PE_8.scala 178:29]
    end else begin
      pe_6_out_0 <= pe_6_io_out_0; // @[PE_8.scala 392:14]
    end
    if (reset) begin // @[PE_8.scala 179:29]
      pe_6_out_1 <= 32'h0; // @[PE_8.scala 179:29]
    end else begin
      pe_6_out_1 <= pe_6_io_out_1; // @[PE_8.scala 393:14]
    end
    if (reset) begin // @[PE_8.scala 180:29]
      pe_7_out_0 <= 32'h0; // @[PE_8.scala 180:29]
    end else begin
      pe_7_out_0 <= pe_7_io_out_0; // @[PE_8.scala 419:14]
    end
    if (reset) begin // @[PE_8.scala 181:29]
      pe_7_out_1 <= 32'h0; // @[PE_8.scala 181:29]
    end else begin
      pe_7_out_1 <= pe_7_io_out_1; // @[PE_8.scala 420:14]
    end
    if (reset) begin // @[PE_8.scala 184:29]
      out <= 32'h0; // @[PE_8.scala 184:29]
    end else begin
      out <= addsubModule_0_io_out; // @[PE_8.scala 458:8]
    end
    if (reset) begin // @[PE_8.scala 189:28]
      addsum_in_0 <= 32'h0; // @[PE_8.scala 189:28]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
          addsum_in_0 <= _GEN_144;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 190:28]
      addsum_in_1 <= 32'h0; // @[PE_8.scala 190:28]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
          addsum_in_1 <= _GEN_145;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
          value <= _GEN_131;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (3'h2 == pe_step) begin // @[PE_8.scala 487:3]
          value_1 <= _GEN_56;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_2 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
          value_2 <= _GEN_133;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_3 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
          value_3 <= _GEN_134;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_4 <= 6'h0; // @[Counter.scala 60:40]
    end else if (!(3'h0 == pe_step)) begin // @[PE_8.scala 487:3]
      if (!(3'h1 == pe_step)) begin // @[PE_8.scala 487:3]
        if (!(3'h2 == pe_step)) begin // @[PE_8.scala 487:3]
          value_4 <= _GEN_143;
        end
      end
    end
    if (reset) begin // @[PE_8.scala 484:25]
      pe_step <= 3'h0; // @[PE_8.scala 484:25]
    end else if (3'h0 == pe_step) begin // @[PE_8.scala 487:3]
      pe_step <= 3'h1; // @[PE_8.scala 490:17]
    end else if (3'h1 == pe_step) begin // @[PE_8.scala 487:3]
      if (2'h0 == op_type) begin // @[PE_8.scala 497:9]
        pe_step <= 3'h2; // @[PE_8.scala 522:21]
      end else begin
        pe_step <= _GEN_35;
      end
    end else if (3'h2 == pe_step) begin // @[PE_8.scala 487:3]
      pe_step <= _GEN_55;
    end else begin
      pe_step <= _GEN_132;
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
  aggr_0_in_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  aggr_0_in_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  aggr_0_in_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  aggr_0_in_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  Xi_1_in_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  Yi_1_in_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  Xi_1_in_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  Yi_1_in_1 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  aggr_1_in_0 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  aggr_1_in_1 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  aggr_1_in_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  aggr_1_in_3 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  Xi_2_in_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  Yi_2_in_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  Xi_2_in_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  Yi_2_in_1 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  aggr_2_in_0 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  aggr_2_in_1 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  aggr_2_in_2 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  aggr_2_in_3 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  Xi_3_in_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  Yi_3_in_0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  Xi_3_in_1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  Yi_3_in_1 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  aggr_3_in_0 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  aggr_3_in_1 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  aggr_3_in_2 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  aggr_3_in_3 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  Xi_4_in_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  Yi_4_in_0 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  Xi_4_in_1 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  Yi_4_in_1 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  Xi_5_in_0 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  Yi_5_in_0 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  Xi_5_in_1 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  Yi_5_in_1 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  Xi_6_in_0 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  Yi_6_in_0 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  Xi_6_in_1 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  Yi_6_in_1 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  Xi_7_in_0 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  Yi_7_in_0 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  Xi_7_in_1 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  Yi_7_in_1 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  m_0_sel = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  m_1_sel = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  m_2_sel = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  m_3_sel = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  m_4_sel = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  m_5_sel = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  m_6_sel = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  m_7_sel = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  m_8_sel = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  m_9_sel = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  op_type = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  addsub_0_op = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  addsub_1_op = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  rounding = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  use_int = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  pe_0_out_0 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  pe_0_out_1 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  pe_1_out_0 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  pe_1_out_1 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  pe_2_out_0 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  pe_2_out_1 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  pe_3_out_0 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  pe_3_out_1 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  pe_4_out_0 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  pe_4_out_1 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  pe_5_out_0 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  pe_5_out_1 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  pe_6_out_0 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  pe_6_out_1 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  pe_7_out_0 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  pe_7_out_1 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  out = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  addsum_in_0 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  addsum_in_1 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  value = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  value_1 = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  value_2 = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  value_3 = _RAND_85[3:0];
  _RAND_86 = {1{`RANDOM}};
  value_4 = _RAND_86[5:0];
  _RAND_87 = {1{`RANDOM}};
  pe_step = _RAND_87[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
