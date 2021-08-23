module RoundAnyRawFNToRecFN(
  input         io_in_isZero,
  input         io_in_sign,
  input  [7:0]  io_in_sExp,
  input  [32:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RoundAnyRawFNToRecFN.scala 88:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RoundAnyRawFNToRecFN.scala 90:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RoundAnyRawFNToRecFN.scala 91:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RoundAnyRawFNToRecFN.scala 92:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RoundAnyRawFNToRecFN.scala 93:53]
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign; // @[RoundAnyRawFNToRecFN.scala 96:42]
  wire [8:0] _GEN_0 = {{1{io_in_sExp[7]}},io_in_sExp}; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [9:0] _sAdjustedExp_T = $signed(_GEN_0) + 9'shc0; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [9:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[8:0])}; // @[RoundAnyRawFNToRecFN.scala 104:31]
  wire [25:0] adjustedSig_hi = io_in_sig[32:7]; // @[RoundAnyRawFNToRecFN.scala 114:26]
  wire  adjustedSig_lo = |io_in_sig[6:0]; // @[RoundAnyRawFNToRecFN.scala 115:60]
  wire [26:0] adjustedSig = {adjustedSig_hi,adjustedSig_lo}; // @[Cat.scala 30:58]
  wire [26:0] _roundPosBit_T = adjustedSig & 27'h2; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [26:0] _anyRoundExtra_T = adjustedSig & 27'h1; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire  anyRound = roundPosBit | anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 164:36]
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit; // @[RoundAnyRawFNToRecFN.scala 167:67]
  wire  _roundIncr_T_2 = roundMagUp & anyRound; // @[RoundAnyRawFNToRecFN.scala 169:29]
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2; // @[RoundAnyRawFNToRecFN.scala 168:31]
  wire [26:0] _roundedSig_T = adjustedSig | 27'h3; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [25:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? 26'h1 : 26'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [26:0] _roundedSig_T_11 = adjustedSig & 27'h7fffffc; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [25:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? 26'h1 : 26'h0; // @[RoundAnyRawFNToRecFN.scala 179:24]
  wire [25:0] _GEN_1 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] _roundedSig_T_16 = _GEN_1 | _roundedSig_T_15; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [9:0] _GEN_2 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [10:0] sRoundedExp = $signed(sAdjustedExp) + $signed(_GEN_2); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [22:0] common_fractOut = roundedSig[22:0]; // @[RoundAnyRawFNToRecFN.scala 189:27]
  wire [8:0] _expOut_T_1 = io_in_isZero ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [8:0] expOut = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [22:0] fractOut = io_in_isZero ? 23'h0 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [9:0] io_out_hi = {io_in_sign,expOut}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
endmodule
module INToRecFN(
  input  [31:0] io_in,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[INToRecFN.scala 59:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[INToRecFN.scala 59:15]
  wire [7:0] roundAnyRawFNToRecFN_io_in_sExp; // @[INToRecFN.scala 59:15]
  wire [32:0] roundAnyRawFNToRecFN_io_in_sig; // @[INToRecFN.scala 59:15]
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode; // @[INToRecFN.scala 59:15]
  wire [32:0] roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 59:15]
  wire  intAsRawFloat_sign = io_in[31]; // @[rawFloatFromIN.scala 50:34]
  wire [31:0] _intAsRawFloat_absIn_T_1 = 32'h0 - io_in; // @[rawFloatFromIN.scala 51:31]
  wire [31:0] intAsRawFloat_extAbsIn_lo = intAsRawFloat_sign ? _intAsRawFloat_absIn_T_1 : io_in; // @[rawFloatFromIN.scala 51:24]
  wire [63:0] _intAsRawFloat_extAbsIn_T = {32'h0,intAsRawFloat_extAbsIn_lo}; // @[Cat.scala 30:58]
  wire [31:0] intAsRawFloat_extAbsIn = _intAsRawFloat_extAbsIn_T[31:0]; // @[rawFloatFromIN.scala 52:56]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_32 = intAsRawFloat_extAbsIn[1] ? 5'h1e : 5'h1f; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_33 = intAsRawFloat_extAbsIn[2] ? 5'h1d :
    _intAsRawFloat_adjustedNormDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_34 = intAsRawFloat_extAbsIn[3] ? 5'h1c :
    _intAsRawFloat_adjustedNormDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_35 = intAsRawFloat_extAbsIn[4] ? 5'h1b :
    _intAsRawFloat_adjustedNormDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_36 = intAsRawFloat_extAbsIn[5] ? 5'h1a :
    _intAsRawFloat_adjustedNormDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_37 = intAsRawFloat_extAbsIn[6] ? 5'h19 :
    _intAsRawFloat_adjustedNormDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_38 = intAsRawFloat_extAbsIn[7] ? 5'h18 :
    _intAsRawFloat_adjustedNormDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_39 = intAsRawFloat_extAbsIn[8] ? 5'h17 :
    _intAsRawFloat_adjustedNormDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_40 = intAsRawFloat_extAbsIn[9] ? 5'h16 :
    _intAsRawFloat_adjustedNormDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_41 = intAsRawFloat_extAbsIn[10] ? 5'h15 :
    _intAsRawFloat_adjustedNormDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_42 = intAsRawFloat_extAbsIn[11] ? 5'h14 :
    _intAsRawFloat_adjustedNormDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_43 = intAsRawFloat_extAbsIn[12] ? 5'h13 :
    _intAsRawFloat_adjustedNormDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_44 = intAsRawFloat_extAbsIn[13] ? 5'h12 :
    _intAsRawFloat_adjustedNormDist_T_43; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_45 = intAsRawFloat_extAbsIn[14] ? 5'h11 :
    _intAsRawFloat_adjustedNormDist_T_44; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_46 = intAsRawFloat_extAbsIn[15] ? 5'h10 :
    _intAsRawFloat_adjustedNormDist_T_45; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_47 = intAsRawFloat_extAbsIn[16] ? 5'hf :
    _intAsRawFloat_adjustedNormDist_T_46; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_48 = intAsRawFloat_extAbsIn[17] ? 5'he :
    _intAsRawFloat_adjustedNormDist_T_47; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_49 = intAsRawFloat_extAbsIn[18] ? 5'hd :
    _intAsRawFloat_adjustedNormDist_T_48; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_50 = intAsRawFloat_extAbsIn[19] ? 5'hc :
    _intAsRawFloat_adjustedNormDist_T_49; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_51 = intAsRawFloat_extAbsIn[20] ? 5'hb :
    _intAsRawFloat_adjustedNormDist_T_50; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_52 = intAsRawFloat_extAbsIn[21] ? 5'ha :
    _intAsRawFloat_adjustedNormDist_T_51; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_53 = intAsRawFloat_extAbsIn[22] ? 5'h9 :
    _intAsRawFloat_adjustedNormDist_T_52; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_54 = intAsRawFloat_extAbsIn[23] ? 5'h8 :
    _intAsRawFloat_adjustedNormDist_T_53; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_55 = intAsRawFloat_extAbsIn[24] ? 5'h7 :
    _intAsRawFloat_adjustedNormDist_T_54; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_56 = intAsRawFloat_extAbsIn[25] ? 5'h6 :
    _intAsRawFloat_adjustedNormDist_T_55; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_57 = intAsRawFloat_extAbsIn[26] ? 5'h5 :
    _intAsRawFloat_adjustedNormDist_T_56; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_58 = intAsRawFloat_extAbsIn[27] ? 5'h4 :
    _intAsRawFloat_adjustedNormDist_T_57; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_59 = intAsRawFloat_extAbsIn[28] ? 5'h3 :
    _intAsRawFloat_adjustedNormDist_T_58; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_60 = intAsRawFloat_extAbsIn[29] ? 5'h2 :
    _intAsRawFloat_adjustedNormDist_T_59; // @[Mux.scala 47:69]
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_61 = intAsRawFloat_extAbsIn[30] ? 5'h1 :
    _intAsRawFloat_adjustedNormDist_T_60; // @[Mux.scala 47:69]
  wire [4:0] intAsRawFloat_adjustedNormDist = intAsRawFloat_extAbsIn[31] ? 5'h0 : _intAsRawFloat_adjustedNormDist_T_61; // @[Mux.scala 47:69]
  wire [62:0] _GEN_0 = {{31'd0}, intAsRawFloat_extAbsIn}; // @[rawFloatFromIN.scala 55:22]
  wire [62:0] _intAsRawFloat_sig_T = _GEN_0 << intAsRawFloat_adjustedNormDist; // @[rawFloatFromIN.scala 55:22]
  wire [31:0] intAsRawFloat_sig = _intAsRawFloat_sig_T[31:0]; // @[rawFloatFromIN.scala 55:41]
  wire [4:0] intAsRawFloat_out_sExp_lo = ~intAsRawFloat_adjustedNormDist; // @[rawFloatFromIN.scala 63:39]
  wire [6:0] _intAsRawFloat_out_sExp_T_1 = {2'h2,intAsRawFloat_out_sExp_lo}; // @[Cat.scala 30:58]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[INToRecFN.scala 59:15]
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundAnyRawFNToRecFN_io_roundingMode),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 72:23]
  assign roundAnyRawFNToRecFN_io_in_isZero = ~intAsRawFloat_sig[31]; // @[rawFloatFromIN.scala 61:23]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in[31]; // @[rawFloatFromIN.scala 50:34]
  assign roundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_intAsRawFloat_out_sExp_T_1)}; // @[rawFloatFromIN.scala 63:75]
  assign roundAnyRawFNToRecFN_io_in_sig = {{1'd0}, intAsRawFloat_sig}; // @[rawFloatFromIN.scala 58:23 rawFloatFromIN.scala 64:20]
  assign roundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; // @[INToRecFN.scala 70:44]
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
  wire  _common_overflow_T_3 = |unroundedInt[30:0] | roundIncr; // @[RecFNToIN.scala 117:64]
  wire  _common_overflow_T_4 = magGeOne_atOverflowEdge & _common_overflow_T_3; // @[RecFNToIN.scala 116:49]
  wire  _common_overflow_T_6 = posExp == 8'h1e & roundCarryBut2; // @[RecFNToIN.scala 119:62]
  wire  _common_overflow_T_7 = magGeOne_atOverflowEdge | _common_overflow_T_6; // @[RecFNToIN.scala 118:49]
  wire  _common_overflow_T_8 = rawIn__sign ? _common_overflow_T_4 : _common_overflow_T_7; // @[RecFNToIN.scala 115:24]
  wire  _common_overflow_T_14 = posExp >= 8'h20 | _common_overflow_T_8; // @[RecFNToIN.scala 113:40]
  wire  common_overflow = magGeOne & _common_overflow_T_14; // @[RecFNToIN.scala 112:12]
  wire  invalidExc = rawIn__isNaN | rawIn__isInf; // @[RecFNToIN.scala 130:34]
  wire  excSign = ~rawIn__isNaN & rawIn__sign; // @[RecFNToIN.scala 134:32]
  wire [31:0] _excOut_T_1 = excSign ? 32'h80000000 : 32'h0; // @[RecFNToIN.scala 136:12]
  wire [30:0] _excOut_T_3 = ~excSign ? 31'h7fffffff : 31'h0; // @[RecFNToIN.scala 140:12]
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
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] iNToRecFN_1_io_in; // @[recFN2INT.scala 27:29]
  wire [2:0] iNToRecFN_1_io_roundingMode; // @[recFN2INT.scala 27:29]
  wire [32:0] iNToRecFN_1_io_out; // @[recFN2INT.scala 27:29]
  wire [32:0] recFNToIN_io_in; // @[recFN2INT.scala 35:27]
  wire [2:0] recFNToIN_io_roundingMode; // @[recFN2INT.scala 35:27]
  wire [31:0] recFNToIN_io_out; // @[recFN2INT.scala 35:27]
  reg [2:0] round_mode; // @[recFN2INT.scala 25:30]
  reg [32:0] iNToRecFN_1_out; // @[recFN2INT.scala 32:35]
  reg [31:0] recFNToIN_out; // @[recFN2INT.scala 39:32]
  INToRecFN iNToRecFN_1 ( // @[recFN2INT.scala 27:29]
    .io_in(iNToRecFN_1_io_in),
    .io_roundingMode(iNToRecFN_1_io_roundingMode),
    .io_out(iNToRecFN_1_io_out)
  );
  RecFNToIN recFNToIN ( // @[recFN2INT.scala 35:27]
    .io_in(recFNToIN_io_in),
    .io_roundingMode(recFNToIN_io_roundingMode),
    .io_out(recFNToIN_io_out)
  );
  assign io_out = recFNToIN_out; // @[recFN2INT.scala 41:12]
  assign iNToRecFN_1_io_in = io_in; // @[recFN2INT.scala 29:23]
  assign iNToRecFN_1_io_roundingMode = round_mode; // @[recFN2INT.scala 30:35]
  assign recFNToIN_io_in = iNToRecFN_1_out; // @[recFN2INT.scala 36:31]
  assign recFNToIN_io_roundingMode = round_mode; // @[recFN2INT.scala 37:31]
  always @(posedge clock) begin
    round_mode <= io_round; // @[recFN2INT.scala 25:30]
    iNToRecFN_1_out <= iNToRecFN_1_io_out; // @[recFN2INT.scala 32:35]
    recFNToIN_out <= recFNToIN_io_out; // @[recFN2INT.scala 39:32]
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
  round_mode = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  iNToRecFN_1_out = _RAND_1[32:0];
  _RAND_2 = {1{`RANDOM}};
  recFNToIN_out = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
