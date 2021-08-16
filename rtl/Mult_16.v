module MulFullRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [6:0]  io_a_sExp,
  input  [11:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [6:0]  io_b_sExp,
  input  [11:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [6:0]  io_rawOut_sExp,
  output [21:0] io_rawOut_sig
);
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isZero | io_a_isZero & io_b_isInf; // @[MulRecFN.scala 58:60]
  wire [6:0] _common_sExpOut_T_2 = $signed(io_a_sExp) + $signed(io_b_sExp); // @[MulRecFN.scala 62:36]
  wire [23:0] _common_sigOut_T = io_a_sig * io_b_sig; // @[MulRecFN.scala 63:35]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[9]; // @[common.scala 84:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[9]; // @[common.scala 84:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[MulRecFN.scala 66:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[MulRecFN.scala 70:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[MulRecFN.scala 59:38]
  assign io_rawOut_isZero = io_a_isZero | io_b_isZero; // @[MulRecFN.scala 60:40]
  assign io_rawOut_sign = io_a_sign ^ io_b_sign; // @[MulRecFN.scala 61:36]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - 7'sh20; // @[MulRecFN.scala 62:48]
  assign io_rawOut_sig = _common_sigOut_T[21:0]; // @[MulRecFN.scala 63:46]
endmodule
module MulRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [6:0]  io_a_sExp,
  input  [11:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [6:0]  io_b_sExp,
  input  [11:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [6:0]  io_rawOut_sExp,
  output [13:0] io_rawOut_sig
);
  wire  mulFullRaw_io_a_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_sign; // @[MulRecFN.scala 84:28]
  wire [6:0] mulFullRaw_io_a_sExp; // @[MulRecFN.scala 84:28]
  wire [11:0] mulFullRaw_io_a_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_sign; // @[MulRecFN.scala 84:28]
  wire [6:0] mulFullRaw_io_b_sExp; // @[MulRecFN.scala 84:28]
  wire [11:0] mulFullRaw_io_b_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_invalidExc; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 84:28]
  wire [6:0] mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 84:28]
  wire [21:0] mulFullRaw_io_rawOut_sig; // @[MulRecFN.scala 84:28]
  wire [12:0] io_rawOut_sig_hi = mulFullRaw_io_rawOut_sig[21:9]; // @[MulRecFN.scala 93:15]
  wire  io_rawOut_sig_lo = |mulFullRaw_io_rawOut_sig[8:0]; // @[MulRecFN.scala 93:55]
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
  assign io_rawOut_sig = {io_rawOut_sig_hi,io_rawOut_sig_lo}; // @[Cat.scala 30:58]
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
  input  [6:0]  io_in_sExp,
  input  [13:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [16:0] io_out
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RoundAnyRawFNToRecFN.scala 88:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RoundAnyRawFNToRecFN.scala 90:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RoundAnyRawFNToRecFN.scala 91:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RoundAnyRawFNToRecFN.scala 92:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RoundAnyRawFNToRecFN.scala 93:53]
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign; // @[RoundAnyRawFNToRecFN.scala 96:42]
  wire  doShiftSigDown1 = io_in_sig[13]; // @[RoundAnyRawFNToRecFN.scala 118:61]
  wire [5:0] _roundMask_T_1 = ~io_in_sExp[5:0]; // @[primitives.scala 51:21]
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> _roundMask_T_1; // @[primitives.scala 77:58]
  wire [7:0] _roundMask_T_7 = {{4'd0}, roundMask_shift[14:11]}; // @[Bitwise.scala 103:31]
  wire [7:0] _roundMask_T_9 = {roundMask_shift[10:7], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _roundMask_T_11 = _roundMask_T_9 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_0 = {{2'd0}, _roundMask_T_12[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _roundMask_T_17 = _GEN_0 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _roundMask_T_19 = {_roundMask_T_12[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _roundMask_T_21 = _roundMask_T_19 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_1 = {{1'd0}, _roundMask_T_22[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _roundMask_T_27 = _GEN_1 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _roundMask_T_29 = {_roundMask_T_22[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _roundMask_T_31 = _roundMask_T_29 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] roundMask_hi = _roundMask_T_27 | _roundMask_T_31; // @[Bitwise.scala 103:39]
  wire  roundMask_hi_1 = roundMask_shift[15]; // @[Bitwise.scala 109:18]
  wire  roundMask_lo = roundMask_shift[16]; // @[Bitwise.scala 109:44]
  wire  roundMask_hi_3 = roundMask_shift[17]; // @[Bitwise.scala 109:18]
  wire  roundMask_lo_1 = roundMask_shift[18]; // @[Bitwise.scala 109:44]
  wire [11:0] _roundMask_T_35 = {roundMask_hi,roundMask_hi_1,roundMask_lo,roundMask_hi_3,roundMask_lo_1}; // @[Cat.scala 30:58]
  wire [11:0] _GEN_2 = {{11'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [11:0] roundMask_hi_4 = _roundMask_T_35 | _GEN_2; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [13:0] roundMask = {roundMask_hi_4,2'h3}; // @[Cat.scala 30:58]
  wire [12:0] shiftedRoundMask_lo = roundMask[13:1]; // @[RoundAnyRawFNToRecFN.scala 160:57]
  wire [13:0] shiftedRoundMask = {1'h0,shiftedRoundMask_lo}; // @[Cat.scala 30:58]
  wire [13:0] _roundPosMask_T = ~shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 161:28]
  wire [13:0] roundPosMask = _roundPosMask_T & roundMask; // @[RoundAnyRawFNToRecFN.scala 161:46]
  wire [13:0] _roundPosBit_T = io_in_sig & roundPosMask; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [13:0] _anyRoundExtra_T = io_in_sig & shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire  anyRound = roundPosBit | anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 164:36]
  wire  _roundIncr_T = roundingMode_near_even | roundingMode_near_maxMag; // @[RoundAnyRawFNToRecFN.scala 167:38]
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit; // @[RoundAnyRawFNToRecFN.scala 167:67]
  wire  _roundIncr_T_2 = roundMagUp & anyRound; // @[RoundAnyRawFNToRecFN.scala 169:29]
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2; // @[RoundAnyRawFNToRecFN.scala 168:31]
  wire [13:0] _roundedSig_T = io_in_sig | roundMask; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [12:0] _roundedSig_T_2 = _roundedSig_T[13:2] + 12'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [12:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? shiftedRoundMask_lo : 13'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [12:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [12:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [13:0] _roundedSig_T_10 = ~roundMask; // @[RoundAnyRawFNToRecFN.scala 178:32]
  wire [13:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [12:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? roundPosMask[13:1] : 13'h0; // @[RoundAnyRawFNToRecFN.scala 179:24]
  wire [12:0] _GEN_3 = {{1'd0}, _roundedSig_T_11[13:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [12:0] _roundedSig_T_16 = _GEN_3 | _roundedSig_T_15; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [12:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[12:11])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [6:0] _GEN_4 = {{4{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [7:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_4); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [5:0] common_expOut = sRoundedExp[5:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [9:0] common_fractOut = doShiftSigDown1 ? roundedSig[10:1] : roundedSig[9:0]; // @[RoundAnyRawFNToRecFN.scala 187:16]
  wire [3:0] _common_overflow_T = sRoundedExp[7:4]; // @[RoundAnyRawFNToRecFN.scala 194:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 194:50]
  wire  common_totalUnderflow = $signed(sRoundedExp) < 8'sh8; // @[RoundAnyRawFNToRecFN.scala 198:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 236:32]
  wire  overflow_roundMagUp = _roundIncr_T | roundMagUp; // @[RoundAnyRawFNToRecFN.scala 241:60]
  wire  pegMinNonzeroMagOut = commonCase & common_totalUnderflow & (roundMagUp | roundingMode_odd); // @[RoundAnyRawFNToRecFN.scala 243:45]
  wire  pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 244:39]
  wire  notNaN_isInfOut = io_in_isInf | overflow & overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 246:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [5:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 6'h38 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [5:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [5:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [5:0] _expOut_T_5 = pegMinNonzeroMagOut ? 6'h37 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 255:18]
  wire [5:0] _expOut_T_6 = ~_expOut_T_5; // @[RoundAnyRawFNToRecFN.scala 255:14]
  wire [5:0] _expOut_T_7 = _expOut_T_3 & _expOut_T_6; // @[RoundAnyRawFNToRecFN.scala 254:17]
  wire [5:0] _expOut_T_8 = pegMaxFiniteMagOut ? 6'h10 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 259:18]
  wire [5:0] _expOut_T_9 = ~_expOut_T_8; // @[RoundAnyRawFNToRecFN.scala 259:14]
  wire [5:0] _expOut_T_10 = _expOut_T_7 & _expOut_T_9; // @[RoundAnyRawFNToRecFN.scala 258:17]
  wire [5:0] _expOut_T_11 = notNaN_isInfOut ? 6'h8 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [5:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [5:0] _expOut_T_13 = _expOut_T_10 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [5:0] _expOut_T_14 = pegMinNonzeroMagOut ? 6'h8 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 267:16]
  wire [5:0] _expOut_T_15 = _expOut_T_13 | _expOut_T_14; // @[RoundAnyRawFNToRecFN.scala 266:18]
  wire [5:0] _expOut_T_16 = pegMaxFiniteMagOut ? 6'h2f : 6'h0; // @[RoundAnyRawFNToRecFN.scala 271:16]
  wire [5:0] _expOut_T_17 = _expOut_T_15 | _expOut_T_16; // @[RoundAnyRawFNToRecFN.scala 270:15]
  wire [5:0] _expOut_T_18 = notNaN_isInfOut ? 6'h30 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [5:0] _expOut_T_19 = _expOut_T_17 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [5:0] _expOut_T_20 = isNaNOut ? 6'h38 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [5:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [9:0] _fractOut_T_2 = isNaNOut ? 10'h200 : 10'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [9:0] _fractOut_T_3 = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [9:0] _fractOut_T_5 = pegMaxFiniteMagOut ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  wire [9:0] fractOut = _fractOut_T_3 | _fractOut_T_5; // @[RoundAnyRawFNToRecFN.scala 281:11]
  wire [6:0] io_out_hi = {signOut,expOut}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
endmodule
module RoundRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [6:0]  io_in_sExp,
  input  [13:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [16:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [6:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [13:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [16:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 307:15]
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
  input  [16:0] io_a,
  input  [16:0] io_b,
  input  [2:0]  io_roundingMode,
  output [16:0] io_out
);
  wire  mulRawFN__io_a_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_sign; // @[MulRecFN.scala 113:26]
  wire [6:0] mulRawFN__io_a_sExp; // @[MulRecFN.scala 113:26]
  wire [11:0] mulRawFN__io_a_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_sign; // @[MulRecFN.scala 113:26]
  wire [6:0] mulRawFN__io_b_sExp; // @[MulRecFN.scala 113:26]
  wire [11:0] mulRawFN__io_b_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_invalidExc; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 113:26]
  wire [6:0] mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 113:26]
  wire [13:0] mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 113:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[MulRecFN.scala 121:15]
  wire [6:0] roundRawFNToRecFN_io_in_sExp; // @[MulRecFN.scala 121:15]
  wire [13:0] roundRawFNToRecFN_io_in_sig; // @[MulRecFN.scala 121:15]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[MulRecFN.scala 121:15]
  wire [16:0] roundRawFNToRecFN_io_out; // @[MulRecFN.scala 121:15]
  wire [5:0] mulRawFN_io_a_exp = io_a[15:10]; // @[rawFloatFromRecFN.scala 50:21]
  wire  mulRawFN_io_a_isZero = mulRawFN_io_a_exp[5:3] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  mulRawFN_io_a_isSpecial = mulRawFN_io_a_exp[5:4] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  mulRawFN_io_a_out_sig_hi_lo = ~mulRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [9:0] mulRawFN_io_a_out_sig_lo = io_a[9:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] mulRawFN_io_a_out_sig_hi = {1'h0,mulRawFN_io_a_out_sig_hi_lo}; // @[Cat.scala 30:58]
  wire [5:0] mulRawFN_io_b_exp = io_b[15:10]; // @[rawFloatFromRecFN.scala 50:21]
  wire  mulRawFN_io_b_isZero = mulRawFN_io_b_exp[5:3] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  mulRawFN_io_b_isSpecial = mulRawFN_io_b_exp[5:4] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  mulRawFN_io_b_out_sig_hi_lo = ~mulRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [9:0] mulRawFN_io_b_out_sig_lo = io_b[9:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] mulRawFN_io_b_out_sig_hi = {1'h0,mulRawFN_io_b_out_sig_hi_lo}; // @[Cat.scala 30:58]
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
  assign mulRawFN__io_a_isNaN = mulRawFN_io_a_isSpecial & mulRawFN_io_a_exp[3]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN__io_a_isInf = mulRawFN_io_a_isSpecial & ~mulRawFN_io_a_exp[3]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_a_isZero = mulRawFN_io_a_exp[5:3] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN__io_a_sign = io_a[16]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN__io_a_sExp = {1'b0,$signed(mulRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN__io_a_sig = {mulRawFN_io_a_out_sig_hi,mulRawFN_io_a_out_sig_lo}; // @[Cat.scala 30:58]
  assign mulRawFN__io_b_isNaN = mulRawFN_io_b_isSpecial & mulRawFN_io_b_exp[3]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN__io_b_isInf = mulRawFN_io_b_isSpecial & ~mulRawFN_io_b_exp[3]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_b_isZero = mulRawFN_io_b_exp[5:3] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN__io_b_sign = io_b[16]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN__io_b_sExp = {1'b0,$signed(mulRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN__io_b_sig = {mulRawFN_io_b_out_sig_hi,mulRawFN_io_b_out_sig_lo}; // @[Cat.scala 30:58]
  assign roundRawFNToRecFN_io_invalidExc = mulRawFN__io_invalidExc; // @[MulRecFN.scala 122:39]
  assign roundRawFNToRecFN_io_in_isNaN = mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isInf = mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isZero = mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sign = mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sExp = mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sig = mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_roundingMode = io_roundingMode; // @[MulRecFN.scala 125:39]
endmodule
module RoundAnyRawFNToRecFN_1(
  input         io_in_isZero,
  input         io_in_sign,
  input  [6:0]  io_in_sExp,
  input  [16:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [16:0] io_out
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RoundAnyRawFNToRecFN.scala 88:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RoundAnyRawFNToRecFN.scala 90:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RoundAnyRawFNToRecFN.scala 91:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RoundAnyRawFNToRecFN.scala 92:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RoundAnyRawFNToRecFN.scala 93:53]
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign; // @[RoundAnyRawFNToRecFN.scala 96:42]
  wire [12:0] adjustedSig_hi = io_in_sig[16:4]; // @[RoundAnyRawFNToRecFN.scala 114:26]
  wire  adjustedSig_lo = |io_in_sig[3:0]; // @[RoundAnyRawFNToRecFN.scala 115:60]
  wire [13:0] adjustedSig = {adjustedSig_hi,adjustedSig_lo}; // @[Cat.scala 30:58]
  wire [13:0] _roundPosBit_T = adjustedSig & 14'h2; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [13:0] _anyRoundExtra_T = adjustedSig & 14'h1; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire  anyRound = roundPosBit | anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 164:36]
  wire  _roundIncr_T = roundingMode_near_even | roundingMode_near_maxMag; // @[RoundAnyRawFNToRecFN.scala 167:38]
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit; // @[RoundAnyRawFNToRecFN.scala 167:67]
  wire  _roundIncr_T_2 = roundMagUp & anyRound; // @[RoundAnyRawFNToRecFN.scala 169:29]
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2; // @[RoundAnyRawFNToRecFN.scala 168:31]
  wire [13:0] _roundedSig_T = adjustedSig | 14'h3; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [12:0] _roundedSig_T_2 = _roundedSig_T[13:2] + 12'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [12:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? 13'h1 : 13'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [12:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [12:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [13:0] _roundedSig_T_11 = adjustedSig & 14'h3ffc; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [12:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? 13'h1 : 13'h0; // @[RoundAnyRawFNToRecFN.scala 179:24]
  wire [12:0] _GEN_0 = {{1'd0}, _roundedSig_T_11[13:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [12:0] _roundedSig_T_16 = _GEN_0 | _roundedSig_T_15; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [12:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[12:11])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [6:0] _GEN_1 = {{4{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [7:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_1); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [5:0] common_expOut = sRoundedExp[5:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [9:0] common_fractOut = roundedSig[9:0]; // @[RoundAnyRawFNToRecFN.scala 189:27]
  wire [3:0] _common_overflow_T = sRoundedExp[7:4]; // @[RoundAnyRawFNToRecFN.scala 194:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 194:50]
  wire  commonCase = ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:64]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 236:32]
  wire  overflow_roundMagUp = _roundIncr_T | roundMagUp; // @[RoundAnyRawFNToRecFN.scala 241:60]
  wire  pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 244:39]
  wire  notNaN_isInfOut = overflow & overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 246:45]
  wire [5:0] _expOut_T_1 = io_in_isZero ? 6'h38 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [5:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [5:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [5:0] _expOut_T_8 = pegMaxFiniteMagOut ? 6'h10 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 259:18]
  wire [5:0] _expOut_T_9 = ~_expOut_T_8; // @[RoundAnyRawFNToRecFN.scala 259:14]
  wire [5:0] _expOut_T_10 = _expOut_T_3 & _expOut_T_9; // @[RoundAnyRawFNToRecFN.scala 258:17]
  wire [5:0] _expOut_T_11 = notNaN_isInfOut ? 6'h8 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [5:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [5:0] _expOut_T_13 = _expOut_T_10 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [5:0] _expOut_T_16 = pegMaxFiniteMagOut ? 6'h2f : 6'h0; // @[RoundAnyRawFNToRecFN.scala 271:16]
  wire [5:0] _expOut_T_17 = _expOut_T_13 | _expOut_T_16; // @[RoundAnyRawFNToRecFN.scala 270:15]
  wire [5:0] _expOut_T_18 = notNaN_isInfOut ? 6'h30 : 6'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [5:0] expOut = _expOut_T_17 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [9:0] _fractOut_T_3 = io_in_isZero ? 10'h0 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [9:0] _fractOut_T_5 = pegMaxFiniteMagOut ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  wire [9:0] fractOut = _fractOut_T_3 | _fractOut_T_5; // @[RoundAnyRawFNToRecFN.scala 281:11]
  wire [6:0] io_out_hi = {io_in_sign,expOut}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
endmodule
module INToRecFN(
  input  [15:0] io_in,
  input  [2:0]  io_roundingMode,
  output [16:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[INToRecFN.scala 59:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[INToRecFN.scala 59:15]
  wire [6:0] roundAnyRawFNToRecFN_io_in_sExp; // @[INToRecFN.scala 59:15]
  wire [16:0] roundAnyRawFNToRecFN_io_in_sig; // @[INToRecFN.scala 59:15]
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode; // @[INToRecFN.scala 59:15]
  wire [16:0] roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 59:15]
  wire  intAsRawFloat_sign = io_in[15]; // @[rawFloatFromIN.scala 50:34]
  wire [15:0] _intAsRawFloat_absIn_T_1 = 16'h0 - io_in; // @[rawFloatFromIN.scala 51:31]
  wire [15:0] intAsRawFloat_extAbsIn_lo = intAsRawFloat_sign ? _intAsRawFloat_absIn_T_1 : io_in; // @[rawFloatFromIN.scala 51:24]
  wire [31:0] _intAsRawFloat_extAbsIn_T = {16'h0,intAsRawFloat_extAbsIn_lo}; // @[Cat.scala 30:58]
  wire [15:0] intAsRawFloat_extAbsIn = _intAsRawFloat_extAbsIn_T[15:0]; // @[rawFloatFromIN.scala 52:56]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_16 = intAsRawFloat_extAbsIn[1] ? 4'he : 4'hf; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_17 = intAsRawFloat_extAbsIn[2] ? 4'hd :
    _intAsRawFloat_adjustedNormDist_T_16; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_18 = intAsRawFloat_extAbsIn[3] ? 4'hc :
    _intAsRawFloat_adjustedNormDist_T_17; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_19 = intAsRawFloat_extAbsIn[4] ? 4'hb :
    _intAsRawFloat_adjustedNormDist_T_18; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_20 = intAsRawFloat_extAbsIn[5] ? 4'ha :
    _intAsRawFloat_adjustedNormDist_T_19; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_21 = intAsRawFloat_extAbsIn[6] ? 4'h9 :
    _intAsRawFloat_adjustedNormDist_T_20; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_22 = intAsRawFloat_extAbsIn[7] ? 4'h8 :
    _intAsRawFloat_adjustedNormDist_T_21; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_23 = intAsRawFloat_extAbsIn[8] ? 4'h7 :
    _intAsRawFloat_adjustedNormDist_T_22; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_24 = intAsRawFloat_extAbsIn[9] ? 4'h6 :
    _intAsRawFloat_adjustedNormDist_T_23; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_25 = intAsRawFloat_extAbsIn[10] ? 4'h5 :
    _intAsRawFloat_adjustedNormDist_T_24; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_26 = intAsRawFloat_extAbsIn[11] ? 4'h4 :
    _intAsRawFloat_adjustedNormDist_T_25; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_27 = intAsRawFloat_extAbsIn[12] ? 4'h3 :
    _intAsRawFloat_adjustedNormDist_T_26; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_28 = intAsRawFloat_extAbsIn[13] ? 4'h2 :
    _intAsRawFloat_adjustedNormDist_T_27; // @[Mux.scala 47:69]
  wire [3:0] _intAsRawFloat_adjustedNormDist_T_29 = intAsRawFloat_extAbsIn[14] ? 4'h1 :
    _intAsRawFloat_adjustedNormDist_T_28; // @[Mux.scala 47:69]
  wire [3:0] intAsRawFloat_adjustedNormDist = intAsRawFloat_extAbsIn[15] ? 4'h0 : _intAsRawFloat_adjustedNormDist_T_29; // @[Mux.scala 47:69]
  wire [30:0] _GEN_0 = {{15'd0}, intAsRawFloat_extAbsIn}; // @[rawFloatFromIN.scala 55:22]
  wire [30:0] _intAsRawFloat_sig_T = _GEN_0 << intAsRawFloat_adjustedNormDist; // @[rawFloatFromIN.scala 55:22]
  wire [15:0] intAsRawFloat_sig = _intAsRawFloat_sig_T[15:0]; // @[rawFloatFromIN.scala 55:41]
  wire [3:0] intAsRawFloat_out_sExp_lo = ~intAsRawFloat_adjustedNormDist; // @[rawFloatFromIN.scala 63:39]
  wire [5:0] _intAsRawFloat_out_sExp_T_1 = {2'h2,intAsRawFloat_out_sExp_lo}; // @[Cat.scala 30:58]
  RoundAnyRawFNToRecFN_1 roundAnyRawFNToRecFN ( // @[INToRecFN.scala 59:15]
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundAnyRawFNToRecFN_io_roundingMode),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 72:23]
  assign roundAnyRawFNToRecFN_io_in_isZero = ~intAsRawFloat_sig[15]; // @[rawFloatFromIN.scala 61:23]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in[15]; // @[rawFloatFromIN.scala 50:34]
  assign roundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_intAsRawFloat_out_sExp_T_1)}; // @[rawFloatFromIN.scala 63:75]
  assign roundAnyRawFNToRecFN_io_in_sig = {{1'd0}, intAsRawFloat_sig}; // @[rawFloatFromIN.scala 58:23 rawFloatFromIN.scala 64:20]
  assign roundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; // @[INToRecFN.scala 70:44]
endmodule
module RecFNToIN(
  input  [16:0] io_in,
  input  [2:0]  io_roundingMode,
  output [15:0] io_out
);
  wire [5:0] rawIn_exp = io_in[15:10]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawIn_isZero = rawIn_exp[5:3] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawIn_isSpecial = rawIn_exp[5:4] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawIn__isNaN = rawIn_isSpecial & rawIn_exp[3]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawIn__isInf = rawIn_isSpecial & ~rawIn_exp[3]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawIn__sign = io_in[16]; // @[rawFloatFromRecFN.scala 58:25]
  wire [6:0] rawIn__sExp = {1'b0,$signed(rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  rawIn_out_sig_hi_lo = ~rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [9:0] rawIn_out_sig_lo = io_in[9:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [11:0] rawIn__sig = {1'h0,rawIn_out_sig_hi_lo,rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  magGeOne = rawIn__sExp[5]; // @[RecFNToIN.scala 58:30]
  wire [4:0] posExp = rawIn__sExp[4:0]; // @[RecFNToIN.scala 59:28]
  wire  magJustBelowOne = ~magGeOne & &posExp; // @[RecFNToIN.scala 60:37]
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RecFNToIN.scala 64:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RecFNToIN.scala 66:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RecFNToIN.scala 67:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RecFNToIN.scala 68:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RecFNToIN.scala 69:53]
  wire [9:0] shiftedSig_lo = rawIn__sig[9:0]; // @[RecFNToIN.scala 80:32]
  wire [10:0] _shiftedSig_T = {magGeOne,shiftedSig_lo}; // @[Cat.scala 30:58]
  wire [3:0] _shiftedSig_T_2 = magGeOne ? rawIn__sExp[3:0] : 4'h0; // @[RecFNToIN.scala 81:16]
  wire [25:0] _GEN_0 = {{15'd0}, _shiftedSig_T}; // @[RecFNToIN.scala 80:50]
  wire [25:0] shiftedSig = _GEN_0 << _shiftedSig_T_2; // @[RecFNToIN.scala 80:50]
  wire [16:0] alignedSig_hi = shiftedSig[25:9]; // @[RecFNToIN.scala 86:23]
  wire  alignedSig_lo = |shiftedSig[8:0]; // @[RecFNToIN.scala 86:69]
  wire [17:0] alignedSig = {alignedSig_hi,alignedSig_lo}; // @[Cat.scala 30:58]
  wire [15:0] unroundedInt = alignedSig[17:2]; // @[RecFNToIN.scala 87:54]
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
  wire [15:0] _complUnroundedInt_T = ~unroundedInt; // @[RecFNToIN.scala 100:45]
  wire [15:0] complUnroundedInt = rawIn__sign ? _complUnroundedInt_T : unroundedInt; // @[RecFNToIN.scala 100:32]
  wire [15:0] _roundedInt_T_2 = complUnroundedInt + 16'h1; // @[RecFNToIN.scala 103:31]
  wire [15:0] _roundedInt_T_3 = roundIncr ^ rawIn__sign ? _roundedInt_T_2 : complUnroundedInt; // @[RecFNToIN.scala 102:12]
  wire  _roundedInt_T_4 = roundingMode_odd & common_inexact; // @[RecFNToIN.scala 105:31]
  wire [15:0] _GEN_1 = {{15'd0}, _roundedInt_T_4}; // @[RecFNToIN.scala 105:11]
  wire [15:0] roundedInt = _roundedInt_T_3 | _GEN_1; // @[RecFNToIN.scala 105:11]
  wire  magGeOne_atOverflowEdge = posExp == 5'hf; // @[RecFNToIN.scala 107:43]
  wire  roundCarryBut2 = &unroundedInt[13:0] & roundIncr; // @[RecFNToIN.scala 110:61]
  wire  _common_overflow_T_3 = |unroundedInt[14:0] | roundIncr; // @[RecFNToIN.scala 117:64]
  wire  _common_overflow_T_4 = magGeOne_atOverflowEdge & _common_overflow_T_3; // @[RecFNToIN.scala 116:49]
  wire  _common_overflow_T_6 = posExp == 5'he & roundCarryBut2; // @[RecFNToIN.scala 119:62]
  wire  _common_overflow_T_7 = magGeOne_atOverflowEdge | _common_overflow_T_6; // @[RecFNToIN.scala 118:49]
  wire  _common_overflow_T_8 = rawIn__sign ? _common_overflow_T_4 : _common_overflow_T_7; // @[RecFNToIN.scala 115:24]
  wire  _common_overflow_T_14 = posExp >= 5'h10 | _common_overflow_T_8; // @[RecFNToIN.scala 113:40]
  wire  common_overflow = magGeOne & _common_overflow_T_14; // @[RecFNToIN.scala 112:12]
  wire  invalidExc = rawIn__isNaN | rawIn__isInf; // @[RecFNToIN.scala 130:34]
  wire  excSign = ~rawIn__isNaN & rawIn__sign; // @[RecFNToIN.scala 134:32]
  wire [15:0] _excOut_T_1 = excSign ? 16'h8000 : 16'h0; // @[RecFNToIN.scala 136:12]
  wire [14:0] _excOut_T_3 = ~excSign ? 15'h7fff : 15'h0; // @[RecFNToIN.scala 140:12]
  wire [15:0] _GEN_2 = {{1'd0}, _excOut_T_3}; // @[RecFNToIN.scala 139:11]
  wire [15:0] excOut = _excOut_T_1 | _GEN_2; // @[RecFNToIN.scala 139:11]
  assign io_out = invalidExc | common_overflow ? excOut : roundedInt; // @[RecFNToIN.scala 142:18]
endmodule
module Mult_16(
  input         clock,
  input         reset,
  input  [15:0] io_in1,
  input  [15:0] io_in2,
  input         io_useINT,
  input  [2:0]  io_round,
  output [16:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [16:0] mulRecFN_io_a; // @[Mult_16.scala 37:24]
  wire [16:0] mulRecFN_io_b; // @[Mult_16.scala 37:24]
  wire [2:0] mulRecFN_io_roundingMode; // @[Mult_16.scala 37:24]
  wire [16:0] mulRecFN_io_out; // @[Mult_16.scala 37:24]
  wire [15:0] iNToRecFN_1_io_in; // @[Mult_16.scala 41:27]
  wire [2:0] iNToRecFN_1_io_roundingMode; // @[Mult_16.scala 41:27]
  wire [16:0] iNToRecFN_1_io_out; // @[Mult_16.scala 41:27]
  wire [15:0] iNToRecFN_2_io_in; // @[Mult_16.scala 48:27]
  wire [2:0] iNToRecFN_2_io_roundingMode; // @[Mult_16.scala 48:27]
  wire [16:0] iNToRecFN_2_io_out; // @[Mult_16.scala 48:27]
  wire [16:0] recFNToIN_io_in; // @[Mult_16.scala 61:25]
  wire [2:0] recFNToIN_io_roundingMode; // @[Mult_16.scala 61:25]
  wire [15:0] recFNToIN_io_out; // @[Mult_16.scala 61:25]
  reg [15:0] fN_in1; // @[Mult_16.scala 33:24]
  reg [15:0] fN_in2; // @[Mult_16.scala 34:24]
  reg [16:0] iNToRecFN_1_out; // @[Mult_16.scala 46:33]
  reg [16:0] iNToRecFN_2_out; // @[Mult_16.scala 53:33]
  reg [16:0] mulRecFN_out; // @[Mult_16.scala 59:30]
  MulRecFN mulRecFN ( // @[Mult_16.scala 37:24]
    .io_a(mulRecFN_io_a),
    .io_b(mulRecFN_io_b),
    .io_roundingMode(mulRecFN_io_roundingMode),
    .io_out(mulRecFN_io_out)
  );
  INToRecFN iNToRecFN_1 ( // @[Mult_16.scala 41:27]
    .io_in(iNToRecFN_1_io_in),
    .io_roundingMode(iNToRecFN_1_io_roundingMode),
    .io_out(iNToRecFN_1_io_out)
  );
  INToRecFN iNToRecFN_2 ( // @[Mult_16.scala 48:27]
    .io_in(iNToRecFN_2_io_in),
    .io_roundingMode(iNToRecFN_2_io_roundingMode),
    .io_out(iNToRecFN_2_io_out)
  );
  RecFNToIN recFNToIN ( // @[Mult_16.scala 61:25]
    .io_in(recFNToIN_io_in),
    .io_roundingMode(recFNToIN_io_roundingMode),
    .io_out(recFNToIN_io_out)
  );
  assign io_out = {{1'd0}, recFNToIN_io_out}; // @[Mult_16.scala 74:10]
  assign mulRecFN_io_a = iNToRecFN_1_out; // @[Mult_16.scala 55:17]
  assign mulRecFN_io_b = iNToRecFN_2_out; // @[Mult_16.scala 56:17]
  assign mulRecFN_io_roundingMode = io_round; // @[Mult_16.scala 38:30]
  assign iNToRecFN_1_io_in = fN_in1; // @[Mult_16.scala 43:21]
  assign iNToRecFN_1_io_roundingMode = io_round; // @[Mult_16.scala 44:33]
  assign iNToRecFN_2_io_in = fN_in2; // @[Mult_16.scala 50:21]
  assign iNToRecFN_2_io_roundingMode = io_round; // @[Mult_16.scala 51:33]
  assign recFNToIN_io_in = mulRecFN_out; // @[Mult_16.scala 62:29]
  assign recFNToIN_io_roundingMode = io_round; // @[Mult_16.scala 63:29]
  always @(posedge clock) begin
    fN_in1 <= io_in1; // @[Mult_16.scala 33:24]
    fN_in2 <= io_in2; // @[Mult_16.scala 34:24]
    iNToRecFN_1_out <= iNToRecFN_1_io_out; // @[Mult_16.scala 46:33]
    iNToRecFN_2_out <= iNToRecFN_2_io_out; // @[Mult_16.scala 53:33]
    mulRecFN_out <= mulRecFN_io_out; // @[Mult_16.scala 59:30]
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
  fN_in1 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  fN_in2 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  iNToRecFN_1_out = _RAND_2[16:0];
  _RAND_3 = {1{`RANDOM}};
  iNToRecFN_2_out = _RAND_3[16:0];
  _RAND_4 = {1{`RANDOM}};
  mulRecFN_out = _RAND_4[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
