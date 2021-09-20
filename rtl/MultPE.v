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
  input         io_tininess,
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
  wire [8:0] io_out_rawIn_exp = module_out[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  io_out_rawIn_isZero = io_out_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  io_out_rawIn_isSpecial = io_out_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  io_out_rawIn__isNaN = io_out_rawIn_isSpecial & io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  io_out_rawIn__isInf = io_out_rawIn_isSpecial & ~io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  io_out_rawIn__sign = module_out[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] io_out_rawIn__sExp = {1'b0,$signed(io_out_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _io_out_rawIn_out_sig_T = ~io_out_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [24:0] io_out_rawIn__sig = {1'h0,_io_out_rawIn_out_sig_T,module_out[22:0]}; // @[Cat.scala 30:58]
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
  wire [63:0] _GEN_0 = use_int ? _module_out_T_1 : {{31'd0}, mulRecFN_io_out}; // @[MultPE.scala 29:16 35:16 56:16]
  wire [32:0] _GEN_1 = use_int ? module_out : {{1'd0}, _io_out_T}; // @[MultPE.scala 29:16 37:12 58:12]
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
