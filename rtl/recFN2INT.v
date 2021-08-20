module RoundAnyRawFNToRecFN(
  input         io_in_isZero,
  input  [5:0]  io_in_sExp,
  input  [8:0]  io_in_sig,
  output [56:0] io_out
);
  wire [24:0] _GEN_0 = {{19{io_in_sExp[5]}},io_in_sExp}; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [25:0] _sAdjustedExp_T = $signed(_GEN_0) + 25'shfffff0; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [25:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[24:0])}; // @[RoundAnyRawFNToRecFN.scala 104:31]
  wire [34:0] adjustedSig = {io_in_sig, 26'h0}; // @[RoundAnyRawFNToRecFN.scala 112:22]
  wire [25:0] _common_expOut_T_1 = {{1'd0}, sAdjustedExp[24:0]}; // @[RoundAnyRawFNToRecFN.scala 134:55]
  wire [24:0] common_expOut = _common_expOut_T_1[24:0]; // @[RoundAnyRawFNToRecFN.scala 134:55]
  wire [30:0] common_fractOut = adjustedSig[32:2]; // @[RoundAnyRawFNToRecFN.scala 138:28]
  wire [24:0] _expOut_T_1 = io_in_isZero ? 25'h1c00000 : 25'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [24:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [24:0] expOut = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [30:0] fractOut = io_in_isZero ? 31'h0 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [25:0] io_out_hi = {1'h1,expOut}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
endmodule
module INToRecFN(
  output [56:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[INToRecFN.scala 59:15]
  wire [5:0] roundAnyRawFNToRecFN_io_in_sExp; // @[INToRecFN.scala 59:15]
  wire [8:0] roundAnyRawFNToRecFN_io_in_sig; // @[INToRecFN.scala 59:15]
  wire [56:0] roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 59:15]
  wire [7:0] intAsRawFloat_extAbsIn_lo = 8'h0 - 8'he0; // @[rawFloatFromIN.scala 51:31]
  wire [15:0] _intAsRawFloat_extAbsIn_T = {8'h0,intAsRawFloat_extAbsIn_lo}; // @[Cat.scala 30:58]
  wire [7:0] intAsRawFloat_extAbsIn = _intAsRawFloat_extAbsIn_T[7:0]; // @[rawFloatFromIN.scala 52:56]
  wire [2:0] _intAsRawFloat_adjustedNormDist_T_8 = intAsRawFloat_extAbsIn[1] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _intAsRawFloat_adjustedNormDist_T_9 = intAsRawFloat_extAbsIn[2] ? 3'h5 :
    _intAsRawFloat_adjustedNormDist_T_8; // @[Mux.scala 47:69]
  wire [2:0] _intAsRawFloat_adjustedNormDist_T_10 = intAsRawFloat_extAbsIn[3] ? 3'h4 :
    _intAsRawFloat_adjustedNormDist_T_9; // @[Mux.scala 47:69]
  wire [2:0] _intAsRawFloat_adjustedNormDist_T_11 = intAsRawFloat_extAbsIn[4] ? 3'h3 :
    _intAsRawFloat_adjustedNormDist_T_10; // @[Mux.scala 47:69]
  wire [2:0] _intAsRawFloat_adjustedNormDist_T_12 = intAsRawFloat_extAbsIn[5] ? 3'h2 :
    _intAsRawFloat_adjustedNormDist_T_11; // @[Mux.scala 47:69]
  wire [2:0] _intAsRawFloat_adjustedNormDist_T_13 = intAsRawFloat_extAbsIn[6] ? 3'h1 :
    _intAsRawFloat_adjustedNormDist_T_12; // @[Mux.scala 47:69]
  wire [2:0] intAsRawFloat_adjustedNormDist = intAsRawFloat_extAbsIn[7] ? 3'h0 : _intAsRawFloat_adjustedNormDist_T_13; // @[Mux.scala 47:69]
  wire [14:0] _GEN_0 = {{7'd0}, intAsRawFloat_extAbsIn}; // @[rawFloatFromIN.scala 55:22]
  wire [14:0] _intAsRawFloat_sig_T = _GEN_0 << intAsRawFloat_adjustedNormDist; // @[rawFloatFromIN.scala 55:22]
  wire [7:0] intAsRawFloat_sig = _intAsRawFloat_sig_T[7:0]; // @[rawFloatFromIN.scala 55:41]
  wire [2:0] intAsRawFloat_out_sExp_lo = ~intAsRawFloat_adjustedNormDist; // @[rawFloatFromIN.scala 63:39]
  wire [4:0] _intAsRawFloat_out_sExp_T_1 = {2'h2,intAsRawFloat_out_sExp_lo}; // @[Cat.scala 30:58]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[INToRecFN.scala 59:15]
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 72:23]
  assign roundAnyRawFNToRecFN_io_in_isZero = ~intAsRawFloat_sig[7]; // @[rawFloatFromIN.scala 61:23]
  assign roundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_intAsRawFloat_out_sExp_T_1)}; // @[rawFloatFromIN.scala 63:75]
  assign roundAnyRawFNToRecFN_io_in_sig = {{1'd0}, intAsRawFloat_sig}; // @[rawFloatFromIN.scala 58:23 rawFloatFromIN.scala 64:20]
endmodule
module RecFNToIN(
  input  [32:0] io_in,
  input  [2:0]  io_roundingMode,
  output [31:0] io_out
);
  wire [8:0] rawIn_exp = io_in[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawIn_isZero = rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawIn_isSpecial = rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawIn__isNaN = rawIn_isSpecial & rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawIn__isInf = rawIn_isSpecial & ~rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawIn__sign = io_in[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] rawIn__sExp = {1'b0,$signed(rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  rawIn_out_sig_hi_lo = ~rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] rawIn_out_sig_lo = io_in[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [24:0] rawIn__sig = {1'h0,rawIn_out_sig_hi_lo,rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  magGeOne = rawIn__sExp[8]; // @[RecFNToIN.scala 58:30]
  wire [7:0] posExp = rawIn__sExp[7:0]; // @[RecFNToIN.scala 59:28]
  wire  magJustBelowOne = ~magGeOne & &posExp; // @[RecFNToIN.scala 60:37]
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RecFNToIN.scala 64:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RecFNToIN.scala 66:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RecFNToIN.scala 67:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RecFNToIN.scala 68:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RecFNToIN.scala 69:53]
  wire [22:0] shiftedSig_lo = rawIn__sig[22:0]; // @[RecFNToIN.scala 80:32]
  wire [23:0] _shiftedSig_T = {magGeOne,shiftedSig_lo}; // @[Cat.scala 30:58]
  wire [4:0] _shiftedSig_T_2 = magGeOne ? rawIn__sExp[4:0] : 5'h0; // @[RecFNToIN.scala 81:16]
  wire [54:0] _GEN_0 = {{31'd0}, _shiftedSig_T}; // @[RecFNToIN.scala 80:50]
  wire [54:0] shiftedSig = _GEN_0 << _shiftedSig_T_2; // @[RecFNToIN.scala 80:50]
  wire [32:0] alignedSig_hi = shiftedSig[54:22]; // @[RecFNToIN.scala 86:23]
  wire  alignedSig_lo = |shiftedSig[21:0]; // @[RecFNToIN.scala 86:69]
  wire [33:0] alignedSig = {alignedSig_hi,alignedSig_lo}; // @[Cat.scala 30:58]
  wire [31:0] unroundedInt = alignedSig[33:2]; // @[RecFNToIN.scala 87:54]
  wire  _common_inexact_T_1 = |alignedSig[1:0]; // @[RecFNToIN.scala 89:57]
  wire  common_inexact = magGeOne ? |alignedSig[1:0] : rawIn_out_sig_hi_lo; // @[RecFNToIN.scala 89:29]
  wire  _roundIncr_near_even_T_8 = magJustBelowOne & _common_inexact_T_1; // @[RecFNToIN.scala 92:26]
  wire  roundIncr_near_even = magGeOne & (&alignedSig[2:1] | &alignedSig[1:0]) | _roundIncr_near_even_T_8; // @[RecFNToIN.scala 91:78]
  wire  roundIncr_near_maxMag = magGeOne & alignedSig[1] | magJustBelowOne; // @[RecFNToIN.scala 93:61]
  wire  _roundIncr_T_1 = roundingMode_near_maxMag & roundIncr_near_maxMag; // @[RecFNToIN.scala 96:35]
  wire  _roundIncr_T_2 = roundingMode_near_even & roundIncr_near_even | _roundIncr_T_1; // @[RecFNToIN.scala 95:61]
  wire  _roundIncr_T_4 = rawIn__sign & common_inexact; // @[RecFNToIN.scala 98:26]
  wire  _roundIncr_T_5 = (roundingMode_min | roundingMode_odd) & _roundIncr_T_4; // @[RecFNToIN.scala 97:49]
  wire  _roundIncr_T_6 = _roundIncr_T_2 | _roundIncr_T_5; // @[RecFNToIN.scala 96:61]
  wire  _roundIncr_T_9 = roundingMode_max & (~rawIn__sign & common_inexact); // @[RecFNToIN.scala 99:27]
  wire  roundIncr = _roundIncr_T_6 | _roundIncr_T_9; // @[RecFNToIN.scala 98:46]
  wire [31:0] _complUnroundedInt_T = ~unroundedInt; // @[RecFNToIN.scala 100:45]
  wire [31:0] complUnroundedInt = rawIn__sign ? _complUnroundedInt_T : unroundedInt; // @[RecFNToIN.scala 100:32]
  wire [31:0] _roundedInt_T_2 = complUnroundedInt + 32'h1; // @[RecFNToIN.scala 103:31]
  wire [31:0] _roundedInt_T_3 = roundIncr ^ rawIn__sign ? _roundedInt_T_2 : complUnroundedInt; // @[RecFNToIN.scala 102:12]
  wire  _roundedInt_T_4 = roundingMode_odd & common_inexact; // @[RecFNToIN.scala 105:31]
  wire [31:0] _GEN_1 = {{31'd0}, _roundedInt_T_4}; // @[RecFNToIN.scala 105:11]
  wire [31:0] roundedInt = _roundedInt_T_3 | _GEN_1; // @[RecFNToIN.scala 105:11]
  wire  magGeOne_atOverflowEdge = posExp == 8'h1f; // @[RecFNToIN.scala 107:43]
  wire  roundCarryBut2 = &unroundedInt[29:0] & roundIncr; // @[RecFNToIN.scala 110:61]
  wire  _common_overflow_T_10 = magGeOne_atOverflowEdge & unroundedInt[30]; // @[RecFNToIN.scala 122:50]
  wire  _common_overflow_T_11 = _common_overflow_T_10 & roundCarryBut2; // @[RecFNToIN.scala 123:57]
  wire  _common_overflow_T_12 = rawIn__sign | _common_overflow_T_11; // @[RecFNToIN.scala 121:32]
  wire  _common_overflow_T_14 = posExp >= 8'h20 | _common_overflow_T_12; // @[RecFNToIN.scala 113:40]
  wire  _common_overflow_T_17 = rawIn__sign & roundIncr; // @[RecFNToIN.scala 125:41]
  wire  common_overflow = magGeOne ? _common_overflow_T_14 : _common_overflow_T_17; // @[RecFNToIN.scala 112:12]
  wire  invalidExc = rawIn__isNaN | rawIn__isInf; // @[RecFNToIN.scala 130:34]
  wire  excSign = ~rawIn__isNaN & rawIn__sign; // @[RecFNToIN.scala 134:32]
  wire  _excOut_T = ~excSign; // @[RecFNToIN.scala 136:27]
  wire [31:0] _excOut_T_1 = ~excSign ? 32'h80000000 : 32'h0; // @[RecFNToIN.scala 136:12]
  wire [30:0] _excOut_T_3 = _excOut_T ? 31'h7fffffff : 31'h0; // @[RecFNToIN.scala 140:12]
  wire [31:0] _GEN_2 = {{1'd0}, _excOut_T_3}; // @[RecFNToIN.scala 139:11]
  wire [31:0] excOut = _excOut_T_1 | _GEN_2; // @[RecFNToIN.scala 139:11]
  assign io_out = invalidExc | common_overflow ? excOut : roundedInt; // @[RecFNToIN.scala 142:18]
endmodule
module recFN2INT(
  input         clock,
  input         reset,
  input         io_signed,
  input  [2:0]  io_round,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [56:0] iNToRecFN_io_out; // @[recFN2INT.scala 26:27]
  wire [32:0] recFNToIN_io_in; // @[recFN2INT.scala 45:27]
  wire [2:0] recFNToIN_io_roundingMode; // @[recFN2INT.scala 45:27]
  wire [31:0] recFNToIN_io_out; // @[recFN2INT.scala 45:27]
  reg [56:0] mid; // @[recFN2INT.scala 31:22]
  reg [31:0] recFNToIN_out; // @[recFN2INT.scala 52:32]
  INToRecFN iNToRecFN ( // @[recFN2INT.scala 26:27]
    .io_out(iNToRecFN_io_out)
  );
  RecFNToIN recFNToIN ( // @[recFN2INT.scala 45:27]
    .io_in(recFNToIN_io_in),
    .io_roundingMode(recFNToIN_io_roundingMode),
    .io_out(recFNToIN_io_out)
  );
  assign io_out = recFNToIN_out; // @[recFN2INT.scala 54:12]
  assign recFNToIN_io_in = mid[32:0]; // @[recFN2INT.scala 46:31]
  assign recFNToIN_io_roundingMode = io_round; // @[recFN2INT.scala 49:31]
  always @(posedge clock) begin
    mid <= iNToRecFN_io_out; // @[recFN2INT.scala 31:22]
    recFNToIN_out <= recFNToIN_io_out; // @[recFN2INT.scala 52:32]
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
  mid = _RAND_0[56:0];
  _RAND_1 = {1{`RANDOM}};
  recFNToIN_out = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
