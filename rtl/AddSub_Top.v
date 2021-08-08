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
  wire [56:0] _GEN_3 = {{31'd0}, close_sigSum}; // @[AddRecFN.scala 82:38]
  wire [56:0] _close_sigOut_T = _GEN_3 << close_nearNormDist; // @[AddRecFN.scala 82:38]
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
  wire  far_roundExtraMask_hi = far_roundExtraMask_shift[1]; // @[Bitwise.scala 109:18]
  wire  far_roundExtraMask_lo = far_roundExtraMask_shift[2]; // @[Bitwise.scala 109:44]
  wire  far_roundExtraMask_hi_2 = far_roundExtraMask_shift[3]; // @[Bitwise.scala 109:18]
  wire  far_roundExtraMask_lo_1 = far_roundExtraMask_shift[4]; // @[Bitwise.scala 109:44]
  wire  far_roundExtraMask_hi_4 = far_roundExtraMask_shift[5]; // @[Bitwise.scala 109:18]
  wire  far_roundExtraMask_lo_3 = far_roundExtraMask_shift[6]; // @[Bitwise.scala 109:44]
  wire  far_roundExtraMask_lo_4 = far_roundExtraMask_shift[7]; // @[Bitwise.scala 109:44]
  wire [6:0] far_roundExtraMask = {far_roundExtraMask_hi,far_roundExtraMask_lo,far_roundExtraMask_hi_2,
    far_roundExtraMask_lo_1,far_roundExtraMask_hi_4,far_roundExtraMask_lo_3,far_roundExtraMask_lo_4}; // @[Cat.scala 30:58]
  wire [25:0] far_alignedSigSmaller_hi = far_mainAlignedSigSmaller[28:3]; // @[AddRecFN.scala 94:38]
  wire [6:0] _far_alignedSigSmaller_T_2 = far_reduced4SigSmaller & far_roundExtraMask; // @[AddRecFN.scala 95:76]
  wire  far_alignedSigSmaller_lo = |far_mainAlignedSigSmaller[2:0] | |_far_alignedSigSmaller_T_2; // @[AddRecFN.scala 95:49]
  wire [26:0] far_alignedSigSmaller = {far_alignedSigSmaller_hi,far_alignedSigSmaller_lo}; // @[Cat.scala 30:58]
  wire [26:0] far_negAlignedSigSmaller_lo = ~far_alignedSigSmaller; // @[AddRecFN.scala 97:62]
  wire [27:0] _far_negAlignedSigSmaller_T = {1'h1,far_negAlignedSigSmaller_lo}; // @[Cat.scala 30:58]
  wire [27:0] far_negAlignedSigSmaller = _closeSubMags_T ? _far_negAlignedSigSmaller_T : {{1'd0}, far_alignedSigSmaller}
    ; // @[AddRecFN.scala 97:39]
  wire [26:0] _far_sigSum_T = {far_sigLarger, 3'h0}; // @[AddRecFN.scala 98:36]
  wire [27:0] _GEN_4 = {{1'd0}, _far_sigSum_T}; // @[AddRecFN.scala 98:41]
  wire [27:0] _far_sigSum_T_2 = _GEN_4 + far_negAlignedSigSmaller; // @[AddRecFN.scala 98:41]
  wire [27:0] _GEN_5 = {{27'd0}, _closeSubMags_T}; // @[AddRecFN.scala 98:68]
  wire [27:0] far_sigSum = _far_sigSum_T_2 + _GEN_5; // @[AddRecFN.scala 98:68]
  wire [26:0] _GEN_6 = {{26'd0}, far_sigSum[0]}; // @[AddRecFN.scala 99:67]
  wire [26:0] _far_sigOut_T_2 = far_sigSum[27:1] | _GEN_6; // @[AddRecFN.scala 99:67]
  wire [27:0] _far_sigOut_T_3 = _closeSubMags_T ? far_sigSum : {{1'd0}, _far_sigOut_T_2}; // @[AddRecFN.scala 99:25]
  wire [26:0] far_sigOut = _far_sigOut_T_3[26:0]; // @[AddRecFN.scala 99:83]
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isInf & _closeSubMags_T; // @[AddRecFN.scala 102:57]
  wire  notNaN_isInfOut = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  wire  addZeros = io_a_isZero & io_b_isZero; // @[AddRecFN.scala 104:32]
  wire  notNaN_specialCase = notNaN_isInfOut | addZeros; // @[AddRecFN.scala 105:46]
  wire  _notNaN_signOut_T_1 = io_a_isInf & io_a_sign; // @[AddRecFN.scala 109:39]
  wire  _notNaN_signOut_T_2 = eqSigns & io_a_sign | _notNaN_signOut_T_1; // @[AddRecFN.scala 108:63]
  wire  _notNaN_signOut_T_3 = io_b_isInf & effSignB; // @[AddRecFN.scala 110:39]
  wire  _notNaN_signOut_T_4 = _notNaN_signOut_T_2 | _notNaN_signOut_T_3; // @[AddRecFN.scala 109:63]
  wire  _notNaN_signOut_T_9 = ~notNaN_specialCase; // @[AddRecFN.scala 112:10]
  wire  _notNaN_signOut_T_12 = ~notNaN_specialCase & closeSubMags & ~close_totalCancellation; // @[AddRecFN.scala 112:46]
  wire  _notNaN_signOut_T_13 = _notNaN_signOut_T_12 & close_notTotalCancellation_signOut; // @[AddRecFN.scala 113:38]
  wire  _notNaN_signOut_T_14 = _notNaN_signOut_T_4 | _notNaN_signOut_T_13; // @[AddRecFN.scala 111:63]
  wire  _notNaN_signOut_T_18 = _notNaN_signOut_T_9 & ~closeSubMags & far_signOut; // @[AddRecFN.scala 114:47]
  wire [9:0] _common_sExpOut_T_2 = closeSubMags | _modNatAlignDist_T ? $signed(io_b_sExp) : $signed(io_a_sExp); // @[AddRecFN.scala 116:13]
  wire [4:0] _common_sExpOut_T_3 = closeSubMags ? close_nearNormDist : {{4'd0}, _closeSubMags_T}; // @[AddRecFN.scala 117:18]
  wire [5:0] _common_sExpOut_T_4 = {1'b0,$signed(_common_sExpOut_T_3)}; // @[AddRecFN.scala 117:66]
  wire [9:0] _GEN_7 = {{4{_common_sExpOut_T_4[5]}},_common_sExpOut_T_4}; // @[AddRecFN.scala 117:13]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[22]; // @[common.scala 84:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[22]; // @[common.scala 84:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[AddRecFN.scala 121:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[AddRecFN.scala 125:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  assign io_rawOut_isZero = addZeros | ~notNaN_isInfOut & closeSubMags & close_totalCancellation; // @[AddRecFN.scala 106:37]
  assign io_rawOut_sign = _notNaN_signOut_T_14 | _notNaN_signOut_T_18; // @[AddRecFN.scala 113:77]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - $signed(_GEN_7); // @[AddRecFN.scala 117:13]
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
  output [32:0] io_out
);
  wire  doShiftSigDown1 = io_in_sig[26]; // @[RoundAnyRawFNToRecFN.scala 118:61]
  wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0]; // @[primitives.scala 51:21]
  wire  roundMask_msb = _roundMask_T_1[8]; // @[primitives.scala 57:25]
  wire [7:0] roundMask_lsbs = _roundMask_T_1[7:0]; // @[primitives.scala 58:26]
  wire  roundMask_msb_1 = roundMask_lsbs[7]; // @[primitives.scala 57:25]
  wire [6:0] roundMask_lsbs_1 = roundMask_lsbs[6:0]; // @[primitives.scala 58:26]
  wire  roundMask_msb_2 = roundMask_lsbs_1[6]; // @[primitives.scala 57:25]
  wire [5:0] roundMask_lsbs_2 = roundMask_lsbs_1[5:0]; // @[primitives.scala 58:26]
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> roundMask_lsbs_2; // @[primitives.scala 77:58]
  wire [15:0] _roundMask_T_7 = {{8'd0}, roundMask_shift[57:50]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_9 = {roundMask_shift[49:42], 8'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_11 = _roundMask_T_9 & 16'hff00; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_0 = {{4'd0}, _roundMask_T_12[15:4]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_17 = _GEN_0 & 16'hf0f; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_19 = {_roundMask_T_12[11:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_21 = _roundMask_T_19 & 16'hf0f0; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_1 = {{2'd0}, _roundMask_T_22[15:2]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_27 = _GEN_1 & 16'h3333; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_29 = {_roundMask_T_22[13:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_31 = _roundMask_T_29 & 16'hcccc; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_32 = _roundMask_T_27 | _roundMask_T_31; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_2 = {{1'd0}, _roundMask_T_32[15:1]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_37 = _GEN_2 & 16'h5555; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_39 = {_roundMask_T_32[14:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_41 = _roundMask_T_39 & 16'haaaa; // @[Bitwise.scala 103:75]
  wire [15:0] roundMask_hi = _roundMask_T_37 | _roundMask_T_41; // @[Bitwise.scala 103:39]
  wire  roundMask_hi_1 = roundMask_shift[58]; // @[Bitwise.scala 109:18]
  wire  roundMask_lo = roundMask_shift[59]; // @[Bitwise.scala 109:44]
  wire  roundMask_hi_3 = roundMask_shift[60]; // @[Bitwise.scala 109:18]
  wire  roundMask_lo_1 = roundMask_shift[61]; // @[Bitwise.scala 109:44]
  wire  roundMask_hi_5 = roundMask_shift[62]; // @[Bitwise.scala 109:18]
  wire  roundMask_lo_3 = roundMask_shift[63]; // @[Bitwise.scala 109:44]
  wire [21:0] _roundMask_T_47 = {roundMask_hi,roundMask_hi_1,roundMask_lo,roundMask_hi_3,roundMask_lo_1,roundMask_hi_5,
    roundMask_lo_3}; // @[Cat.scala 30:58]
  wire [21:0] _roundMask_T_48 = ~_roundMask_T_47; // @[primitives.scala 74:36]
  wire [21:0] _roundMask_T_49 = roundMask_msb_2 ? 22'h0 : _roundMask_T_48; // @[primitives.scala 74:21]
  wire [21:0] roundMask_hi_6 = ~_roundMask_T_49; // @[primitives.scala 74:17]
  wire [24:0] _roundMask_T_50 = {roundMask_hi_6,3'h7}; // @[Cat.scala 30:58]
  wire  roundMask_hi_7 = roundMask_shift[0]; // @[Bitwise.scala 109:18]
  wire  roundMask_lo_6 = roundMask_shift[1]; // @[Bitwise.scala 109:44]
  wire  roundMask_lo_7 = roundMask_shift[2]; // @[Bitwise.scala 109:44]
  wire [2:0] _roundMask_T_53 = {roundMask_hi_7,roundMask_lo_6,roundMask_lo_7}; // @[Cat.scala 30:58]
  wire [2:0] _roundMask_T_54 = roundMask_msb_2 ? _roundMask_T_53 : 3'h0; // @[primitives.scala 61:24]
  wire [24:0] _roundMask_T_55 = roundMask_msb_1 ? _roundMask_T_50 : {{22'd0}, _roundMask_T_54}; // @[primitives.scala 66:24]
  wire [24:0] _roundMask_T_56 = roundMask_msb ? _roundMask_T_55 : 25'h0; // @[primitives.scala 61:24]
  wire [24:0] _GEN_3 = {{24'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [24:0] roundMask_hi_9 = _roundMask_T_56 | _GEN_3; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [26:0] roundMask = {roundMask_hi_9,2'h3}; // @[Cat.scala 30:58]
  wire [25:0] shiftedRoundMask_lo = roundMask[26:1]; // @[RoundAnyRawFNToRecFN.scala 160:57]
  wire [26:0] shiftedRoundMask = {1'h0,shiftedRoundMask_lo}; // @[Cat.scala 30:58]
  wire [26:0] _roundPosMask_T = ~shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 161:28]
  wire [26:0] roundPosMask = _roundPosMask_T & roundMask; // @[RoundAnyRawFNToRecFN.scala 161:46]
  wire [26:0] _roundPosBit_T = io_in_sig & roundPosMask; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [26:0] _roundedSig_T = io_in_sig | roundMask; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire [26:0] _roundedSig_T_10 = ~roundMask; // @[RoundAnyRawFNToRecFN.scala 178:32]
  wire [26:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [25:0] _roundedSig_T_16 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] roundedSig = roundPosBit ? _roundedSig_T_2 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [9:0] _GEN_4 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [10:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_4); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [22:0] common_fractOut = doShiftSigDown1 ? roundedSig[23:1] : roundedSig[22:0]; // @[RoundAnyRawFNToRecFN.scala 187:16]
  wire [3:0] _common_overflow_T = sRoundedExp[10:7]; // @[RoundAnyRawFNToRecFN.scala 194:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 194:50]
  wire  common_totalUnderflow = $signed(sRoundedExp) < 11'sh6b; // @[RoundAnyRawFNToRecFN.scala 198:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 236:32]
  wire  notNaN_isInfOut = io_in_isInf | overflow; // @[RoundAnyRawFNToRecFN.scala 246:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [8:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [8:0] _expOut_T_11 = notNaN_isInfOut ? 9'h40 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [8:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [8:0] _expOut_T_13 = _expOut_T_3 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [8:0] _expOut_T_18 = notNaN_isInfOut ? 9'h180 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [8:0] _expOut_T_19 = _expOut_T_13 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [22:0] _fractOut_T_2 = isNaNOut ? 23'h400000 : 23'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [22:0] fractOut = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
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
  output [32:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [9:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [26:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [32:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 307:15]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[RoundAnyRawFNToRecFN.scala 307:15]
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
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
endmodule
module AddRecFN(
  input         io_subOp,
  input  [32:0] io_a,
  input  [32:0] io_b,
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
  wire [32:0] roundRawFNToRecFN_io_out; // @[AddRecFN.scala 157:15]
  wire [8:0] addRawFN_io_a_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  addRawFN_io_a_isZero = addRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  addRawFN_io_a_isSpecial = addRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  addRawFN_io_a_out_sig_hi_lo = ~addRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] addRawFN_io_a_out_sig_lo = io_a[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] addRawFN_io_a_out_sig_hi = {1'h0,addRawFN_io_a_out_sig_hi_lo}; // @[Cat.scala 30:58]
  wire [8:0] addRawFN_io_b_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  addRawFN_io_b_isZero = addRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  addRawFN_io_b_isSpecial = addRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  addRawFN_io_b_out_sig_hi_lo = ~addRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] addRawFN_io_b_out_sig_lo = io_b[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] addRawFN_io_b_out_sig_hi = {1'h0,addRawFN_io_b_out_sig_hi_lo}; // @[Cat.scala 30:58]
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
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[AddRecFN.scala 163:23]
  assign addRawFN__io_subOp = io_subOp; // @[AddRecFN.scala 149:30]
  assign addRawFN__io_a_isNaN = addRawFN_io_a_isSpecial & addRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN__io_a_isInf = addRawFN_io_a_isSpecial & ~addRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN__io_a_isZero = addRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN__io_a_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN__io_a_sExp = {1'b0,$signed(addRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN__io_a_sig = {addRawFN_io_a_out_sig_hi,addRawFN_io_a_out_sig_lo}; // @[Cat.scala 30:58]
  assign addRawFN__io_b_isNaN = addRawFN_io_b_isSpecial & addRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN__io_b_isInf = addRawFN_io_b_isSpecial & ~addRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN__io_b_isZero = addRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN__io_b_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN__io_b_sExp = {1'b0,$signed(addRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN__io_b_sig = {addRawFN_io_b_out_sig_hi,addRawFN_io_b_out_sig_lo}; // @[Cat.scala 30:58]
  assign roundRawFNToRecFN_io_invalidExc = addRawFN__io_invalidExc; // @[AddRecFN.scala 158:39]
  assign roundRawFNToRecFN_io_in_isNaN = addRawFN__io_rawOut_isNaN; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isInf = addRawFN__io_rawOut_isInf; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isZero = addRawFN__io_rawOut_isZero; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sign = addRawFN__io_rawOut_sign; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sExp = addRawFN__io_rawOut_sExp; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sig = addRawFN__io_rawOut_sig; // @[AddRecFN.scala 160:39]
endmodule
module RoundAnyRawFNToRecFN_1(
  input         io_in_isZero,
  input         io_in_sign,
  input  [7:0]  io_in_sExp,
  input  [32:0] io_in_sig,
  output [32:0] io_out
);
  wire [8:0] _GEN_0 = {{1{io_in_sExp[7]}},io_in_sExp}; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [9:0] _sAdjustedExp_T = $signed(_GEN_0) + 9'shc0; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [9:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[8:0])}; // @[RoundAnyRawFNToRecFN.scala 104:31]
  wire [25:0] adjustedSig_hi = io_in_sig[32:7]; // @[RoundAnyRawFNToRecFN.scala 114:26]
  wire  adjustedSig_lo = |io_in_sig[6:0]; // @[RoundAnyRawFNToRecFN.scala 115:60]
  wire [26:0] adjustedSig = {adjustedSig_hi,adjustedSig_lo}; // @[Cat.scala 30:58]
  wire [26:0] _roundPosBit_T = adjustedSig & 27'h2; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [26:0] _roundedSig_T = adjustedSig | 27'h3; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire [26:0] _roundedSig_T_11 = adjustedSig & 27'h7fffffc; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [25:0] _roundedSig_T_16 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] roundedSig = roundPosBit ? _roundedSig_T_2 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [9:0] _GEN_1 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [10:0] sRoundedExp = $signed(sAdjustedExp) + $signed(_GEN_1); // @[RoundAnyRawFNToRecFN.scala 183:40]
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
  output [32:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[INToRecFN.scala 59:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[INToRecFN.scala 59:15]
  wire [7:0] roundAnyRawFNToRecFN_io_in_sExp; // @[INToRecFN.scala 59:15]
  wire [32:0] roundAnyRawFNToRecFN_io_in_sig; // @[INToRecFN.scala 59:15]
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
  RoundAnyRawFNToRecFN_1 roundAnyRawFNToRecFN ( // @[INToRecFN.scala 59:15]
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 72:23]
  assign roundAnyRawFNToRecFN_io_in_isZero = ~intAsRawFloat_sig[31]; // @[rawFloatFromIN.scala 61:23]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in[31]; // @[rawFloatFromIN.scala 50:34]
  assign roundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_intAsRawFloat_out_sExp_T_1)}; // @[rawFloatFromIN.scala 63:75]
  assign roundAnyRawFNToRecFN_io_in_sig = {{1'd0}, intAsRawFloat_sig}; // @[rawFloatFromIN.scala 58:23 rawFloatFromIN.scala 64:20]
endmodule
module AddSub(
  input         clock,
  input         reset,
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input         io_op,
  input         io_useINT,
  output [32:0] io_outIEEE
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  addRecFN_io_subOp; // @[AddSub.scala 33:24]
  wire [32:0] addRecFN_io_a; // @[AddSub.scala 33:24]
  wire [32:0] addRecFN_io_b; // @[AddSub.scala 33:24]
  wire [32:0] addRecFN_io_out; // @[AddSub.scala 33:24]
  wire [31:0] iNToRecFN_1_io_in; // @[AddSub.scala 40:29]
  wire [32:0] iNToRecFN_1_io_out; // @[AddSub.scala 40:29]
  wire [31:0] iNToRecFN_2_io_in; // @[AddSub.scala 47:29]
  wire [32:0] iNToRecFN_2_io_out; // @[AddSub.scala 47:29]
  reg  op_sel; // @[AddSub.scala 25:28]
  reg [31:0] fN_in1; // @[AddSub.scala 30:24]
  reg [31:0] fN_in2; // @[AddSub.scala 31:24]
  wire  addRecFN_io_a_rawIn_sign = fN_in1[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] addRecFN_io_a_rawIn_expIn = fN_in1[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] addRecFN_io_a_rawIn_fractIn = fN_in1[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  addRecFN_io_a_rawIn_isZeroExpIn = addRecFN_io_a_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  addRecFN_io_a_rawIn_isZeroFractIn = addRecFN_io_a_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_23 = addRecFN_io_a_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_24 = addRecFN_io_a_rawIn_fractIn[2] ? 5'h14 :
    _addRecFN_io_a_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_25 = addRecFN_io_a_rawIn_fractIn[3] ? 5'h13 :
    _addRecFN_io_a_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_26 = addRecFN_io_a_rawIn_fractIn[4] ? 5'h12 :
    _addRecFN_io_a_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_27 = addRecFN_io_a_rawIn_fractIn[5] ? 5'h11 :
    _addRecFN_io_a_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_28 = addRecFN_io_a_rawIn_fractIn[6] ? 5'h10 :
    _addRecFN_io_a_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_29 = addRecFN_io_a_rawIn_fractIn[7] ? 5'hf :
    _addRecFN_io_a_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_30 = addRecFN_io_a_rawIn_fractIn[8] ? 5'he :
    _addRecFN_io_a_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_31 = addRecFN_io_a_rawIn_fractIn[9] ? 5'hd :
    _addRecFN_io_a_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_32 = addRecFN_io_a_rawIn_fractIn[10] ? 5'hc :
    _addRecFN_io_a_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_33 = addRecFN_io_a_rawIn_fractIn[11] ? 5'hb :
    _addRecFN_io_a_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_34 = addRecFN_io_a_rawIn_fractIn[12] ? 5'ha :
    _addRecFN_io_a_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_35 = addRecFN_io_a_rawIn_fractIn[13] ? 5'h9 :
    _addRecFN_io_a_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_36 = addRecFN_io_a_rawIn_fractIn[14] ? 5'h8 :
    _addRecFN_io_a_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_37 = addRecFN_io_a_rawIn_fractIn[15] ? 5'h7 :
    _addRecFN_io_a_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_38 = addRecFN_io_a_rawIn_fractIn[16] ? 5'h6 :
    _addRecFN_io_a_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_39 = addRecFN_io_a_rawIn_fractIn[17] ? 5'h5 :
    _addRecFN_io_a_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_40 = addRecFN_io_a_rawIn_fractIn[18] ? 5'h4 :
    _addRecFN_io_a_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_41 = addRecFN_io_a_rawIn_fractIn[19] ? 5'h3 :
    _addRecFN_io_a_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_42 = addRecFN_io_a_rawIn_fractIn[20] ? 5'h2 :
    _addRecFN_io_a_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_a_rawIn_normDist_T_43 = addRecFN_io_a_rawIn_fractIn[21] ? 5'h1 :
    _addRecFN_io_a_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] addRecFN_io_a_rawIn_normDist = addRecFN_io_a_rawIn_fractIn[22] ? 5'h0 : _addRecFN_io_a_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_2 = {{31'd0}, addRecFN_io_a_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _addRecFN_io_a_rawIn_subnormFract_T = _GEN_2 << addRecFN_io_a_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] addRecFN_io_a_rawIn_subnormFract = {_addRecFN_io_a_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_3 = {{4'd0}, addRecFN_io_a_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _addRecFN_io_a_rawIn_adjustedExp_T = _GEN_3 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _addRecFN_io_a_rawIn_adjustedExp_T_1 = addRecFN_io_a_rawIn_isZeroExpIn ? _addRecFN_io_a_rawIn_adjustedExp_T
     : {{1'd0}, addRecFN_io_a_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _addRecFN_io_a_rawIn_adjustedExp_T_2 = addRecFN_io_a_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_4 = {{6'd0}, _addRecFN_io_a_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _addRecFN_io_a_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_4; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_5 = {{1'd0}, _addRecFN_io_a_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] addRecFN_io_a_rawIn_adjustedExp = _addRecFN_io_a_rawIn_adjustedExp_T_1 + _GEN_5; // @[rawFloatFromFN.scala 59:15]
  wire  addRecFN_io_a_rawIn_isZero = addRecFN_io_a_rawIn_isZeroExpIn & addRecFN_io_a_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  addRecFN_io_a_rawIn_isSpecial = addRecFN_io_a_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  addRecFN_io_a_rawIn__isNaN = addRecFN_io_a_rawIn_isSpecial & ~addRecFN_io_a_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] addRecFN_io_a_rawIn__sExp = {1'b0,$signed(addRecFN_io_a_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  addRecFN_io_a_rawIn_out_sig_hi_lo = ~addRecFN_io_a_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] addRecFN_io_a_rawIn_out_sig_lo = addRecFN_io_a_rawIn_isZeroExpIn ? addRecFN_io_a_rawIn_subnormFract :
    addRecFN_io_a_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] addRecFN_io_a_rawIn__sig = {1'h0,addRecFN_io_a_rawIn_out_sig_hi_lo,addRecFN_io_a_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire [2:0] _addRecFN_io_a_T_1 = addRecFN_io_a_rawIn_isZero ? 3'h0 : addRecFN_io_a_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_6 = {{2'd0}, addRecFN_io_a_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] addRecFN_io_a_hi_lo = _addRecFN_io_a_T_1 | _GEN_6; // @[recFNFromFN.scala 48:79]
  wire [5:0] addRecFN_io_a_lo_hi = addRecFN_io_a_rawIn__sExp[5:0]; // @[recFNFromFN.scala 50:23]
  wire [22:0] addRecFN_io_a_lo_lo = addRecFN_io_a_rawIn__sig[22:0]; // @[recFNFromFN.scala 51:22]
  wire [32:0] _addRecFN_io_a_T_3 = {addRecFN_io_a_rawIn_sign,addRecFN_io_a_hi_lo,addRecFN_io_a_lo_hi,addRecFN_io_a_lo_lo
    }; // @[Cat.scala 30:58]
  wire  addRecFN_io_b_rawIn_sign = fN_in2[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] addRecFN_io_b_rawIn_expIn = fN_in2[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] addRecFN_io_b_rawIn_fractIn = fN_in2[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  addRecFN_io_b_rawIn_isZeroExpIn = addRecFN_io_b_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  addRecFN_io_b_rawIn_isZeroFractIn = addRecFN_io_b_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_23 = addRecFN_io_b_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_24 = addRecFN_io_b_rawIn_fractIn[2] ? 5'h14 :
    _addRecFN_io_b_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_25 = addRecFN_io_b_rawIn_fractIn[3] ? 5'h13 :
    _addRecFN_io_b_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_26 = addRecFN_io_b_rawIn_fractIn[4] ? 5'h12 :
    _addRecFN_io_b_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_27 = addRecFN_io_b_rawIn_fractIn[5] ? 5'h11 :
    _addRecFN_io_b_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_28 = addRecFN_io_b_rawIn_fractIn[6] ? 5'h10 :
    _addRecFN_io_b_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_29 = addRecFN_io_b_rawIn_fractIn[7] ? 5'hf :
    _addRecFN_io_b_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_30 = addRecFN_io_b_rawIn_fractIn[8] ? 5'he :
    _addRecFN_io_b_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_31 = addRecFN_io_b_rawIn_fractIn[9] ? 5'hd :
    _addRecFN_io_b_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_32 = addRecFN_io_b_rawIn_fractIn[10] ? 5'hc :
    _addRecFN_io_b_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_33 = addRecFN_io_b_rawIn_fractIn[11] ? 5'hb :
    _addRecFN_io_b_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_34 = addRecFN_io_b_rawIn_fractIn[12] ? 5'ha :
    _addRecFN_io_b_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_35 = addRecFN_io_b_rawIn_fractIn[13] ? 5'h9 :
    _addRecFN_io_b_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_36 = addRecFN_io_b_rawIn_fractIn[14] ? 5'h8 :
    _addRecFN_io_b_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_37 = addRecFN_io_b_rawIn_fractIn[15] ? 5'h7 :
    _addRecFN_io_b_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_38 = addRecFN_io_b_rawIn_fractIn[16] ? 5'h6 :
    _addRecFN_io_b_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_39 = addRecFN_io_b_rawIn_fractIn[17] ? 5'h5 :
    _addRecFN_io_b_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_40 = addRecFN_io_b_rawIn_fractIn[18] ? 5'h4 :
    _addRecFN_io_b_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_41 = addRecFN_io_b_rawIn_fractIn[19] ? 5'h3 :
    _addRecFN_io_b_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_42 = addRecFN_io_b_rawIn_fractIn[20] ? 5'h2 :
    _addRecFN_io_b_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _addRecFN_io_b_rawIn_normDist_T_43 = addRecFN_io_b_rawIn_fractIn[21] ? 5'h1 :
    _addRecFN_io_b_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] addRecFN_io_b_rawIn_normDist = addRecFN_io_b_rawIn_fractIn[22] ? 5'h0 : _addRecFN_io_b_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_7 = {{31'd0}, addRecFN_io_b_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _addRecFN_io_b_rawIn_subnormFract_T = _GEN_7 << addRecFN_io_b_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] addRecFN_io_b_rawIn_subnormFract = {_addRecFN_io_b_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_8 = {{4'd0}, addRecFN_io_b_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _addRecFN_io_b_rawIn_adjustedExp_T = _GEN_8 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _addRecFN_io_b_rawIn_adjustedExp_T_1 = addRecFN_io_b_rawIn_isZeroExpIn ? _addRecFN_io_b_rawIn_adjustedExp_T
     : {{1'd0}, addRecFN_io_b_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _addRecFN_io_b_rawIn_adjustedExp_T_2 = addRecFN_io_b_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_9 = {{6'd0}, _addRecFN_io_b_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _addRecFN_io_b_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_9; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_10 = {{1'd0}, _addRecFN_io_b_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] addRecFN_io_b_rawIn_adjustedExp = _addRecFN_io_b_rawIn_adjustedExp_T_1 + _GEN_10; // @[rawFloatFromFN.scala 59:15]
  wire  addRecFN_io_b_rawIn_isZero = addRecFN_io_b_rawIn_isZeroExpIn & addRecFN_io_b_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  addRecFN_io_b_rawIn_isSpecial = addRecFN_io_b_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  addRecFN_io_b_rawIn__isNaN = addRecFN_io_b_rawIn_isSpecial & ~addRecFN_io_b_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] addRecFN_io_b_rawIn__sExp = {1'b0,$signed(addRecFN_io_b_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  addRecFN_io_b_rawIn_out_sig_hi_lo = ~addRecFN_io_b_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] addRecFN_io_b_rawIn_out_sig_lo = addRecFN_io_b_rawIn_isZeroExpIn ? addRecFN_io_b_rawIn_subnormFract :
    addRecFN_io_b_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] addRecFN_io_b_rawIn__sig = {1'h0,addRecFN_io_b_rawIn_out_sig_hi_lo,addRecFN_io_b_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire [2:0] _addRecFN_io_b_T_1 = addRecFN_io_b_rawIn_isZero ? 3'h0 : addRecFN_io_b_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_11 = {{2'd0}, addRecFN_io_b_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] addRecFN_io_b_hi_lo = _addRecFN_io_b_T_1 | _GEN_11; // @[recFNFromFN.scala 48:79]
  wire [5:0] addRecFN_io_b_lo_hi = addRecFN_io_b_rawIn__sExp[5:0]; // @[recFNFromFN.scala 50:23]
  wire [22:0] addRecFN_io_b_lo_lo = addRecFN_io_b_rawIn__sig[22:0]; // @[recFNFromFN.scala 51:22]
  wire [32:0] _addRecFN_io_b_T_3 = {addRecFN_io_b_rawIn_sign,addRecFN_io_b_hi_lo,addRecFN_io_b_lo_hi,addRecFN_io_b_lo_lo
    }; // @[Cat.scala 30:58]
  wire [8:0] outIEEE_out_rawIn_exp = addRecFN_io_out[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  outIEEE_out_rawIn_isZero = outIEEE_out_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  outIEEE_out_rawIn_isSpecial = outIEEE_out_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  outIEEE_out_rawIn__isNaN = outIEEE_out_rawIn_isSpecial & outIEEE_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  outIEEE_out_rawIn__isInf = outIEEE_out_rawIn_isSpecial & ~outIEEE_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  outIEEE_out_rawIn__sign = addRecFN_io_out[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] outIEEE_out_rawIn__sExp = {1'b0,$signed(outIEEE_out_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  outIEEE_out_rawIn_out_sig_hi_lo = ~outIEEE_out_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] outIEEE_out_rawIn_out_sig_lo = addRecFN_io_out[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [24:0] outIEEE_out_rawIn__sig = {1'h0,outIEEE_out_rawIn_out_sig_hi_lo,outIEEE_out_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  outIEEE_out_isSubnormal = $signed(outIEEE_out_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] outIEEE_out_denormShiftDist = 5'h1 - outIEEE_out_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _outIEEE_out_denormFract_T_1 = outIEEE_out_rawIn__sig[24:1] >> outIEEE_out_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] outIEEE_out_denormFract = _outIEEE_out_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _outIEEE_out_expOut_T_2 = outIEEE_out_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _outIEEE_out_expOut_T_3 = outIEEE_out_isSubnormal ? 8'h0 : _outIEEE_out_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _outIEEE_out_expOut_T_4 = outIEEE_out_rawIn__isNaN | outIEEE_out_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _outIEEE_out_expOut_T_6 = _outIEEE_out_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] outIEEE_out_hi_lo = _outIEEE_out_expOut_T_3 | _outIEEE_out_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _outIEEE_out_fractOut_T_1 = outIEEE_out_rawIn__isInf ? 23'h0 : outIEEE_out_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] outIEEE_out_lo = outIEEE_out_isSubnormal ? outIEEE_out_denormFract : _outIEEE_out_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] outIEEE_out = {outIEEE_out_rawIn__sign,outIEEE_out_hi_lo,outIEEE_out_lo}; // @[Cat.scala 30:58]
  AddRecFN addRecFN ( // @[AddSub.scala 33:24]
    .io_subOp(addRecFN_io_subOp),
    .io_a(addRecFN_io_a),
    .io_b(addRecFN_io_b),
    .io_out(addRecFN_io_out)
  );
  INToRecFN iNToRecFN_1 ( // @[AddSub.scala 40:29]
    .io_in(iNToRecFN_1_io_in),
    .io_out(iNToRecFN_1_io_out)
  );
  INToRecFN iNToRecFN_2 ( // @[AddSub.scala 47:29]
    .io_in(iNToRecFN_2_io_in),
    .io_out(iNToRecFN_2_io_out)
  );
  assign io_outIEEE = {{1'd0}, outIEEE_out}; // @[Cat.scala 30:58]
  assign addRecFN_io_subOp = op_sel; // @[AddSub.scala 34:21]
  assign addRecFN_io_a = io_useINT ? iNToRecFN_1_io_out : _addRecFN_io_a_T_3; // @[AddSub.scala 38:19 AddSub.scala 54:19 AddSub.scala 63:19]
  assign addRecFN_io_b = io_useINT ? iNToRecFN_2_io_out : _addRecFN_io_b_T_3; // @[AddSub.scala 38:19 AddSub.scala 55:19 AddSub.scala 64:19]
  assign iNToRecFN_1_io_in = fN_in1; // @[AddSub.scala 42:23]
  assign iNToRecFN_2_io_in = fN_in2; // @[AddSub.scala 49:23]
  always @(posedge clock) begin
    op_sel <= io_op; // @[AddSub.scala 25:28]
    fN_in1 <= io_in1; // @[AddSub.scala 30:24]
    fN_in2 <= io_in2; // @[AddSub.scala 31:24]
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
  op_sel = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  fN_in1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  fN_in2 = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
