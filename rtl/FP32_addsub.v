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
module FP32_addsub(
  input         clock,
  input         reset,
  input         io_use_int,
  input         io_op,
  input  [2:0]  io_rounding,
  input         io_tininess,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [32:0] io_out
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
  wire  addRecFN_io_subOp; // @[FP32_addsub.scala 53:26]
  wire [32:0] addRecFN_io_a; // @[FP32_addsub.scala 53:26]
  wire [32:0] addRecFN_io_b; // @[FP32_addsub.scala 53:26]
  wire [2:0] addRecFN_io_roundingMode; // @[FP32_addsub.scala 53:26]
  wire [32:0] addRecFN_io_out; // @[FP32_addsub.scala 53:26]
  reg  op; // @[FP32_addsub.scala 22:25]
  reg  use_int; // @[FP32_addsub.scala 24:25]
  reg [32:0] module_out; // @[FP32_addsub.scala 26:27]
  reg [31:0] sign_in_0; // @[FP32_addsub.scala 30:29]
  reg [31:0] sign_in_1; // @[FP32_addsub.scala 31:29]
  wire [31:0] _module_out_T_3 = $signed(sign_in_0) - $signed(sign_in_1); // @[FP32_addsub.scala 35:51]
  wire [31:0] _module_out_T_7 = $signed(sign_in_0) + $signed(sign_in_1); // @[FP32_addsub.scala 37:51]
  wire [31:0] _GEN_0 = op ? _module_out_T_3 : _module_out_T_7; // @[FP32_addsub.scala 34:17 35:18 37:18]
  reg [31:0] fN_in_0; // @[FP32_addsub.scala 45:27]
  reg [31:0] fN_in_1; // @[FP32_addsub.scala 46:27]
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
  wire [53:0] _GEN_2 = {{31'd0}, recFN_from_fN_in_0_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_0_rawIn_subnormFract_T = _GEN_2 << recFN_from_fN_in_0_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
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
  reg [32:0] recFN_from_fN_in_0; // @[FP32_addsub.scala 49:37]
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
  wire [53:0] _GEN_11 = {{31'd0}, recFN_from_fN_in_1_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_1_rawIn_subnormFract_T = _GEN_11 << recFN_from_fN_in_1_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
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
  reg [32:0] recFN_from_fN_in_1; // @[FP32_addsub.scala 50:37]
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
  AddRecFN addRecFN ( // @[FP32_addsub.scala 53:26]
    .io_subOp(addRecFN_io_subOp),
    .io_a(addRecFN_io_a),
    .io_b(addRecFN_io_b),
    .io_roundingMode(addRecFN_io_roundingMode),
    .io_out(addRecFN_io_out)
  );
  assign io_out = use_int ? module_out : {{1'd0}, _io_out_T}; // @[FP32_addsub.scala 28:16 40:12 62:12]
  assign addRecFN_io_subOp = op; // @[FP32_addsub.scala 54:23]
  assign addRecFN_io_a = recFN_from_fN_in_0; // @[FP32_addsub.scala 57:19]
  assign addRecFN_io_b = recFN_from_fN_in_1; // @[FP32_addsub.scala 58:19]
  assign addRecFN_io_roundingMode = io_rounding; // @[FP32_addsub.scala 55:32]
  always @(posedge clock) begin
    op <= io_op; // @[FP32_addsub.scala 22:25]
    use_int <= io_use_int; // @[FP32_addsub.scala 24:25]
    if (reset) begin // @[FP32_addsub.scala 26:27]
      module_out <= 33'h0; // @[FP32_addsub.scala 26:27]
    end else if (use_int) begin // @[FP32_addsub.scala 28:16]
      module_out <= {{1'd0}, _GEN_0};
    end else begin
      module_out <= addRecFN_io_out; // @[FP32_addsub.scala 60:16]
    end
    sign_in_0 <= io_in_0; // @[FP32_addsub.scala 30:44]
    sign_in_1 <= io_in_1; // @[FP32_addsub.scala 31:44]
    fN_in_0 <= io_in_0; // @[FP32_addsub.scala 45:27]
    fN_in_1 <= io_in_1; // @[FP32_addsub.scala 46:27]
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
  op = _RAND_0[0:0];
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
