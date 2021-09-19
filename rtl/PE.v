module MuxPE(
  input         clock,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [31:0] io_in_2,
  input  [1:0]  io_sel,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] sel; // @[MuxPE.scala 22:21]
  reg [31:0] in_0; // @[MuxPE.scala 23:21]
  reg [31:0] in_1; // @[MuxPE.scala 24:21]
  reg [31:0] in_2; // @[MuxPE.scala 25:21]
  wire  _T = sel == 2'h0; // @[MuxPE.scala 28:14]
  wire  _T_1 = sel == 2'h1; // @[MuxPE.scala 32:20]
  wire  _T_2 = sel == 2'h2; // @[MuxPE.scala 36:20]
  wire [31:0] _GEN_0 = _T_2 ? in_2 : 32'h0; // @[MuxPE.scala 37:3 38:12 42:12]
  wire [31:0] _GEN_1 = _T_1 ? in_1 : _GEN_0; // @[MuxPE.scala 33:3 34:12]
  assign io_out = _T ? in_0 : _GEN_1; // @[MuxPE.scala 29:3 30:12]
  always @(posedge clock) begin
    sel <= io_sel; // @[MuxPE.scala 22:21]
    in_0 <= io_in_0; // @[MuxPE.scala 23:21]
    in_1 <= io_in_1; // @[MuxPE.scala 24:21]
    in_2 <= io_in_2; // @[MuxPE.scala 25:21]
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
  input  [2:0]  io_rounding,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [32:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] mulRecFN_io_a; // @[MultPE.scala 28:24]
  wire [32:0] mulRecFN_io_b; // @[MultPE.scala 28:24]
  wire [2:0] mulRecFN_io_roundingMode; // @[MultPE.scala 28:24]
  wire [32:0] mulRecFN_io_out; // @[MultPE.scala 28:24]
  reg [2:0] rounding; // @[MultPE.scala 18:26]
  reg [31:0] in_0; // @[MultPE.scala 24:22]
  reg [31:0] in_1; // @[MultPE.scala 25:22]
  reg [32:0] mulRecFN_out; // @[MultPE.scala 33:30]
  MulRecFN mulRecFN ( // @[MultPE.scala 28:24]
    .io_a(mulRecFN_io_a),
    .io_b(mulRecFN_io_b),
    .io_roundingMode(mulRecFN_io_roundingMode),
    .io_out(mulRecFN_io_out)
  );
  assign io_out = mulRecFN_out; // @[MultPE.scala 35:10]
  assign mulRecFN_io_a = {{1'd0}, in_0}; // @[MultPE.scala 31:17]
  assign mulRecFN_io_b = {{1'd0}, in_1}; // @[MultPE.scala 32:17]
  assign mulRecFN_io_roundingMode = rounding; // @[MultPE.scala 29:30]
  always @(posedge clock) begin
    rounding <= io_rounding; // @[MultPE.scala 18:26]
    in_0 <= io_in_0; // @[MultPE.scala 24:22]
    in_1 <= io_in_1; // @[MultPE.scala 25:22]
    mulRecFN_out <= mulRecFN_io_out; // @[MultPE.scala 33:30]
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
  in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  in_1 = _RAND_2[31:0];
  _RAND_3 = {2{`RANDOM}};
  mulRecFN_out = _RAND_3[32:0];
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
  input         io_op,
  input  [2:0]  io_rounding,
  input  [32:0] io_in_0,
  input  [32:0] io_in_1,
  output [32:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  addRecFN_io_subOp; // @[AddSubPE.scala 33:24]
  wire [32:0] addRecFN_io_a; // @[AddSubPE.scala 33:24]
  wire [32:0] addRecFN_io_b; // @[AddSubPE.scala 33:24]
  wire [2:0] addRecFN_io_roundingMode; // @[AddSubPE.scala 33:24]
  wire [32:0] addRecFN_io_out; // @[AddSubPE.scala 33:24]
  reg  op; // @[AddSubPE.scala 20:19]
  reg [2:0] rounding; // @[AddSubPE.scala 23:26]
  reg [32:0] in_0; // @[AddSubPE.scala 29:22]
  reg [32:0] in_1; // @[AddSubPE.scala 30:22]
  reg [32:0] addRecFN_out; // @[AddSubPE.scala 39:30]
  AddRecFN addRecFN ( // @[AddSubPE.scala 33:24]
    .io_subOp(addRecFN_io_subOp),
    .io_a(addRecFN_io_a),
    .io_b(addRecFN_io_b),
    .io_roundingMode(addRecFN_io_roundingMode),
    .io_out(addRecFN_io_out)
  );
  assign io_out = addRecFN_out; // @[AddSubPE.scala 41:10]
  assign addRecFN_io_subOp = op; // @[AddSubPE.scala 34:21]
  assign addRecFN_io_a = in_0; // @[AddSubPE.scala 35:17]
  assign addRecFN_io_b = in_1; // @[AddSubPE.scala 36:17]
  assign addRecFN_io_roundingMode = rounding; // @[AddSubPE.scala 37:30]
  always @(posedge clock) begin
    op <= io_op; // @[AddSubPE.scala 20:19]
    rounding <= io_rounding; // @[AddSubPE.scala 23:26]
    in_0 <= io_in_0; // @[AddSubPE.scala 29:22]
    in_1 <= io_in_1; // @[AddSubPE.scala 30:22]
    addRecFN_out <= addRecFN_io_out; // @[AddSubPE.scala 39:30]
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
  op = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rounding = _RAND_1[2:0];
  _RAND_2 = {2{`RANDOM}};
  in_0 = _RAND_2[32:0];
  _RAND_3 = {2{`RANDOM}};
  in_1 = _RAND_3[32:0];
  _RAND_4 = {2{`RANDOM}};
  addRecFN_out = _RAND_4[32:0];
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
  input         io_tininess,
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
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  wire  m_0_clock; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_0; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_1; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_2; // @[PE.scala 106:19]
  wire [1:0] m_0_io_sel; // @[PE.scala 106:19]
  wire [31:0] m_0_io_out; // @[PE.scala 106:19]
  wire  m_1_clock; // @[PE.scala 114:19]
  wire [31:0] m_1_io_in_0; // @[PE.scala 114:19]
  wire [31:0] m_1_io_in_1; // @[PE.scala 114:19]
  wire [31:0] m_1_io_in_2; // @[PE.scala 114:19]
  wire [1:0] m_1_io_sel; // @[PE.scala 114:19]
  wire [31:0] m_1_io_out; // @[PE.scala 114:19]
  wire  m_2_clock; // @[PE.scala 122:19]
  wire [31:0] m_2_io_in_0; // @[PE.scala 122:19]
  wire [31:0] m_2_io_in_1; // @[PE.scala 122:19]
  wire [31:0] m_2_io_in_2; // @[PE.scala 122:19]
  wire [1:0] m_2_io_sel; // @[PE.scala 122:19]
  wire [31:0] m_2_io_out; // @[PE.scala 122:19]
  wire  m_3_clock; // @[PE.scala 130:19]
  wire [31:0] m_3_io_in_0; // @[PE.scala 130:19]
  wire [31:0] m_3_io_in_1; // @[PE.scala 130:19]
  wire [31:0] m_3_io_in_2; // @[PE.scala 130:19]
  wire [1:0] m_3_io_sel; // @[PE.scala 130:19]
  wire [31:0] m_3_io_out; // @[PE.scala 130:19]
  wire  multModule_0_clock; // @[PE.scala 141:28]
  wire [2:0] multModule_0_io_rounding; // @[PE.scala 141:28]
  wire [31:0] multModule_0_io_in_0; // @[PE.scala 141:28]
  wire [31:0] multModule_0_io_in_1; // @[PE.scala 141:28]
  wire [32:0] multModule_0_io_out; // @[PE.scala 141:28]
  wire  multModule_1_clock; // @[PE.scala 148:28]
  wire [2:0] multModule_1_io_rounding; // @[PE.scala 148:28]
  wire [31:0] multModule_1_io_in_0; // @[PE.scala 148:28]
  wire [31:0] multModule_1_io_in_1; // @[PE.scala 148:28]
  wire [32:0] multModule_1_io_out; // @[PE.scala 148:28]
  wire  m_4_clock; // @[PE.scala 158:19]
  wire [31:0] m_4_io_in_0; // @[PE.scala 158:19]
  wire [31:0] m_4_io_in_1; // @[PE.scala 158:19]
  wire [31:0] m_4_io_in_2; // @[PE.scala 158:19]
  wire [1:0] m_4_io_sel; // @[PE.scala 158:19]
  wire [31:0] m_4_io_out; // @[PE.scala 158:19]
  wire  m_5_clock; // @[PE.scala 166:19]
  wire [31:0] m_5_io_in_0; // @[PE.scala 166:19]
  wire [31:0] m_5_io_in_1; // @[PE.scala 166:19]
  wire [31:0] m_5_io_in_2; // @[PE.scala 166:19]
  wire [1:0] m_5_io_sel; // @[PE.scala 166:19]
  wire [31:0] m_5_io_out; // @[PE.scala 166:19]
  wire  m_6_clock; // @[PE.scala 174:19]
  wire [31:0] m_6_io_in_0; // @[PE.scala 174:19]
  wire [31:0] m_6_io_in_1; // @[PE.scala 174:19]
  wire [31:0] m_6_io_in_2; // @[PE.scala 174:19]
  wire [1:0] m_6_io_sel; // @[PE.scala 174:19]
  wire [31:0] m_6_io_out; // @[PE.scala 174:19]
  wire  m_7_clock; // @[PE.scala 182:19]
  wire [31:0] m_7_io_in_0; // @[PE.scala 182:19]
  wire [31:0] m_7_io_in_1; // @[PE.scala 182:19]
  wire [31:0] m_7_io_in_2; // @[PE.scala 182:19]
  wire [1:0] m_7_io_sel; // @[PE.scala 182:19]
  wire [31:0] m_7_io_out; // @[PE.scala 182:19]
  wire  addsubModule_0_clock; // @[PE.scala 193:30]
  wire  addsubModule_0_io_op; // @[PE.scala 193:30]
  wire [2:0] addsubModule_0_io_rounding; // @[PE.scala 193:30]
  wire [32:0] addsubModule_0_io_in_0; // @[PE.scala 193:30]
  wire [32:0] addsubModule_0_io_in_1; // @[PE.scala 193:30]
  wire [32:0] addsubModule_0_io_out; // @[PE.scala 193:30]
  wire  addsubModule_1_clock; // @[PE.scala 201:30]
  wire  addsubModule_1_io_op; // @[PE.scala 201:30]
  wire [2:0] addsubModule_1_io_rounding; // @[PE.scala 201:30]
  wire [32:0] addsubModule_1_io_in_0; // @[PE.scala 201:30]
  wire [32:0] addsubModule_1_io_in_1; // @[PE.scala 201:30]
  wire [32:0] addsubModule_1_io_out; // @[PE.scala 201:30]
  wire  m_8_clock; // @[PE.scala 212:19]
  wire [31:0] m_8_io_in_0; // @[PE.scala 212:19]
  wire [31:0] m_8_io_in_1; // @[PE.scala 212:19]
  wire [31:0] m_8_io_in_2; // @[PE.scala 212:19]
  wire [1:0] m_8_io_sel; // @[PE.scala 212:19]
  wire [31:0] m_8_io_out; // @[PE.scala 212:19]
  wire  m_9_clock; // @[PE.scala 220:19]
  wire [31:0] m_9_io_in_0; // @[PE.scala 220:19]
  wire [31:0] m_9_io_in_1; // @[PE.scala 220:19]
  wire [31:0] m_9_io_in_2; // @[PE.scala 220:19]
  wire [1:0] m_9_io_sel; // @[PE.scala 220:19]
  wire [31:0] m_9_io_out; // @[PE.scala 220:19]
  reg [31:0] Xi_0; // @[PE.scala 47:22]
  reg [31:0] Yi_0; // @[PE.scala 48:22]
  reg [31:0] Xi_1; // @[PE.scala 50:22]
  reg [31:0] Yi_1; // @[PE.scala 51:22]
  reg [31:0] aggr_0; // @[PE.scala 56:24]
  reg [31:0] aggr_1; // @[PE.scala 57:24]
  reg [31:0] aggr_2; // @[PE.scala 59:24]
  reg [31:0] aggr_3; // @[PE.scala 60:24]
  reg [1:0] m_0_sel; // @[PE.scala 65:25]
  reg [1:0] m_1_sel; // @[PE.scala 66:25]
  reg [1:0] m_2_sel; // @[PE.scala 67:25]
  reg [1:0] m_3_sel; // @[PE.scala 68:25]
  reg [1:0] m_5_sel; // @[PE.scala 70:25]
  reg [1:0] m_6_sel; // @[PE.scala 71:25]
  reg [1:0] m_7_sel; // @[PE.scala 72:25]
  reg [1:0] m_8_sel; // @[PE.scala 73:25]
  reg  addsub_0_op; // @[PE.scala 76:29]
  reg  addsub_1_op; // @[PE.scala 77:29]
  reg [2:0] rounding; // @[PE.scala 80:29]
  reg [32:0] addsubModule_0_out; // @[PE.scala 87:36]
  reg [32:0] addsubModule_1_out; // @[PE.scala 88:36]
  reg [32:0] multModule_0_out; // @[PE.scala 89:36]
  reg [32:0] multModule_1_out; // @[PE.scala 90:36]
  reg [32:0] m_0_out; // @[PE.scala 92:24]
  reg [32:0] m_1_out; // @[PE.scala 93:24]
  reg [32:0] m_2_out; // @[PE.scala 94:24]
  reg [32:0] m_3_out; // @[PE.scala 95:24]
  reg [32:0] m_4_out; // @[PE.scala 96:24]
  reg [32:0] m_5_out; // @[PE.scala 97:24]
  reg [32:0] m_6_out; // @[PE.scala 98:24]
  reg [32:0] m_7_out; // @[PE.scala 99:24]
  reg [32:0] m_8_out; // @[PE.scala 100:24]
  reg [32:0] m_9_out; // @[PE.scala 101:24]
  MuxPE m_0 ( // @[PE.scala 106:19]
    .clock(m_0_clock),
    .io_in_0(m_0_io_in_0),
    .io_in_1(m_0_io_in_1),
    .io_in_2(m_0_io_in_2),
    .io_sel(m_0_io_sel),
    .io_out(m_0_io_out)
  );
  MuxPE m_1 ( // @[PE.scala 114:19]
    .clock(m_1_clock),
    .io_in_0(m_1_io_in_0),
    .io_in_1(m_1_io_in_1),
    .io_in_2(m_1_io_in_2),
    .io_sel(m_1_io_sel),
    .io_out(m_1_io_out)
  );
  MuxPE m_2 ( // @[PE.scala 122:19]
    .clock(m_2_clock),
    .io_in_0(m_2_io_in_0),
    .io_in_1(m_2_io_in_1),
    .io_in_2(m_2_io_in_2),
    .io_sel(m_2_io_sel),
    .io_out(m_2_io_out)
  );
  MuxPE m_3 ( // @[PE.scala 130:19]
    .clock(m_3_clock),
    .io_in_0(m_3_io_in_0),
    .io_in_1(m_3_io_in_1),
    .io_in_2(m_3_io_in_2),
    .io_sel(m_3_io_sel),
    .io_out(m_3_io_out)
  );
  MultPE multModule_0 ( // @[PE.scala 141:28]
    .clock(multModule_0_clock),
    .io_rounding(multModule_0_io_rounding),
    .io_in_0(multModule_0_io_in_0),
    .io_in_1(multModule_0_io_in_1),
    .io_out(multModule_0_io_out)
  );
  MultPE multModule_1 ( // @[PE.scala 148:28]
    .clock(multModule_1_clock),
    .io_rounding(multModule_1_io_rounding),
    .io_in_0(multModule_1_io_in_0),
    .io_in_1(multModule_1_io_in_1),
    .io_out(multModule_1_io_out)
  );
  MuxPE m_4 ( // @[PE.scala 158:19]
    .clock(m_4_clock),
    .io_in_0(m_4_io_in_0),
    .io_in_1(m_4_io_in_1),
    .io_in_2(m_4_io_in_2),
    .io_sel(m_4_io_sel),
    .io_out(m_4_io_out)
  );
  MuxPE m_5 ( // @[PE.scala 166:19]
    .clock(m_5_clock),
    .io_in_0(m_5_io_in_0),
    .io_in_1(m_5_io_in_1),
    .io_in_2(m_5_io_in_2),
    .io_sel(m_5_io_sel),
    .io_out(m_5_io_out)
  );
  MuxPE m_6 ( // @[PE.scala 174:19]
    .clock(m_6_clock),
    .io_in_0(m_6_io_in_0),
    .io_in_1(m_6_io_in_1),
    .io_in_2(m_6_io_in_2),
    .io_sel(m_6_io_sel),
    .io_out(m_6_io_out)
  );
  MuxPE m_7 ( // @[PE.scala 182:19]
    .clock(m_7_clock),
    .io_in_0(m_7_io_in_0),
    .io_in_1(m_7_io_in_1),
    .io_in_2(m_7_io_in_2),
    .io_sel(m_7_io_sel),
    .io_out(m_7_io_out)
  );
  AddSubPE addsubModule_0 ( // @[PE.scala 193:30]
    .clock(addsubModule_0_clock),
    .io_op(addsubModule_0_io_op),
    .io_rounding(addsubModule_0_io_rounding),
    .io_in_0(addsubModule_0_io_in_0),
    .io_in_1(addsubModule_0_io_in_1),
    .io_out(addsubModule_0_io_out)
  );
  AddSubPE addsubModule_1 ( // @[PE.scala 201:30]
    .clock(addsubModule_1_clock),
    .io_op(addsubModule_1_io_op),
    .io_rounding(addsubModule_1_io_rounding),
    .io_in_0(addsubModule_1_io_in_0),
    .io_in_1(addsubModule_1_io_in_1),
    .io_out(addsubModule_1_io_out)
  );
  MuxPE m_8 ( // @[PE.scala 212:19]
    .clock(m_8_clock),
    .io_in_0(m_8_io_in_0),
    .io_in_1(m_8_io_in_1),
    .io_in_2(m_8_io_in_2),
    .io_sel(m_8_io_sel),
    .io_out(m_8_io_out)
  );
  MuxPE m_9 ( // @[PE.scala 220:19]
    .clock(m_9_clock),
    .io_in_0(m_9_io_in_0),
    .io_in_1(m_9_io_in_1),
    .io_in_2(m_9_io_in_2),
    .io_sel(m_9_io_sel),
    .io_out(m_9_io_out)
  );
  assign io_out_0 = m_8_out; // @[PE.scala 231:12]
  assign io_out_1 = m_9_out; // @[PE.scala 232:12]
  assign m_0_clock = clock;
  assign m_0_io_in_0 = Xi_0; // @[PE.scala 108:15]
  assign m_0_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 109:15]
  assign m_0_io_in_2 = 32'h0;
  assign m_0_io_sel = m_0_sel; // @[PE.scala 107:14]
  assign m_1_clock = clock;
  assign m_1_io_in_0 = Yi_0; // @[PE.scala 116:15]
  assign m_1_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 117:15]
  assign m_1_io_in_2 = 32'h0;
  assign m_1_io_sel = m_1_sel; // @[PE.scala 115:14]
  assign m_2_clock = clock;
  assign m_2_io_in_0 = Xi_1; // @[PE.scala 124:15]
  assign m_2_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 125:15]
  assign m_2_io_in_2 = 32'h0;
  assign m_2_io_sel = m_2_sel; // @[PE.scala 123:14]
  assign m_3_clock = clock;
  assign m_3_io_in_0 = Yi_1; // @[PE.scala 132:15]
  assign m_3_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 133:15]
  assign m_3_io_in_2 = 32'h0;
  assign m_3_io_sel = m_3_sel; // @[PE.scala 131:14]
  assign multModule_0_clock = clock;
  assign multModule_0_io_rounding = rounding; // @[PE.scala 142:30]
  assign multModule_0_io_in_0 = m_0_out[31:0]; // @[PE.scala 144:24]
  assign multModule_0_io_in_1 = m_1_out[31:0]; // @[PE.scala 145:24]
  assign multModule_1_clock = clock;
  assign multModule_1_io_rounding = rounding; // @[PE.scala 149:30]
  assign multModule_1_io_in_0 = m_2_out[31:0]; // @[PE.scala 151:24]
  assign multModule_1_io_in_1 = m_3_out[31:0]; // @[PE.scala 152:24]
  assign m_4_clock = clock;
  assign m_4_io_in_0 = Xi_0; // @[PE.scala 160:15]
  assign m_4_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 161:15]
  assign m_4_io_in_2 = aggr_0; // @[PE.scala 162:15]
  assign m_4_io_sel = m_0_sel; // @[PE.scala 159:15]
  assign m_5_clock = clock;
  assign m_5_io_in_0 = Yi_0; // @[PE.scala 168:15]
  assign m_5_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 169:15]
  assign m_5_io_in_2 = aggr_1; // @[PE.scala 170:15]
  assign m_5_io_sel = m_5_sel; // @[PE.scala 167:15]
  assign m_6_clock = clock;
  assign m_6_io_in_0 = Xi_1; // @[PE.scala 176:15]
  assign m_6_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 177:15]
  assign m_6_io_in_2 = aggr_2; // @[PE.scala 178:15]
  assign m_6_io_sel = m_6_sel; // @[PE.scala 175:15]
  assign m_7_clock = clock;
  assign m_7_io_in_0 = Yi_1; // @[PE.scala 184:15]
  assign m_7_io_in_1 = 32'h0;
  assign m_7_io_in_2 = aggr_3; // @[PE.scala 186:15]
  assign m_7_io_sel = m_7_sel; // @[PE.scala 183:15]
  assign addsubModule_0_clock = clock;
  assign addsubModule_0_io_op = addsub_0_op; // @[PE.scala 194:24]
  assign addsubModule_0_io_rounding = rounding; // @[PE.scala 197:32]
  assign addsubModule_0_io_in_0 = m_4_out; // @[PE.scala 195:26]
  assign addsubModule_0_io_in_1 = m_5_out; // @[PE.scala 196:26]
  assign addsubModule_1_clock = clock;
  assign addsubModule_1_io_op = addsub_1_op; // @[PE.scala 202:24]
  assign addsubModule_1_io_rounding = rounding; // @[PE.scala 205:32]
  assign addsubModule_1_io_in_0 = m_6_out; // @[PE.scala 203:26]
  assign addsubModule_1_io_in_1 = m_7_out; // @[PE.scala 204:26]
  assign m_8_clock = clock;
  assign m_8_io_in_0 = addsubModule_0_out[31:0]; // @[PE.scala 214:15]
  assign m_8_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 215:15]
  assign m_8_io_in_2 = 32'h0;
  assign m_8_io_sel = m_8_sel; // @[PE.scala 213:15]
  assign m_9_clock = clock;
  assign m_9_io_in_0 = addsubModule_1_out[31:0]; // @[PE.scala 222:15]
  assign m_9_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 223:15]
  assign m_9_io_in_2 = 32'h0;
  assign m_9_io_sel = m_7_sel; // @[PE.scala 221:15]
  always @(posedge clock) begin
    Xi_0 <= io_Xi_0; // @[PE.scala 47:22]
    Yi_0 <= io_Yi_0; // @[PE.scala 48:22]
    Xi_1 <= io_Xi_1; // @[PE.scala 50:22]
    Yi_1 <= io_Yi_1; // @[PE.scala 51:22]
    aggr_0 <= io_aggr_0; // @[PE.scala 56:24]
    aggr_1 <= io_aggr_0; // @[PE.scala 57:24]
    aggr_2 <= io_aggr_0; // @[PE.scala 59:24]
    aggr_3 <= io_aggr_0; // @[PE.scala 60:24]
    m_0_sel <= io_m_0_sel; // @[PE.scala 65:25]
    m_1_sel <= io_m_1_sel; // @[PE.scala 66:25]
    m_2_sel <= io_m_2_sel; // @[PE.scala 67:25]
    m_3_sel <= io_m_3_sel; // @[PE.scala 68:25]
    m_5_sel <= io_m_5_sel; // @[PE.scala 70:25]
    m_6_sel <= io_m_6_sel; // @[PE.scala 71:25]
    m_7_sel <= io_m_7_sel; // @[PE.scala 72:25]
    m_8_sel <= io_m_8_sel; // @[PE.scala 73:25]
    addsub_0_op <= io_addsub_0_op; // @[PE.scala 76:29]
    addsub_1_op <= io_addsub_1_op; // @[PE.scala 77:29]
    rounding <= io_rounding; // @[PE.scala 80:29]
    if (reset) begin // @[PE.scala 87:36]
      addsubModule_0_out <= 33'h0; // @[PE.scala 87:36]
    end else begin
      addsubModule_0_out <= addsubModule_0_io_out; // @[PE.scala 199:23]
    end
    if (reset) begin // @[PE.scala 88:36]
      addsubModule_1_out <= 33'h0; // @[PE.scala 88:36]
    end else begin
      addsubModule_1_out <= addsubModule_1_io_out; // @[PE.scala 207:23]
    end
    if (reset) begin // @[PE.scala 89:36]
      multModule_0_out <= 33'h0; // @[PE.scala 89:36]
    end else begin
      multModule_0_out <= multModule_0_io_out; // @[PE.scala 146:21]
    end
    if (reset) begin // @[PE.scala 90:36]
      multModule_1_out <= 33'h0; // @[PE.scala 90:36]
    end else begin
      multModule_1_out <= multModule_1_io_out; // @[PE.scala 153:21]
    end
    if (reset) begin // @[PE.scala 92:24]
      m_0_out <= 33'h0; // @[PE.scala 92:24]
    end else begin
      m_0_out <= {{1'd0}, m_0_io_out}; // @[PE.scala 112:11]
    end
    if (reset) begin // @[PE.scala 93:24]
      m_1_out <= 33'h0; // @[PE.scala 93:24]
    end else begin
      m_1_out <= {{1'd0}, m_1_io_out}; // @[PE.scala 120:11]
    end
    if (reset) begin // @[PE.scala 94:24]
      m_2_out <= 33'h0; // @[PE.scala 94:24]
    end else begin
      m_2_out <= {{1'd0}, m_2_io_out}; // @[PE.scala 128:11]
    end
    if (reset) begin // @[PE.scala 95:24]
      m_3_out <= 33'h0; // @[PE.scala 95:24]
    end else begin
      m_3_out <= {{1'd0}, m_3_io_out}; // @[PE.scala 136:11]
    end
    if (reset) begin // @[PE.scala 96:24]
      m_4_out <= 33'h0; // @[PE.scala 96:24]
    end else begin
      m_4_out <= {{1'd0}, m_4_io_out}; // @[PE.scala 164:15]
    end
    if (reset) begin // @[PE.scala 97:24]
      m_5_out <= 33'h0; // @[PE.scala 97:24]
    end else begin
      m_5_out <= {{1'd0}, m_5_io_out}; // @[PE.scala 172:15]
    end
    if (reset) begin // @[PE.scala 98:24]
      m_6_out <= 33'h0; // @[PE.scala 98:24]
    end else begin
      m_6_out <= {{1'd0}, m_6_io_out}; // @[PE.scala 180:15]
    end
    if (reset) begin // @[PE.scala 99:24]
      m_7_out <= 33'h0; // @[PE.scala 99:24]
    end else begin
      m_7_out <= {{1'd0}, m_7_io_out}; // @[PE.scala 188:15]
    end
    if (reset) begin // @[PE.scala 100:24]
      m_8_out <= 33'h0; // @[PE.scala 100:24]
    end else begin
      m_8_out <= {{1'd0}, m_8_io_out}; // @[PE.scala 218:15]
    end
    if (reset) begin // @[PE.scala 101:24]
      m_9_out <= 33'h0; // @[PE.scala 101:24]
    end else begin
      m_9_out <= {{1'd0}, m_9_io_out}; // @[PE.scala 226:15]
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
  m_5_sel = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  m_6_sel = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  m_7_sel = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  m_8_sel = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  addsub_0_op = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  addsub_1_op = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  rounding = _RAND_18[2:0];
  _RAND_19 = {2{`RANDOM}};
  addsubModule_0_out = _RAND_19[32:0];
  _RAND_20 = {2{`RANDOM}};
  addsubModule_1_out = _RAND_20[32:0];
  _RAND_21 = {2{`RANDOM}};
  multModule_0_out = _RAND_21[32:0];
  _RAND_22 = {2{`RANDOM}};
  multModule_1_out = _RAND_22[32:0];
  _RAND_23 = {2{`RANDOM}};
  m_0_out = _RAND_23[32:0];
  _RAND_24 = {2{`RANDOM}};
  m_1_out = _RAND_24[32:0];
  _RAND_25 = {2{`RANDOM}};
  m_2_out = _RAND_25[32:0];
  _RAND_26 = {2{`RANDOM}};
  m_3_out = _RAND_26[32:0];
  _RAND_27 = {2{`RANDOM}};
  m_4_out = _RAND_27[32:0];
  _RAND_28 = {2{`RANDOM}};
  m_5_out = _RAND_28[32:0];
  _RAND_29 = {2{`RANDOM}};
  m_6_out = _RAND_29[32:0];
  _RAND_30 = {2{`RANDOM}};
  m_7_out = _RAND_30[32:0];
  _RAND_31 = {2{`RANDOM}};
  m_8_out = _RAND_31[32:0];
  _RAND_32 = {2{`RANDOM}};
  m_9_out = _RAND_32[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
