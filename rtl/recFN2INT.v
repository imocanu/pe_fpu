module RecFNToIN(
  input  [32:0] io_in,
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
  wire [22:0] shiftedSig_lo = rawIn__sig[22:0]; // @[RecFNToIN.scala 80:32]
  wire [23:0] _shiftedSig_T = {magGeOne,shiftedSig_lo}; // @[Cat.scala 30:58]
  wire [4:0] _shiftedSig_T_2 = magGeOne ? rawIn__sExp[4:0] : 5'h0; // @[RecFNToIN.scala 81:16]
  wire [54:0] _GEN_0 = {{31'd0}, _shiftedSig_T}; // @[RecFNToIN.scala 80:50]
  wire [54:0] shiftedSig = _GEN_0 << _shiftedSig_T_2; // @[RecFNToIN.scala 80:50]
  wire [32:0] alignedSig_hi = shiftedSig[54:22]; // @[RecFNToIN.scala 86:23]
  wire  alignedSig_lo = |shiftedSig[21:0]; // @[RecFNToIN.scala 86:69]
  wire [33:0] alignedSig = {alignedSig_hi,alignedSig_lo}; // @[Cat.scala 30:58]
  wire [31:0] unroundedInt = alignedSig[33:2]; // @[RecFNToIN.scala 87:54]
  wire  roundIncr_near_maxMag = magGeOne & alignedSig[1] | magJustBelowOne; // @[RecFNToIN.scala 93:61]
  wire [31:0] _complUnroundedInt_T = ~unroundedInt; // @[RecFNToIN.scala 100:45]
  wire [31:0] complUnroundedInt = rawIn__sign ? _complUnroundedInt_T : unroundedInt; // @[RecFNToIN.scala 100:32]
  wire [31:0] _roundedInt_T_2 = complUnroundedInt + 32'h1; // @[RecFNToIN.scala 103:31]
  wire [31:0] roundedInt = roundIncr_near_maxMag ^ rawIn__sign ? _roundedInt_T_2 : complUnroundedInt; // @[RecFNToIN.scala 102:12]
  wire  magGeOne_atOverflowEdge = posExp == 8'h1f; // @[RecFNToIN.scala 107:43]
  wire  roundCarryBut2 = &unroundedInt[29:0] & roundIncr_near_maxMag; // @[RecFNToIN.scala 110:61]
  wire  _common_overflow_T_3 = |unroundedInt[30:0] | roundIncr_near_maxMag; // @[RecFNToIN.scala 117:64]
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
  wire [31:0] _GEN_1 = {{1'd0}, _excOut_T_3}; // @[RecFNToIN.scala 139:11]
  wire [31:0] excOut = _excOut_T_1 | _GEN_1; // @[RecFNToIN.scala 139:11]
  assign io_out = invalidExc | common_overflow ? excOut : roundedInt; // @[RecFNToIN.scala 142:18]
endmodule
module recFN2INT(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [32:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] recFNToIN_io_in; // @[recFN2INT.scala 24:27]
  wire [31:0] recFNToIN_io_out; // @[recFN2INT.scala 24:27]
  reg [31:0] in_FN; // @[recFN2INT.scala 22:24]
  wire  recFNToIN_io_in_rawIn_sign = in_FN[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFNToIN_io_in_rawIn_expIn = in_FN[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFNToIN_io_in_rawIn_fractIn = in_FN[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFNToIN_io_in_rawIn_isZeroExpIn = recFNToIN_io_in_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFNToIN_io_in_rawIn_isZeroFractIn = recFNToIN_io_in_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_23 = recFNToIN_io_in_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_24 = recFNToIN_io_in_rawIn_fractIn[2] ? 5'h14 :
    _recFNToIN_io_in_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_25 = recFNToIN_io_in_rawIn_fractIn[3] ? 5'h13 :
    _recFNToIN_io_in_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_26 = recFNToIN_io_in_rawIn_fractIn[4] ? 5'h12 :
    _recFNToIN_io_in_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_27 = recFNToIN_io_in_rawIn_fractIn[5] ? 5'h11 :
    _recFNToIN_io_in_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_28 = recFNToIN_io_in_rawIn_fractIn[6] ? 5'h10 :
    _recFNToIN_io_in_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_29 = recFNToIN_io_in_rawIn_fractIn[7] ? 5'hf :
    _recFNToIN_io_in_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_30 = recFNToIN_io_in_rawIn_fractIn[8] ? 5'he :
    _recFNToIN_io_in_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_31 = recFNToIN_io_in_rawIn_fractIn[9] ? 5'hd :
    _recFNToIN_io_in_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_32 = recFNToIN_io_in_rawIn_fractIn[10] ? 5'hc :
    _recFNToIN_io_in_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_33 = recFNToIN_io_in_rawIn_fractIn[11] ? 5'hb :
    _recFNToIN_io_in_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_34 = recFNToIN_io_in_rawIn_fractIn[12] ? 5'ha :
    _recFNToIN_io_in_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_35 = recFNToIN_io_in_rawIn_fractIn[13] ? 5'h9 :
    _recFNToIN_io_in_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_36 = recFNToIN_io_in_rawIn_fractIn[14] ? 5'h8 :
    _recFNToIN_io_in_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_37 = recFNToIN_io_in_rawIn_fractIn[15] ? 5'h7 :
    _recFNToIN_io_in_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_38 = recFNToIN_io_in_rawIn_fractIn[16] ? 5'h6 :
    _recFNToIN_io_in_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_39 = recFNToIN_io_in_rawIn_fractIn[17] ? 5'h5 :
    _recFNToIN_io_in_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_40 = recFNToIN_io_in_rawIn_fractIn[18] ? 5'h4 :
    _recFNToIN_io_in_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_41 = recFNToIN_io_in_rawIn_fractIn[19] ? 5'h3 :
    _recFNToIN_io_in_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_42 = recFNToIN_io_in_rawIn_fractIn[20] ? 5'h2 :
    _recFNToIN_io_in_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFNToIN_io_in_rawIn_normDist_T_43 = recFNToIN_io_in_rawIn_fractIn[21] ? 5'h1 :
    _recFNToIN_io_in_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFNToIN_io_in_rawIn_normDist = recFNToIN_io_in_rawIn_fractIn[22] ? 5'h0 :
    _recFNToIN_io_in_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_0 = {{31'd0}, recFNToIN_io_in_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFNToIN_io_in_rawIn_subnormFract_T = _GEN_0 << recFNToIN_io_in_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFNToIN_io_in_rawIn_subnormFract = {_recFNToIN_io_in_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_1 = {{4'd0}, recFNToIN_io_in_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFNToIN_io_in_rawIn_adjustedExp_T = _GEN_1 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFNToIN_io_in_rawIn_adjustedExp_T_1 = recFNToIN_io_in_rawIn_isZeroExpIn ?
    _recFNToIN_io_in_rawIn_adjustedExp_T : {{1'd0}, recFNToIN_io_in_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFNToIN_io_in_rawIn_adjustedExp_T_2 = recFNToIN_io_in_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_2 = {{6'd0}, _recFNToIN_io_in_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFNToIN_io_in_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_2; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_3 = {{1'd0}, _recFNToIN_io_in_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFNToIN_io_in_rawIn_adjustedExp = _recFNToIN_io_in_rawIn_adjustedExp_T_1 + _GEN_3; // @[rawFloatFromFN.scala 59:15]
  wire  recFNToIN_io_in_rawIn_isZero = recFNToIN_io_in_rawIn_isZeroExpIn & recFNToIN_io_in_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFNToIN_io_in_rawIn_isSpecial = recFNToIN_io_in_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFNToIN_io_in_rawIn__isNaN = recFNToIN_io_in_rawIn_isSpecial & ~recFNToIN_io_in_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFNToIN_io_in_rawIn__sExp = {1'b0,$signed(recFNToIN_io_in_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  recFNToIN_io_in_rawIn_out_sig_hi_lo = ~recFNToIN_io_in_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] recFNToIN_io_in_rawIn_out_sig_lo = recFNToIN_io_in_rawIn_isZeroExpIn ? recFNToIN_io_in_rawIn_subnormFract
     : recFNToIN_io_in_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFNToIN_io_in_rawIn__sig = {1'h0,recFNToIN_io_in_rawIn_out_sig_hi_lo,recFNToIN_io_in_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire [2:0] _recFNToIN_io_in_T_1 = recFNToIN_io_in_rawIn_isZero ? 3'h0 : recFNToIN_io_in_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_4 = {{2'd0}, recFNToIN_io_in_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] recFNToIN_io_in_hi_lo = _recFNToIN_io_in_T_1 | _GEN_4; // @[recFNFromFN.scala 48:79]
  wire [5:0] recFNToIN_io_in_lo_hi = recFNToIN_io_in_rawIn__sExp[5:0]; // @[recFNFromFN.scala 50:23]
  wire [22:0] recFNToIN_io_in_lo_lo = recFNToIN_io_in_rawIn__sig[22:0]; // @[recFNFromFN.scala 51:22]
  wire [28:0] recFNToIN_io_in_lo = {recFNToIN_io_in_lo_hi,recFNToIN_io_in_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] recFNToIN_io_in_hi = {recFNToIN_io_in_rawIn_sign,recFNToIN_io_in_hi_lo}; // @[Cat.scala 30:58]
  reg [31:0] recFNToIN_out; // @[recFN2INT.scala 29:32]
  RecFNToIN recFNToIN ( // @[recFN2INT.scala 24:27]
    .io_in(recFNToIN_io_in),
    .io_out(recFNToIN_io_out)
  );
  assign io_out = {{1'd0}, recFNToIN_out}; // @[recFN2INT.scala 31:12]
  assign recFNToIN_io_in = {recFNToIN_io_in_hi,recFNToIN_io_in_lo}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    in_FN <= io_in; // @[recFN2INT.scala 22:24]
    recFNToIN_out <= recFNToIN_io_out; // @[recFN2INT.scala 29:32]
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
  in_FN = _RAND_0[31:0];
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
