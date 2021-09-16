circuit PE :
  module MuxPE :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    input io_in_2 : UInt<32>
    input io_in_3 : UInt<32>
    input io_sel : UInt<2>
    output io_out : UInt<32>

    reg sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), sel) @[MuxPE.scala 22:21]
    reg in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_0) @[MuxPE.scala 23:21]
    reg in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_1) @[MuxPE.scala 24:21]
    reg in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_2) @[MuxPE.scala 25:21]
    reg in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_3) @[MuxPE.scala 26:21]
    node _T = eq(sel, UInt<1>("h0")) @[MuxPE.scala 28:14]
    node _T_1 = eq(sel, UInt<1>("h1")) @[MuxPE.scala 32:20]
    node _T_2 = eq(sel, UInt<2>("h2")) @[MuxPE.scala 36:20]
    node _GEN_0 = mux(_T_2, in_2, in_3) @[MuxPE.scala 37:3 MuxPE.scala 38:12 MuxPE.scala 42:12]
    node _GEN_1 = mux(_T_1, in_1, _GEN_0) @[MuxPE.scala 33:3 MuxPE.scala 34:12]
    node _GEN_2 = mux(_T, in_0, _GEN_1) @[MuxPE.scala 29:3 MuxPE.scala 30:12]
    io_out <= _GEN_2
    sel <= io_sel @[MuxPE.scala 22:21]
    in_0 <= io_in_0 @[MuxPE.scala 23:21]
    in_1 <= io_in_1 @[MuxPE.scala 24:21]
    in_2 <= io_in_2 @[MuxPE.scala 25:21]
    in_3 <= io_in_3 @[MuxPE.scala 26:21]

  module MulFullRawFN :
    input io_a_isNaN : UInt<1>
    input io_a_isInf : UInt<1>
    input io_a_isZero : UInt<1>
    input io_a_sign : UInt<1>
    input io_a_sExp : SInt<10>
    input io_a_sig : UInt<25>
    input io_b_isNaN : UInt<1>
    input io_b_isInf : UInt<1>
    input io_b_isZero : UInt<1>
    input io_b_sign : UInt<1>
    input io_b_sExp : SInt<10>
    input io_b_sig : UInt<25>
    output io_invalidExc : UInt<1>
    output io_rawOut_isNaN : UInt<1>
    output io_rawOut_isInf : UInt<1>
    output io_rawOut_isZero : UInt<1>
    output io_rawOut_sign : UInt<1>
    output io_rawOut_sExp : SInt<10>
    output io_rawOut_sig : UInt<48>

    node _notSigNaN_invalidExc_T = and(io_a_isInf, io_b_isZero) @[MulRecFN.scala 58:44]
    node _notSigNaN_invalidExc_T_1 = and(io_a_isZero, io_b_isInf) @[MulRecFN.scala 58:76]
    node notSigNaN_invalidExc = or(_notSigNaN_invalidExc_T, _notSigNaN_invalidExc_T_1) @[MulRecFN.scala 58:60]
    node notNaN_isInfOut = or(io_a_isInf, io_b_isInf) @[MulRecFN.scala 59:38]
    node notNaN_isZeroOut = or(io_a_isZero, io_b_isZero) @[MulRecFN.scala 60:40]
    node notNaN_signOut = xor(io_a_sign, io_b_sign) @[MulRecFN.scala 61:36]
    node _common_sExpOut_T = add(io_a_sExp, io_b_sExp) @[MulRecFN.scala 62:36]
    node _common_sExpOut_T_1 = tail(_common_sExpOut_T, 1) @[MulRecFN.scala 62:36]
    node _common_sExpOut_T_2 = asSInt(_common_sExpOut_T_1) @[MulRecFN.scala 62:36]
    node _common_sExpOut_T_3 = sub(_common_sExpOut_T_2, asSInt(UInt<10>("h100"))) @[MulRecFN.scala 62:48]
    node _common_sExpOut_T_4 = tail(_common_sExpOut_T_3, 1) @[MulRecFN.scala 62:48]
    node common_sExpOut = asSInt(_common_sExpOut_T_4) @[MulRecFN.scala 62:48]
    node _common_sigOut_T = mul(io_a_sig, io_b_sig) @[MulRecFN.scala 63:35]
    node common_sigOut = bits(_common_sigOut_T, 47, 0) @[MulRecFN.scala 63:46]
    node _io_invalidExc_T = bits(io_a_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_1 = eq(_io_invalidExc_T, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_2 = and(io_a_isNaN, _io_invalidExc_T_1) @[common.scala 84:46]
    node _io_invalidExc_T_3 = bits(io_b_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_4 = eq(_io_invalidExc_T_3, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_5 = and(io_b_isNaN, _io_invalidExc_T_4) @[common.scala 84:46]
    node _io_invalidExc_T_6 = or(_io_invalidExc_T_2, _io_invalidExc_T_5) @[MulRecFN.scala 66:45]
    node _io_invalidExc_T_7 = or(_io_invalidExc_T_6, notSigNaN_invalidExc) @[MulRecFN.scala 66:71]
    node _io_rawOut_isNaN_T = or(io_a_isNaN, io_b_isNaN) @[MulRecFN.scala 70:35]
    io_invalidExc <= _io_invalidExc_T_7 @[MulRecFN.scala 66:19]
    io_rawOut_isNaN <= _io_rawOut_isNaN_T @[MulRecFN.scala 70:21]
    io_rawOut_isInf <= notNaN_isInfOut @[MulRecFN.scala 67:21]
    io_rawOut_isZero <= notNaN_isZeroOut @[MulRecFN.scala 68:22]
    io_rawOut_sign <= notNaN_signOut @[MulRecFN.scala 71:20]
    io_rawOut_sExp <= common_sExpOut @[MulRecFN.scala 69:20]
    io_rawOut_sig <= common_sigOut @[MulRecFN.scala 72:19]

  module MulRawFN :
    input io_a_isNaN : UInt<1>
    input io_a_isInf : UInt<1>
    input io_a_isZero : UInt<1>
    input io_a_sign : UInt<1>
    input io_a_sExp : SInt<10>
    input io_a_sig : UInt<25>
    input io_b_isNaN : UInt<1>
    input io_b_isInf : UInt<1>
    input io_b_isZero : UInt<1>
    input io_b_sign : UInt<1>
    input io_b_sExp : SInt<10>
    input io_b_sig : UInt<25>
    output io_invalidExc : UInt<1>
    output io_rawOut_isNaN : UInt<1>
    output io_rawOut_isInf : UInt<1>
    output io_rawOut_isZero : UInt<1>
    output io_rawOut_sign : UInt<1>
    output io_rawOut_sExp : SInt<10>
    output io_rawOut_sig : UInt<27>

    inst mulFullRaw of MulFullRawFN @[MulRecFN.scala 84:28]
    node io_rawOut_sig_hi = shr(mulFullRaw.io_rawOut_sig, 22) @[MulRecFN.scala 93:15]
    node _io_rawOut_sig_T = bits(mulFullRaw.io_rawOut_sig, 21, 0) @[MulRecFN.scala 93:37]
    node io_rawOut_sig_lo = orr(_io_rawOut_sig_T) @[MulRecFN.scala 93:55]
    node _io_rawOut_sig_T_1 = cat(io_rawOut_sig_hi, io_rawOut_sig_lo) @[Cat.scala 30:58]
    io_invalidExc <= mulFullRaw.io_invalidExc @[MulRecFN.scala 89:19]
    io_rawOut_isNaN <= mulFullRaw.io_rawOut_isNaN @[MulRecFN.scala 90:15]
    io_rawOut_isInf <= mulFullRaw.io_rawOut_isInf @[MulRecFN.scala 90:15]
    io_rawOut_isZero <= mulFullRaw.io_rawOut_isZero @[MulRecFN.scala 90:15]
    io_rawOut_sign <= mulFullRaw.io_rawOut_sign @[MulRecFN.scala 90:15]
    io_rawOut_sExp <= mulFullRaw.io_rawOut_sExp @[MulRecFN.scala 90:15]
    io_rawOut_sig <= _io_rawOut_sig_T_1 @[MulRecFN.scala 91:19]
    mulFullRaw.io_a_isNaN <= io_a_isNaN @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_isInf <= io_a_isInf @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_isZero <= io_a_isZero @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_sign <= io_a_sign @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_sExp <= io_a_sExp @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_sig <= io_a_sig @[MulRecFN.scala 86:21]
    mulFullRaw.io_b_isNaN <= io_b_isNaN @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_isInf <= io_b_isInf @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_isZero <= io_b_isZero @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_sign <= io_b_sign @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_sExp <= io_b_sExp @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_sig <= io_b_sig @[MulRecFN.scala 87:21]

  module RoundAnyRawFNToRecFN :
    input io_invalidExc : UInt<1>
    input io_infiniteExc : UInt<1>
    input io_in_isNaN : UInt<1>
    input io_in_isInf : UInt<1>
    input io_in_isZero : UInt<1>
    input io_in_sign : UInt<1>
    input io_in_sExp : SInt<10>
    input io_in_sig : UInt<27>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    node roundingMode_near_even = eq(io_roundingMode, UInt<3>("h0")) @[RoundAnyRawFNToRecFN.scala 88:53]
    node roundingMode_minMag = eq(io_roundingMode, UInt<3>("h1")) @[RoundAnyRawFNToRecFN.scala 89:53]
    node roundingMode_min = eq(io_roundingMode, UInt<3>("h2")) @[RoundAnyRawFNToRecFN.scala 90:53]
    node roundingMode_max = eq(io_roundingMode, UInt<3>("h3")) @[RoundAnyRawFNToRecFN.scala 91:53]
    node roundingMode_near_maxMag = eq(io_roundingMode, UInt<3>("h4")) @[RoundAnyRawFNToRecFN.scala 92:53]
    node roundingMode_odd = eq(io_roundingMode, UInt<3>("h6")) @[RoundAnyRawFNToRecFN.scala 93:53]
    node _roundMagUp_T = and(roundingMode_min, io_in_sign) @[RoundAnyRawFNToRecFN.scala 96:27]
    node _roundMagUp_T_1 = eq(io_in_sign, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 96:66]
    node _roundMagUp_T_2 = and(roundingMode_max, _roundMagUp_T_1) @[RoundAnyRawFNToRecFN.scala 96:63]
    node roundMagUp = or(_roundMagUp_T, _roundMagUp_T_2) @[RoundAnyRawFNToRecFN.scala 96:42]
    node adjustedSig = shl(io_in_sig, 0) @[RoundAnyRawFNToRecFN.scala 112:22]
    node doShiftSigDown1 = bits(adjustedSig, 26, 26) @[RoundAnyRawFNToRecFN.scala 118:61]
    node _roundMask_T = bits(io_in_sExp, 8, 0) @[RoundAnyRawFNToRecFN.scala 154:37]
    node _roundMask_T_1 = not(_roundMask_T) @[primitives.scala 51:21]
    node roundMask_msb = bits(_roundMask_T_1, 8, 8) @[primitives.scala 57:25]
    node roundMask_lsbs = bits(_roundMask_T_1, 7, 0) @[primitives.scala 58:26]
    node roundMask_msb_1 = bits(roundMask_lsbs, 7, 7) @[primitives.scala 57:25]
    node roundMask_lsbs_1 = bits(roundMask_lsbs, 6, 0) @[primitives.scala 58:26]
    node roundMask_msb_2 = bits(roundMask_lsbs_1, 6, 6) @[primitives.scala 57:25]
    node roundMask_lsbs_2 = bits(roundMask_lsbs_1, 5, 0) @[primitives.scala 58:26]
    node roundMask_shift = dshr(asSInt(UInt<65>("h10000000000000000")), roundMask_lsbs_2) @[primitives.scala 77:58]
    node _roundMask_T_2 = bits(roundMask_shift, 63, 42) @[primitives.scala 79:22]
    node _roundMask_T_3 = bits(_roundMask_T_2, 15, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_4 = shl(UInt<8>("hff"), 8) @[Bitwise.scala 102:47]
    node _roundMask_T_5 = xor(UInt<16>("hffff"), _roundMask_T_4) @[Bitwise.scala 102:21]
    node _roundMask_T_6 = shr(_roundMask_T_3, 8) @[Bitwise.scala 103:21]
    node _roundMask_T_7 = and(_roundMask_T_6, _roundMask_T_5) @[Bitwise.scala 103:31]
    node _roundMask_T_8 = bits(_roundMask_T_3, 7, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_9 = shl(_roundMask_T_8, 8) @[Bitwise.scala 103:65]
    node _roundMask_T_10 = not(_roundMask_T_5) @[Bitwise.scala 103:77]
    node _roundMask_T_11 = and(_roundMask_T_9, _roundMask_T_10) @[Bitwise.scala 103:75]
    node _roundMask_T_12 = or(_roundMask_T_7, _roundMask_T_11) @[Bitwise.scala 103:39]
    node _roundMask_T_13 = bits(_roundMask_T_5, 11, 0) @[Bitwise.scala 102:28]
    node _roundMask_T_14 = shl(_roundMask_T_13, 4) @[Bitwise.scala 102:47]
    node _roundMask_T_15 = xor(_roundMask_T_5, _roundMask_T_14) @[Bitwise.scala 102:21]
    node _roundMask_T_16 = shr(_roundMask_T_12, 4) @[Bitwise.scala 103:21]
    node _roundMask_T_17 = and(_roundMask_T_16, _roundMask_T_15) @[Bitwise.scala 103:31]
    node _roundMask_T_18 = bits(_roundMask_T_12, 11, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_19 = shl(_roundMask_T_18, 4) @[Bitwise.scala 103:65]
    node _roundMask_T_20 = not(_roundMask_T_15) @[Bitwise.scala 103:77]
    node _roundMask_T_21 = and(_roundMask_T_19, _roundMask_T_20) @[Bitwise.scala 103:75]
    node _roundMask_T_22 = or(_roundMask_T_17, _roundMask_T_21) @[Bitwise.scala 103:39]
    node _roundMask_T_23 = bits(_roundMask_T_15, 13, 0) @[Bitwise.scala 102:28]
    node _roundMask_T_24 = shl(_roundMask_T_23, 2) @[Bitwise.scala 102:47]
    node _roundMask_T_25 = xor(_roundMask_T_15, _roundMask_T_24) @[Bitwise.scala 102:21]
    node _roundMask_T_26 = shr(_roundMask_T_22, 2) @[Bitwise.scala 103:21]
    node _roundMask_T_27 = and(_roundMask_T_26, _roundMask_T_25) @[Bitwise.scala 103:31]
    node _roundMask_T_28 = bits(_roundMask_T_22, 13, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_29 = shl(_roundMask_T_28, 2) @[Bitwise.scala 103:65]
    node _roundMask_T_30 = not(_roundMask_T_25) @[Bitwise.scala 103:77]
    node _roundMask_T_31 = and(_roundMask_T_29, _roundMask_T_30) @[Bitwise.scala 103:75]
    node _roundMask_T_32 = or(_roundMask_T_27, _roundMask_T_31) @[Bitwise.scala 103:39]
    node _roundMask_T_33 = bits(_roundMask_T_25, 14, 0) @[Bitwise.scala 102:28]
    node _roundMask_T_34 = shl(_roundMask_T_33, 1) @[Bitwise.scala 102:47]
    node _roundMask_T_35 = xor(_roundMask_T_25, _roundMask_T_34) @[Bitwise.scala 102:21]
    node _roundMask_T_36 = shr(_roundMask_T_32, 1) @[Bitwise.scala 103:21]
    node _roundMask_T_37 = and(_roundMask_T_36, _roundMask_T_35) @[Bitwise.scala 103:31]
    node _roundMask_T_38 = bits(_roundMask_T_32, 14, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_39 = shl(_roundMask_T_38, 1) @[Bitwise.scala 103:65]
    node _roundMask_T_40 = not(_roundMask_T_35) @[Bitwise.scala 103:77]
    node _roundMask_T_41 = and(_roundMask_T_39, _roundMask_T_40) @[Bitwise.scala 103:75]
    node roundMask_hi = or(_roundMask_T_37, _roundMask_T_41) @[Bitwise.scala 103:39]
    node _roundMask_T_42 = bits(_roundMask_T_2, 21, 16) @[Bitwise.scala 109:44]
    node _roundMask_T_43 = bits(_roundMask_T_42, 3, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_44 = bits(_roundMask_T_43, 1, 0) @[Bitwise.scala 109:18]
    node roundMask_hi_1 = bits(_roundMask_T_44, 0, 0) @[Bitwise.scala 109:18]
    node roundMask_lo = bits(_roundMask_T_44, 1, 1) @[Bitwise.scala 109:44]
    node roundMask_hi_2 = cat(roundMask_hi_1, roundMask_lo) @[Cat.scala 30:58]
    node _roundMask_T_45 = bits(_roundMask_T_43, 3, 2) @[Bitwise.scala 109:44]
    node roundMask_hi_3 = bits(_roundMask_T_45, 0, 0) @[Bitwise.scala 109:18]
    node roundMask_lo_1 = bits(_roundMask_T_45, 1, 1) @[Bitwise.scala 109:44]
    node roundMask_lo_2 = cat(roundMask_hi_3, roundMask_lo_1) @[Cat.scala 30:58]
    node roundMask_hi_4 = cat(roundMask_hi_2, roundMask_lo_2) @[Cat.scala 30:58]
    node _roundMask_T_46 = bits(_roundMask_T_42, 5, 4) @[Bitwise.scala 109:44]
    node roundMask_hi_5 = bits(_roundMask_T_46, 0, 0) @[Bitwise.scala 109:18]
    node roundMask_lo_3 = bits(_roundMask_T_46, 1, 1) @[Bitwise.scala 109:44]
    node roundMask_lo_4 = cat(roundMask_hi_5, roundMask_lo_3) @[Cat.scala 30:58]
    node roundMask_lo_5 = cat(roundMask_hi_4, roundMask_lo_4) @[Cat.scala 30:58]
    node _roundMask_T_47 = cat(roundMask_hi, roundMask_lo_5) @[Cat.scala 30:58]
    node _roundMask_T_48 = not(_roundMask_T_47) @[primitives.scala 74:36]
    node _roundMask_T_49 = mux(roundMask_msb_2, UInt<1>("h0"), _roundMask_T_48) @[primitives.scala 74:21]
    node roundMask_hi_6 = not(_roundMask_T_49) @[primitives.scala 74:17]
    node _roundMask_T_50 = cat(roundMask_hi_6, UInt<3>("h7")) @[Cat.scala 30:58]
    node roundMask_msb_3 = bits(roundMask_lsbs_1, 6, 6) @[primitives.scala 57:25]
    node roundMask_lsbs_3 = bits(roundMask_lsbs_1, 5, 0) @[primitives.scala 58:26]
    node roundMask_shift_1 = dshr(asSInt(UInt<65>("h10000000000000000")), roundMask_lsbs_3) @[primitives.scala 77:58]
    node _roundMask_T_51 = bits(roundMask_shift_1, 2, 0) @[primitives.scala 79:22]
    node _roundMask_T_52 = bits(_roundMask_T_51, 1, 0) @[Bitwise.scala 109:18]
    node roundMask_hi_7 = bits(_roundMask_T_52, 0, 0) @[Bitwise.scala 109:18]
    node roundMask_lo_6 = bits(_roundMask_T_52, 1, 1) @[Bitwise.scala 109:44]
    node roundMask_hi_8 = cat(roundMask_hi_7, roundMask_lo_6) @[Cat.scala 30:58]
    node roundMask_lo_7 = bits(_roundMask_T_51, 2, 2) @[Bitwise.scala 109:44]
    node _roundMask_T_53 = cat(roundMask_hi_8, roundMask_lo_7) @[Cat.scala 30:58]
    node _roundMask_T_54 = mux(roundMask_msb_3, _roundMask_T_53, UInt<1>("h0")) @[primitives.scala 61:24]
    node _roundMask_T_55 = mux(roundMask_msb_1, _roundMask_T_50, _roundMask_T_54) @[primitives.scala 66:24]
    node _roundMask_T_56 = mux(roundMask_msb, _roundMask_T_55, UInt<1>("h0")) @[primitives.scala 61:24]
    node roundMask_hi_9 = or(_roundMask_T_56, doShiftSigDown1) @[RoundAnyRawFNToRecFN.scala 157:23]
    node roundMask = cat(roundMask_hi_9, UInt<2>("h3")) @[Cat.scala 30:58]
    node shiftedRoundMask_lo = shr(roundMask, 1) @[RoundAnyRawFNToRecFN.scala 160:57]
    node shiftedRoundMask = cat(UInt<1>("h0"), shiftedRoundMask_lo) @[Cat.scala 30:58]
    node _roundPosMask_T = not(shiftedRoundMask) @[RoundAnyRawFNToRecFN.scala 161:28]
    node roundPosMask = and(_roundPosMask_T, roundMask) @[RoundAnyRawFNToRecFN.scala 161:46]
    node _roundPosBit_T = and(adjustedSig, roundPosMask) @[RoundAnyRawFNToRecFN.scala 162:40]
    node roundPosBit = orr(_roundPosBit_T) @[RoundAnyRawFNToRecFN.scala 162:56]
    node _anyRoundExtra_T = and(adjustedSig, shiftedRoundMask) @[RoundAnyRawFNToRecFN.scala 163:42]
    node anyRoundExtra = orr(_anyRoundExtra_T) @[RoundAnyRawFNToRecFN.scala 163:62]
    node anyRound = or(roundPosBit, anyRoundExtra) @[RoundAnyRawFNToRecFN.scala 164:36]
    node _roundIncr_T = or(roundingMode_near_even, roundingMode_near_maxMag) @[RoundAnyRawFNToRecFN.scala 167:38]
    node _roundIncr_T_1 = and(_roundIncr_T, roundPosBit) @[RoundAnyRawFNToRecFN.scala 167:67]
    node _roundIncr_T_2 = and(roundMagUp, anyRound) @[RoundAnyRawFNToRecFN.scala 169:29]
    node roundIncr = or(_roundIncr_T_1, _roundIncr_T_2) @[RoundAnyRawFNToRecFN.scala 168:31]
    node _roundedSig_T = or(adjustedSig, roundMask) @[RoundAnyRawFNToRecFN.scala 172:32]
    node _roundedSig_T_1 = shr(_roundedSig_T, 2) @[RoundAnyRawFNToRecFN.scala 172:44]
    node _roundedSig_T_2 = add(_roundedSig_T_1, UInt<1>("h1")) @[RoundAnyRawFNToRecFN.scala 172:49]
    node _roundedSig_T_3 = and(roundingMode_near_even, roundPosBit) @[RoundAnyRawFNToRecFN.scala 173:49]
    node _roundedSig_T_4 = eq(anyRoundExtra, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 174:30]
    node _roundedSig_T_5 = and(_roundedSig_T_3, _roundedSig_T_4) @[RoundAnyRawFNToRecFN.scala 173:64]
    node _roundedSig_T_6 = shr(roundMask, 1) @[RoundAnyRawFNToRecFN.scala 175:35]
    node _roundedSig_T_7 = mux(_roundedSig_T_5, _roundedSig_T_6, UInt<26>("h0")) @[RoundAnyRawFNToRecFN.scala 173:25]
    node _roundedSig_T_8 = not(_roundedSig_T_7) @[RoundAnyRawFNToRecFN.scala 173:21]
    node _roundedSig_T_9 = and(_roundedSig_T_2, _roundedSig_T_8) @[RoundAnyRawFNToRecFN.scala 172:61]
    node _roundedSig_T_10 = not(roundMask) @[RoundAnyRawFNToRecFN.scala 178:32]
    node _roundedSig_T_11 = and(adjustedSig, _roundedSig_T_10) @[RoundAnyRawFNToRecFN.scala 178:30]
    node _roundedSig_T_12 = shr(_roundedSig_T_11, 2) @[RoundAnyRawFNToRecFN.scala 178:43]
    node _roundedSig_T_13 = and(roundingMode_odd, anyRound) @[RoundAnyRawFNToRecFN.scala 179:42]
    node _roundedSig_T_14 = shr(roundPosMask, 1) @[RoundAnyRawFNToRecFN.scala 179:67]
    node _roundedSig_T_15 = mux(_roundedSig_T_13, _roundedSig_T_14, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 179:24]
    node _roundedSig_T_16 = or(_roundedSig_T_12, _roundedSig_T_15) @[RoundAnyRawFNToRecFN.scala 178:47]
    node roundedSig = mux(roundIncr, _roundedSig_T_9, _roundedSig_T_16) @[RoundAnyRawFNToRecFN.scala 171:16]
    node _sRoundedExp_T = shr(roundedSig, 24) @[RoundAnyRawFNToRecFN.scala 183:54]
    node _sRoundedExp_T_1 = cvt(_sRoundedExp_T) @[RoundAnyRawFNToRecFN.scala 183:69]
    node sRoundedExp = add(io_in_sExp, _sRoundedExp_T_1) @[RoundAnyRawFNToRecFN.scala 183:40]
    node _common_expOut_T = bits(sRoundedExp, 8, 0) @[RoundAnyRawFNToRecFN.scala 185:37]
    node _common_fractOut_T = bits(roundedSig, 23, 1) @[RoundAnyRawFNToRecFN.scala 188:27]
    node _common_fractOut_T_1 = bits(roundedSig, 22, 0) @[RoundAnyRawFNToRecFN.scala 189:27]
    node _common_fractOut_T_2 = mux(doShiftSigDown1, _common_fractOut_T, _common_fractOut_T_1) @[RoundAnyRawFNToRecFN.scala 187:16]
    node _common_overflow_T = shr(sRoundedExp, 7) @[RoundAnyRawFNToRecFN.scala 194:30]
    node _common_overflow_T_1 = geq(_common_overflow_T, asSInt(UInt<3>("h3"))) @[RoundAnyRawFNToRecFN.scala 194:50]
    node _common_totalUnderflow_T = lt(sRoundedExp, asSInt(UInt<8>("h6b"))) @[RoundAnyRawFNToRecFN.scala 198:31]
    node _unboundedRange_roundPosBit_T = bits(adjustedSig, 2, 2) @[RoundAnyRawFNToRecFN.scala 201:45]
    node _unboundedRange_roundPosBit_T_1 = bits(adjustedSig, 1, 1) @[RoundAnyRawFNToRecFN.scala 201:61]
    node unboundedRange_roundPosBit = mux(doShiftSigDown1, _unboundedRange_roundPosBit_T, _unboundedRange_roundPosBit_T_1) @[RoundAnyRawFNToRecFN.scala 201:16]
    node _unboundedRange_anyRound_T = bits(adjustedSig, 2, 2) @[RoundAnyRawFNToRecFN.scala 203:44]
    node _unboundedRange_anyRound_T_1 = and(doShiftSigDown1, _unboundedRange_anyRound_T) @[RoundAnyRawFNToRecFN.scala 203:30]
    node _unboundedRange_anyRound_T_2 = bits(adjustedSig, 1, 0) @[RoundAnyRawFNToRecFN.scala 203:63]
    node _unboundedRange_anyRound_T_3 = orr(_unboundedRange_anyRound_T_2) @[RoundAnyRawFNToRecFN.scala 203:70]
    node unboundedRange_anyRound = or(_unboundedRange_anyRound_T_1, _unboundedRange_anyRound_T_3) @[RoundAnyRawFNToRecFN.scala 203:49]
    node _unboundedRange_roundIncr_T = or(roundingMode_near_even, roundingMode_near_maxMag) @[RoundAnyRawFNToRecFN.scala 205:38]
    node _unboundedRange_roundIncr_T_1 = and(_unboundedRange_roundIncr_T, unboundedRange_roundPosBit) @[RoundAnyRawFNToRecFN.scala 205:67]
    node _unboundedRange_roundIncr_T_2 = and(roundMagUp, unboundedRange_anyRound) @[RoundAnyRawFNToRecFN.scala 207:29]
    node unboundedRange_roundIncr = or(_unboundedRange_roundIncr_T_1, _unboundedRange_roundIncr_T_2) @[RoundAnyRawFNToRecFN.scala 206:46]
    node _roundCarry_T = bits(roundedSig, 25, 25) @[RoundAnyRawFNToRecFN.scala 210:27]
    node _roundCarry_T_1 = bits(roundedSig, 24, 24) @[RoundAnyRawFNToRecFN.scala 211:27]
    node roundCarry = mux(doShiftSigDown1, _roundCarry_T, _roundCarry_T_1) @[RoundAnyRawFNToRecFN.scala 209:16]
    node _common_underflow_T = shr(io_in_sExp, 8) @[RoundAnyRawFNToRecFN.scala 218:48]
    node _common_underflow_T_1 = leq(_common_underflow_T, asSInt(UInt<1>("h0"))) @[RoundAnyRawFNToRecFN.scala 218:62]
    node _common_underflow_T_2 = and(anyRound, _common_underflow_T_1) @[RoundAnyRawFNToRecFN.scala 218:32]
    node _common_underflow_T_3 = bits(roundMask, 3, 3) @[RoundAnyRawFNToRecFN.scala 219:57]
    node _common_underflow_T_4 = bits(roundMask, 2, 2) @[RoundAnyRawFNToRecFN.scala 219:71]
    node _common_underflow_T_5 = mux(doShiftSigDown1, _common_underflow_T_3, _common_underflow_T_4) @[RoundAnyRawFNToRecFN.scala 219:30]
    node _common_underflow_T_6 = and(_common_underflow_T_2, _common_underflow_T_5) @[RoundAnyRawFNToRecFN.scala 218:74]
    node _common_underflow_T_7 = eq(io_detectTininess, UInt<1>("h1")) @[RoundAnyRawFNToRecFN.scala 220:49]
    node _common_underflow_T_8 = bits(roundMask, 4, 4) @[RoundAnyRawFNToRecFN.scala 222:49]
    node _common_underflow_T_9 = bits(roundMask, 3, 3) @[RoundAnyRawFNToRecFN.scala 223:49]
    node _common_underflow_T_10 = mux(doShiftSigDown1, _common_underflow_T_8, _common_underflow_T_9) @[RoundAnyRawFNToRecFN.scala 221:39]
    node _common_underflow_T_11 = eq(_common_underflow_T_10, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 221:34]
    node _common_underflow_T_12 = and(_common_underflow_T_7, _common_underflow_T_11) @[RoundAnyRawFNToRecFN.scala 220:77]
    node _common_underflow_T_13 = and(_common_underflow_T_12, roundCarry) @[RoundAnyRawFNToRecFN.scala 224:38]
    node _common_underflow_T_14 = and(_common_underflow_T_13, roundPosBit) @[RoundAnyRawFNToRecFN.scala 225:45]
    node _common_underflow_T_15 = and(_common_underflow_T_14, unboundedRange_roundIncr) @[RoundAnyRawFNToRecFN.scala 225:60]
    node _common_underflow_T_16 = eq(_common_underflow_T_15, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 220:27]
    node _common_underflow_T_17 = and(_common_underflow_T_6, _common_underflow_T_16) @[RoundAnyRawFNToRecFN.scala 219:76]
    node common_totalUnderflow = _common_totalUnderflow_T @[RoundAnyRawFNToRecFN.scala 123:37 RoundAnyRawFNToRecFN.scala 195:31]
    node _common_underflow_T_18 = or(common_totalUnderflow, _common_underflow_T_17) @[RoundAnyRawFNToRecFN.scala 215:40]
    node _common_inexact_T = or(common_totalUnderflow, anyRound) @[RoundAnyRawFNToRecFN.scala 228:49]
    node isNaNOut = or(io_invalidExc, io_in_isNaN) @[RoundAnyRawFNToRecFN.scala 233:34]
    node notNaN_isSpecialInfOut = or(io_infiniteExc, io_in_isInf) @[RoundAnyRawFNToRecFN.scala 234:49]
    node _commonCase_T = eq(isNaNOut, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 235:22]
    node _commonCase_T_1 = eq(notNaN_isSpecialInfOut, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 235:36]
    node _commonCase_T_2 = and(_commonCase_T, _commonCase_T_1) @[RoundAnyRawFNToRecFN.scala 235:33]
    node _commonCase_T_3 = eq(io_in_isZero, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 235:64]
    node commonCase = and(_commonCase_T_2, _commonCase_T_3) @[RoundAnyRawFNToRecFN.scala 235:61]
    node common_overflow = _common_overflow_T_1 @[RoundAnyRawFNToRecFN.scala 122:37 RoundAnyRawFNToRecFN.scala 191:25]
    node overflow = and(commonCase, common_overflow) @[RoundAnyRawFNToRecFN.scala 236:32]
    node common_underflow = _common_underflow_T_18 @[RoundAnyRawFNToRecFN.scala 124:37 RoundAnyRawFNToRecFN.scala 213:26]
    node underflow = and(commonCase, common_underflow) @[RoundAnyRawFNToRecFN.scala 237:32]
    node common_inexact = _common_inexact_T @[RoundAnyRawFNToRecFN.scala 125:37 RoundAnyRawFNToRecFN.scala 228:24]
    node _inexact_T = and(commonCase, common_inexact) @[RoundAnyRawFNToRecFN.scala 238:43]
    node inexact = or(overflow, _inexact_T) @[RoundAnyRawFNToRecFN.scala 238:28]
    node _overflow_roundMagUp_T = or(roundingMode_near_even, roundingMode_near_maxMag) @[RoundAnyRawFNToRecFN.scala 241:32]
    node overflow_roundMagUp = or(_overflow_roundMagUp_T, roundMagUp) @[RoundAnyRawFNToRecFN.scala 241:60]
    node _pegMinNonzeroMagOut_T = and(commonCase, common_totalUnderflow) @[RoundAnyRawFNToRecFN.scala 243:20]
    node _pegMinNonzeroMagOut_T_1 = or(roundMagUp, roundingMode_odd) @[RoundAnyRawFNToRecFN.scala 243:60]
    node pegMinNonzeroMagOut = and(_pegMinNonzeroMagOut_T, _pegMinNonzeroMagOut_T_1) @[RoundAnyRawFNToRecFN.scala 243:45]
    node _pegMaxFiniteMagOut_T = eq(overflow_roundMagUp, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 244:42]
    node pegMaxFiniteMagOut = and(overflow, _pegMaxFiniteMagOut_T) @[RoundAnyRawFNToRecFN.scala 244:39]
    node _notNaN_isInfOut_T = and(overflow, overflow_roundMagUp) @[RoundAnyRawFNToRecFN.scala 246:45]
    node notNaN_isInfOut = or(notNaN_isSpecialInfOut, _notNaN_isInfOut_T) @[RoundAnyRawFNToRecFN.scala 246:32]
    node signOut = mux(isNaNOut, UInt<1>("h0"), io_in_sign) @[RoundAnyRawFNToRecFN.scala 248:22]
    node _expOut_T = or(io_in_isZero, common_totalUnderflow) @[RoundAnyRawFNToRecFN.scala 251:32]
    node _expOut_T_1 = mux(_expOut_T, UInt<9>("h1c0"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 251:18]
    node _expOut_T_2 = not(_expOut_T_1) @[RoundAnyRawFNToRecFN.scala 251:14]
    node common_expOut = _common_expOut_T @[RoundAnyRawFNToRecFN.scala 120:31 RoundAnyRawFNToRecFN.scala 185:23]
    node _expOut_T_3 = and(common_expOut, _expOut_T_2) @[RoundAnyRawFNToRecFN.scala 250:24]
    node _expOut_T_4 = not(UInt<9>("h6b")) @[RoundAnyRawFNToRecFN.scala 256:19]
    node _expOut_T_5 = mux(pegMinNonzeroMagOut, _expOut_T_4, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 255:18]
    node _expOut_T_6 = not(_expOut_T_5) @[RoundAnyRawFNToRecFN.scala 255:14]
    node _expOut_T_7 = and(_expOut_T_3, _expOut_T_6) @[RoundAnyRawFNToRecFN.scala 254:17]
    node _expOut_T_8 = mux(pegMaxFiniteMagOut, UInt<9>("h80"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 259:18]
    node _expOut_T_9 = not(_expOut_T_8) @[RoundAnyRawFNToRecFN.scala 259:14]
    node _expOut_T_10 = and(_expOut_T_7, _expOut_T_9) @[RoundAnyRawFNToRecFN.scala 258:17]
    node _expOut_T_11 = mux(notNaN_isInfOut, UInt<9>("h40"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 263:18]
    node _expOut_T_12 = not(_expOut_T_11) @[RoundAnyRawFNToRecFN.scala 263:14]
    node _expOut_T_13 = and(_expOut_T_10, _expOut_T_12) @[RoundAnyRawFNToRecFN.scala 262:17]
    node _expOut_T_14 = mux(pegMinNonzeroMagOut, UInt<9>("h6b"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 267:16]
    node _expOut_T_15 = or(_expOut_T_13, _expOut_T_14) @[RoundAnyRawFNToRecFN.scala 266:18]
    node _expOut_T_16 = mux(pegMaxFiniteMagOut, UInt<9>("h17f"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 271:16]
    node _expOut_T_17 = or(_expOut_T_15, _expOut_T_16) @[RoundAnyRawFNToRecFN.scala 270:15]
    node _expOut_T_18 = mux(notNaN_isInfOut, UInt<9>("h180"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 275:16]
    node _expOut_T_19 = or(_expOut_T_17, _expOut_T_18) @[RoundAnyRawFNToRecFN.scala 274:15]
    node _expOut_T_20 = mux(isNaNOut, UInt<9>("h1c0"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 276:16]
    node expOut = or(_expOut_T_19, _expOut_T_20) @[RoundAnyRawFNToRecFN.scala 275:77]
    node _fractOut_T = or(isNaNOut, io_in_isZero) @[RoundAnyRawFNToRecFN.scala 278:22]
    node _fractOut_T_1 = or(_fractOut_T, common_totalUnderflow) @[RoundAnyRawFNToRecFN.scala 278:38]
    node _fractOut_T_2 = mux(isNaNOut, UInt<23>("h400000"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 279:16]
    node common_fractOut = _common_fractOut_T_2 @[RoundAnyRawFNToRecFN.scala 121:31 RoundAnyRawFNToRecFN.scala 186:25]
    node _fractOut_T_3 = mux(_fractOut_T_1, _fractOut_T_2, common_fractOut) @[RoundAnyRawFNToRecFN.scala 278:12]
    node _fractOut_T_4 = bits(pegMaxFiniteMagOut, 0, 0) @[Bitwise.scala 72:15]
    node _fractOut_T_5 = mux(_fractOut_T_4, UInt<23>("h7fffff"), UInt<23>("h0")) @[Bitwise.scala 72:12]
    node fractOut = or(_fractOut_T_3, _fractOut_T_5) @[RoundAnyRawFNToRecFN.scala 281:11]
    node io_out_hi = cat(signOut, expOut) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, fractOut) @[Cat.scala 30:58]
    node io_exceptionFlags_lo = cat(underflow, inexact) @[Cat.scala 30:58]
    node io_exceptionFlags_hi_hi = cat(io_invalidExc, io_infiniteExc) @[Cat.scala 30:58]
    node io_exceptionFlags_hi = cat(io_exceptionFlags_hi_hi, overflow) @[Cat.scala 30:58]
    node _io_exceptionFlags_T = cat(io_exceptionFlags_hi, io_exceptionFlags_lo) @[Cat.scala 30:58]
    io_out <= _io_out_T @[RoundAnyRawFNToRecFN.scala 284:12]
    io_exceptionFlags <= _io_exceptionFlags_T @[RoundAnyRawFNToRecFN.scala 285:23]

  module RoundRawFNToRecFN :
    input io_invalidExc : UInt<1>
    input io_infiniteExc : UInt<1>
    input io_in_isNaN : UInt<1>
    input io_in_isInf : UInt<1>
    input io_in_isZero : UInt<1>
    input io_in_sign : UInt<1>
    input io_in_sExp : SInt<10>
    input io_in_sig : UInt<27>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    inst roundAnyRawFNToRecFN of RoundAnyRawFNToRecFN @[RoundAnyRawFNToRecFN.scala 307:15]
    io_out <= roundAnyRawFNToRecFN.io_out @[RoundAnyRawFNToRecFN.scala 315:23]
    io_exceptionFlags <= roundAnyRawFNToRecFN.io_exceptionFlags @[RoundAnyRawFNToRecFN.scala 316:23]
    roundAnyRawFNToRecFN.io_invalidExc <= io_invalidExc @[RoundAnyRawFNToRecFN.scala 310:44]
    roundAnyRawFNToRecFN.io_infiniteExc <= io_infiniteExc @[RoundAnyRawFNToRecFN.scala 311:44]
    roundAnyRawFNToRecFN.io_in_isNaN <= io_in_isNaN @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_isInf <= io_in_isInf @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_isZero <= io_in_isZero @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_sign <= io_in_sign @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_sExp <= io_in_sExp @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_sig <= io_in_sig @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_roundingMode <= io_roundingMode @[RoundAnyRawFNToRecFN.scala 313:44]
    roundAnyRawFNToRecFN.io_detectTininess <= io_detectTininess @[RoundAnyRawFNToRecFN.scala 314:44]

  module MulRecFN :
    input io_a : UInt<33>
    input io_b : UInt<33>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    inst mulRawFN_ of MulRawFN @[MulRecFN.scala 113:26]
    inst roundRawFNToRecFN of RoundRawFNToRecFN @[MulRecFN.scala 121:15]
    node mulRawFN_io_a_exp = bits(io_a, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _mulRawFN_io_a_isZero_T = bits(mulRawFN_io_a_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node mulRawFN_io_a_isZero = eq(_mulRawFN_io_a_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _mulRawFN_io_a_isSpecial_T = bits(mulRawFN_io_a_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node mulRawFN_io_a_isSpecial = eq(_mulRawFN_io_a_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _mulRawFN_io_a_out_isNaN_T = bits(mulRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _mulRawFN_io_a_out_isNaN_T_1 = and(mulRawFN_io_a_isSpecial, _mulRawFN_io_a_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _mulRawFN_io_a_out_isInf_T = bits(mulRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _mulRawFN_io_a_out_isInf_T_1 = eq(_mulRawFN_io_a_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _mulRawFN_io_a_out_isInf_T_2 = and(mulRawFN_io_a_isSpecial, _mulRawFN_io_a_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _mulRawFN_io_a_out_sign_T = bits(io_a, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _mulRawFN_io_a_out_sExp_T = cvt(mulRawFN_io_a_exp) @[rawFloatFromRecFN.scala 59:27]
    node mulRawFN_io_a_out_sig_hi_lo = eq(mulRawFN_io_a_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node mulRawFN_io_a_out_sig_lo = bits(io_a, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node mulRawFN_io_a_out_sig_hi = cat(UInt<1>("h0"), mulRawFN_io_a_out_sig_hi_lo) @[Cat.scala 30:58]
    node _mulRawFN_io_a_out_sig_T = cat(mulRawFN_io_a_out_sig_hi, mulRawFN_io_a_out_sig_lo) @[Cat.scala 30:58]
    node mulRawFN_io_b_exp = bits(io_b, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _mulRawFN_io_b_isZero_T = bits(mulRawFN_io_b_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node mulRawFN_io_b_isZero = eq(_mulRawFN_io_b_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _mulRawFN_io_b_isSpecial_T = bits(mulRawFN_io_b_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node mulRawFN_io_b_isSpecial = eq(_mulRawFN_io_b_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _mulRawFN_io_b_out_isNaN_T = bits(mulRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _mulRawFN_io_b_out_isNaN_T_1 = and(mulRawFN_io_b_isSpecial, _mulRawFN_io_b_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _mulRawFN_io_b_out_isInf_T = bits(mulRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _mulRawFN_io_b_out_isInf_T_1 = eq(_mulRawFN_io_b_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _mulRawFN_io_b_out_isInf_T_2 = and(mulRawFN_io_b_isSpecial, _mulRawFN_io_b_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _mulRawFN_io_b_out_sign_T = bits(io_b, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _mulRawFN_io_b_out_sExp_T = cvt(mulRawFN_io_b_exp) @[rawFloatFromRecFN.scala 59:27]
    node mulRawFN_io_b_out_sig_hi_lo = eq(mulRawFN_io_b_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node mulRawFN_io_b_out_sig_lo = bits(io_b, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node mulRawFN_io_b_out_sig_hi = cat(UInt<1>("h0"), mulRawFN_io_b_out_sig_hi_lo) @[Cat.scala 30:58]
    node _mulRawFN_io_b_out_sig_T = cat(mulRawFN_io_b_out_sig_hi, mulRawFN_io_b_out_sig_lo) @[Cat.scala 30:58]
    node mulRawFN_io_a_out_isNaN = _mulRawFN_io_a_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 55:20]
    node mulRawFN_io_a_out_isInf = _mulRawFN_io_a_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 56:20]
    node mulRawFN_io_a_out_isZero = mulRawFN_io_a_isZero @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 57:20]
    node mulRawFN_io_a_out_sign = _mulRawFN_io_a_out_sign_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 58:20]
    node mulRawFN_io_a_out_sExp = _mulRawFN_io_a_out_sExp_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 59:20]
    node mulRawFN_io_a_out_sig = _mulRawFN_io_a_out_sig_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 60:20]
    node mulRawFN_io_b_out_isNaN = _mulRawFN_io_b_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 55:20]
    node mulRawFN_io_b_out_isInf = _mulRawFN_io_b_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 56:20]
    node mulRawFN_io_b_out_isZero = mulRawFN_io_b_isZero @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 57:20]
    node mulRawFN_io_b_out_sign = _mulRawFN_io_b_out_sign_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 58:20]
    node mulRawFN_io_b_out_sExp = _mulRawFN_io_b_out_sExp_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 59:20]
    node mulRawFN_io_b_out_sig = _mulRawFN_io_b_out_sig_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 60:20]
    io_out <= roundRawFNToRecFN.io_out @[MulRecFN.scala 127:23]
    io_exceptionFlags <= roundRawFNToRecFN.io_exceptionFlags @[MulRecFN.scala 128:23]
    mulRawFN_.io_a_isNaN <= mulRawFN_io_a_out_isNaN @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_isInf <= mulRawFN_io_a_out_isInf @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_isZero <= mulRawFN_io_a_out_isZero @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_sign <= mulRawFN_io_a_out_sign @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_sExp <= mulRawFN_io_a_out_sExp @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_sig <= mulRawFN_io_a_out_sig @[MulRecFN.scala 115:19]
    mulRawFN_.io_b_isNaN <= mulRawFN_io_b_out_isNaN @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_isInf <= mulRawFN_io_b_out_isInf @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_isZero <= mulRawFN_io_b_out_isZero @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_sign <= mulRawFN_io_b_out_sign @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_sExp <= mulRawFN_io_b_out_sExp @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_sig <= mulRawFN_io_b_out_sig @[MulRecFN.scala 116:19]
    roundRawFNToRecFN.io_invalidExc <= mulRawFN_.io_invalidExc @[MulRecFN.scala 122:39]
    roundRawFNToRecFN.io_infiniteExc <= UInt<1>("h0") @[MulRecFN.scala 123:39]
    roundRawFNToRecFN.io_in_isNaN <= mulRawFN_.io_rawOut_isNaN @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_isInf <= mulRawFN_.io_rawOut_isInf @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_isZero <= mulRawFN_.io_rawOut_isZero @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_sign <= mulRawFN_.io_rawOut_sign @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_sExp <= mulRawFN_.io_rawOut_sExp @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_sig <= mulRawFN_.io_rawOut_sig @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_roundingMode <= io_roundingMode @[MulRecFN.scala 125:39]
    roundRawFNToRecFN.io_detectTininess <= io_detectTininess @[MulRecFN.scala 126:41]

  module MultPE :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    input io_rounding : UInt<3>
    input io_tininess : UInt<1>
    output io_out : UInt<33>

    inst mulRecFN of MulRecFN @[MultPE.scala 28:24]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[MultPE.scala 18:26]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[MultPE.scala 21:26]
    reg in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_0) @[MultPE.scala 24:22]
    reg in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_1) @[MultPE.scala 25:22]
    reg mulRecFN_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), mulRecFN_out) @[MultPE.scala 33:30]
    io_out <= mulRecFN_out @[MultPE.scala 35:10]
    rounding <= io_rounding @[MultPE.scala 18:26]
    tininess <= io_tininess @[MultPE.scala 21:26]
    in_0 <= io_in_0 @[MultPE.scala 24:22]
    in_1 <= io_in_1 @[MultPE.scala 25:22]
    mulRecFN.io_a <= in_0 @[MultPE.scala 31:17]
    mulRecFN.io_b <= in_1 @[MultPE.scala 32:17]
    mulRecFN.io_roundingMode <= UInt<3>("h4") @[MultPE.scala 29:30]
    mulRecFN.io_detectTininess <= UInt<1>("h1") @[MultPE.scala 30:30]
    mulRecFN_out <= mulRecFN.io_out @[MultPE.scala 33:30]

  module AddRawFN :
    input io_subOp : UInt<1>
    input io_a_isNaN : UInt<1>
    input io_a_isInf : UInt<1>
    input io_a_isZero : UInt<1>
    input io_a_sign : UInt<1>
    input io_a_sExp : SInt<10>
    input io_a_sig : UInt<25>
    input io_b_isNaN : UInt<1>
    input io_b_isInf : UInt<1>
    input io_b_isZero : UInt<1>
    input io_b_sign : UInt<1>
    input io_b_sExp : SInt<10>
    input io_b_sig : UInt<25>
    input io_roundingMode : UInt<3>
    output io_invalidExc : UInt<1>
    output io_rawOut_isNaN : UInt<1>
    output io_rawOut_isInf : UInt<1>
    output io_rawOut_isZero : UInt<1>
    output io_rawOut_sign : UInt<1>
    output io_rawOut_sExp : SInt<10>
    output io_rawOut_sig : UInt<27>

    node effSignB = xor(io_b_sign, io_subOp) @[AddRecFN.scala 60:30]
    node eqSigns = eq(io_a_sign, effSignB) @[AddRecFN.scala 61:29]
    node notEqSigns_signZero = eq(io_roundingMode, UInt<3>("h2")) @[AddRecFN.scala 62:47]
    node _sDiffExps_T = sub(io_a_sExp, io_b_sExp) @[AddRecFN.scala 63:31]
    node _sDiffExps_T_1 = tail(_sDiffExps_T, 1) @[AddRecFN.scala 63:31]
    node sDiffExps = asSInt(_sDiffExps_T_1) @[AddRecFN.scala 63:31]
    node _modNatAlignDist_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 64:41]
    node _modNatAlignDist_T_1 = sub(io_b_sExp, io_a_sExp) @[AddRecFN.scala 64:58]
    node _modNatAlignDist_T_2 = tail(_modNatAlignDist_T_1, 1) @[AddRecFN.scala 64:58]
    node _modNatAlignDist_T_3 = asSInt(_modNatAlignDist_T_2) @[AddRecFN.scala 64:58]
    node _modNatAlignDist_T_4 = mux(_modNatAlignDist_T, _modNatAlignDist_T_3, sDiffExps) @[AddRecFN.scala 64:30]
    node modNatAlignDist = bits(_modNatAlignDist_T_4, 4, 0) @[AddRecFN.scala 64:81]
    node _isMaxAlign_T = shr(sDiffExps, 5) @[AddRecFN.scala 66:19]
    node _isMaxAlign_T_1 = neq(_isMaxAlign_T, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 66:37]
    node _isMaxAlign_T_2 = shr(sDiffExps, 5) @[AddRecFN.scala 67:24]
    node _isMaxAlign_T_3 = neq(_isMaxAlign_T_2, asSInt(UInt<1>("h1"))) @[AddRecFN.scala 67:42]
    node _isMaxAlign_T_4 = bits(sDiffExps, 4, 0) @[AddRecFN.scala 67:63]
    node _isMaxAlign_T_5 = eq(_isMaxAlign_T_4, UInt<1>("h0")) @[AddRecFN.scala 67:87]
    node _isMaxAlign_T_6 = or(_isMaxAlign_T_3, _isMaxAlign_T_5) @[AddRecFN.scala 67:51]
    node isMaxAlign = and(_isMaxAlign_T_1, _isMaxAlign_T_6) @[AddRecFN.scala 66:45]
    node alignDist = mux(isMaxAlign, UInt<5>("h1f"), modNatAlignDist) @[AddRecFN.scala 68:24]
    node _closeSubMags_T = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 69:24]
    node _closeSubMags_T_1 = eq(isMaxAlign, UInt<1>("h0")) @[AddRecFN.scala 69:36]
    node _closeSubMags_T_2 = and(_closeSubMags_T, _closeSubMags_T_1) @[AddRecFN.scala 69:33]
    node _closeSubMags_T_3 = leq(modNatAlignDist, UInt<1>("h1")) @[AddRecFN.scala 69:68]
    node closeSubMags = and(_closeSubMags_T_2, _closeSubMags_T_3) @[AddRecFN.scala 69:48]
    node _close_alignedSigA_T = leq(asSInt(UInt<1>("h0")), sDiffExps) @[AddRecFN.scala 73:18]
    node _close_alignedSigA_T_1 = bits(sDiffExps, 0, 0) @[AddRecFN.scala 73:45]
    node _close_alignedSigA_T_2 = and(_close_alignedSigA_T, _close_alignedSigA_T_1) @[AddRecFN.scala 73:32]
    node _close_alignedSigA_T_3 = shl(io_a_sig, 2) @[AddRecFN.scala 73:58]
    node _close_alignedSigA_T_4 = mux(_close_alignedSigA_T_2, _close_alignedSigA_T_3, UInt<1>("h0")) @[AddRecFN.scala 73:12]
    node _close_alignedSigA_T_5 = leq(asSInt(UInt<1>("h0")), sDiffExps) @[AddRecFN.scala 74:18]
    node _close_alignedSigA_T_6 = bits(sDiffExps, 0, 0) @[AddRecFN.scala 74:45]
    node _close_alignedSigA_T_7 = eq(_close_alignedSigA_T_6, UInt<1>("h0")) @[AddRecFN.scala 74:35]
    node _close_alignedSigA_T_8 = and(_close_alignedSigA_T_5, _close_alignedSigA_T_7) @[AddRecFN.scala 74:32]
    node _close_alignedSigA_T_9 = shl(io_a_sig, 1) @[AddRecFN.scala 74:58]
    node _close_alignedSigA_T_10 = mux(_close_alignedSigA_T_8, _close_alignedSigA_T_9, UInt<1>("h0")) @[AddRecFN.scala 74:12]
    node _close_alignedSigA_T_11 = or(_close_alignedSigA_T_4, _close_alignedSigA_T_10) @[AddRecFN.scala 73:68]
    node _close_alignedSigA_T_12 = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 75:24]
    node _close_alignedSigA_T_13 = mux(_close_alignedSigA_T_12, io_a_sig, UInt<1>("h0")) @[AddRecFN.scala 75:12]
    node close_alignedSigA = or(_close_alignedSigA_T_11, _close_alignedSigA_T_13) @[AddRecFN.scala 74:68]
    node _close_sSigSum_T = asSInt(close_alignedSigA) @[AddRecFN.scala 76:43]
    node _close_sSigSum_T_1 = shl(io_b_sig, 1) @[AddRecFN.scala 76:61]
    node _close_sSigSum_T_2 = asSInt(_close_sSigSum_T_1) @[AddRecFN.scala 76:66]
    node _close_sSigSum_T_3 = sub(_close_sSigSum_T, _close_sSigSum_T_2) @[AddRecFN.scala 76:50]
    node _close_sSigSum_T_4 = tail(_close_sSigSum_T_3, 1) @[AddRecFN.scala 76:50]
    node close_sSigSum = asSInt(_close_sSigSum_T_4) @[AddRecFN.scala 76:50]
    node _close_sigSum_T = lt(close_sSigSum, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 77:42]
    node _close_sigSum_T_1 = sub(asSInt(UInt<1>("h0")), close_sSigSum) @[AddRecFN.scala 77:49]
    node _close_sigSum_T_2 = tail(_close_sigSum_T_1, 1) @[AddRecFN.scala 77:49]
    node _close_sigSum_T_3 = asSInt(_close_sigSum_T_2) @[AddRecFN.scala 77:49]
    node _close_sigSum_T_4 = mux(_close_sigSum_T, _close_sigSum_T_3, close_sSigSum) @[AddRecFN.scala 77:27]
    node close_sigSum = bits(_close_sigSum_T_4, 25, 0) @[AddRecFN.scala 77:79]
    node close_adjustedSigSum = shl(close_sigSum, 0) @[AddRecFN.scala 78:44]
    node _close_reduced2SigSum_reducedVec_0_T = bits(close_adjustedSigSum, 1, 0) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_0_T_1 = orr(_close_reduced2SigSum_reducedVec_0_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_1_T = bits(close_adjustedSigSum, 3, 2) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_1_T_1 = orr(_close_reduced2SigSum_reducedVec_1_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_2_T = bits(close_adjustedSigSum, 5, 4) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_2_T_1 = orr(_close_reduced2SigSum_reducedVec_2_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_3_T = bits(close_adjustedSigSum, 7, 6) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_3_T_1 = orr(_close_reduced2SigSum_reducedVec_3_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_4_T = bits(close_adjustedSigSum, 9, 8) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_4_T_1 = orr(_close_reduced2SigSum_reducedVec_4_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_5_T = bits(close_adjustedSigSum, 11, 10) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_5_T_1 = orr(_close_reduced2SigSum_reducedVec_5_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_6_T = bits(close_adjustedSigSum, 13, 12) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_6_T_1 = orr(_close_reduced2SigSum_reducedVec_6_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_7_T = bits(close_adjustedSigSum, 15, 14) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_7_T_1 = orr(_close_reduced2SigSum_reducedVec_7_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_8_T = bits(close_adjustedSigSum, 17, 16) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_8_T_1 = orr(_close_reduced2SigSum_reducedVec_8_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_9_T = bits(close_adjustedSigSum, 19, 18) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_9_T_1 = orr(_close_reduced2SigSum_reducedVec_9_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_10_T = bits(close_adjustedSigSum, 21, 20) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_10_T_1 = orr(_close_reduced2SigSum_reducedVec_10_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_11_T = bits(close_adjustedSigSum, 23, 22) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_11_T_1 = orr(_close_reduced2SigSum_reducedVec_11_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_12_T = bits(close_adjustedSigSum, 25, 24) @[primitives.scala 107:15]
    node _close_reduced2SigSum_reducedVec_12_T_1 = orr(_close_reduced2SigSum_reducedVec_12_T) @[primitives.scala 107:57]
    node close_reduced2SigSum_reducedVec_2 = _close_reduced2SigSum_reducedVec_2_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_reducedVec_1 = _close_reduced2SigSum_reducedVec_1_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_lo_lo_hi = cat(close_reduced2SigSum_reducedVec_2, close_reduced2SigSum_reducedVec_1) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_0 = _close_reduced2SigSum_reducedVec_0_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_lo_lo = cat(close_reduced2SigSum_lo_lo_hi, close_reduced2SigSum_reducedVec_0) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_5 = _close_reduced2SigSum_reducedVec_5_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_reducedVec_4 = _close_reduced2SigSum_reducedVec_4_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_lo_hi_hi = cat(close_reduced2SigSum_reducedVec_5, close_reduced2SigSum_reducedVec_4) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_3 = _close_reduced2SigSum_reducedVec_3_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_lo_hi = cat(close_reduced2SigSum_lo_hi_hi, close_reduced2SigSum_reducedVec_3) @[primitives.scala 108:20]
    node close_reduced2SigSum_lo = cat(close_reduced2SigSum_lo_hi, close_reduced2SigSum_lo_lo) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_8 = _close_reduced2SigSum_reducedVec_8_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_reducedVec_7 = _close_reduced2SigSum_reducedVec_7_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_hi_lo_hi = cat(close_reduced2SigSum_reducedVec_8, close_reduced2SigSum_reducedVec_7) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_6 = _close_reduced2SigSum_reducedVec_6_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_hi_lo = cat(close_reduced2SigSum_hi_lo_hi, close_reduced2SigSum_reducedVec_6) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_10 = _close_reduced2SigSum_reducedVec_10_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_reducedVec_9 = _close_reduced2SigSum_reducedVec_9_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_hi_hi_lo = cat(close_reduced2SigSum_reducedVec_10, close_reduced2SigSum_reducedVec_9) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_12 = _close_reduced2SigSum_reducedVec_12_T_1 @[primitives.scala 102:30 primitives.scala 106:38]
    node close_reduced2SigSum_reducedVec_11 = _close_reduced2SigSum_reducedVec_11_T_1 @[primitives.scala 102:30 primitives.scala 104:28]
    node close_reduced2SigSum_hi_hi_hi = cat(close_reduced2SigSum_reducedVec_12, close_reduced2SigSum_reducedVec_11) @[primitives.scala 108:20]
    node close_reduced2SigSum_hi_hi = cat(close_reduced2SigSum_hi_hi_hi, close_reduced2SigSum_hi_hi_lo) @[primitives.scala 108:20]
    node close_reduced2SigSum_hi = cat(close_reduced2SigSum_hi_hi, close_reduced2SigSum_hi_lo) @[primitives.scala 108:20]
    node close_reduced2SigSum = cat(close_reduced2SigSum_hi, close_reduced2SigSum_lo) @[primitives.scala 108:20]
    node _close_normDistReduced2_T = bits(close_reduced2SigSum, 0, 0) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_1 = bits(close_reduced2SigSum, 1, 1) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_2 = bits(close_reduced2SigSum, 2, 2) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_3 = bits(close_reduced2SigSum, 3, 3) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_4 = bits(close_reduced2SigSum, 4, 4) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_5 = bits(close_reduced2SigSum, 5, 5) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_6 = bits(close_reduced2SigSum, 6, 6) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_7 = bits(close_reduced2SigSum, 7, 7) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_8 = bits(close_reduced2SigSum, 8, 8) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_9 = bits(close_reduced2SigSum, 9, 9) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_10 = bits(close_reduced2SigSum, 10, 10) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_11 = bits(close_reduced2SigSum, 11, 11) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_12 = bits(close_reduced2SigSum, 12, 12) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_13 = mux(_close_normDistReduced2_T_1, UInt<4>("hb"), UInt<4>("hc")) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_14 = mux(_close_normDistReduced2_T_2, UInt<4>("ha"), _close_normDistReduced2_T_13) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_15 = mux(_close_normDistReduced2_T_3, UInt<4>("h9"), _close_normDistReduced2_T_14) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_16 = mux(_close_normDistReduced2_T_4, UInt<4>("h8"), _close_normDistReduced2_T_15) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_17 = mux(_close_normDistReduced2_T_5, UInt<3>("h7"), _close_normDistReduced2_T_16) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_18 = mux(_close_normDistReduced2_T_6, UInt<3>("h6"), _close_normDistReduced2_T_17) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_19 = mux(_close_normDistReduced2_T_7, UInt<3>("h5"), _close_normDistReduced2_T_18) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_20 = mux(_close_normDistReduced2_T_8, UInt<3>("h4"), _close_normDistReduced2_T_19) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_21 = mux(_close_normDistReduced2_T_9, UInt<2>("h3"), _close_normDistReduced2_T_20) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_22 = mux(_close_normDistReduced2_T_10, UInt<2>("h2"), _close_normDistReduced2_T_21) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_23 = mux(_close_normDistReduced2_T_11, UInt<1>("h1"), _close_normDistReduced2_T_22) @[Mux.scala 47:69]
    node close_normDistReduced2 = mux(_close_normDistReduced2_T_12, UInt<1>("h0"), _close_normDistReduced2_T_23) @[Mux.scala 47:69]
    node _close_nearNormDist_T = shl(close_normDistReduced2, 1) @[AddRecFN.scala 81:53]
    node close_nearNormDist = bits(_close_nearNormDist_T, 4, 0) @[AddRecFN.scala 81:57]
    node _close_sigOut_T = dshl(close_sigSum, close_nearNormDist) @[AddRecFN.scala 82:38]
    node _close_sigOut_T_1 = shl(_close_sigOut_T, 1) @[AddRecFN.scala 82:59]
    node close_sigOut = bits(_close_sigOut_T_1, 26, 0) @[AddRecFN.scala 82:63]
    node _close_totalCancellation_T = bits(close_sigOut, 26, 25) @[AddRecFN.scala 83:49]
    node _close_totalCancellation_T_1 = orr(_close_totalCancellation_T) @[AddRecFN.scala 83:82]
    node close_totalCancellation = eq(_close_totalCancellation_T_1, UInt<1>("h0")) @[AddRecFN.scala 83:35]
    node _close_notTotalCancellation_signOut_T = lt(close_sSigSum, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 84:73]
    node close_notTotalCancellation_signOut = xor(io_a_sign, _close_notTotalCancellation_signOut_T) @[AddRecFN.scala 84:56]
    node _far_signOut_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 87:37]
    node far_signOut = mux(_far_signOut_T, effSignB, io_a_sign) @[AddRecFN.scala 87:26]
    node _far_sigLarger_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 88:40]
    node _far_sigLarger_T_1 = mux(_far_sigLarger_T, io_b_sig, io_a_sig) @[AddRecFN.scala 88:29]
    node far_sigLarger = bits(_far_sigLarger_T_1, 23, 0) @[AddRecFN.scala 88:66]
    node _far_sigSmaller_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 89:40]
    node _far_sigSmaller_T_1 = mux(_far_sigSmaller_T, io_a_sig, io_b_sig) @[AddRecFN.scala 89:29]
    node far_sigSmaller = bits(_far_sigSmaller_T_1, 23, 0) @[AddRecFN.scala 89:66]
    node _far_mainAlignedSigSmaller_T = shl(far_sigSmaller, 5) @[AddRecFN.scala 90:52]
    node far_mainAlignedSigSmaller = dshr(_far_mainAlignedSigSmaller_T, alignDist) @[AddRecFN.scala 90:56]
    node _far_reduced4SigSmaller_T = shl(far_sigSmaller, 2) @[AddRecFN.scala 91:60]
    node _far_reduced4SigSmaller_reducedVec_0_T = bits(_far_reduced4SigSmaller_T, 3, 0) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_0_T_1 = orr(_far_reduced4SigSmaller_reducedVec_0_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_1_T = bits(_far_reduced4SigSmaller_T, 7, 4) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_1_T_1 = orr(_far_reduced4SigSmaller_reducedVec_1_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_2_T = bits(_far_reduced4SigSmaller_T, 11, 8) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_2_T_1 = orr(_far_reduced4SigSmaller_reducedVec_2_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_3_T = bits(_far_reduced4SigSmaller_T, 15, 12) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_3_T_1 = orr(_far_reduced4SigSmaller_reducedVec_3_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_4_T = bits(_far_reduced4SigSmaller_T, 19, 16) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_4_T_1 = orr(_far_reduced4SigSmaller_reducedVec_4_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_5_T = bits(_far_reduced4SigSmaller_T, 23, 20) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_5_T_1 = orr(_far_reduced4SigSmaller_reducedVec_5_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_6_T = bits(_far_reduced4SigSmaller_T, 25, 24) @[primitives.scala 124:15]
    node _far_reduced4SigSmaller_reducedVec_6_T_1 = orr(_far_reduced4SigSmaller_reducedVec_6_T) @[primitives.scala 124:57]
    node far_reduced4SigSmaller_reducedVec_2 = _far_reduced4SigSmaller_reducedVec_2_T_1 @[primitives.scala 119:30 primitives.scala 121:28]
    node far_reduced4SigSmaller_reducedVec_1 = _far_reduced4SigSmaller_reducedVec_1_T_1 @[primitives.scala 119:30 primitives.scala 121:28]
    node far_reduced4SigSmaller_lo_hi = cat(far_reduced4SigSmaller_reducedVec_2, far_reduced4SigSmaller_reducedVec_1) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_reducedVec_0 = _far_reduced4SigSmaller_reducedVec_0_T_1 @[primitives.scala 119:30 primitives.scala 121:28]
    node far_reduced4SigSmaller_lo = cat(far_reduced4SigSmaller_lo_hi, far_reduced4SigSmaller_reducedVec_0) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_reducedVec_4 = _far_reduced4SigSmaller_reducedVec_4_T_1 @[primitives.scala 119:30 primitives.scala 121:28]
    node far_reduced4SigSmaller_reducedVec_3 = _far_reduced4SigSmaller_reducedVec_3_T_1 @[primitives.scala 119:30 primitives.scala 121:28]
    node far_reduced4SigSmaller_hi_lo = cat(far_reduced4SigSmaller_reducedVec_4, far_reduced4SigSmaller_reducedVec_3) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_reducedVec_6 = _far_reduced4SigSmaller_reducedVec_6_T_1 @[primitives.scala 119:30 primitives.scala 123:38]
    node far_reduced4SigSmaller_reducedVec_5 = _far_reduced4SigSmaller_reducedVec_5_T_1 @[primitives.scala 119:30 primitives.scala 121:28]
    node far_reduced4SigSmaller_hi_hi = cat(far_reduced4SigSmaller_reducedVec_6, far_reduced4SigSmaller_reducedVec_5) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_hi = cat(far_reduced4SigSmaller_hi_hi, far_reduced4SigSmaller_hi_lo) @[primitives.scala 125:20]
    node far_reduced4SigSmaller = cat(far_reduced4SigSmaller_hi, far_reduced4SigSmaller_lo) @[primitives.scala 125:20]
    node _far_roundExtraMask_T = bits(alignDist, 4, 2) @[AddRecFN.scala 92:47]
    node far_roundExtraMask_shift = dshr(asSInt(UInt<9>("h100")), _far_roundExtraMask_T) @[primitives.scala 77:58]
    node _far_roundExtraMask_T_1 = bits(far_roundExtraMask_shift, 7, 1) @[primitives.scala 79:22]
    node _far_roundExtraMask_T_2 = bits(_far_roundExtraMask_T_1, 3, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_3 = bits(_far_roundExtraMask_T_2, 1, 0) @[Bitwise.scala 109:18]
    node far_roundExtraMask_hi = bits(_far_roundExtraMask_T_3, 0, 0) @[Bitwise.scala 109:18]
    node far_roundExtraMask_lo = bits(_far_roundExtraMask_T_3, 1, 1) @[Bitwise.scala 109:44]
    node far_roundExtraMask_hi_1 = cat(far_roundExtraMask_hi, far_roundExtraMask_lo) @[Cat.scala 30:58]
    node _far_roundExtraMask_T_4 = bits(_far_roundExtraMask_T_2, 3, 2) @[Bitwise.scala 109:44]
    node far_roundExtraMask_hi_2 = bits(_far_roundExtraMask_T_4, 0, 0) @[Bitwise.scala 109:18]
    node far_roundExtraMask_lo_1 = bits(_far_roundExtraMask_T_4, 1, 1) @[Bitwise.scala 109:44]
    node far_roundExtraMask_lo_2 = cat(far_roundExtraMask_hi_2, far_roundExtraMask_lo_1) @[Cat.scala 30:58]
    node far_roundExtraMask_hi_3 = cat(far_roundExtraMask_hi_1, far_roundExtraMask_lo_2) @[Cat.scala 30:58]
    node _far_roundExtraMask_T_5 = bits(_far_roundExtraMask_T_1, 6, 4) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_6 = bits(_far_roundExtraMask_T_5, 1, 0) @[Bitwise.scala 109:18]
    node far_roundExtraMask_hi_4 = bits(_far_roundExtraMask_T_6, 0, 0) @[Bitwise.scala 109:18]
    node far_roundExtraMask_lo_3 = bits(_far_roundExtraMask_T_6, 1, 1) @[Bitwise.scala 109:44]
    node far_roundExtraMask_hi_5 = cat(far_roundExtraMask_hi_4, far_roundExtraMask_lo_3) @[Cat.scala 30:58]
    node far_roundExtraMask_lo_4 = bits(_far_roundExtraMask_T_5, 2, 2) @[Bitwise.scala 109:44]
    node far_roundExtraMask_lo_5 = cat(far_roundExtraMask_hi_5, far_roundExtraMask_lo_4) @[Cat.scala 30:58]
    node far_roundExtraMask = cat(far_roundExtraMask_hi_3, far_roundExtraMask_lo_5) @[Cat.scala 30:58]
    node far_alignedSigSmaller_hi = shr(far_mainAlignedSigSmaller, 3) @[AddRecFN.scala 94:38]
    node _far_alignedSigSmaller_T = bits(far_mainAlignedSigSmaller, 2, 0) @[AddRecFN.scala 95:38]
    node _far_alignedSigSmaller_T_1 = orr(_far_alignedSigSmaller_T) @[AddRecFN.scala 95:45]
    node _far_alignedSigSmaller_T_2 = and(far_reduced4SigSmaller, far_roundExtraMask) @[AddRecFN.scala 95:76]
    node _far_alignedSigSmaller_T_3 = orr(_far_alignedSigSmaller_T_2) @[AddRecFN.scala 95:98]
    node far_alignedSigSmaller_lo = or(_far_alignedSigSmaller_T_1, _far_alignedSigSmaller_T_3) @[AddRecFN.scala 95:49]
    node far_alignedSigSmaller = cat(far_alignedSigSmaller_hi, far_alignedSigSmaller_lo) @[Cat.scala 30:58]
    node far_subMags = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 96:23]
    node far_negAlignedSigSmaller_lo = not(far_alignedSigSmaller) @[AddRecFN.scala 97:62]
    node _far_negAlignedSigSmaller_T = cat(UInt<1>("h1"), far_negAlignedSigSmaller_lo) @[Cat.scala 30:58]
    node far_negAlignedSigSmaller = mux(far_subMags, _far_negAlignedSigSmaller_T, far_alignedSigSmaller) @[AddRecFN.scala 97:39]
    node _far_sigSum_T = shl(far_sigLarger, 3) @[AddRecFN.scala 98:36]
    node _far_sigSum_T_1 = add(_far_sigSum_T, far_negAlignedSigSmaller) @[AddRecFN.scala 98:41]
    node _far_sigSum_T_2 = tail(_far_sigSum_T_1, 1) @[AddRecFN.scala 98:41]
    node _far_sigSum_T_3 = add(_far_sigSum_T_2, far_subMags) @[AddRecFN.scala 98:68]
    node far_sigSum = tail(_far_sigSum_T_3, 1) @[AddRecFN.scala 98:68]
    node _far_sigOut_T = shr(far_sigSum, 1) @[AddRecFN.scala 99:62]
    node _far_sigOut_T_1 = bits(far_sigSum, 0, 0) @[AddRecFN.scala 99:79]
    node _far_sigOut_T_2 = or(_far_sigOut_T, _far_sigOut_T_1) @[AddRecFN.scala 99:67]
    node _far_sigOut_T_3 = mux(far_subMags, far_sigSum, _far_sigOut_T_2) @[AddRecFN.scala 99:25]
    node far_sigOut = bits(_far_sigOut_T_3, 26, 0) @[AddRecFN.scala 99:83]
    node _notSigNaN_invalidExc_T = and(io_a_isInf, io_b_isInf) @[AddRecFN.scala 102:43]
    node _notSigNaN_invalidExc_T_1 = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 102:60]
    node notSigNaN_invalidExc = and(_notSigNaN_invalidExc_T, _notSigNaN_invalidExc_T_1) @[AddRecFN.scala 102:57]
    node notNaN_isInfOut = or(io_a_isInf, io_b_isInf) @[AddRecFN.scala 103:38]
    node addZeros = and(io_a_isZero, io_b_isZero) @[AddRecFN.scala 104:32]
    node notNaN_specialCase = or(notNaN_isInfOut, addZeros) @[AddRecFN.scala 105:46]
    node _notNaN_isZeroOut_T = eq(notNaN_isInfOut, UInt<1>("h0")) @[AddRecFN.scala 106:41]
    node _notNaN_isZeroOut_T_1 = and(_notNaN_isZeroOut_T, closeSubMags) @[AddRecFN.scala 106:58]
    node _notNaN_isZeroOut_T_2 = and(_notNaN_isZeroOut_T_1, close_totalCancellation) @[AddRecFN.scala 106:74]
    node notNaN_isZeroOut = or(addZeros, _notNaN_isZeroOut_T_2) @[AddRecFN.scala 106:37]
    node _notNaN_signOut_T = and(eqSigns, io_a_sign) @[AddRecFN.scala 108:39]
    node _notNaN_signOut_T_1 = and(io_a_isInf, io_a_sign) @[AddRecFN.scala 109:39]
    node _notNaN_signOut_T_2 = or(_notNaN_signOut_T, _notNaN_signOut_T_1) @[AddRecFN.scala 108:63]
    node _notNaN_signOut_T_3 = and(io_b_isInf, effSignB) @[AddRecFN.scala 110:39]
    node _notNaN_signOut_T_4 = or(_notNaN_signOut_T_2, _notNaN_signOut_T_3) @[AddRecFN.scala 109:63]
    node _notNaN_signOut_T_5 = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 111:30]
    node _notNaN_signOut_T_6 = and(notNaN_isZeroOut, _notNaN_signOut_T_5) @[AddRecFN.scala 111:27]
    node _notNaN_signOut_T_7 = and(_notNaN_signOut_T_6, notEqSigns_signZero) @[AddRecFN.scala 111:39]
    node _notNaN_signOut_T_8 = or(_notNaN_signOut_T_4, _notNaN_signOut_T_7) @[AddRecFN.scala 110:63]
    node _notNaN_signOut_T_9 = eq(notNaN_specialCase, UInt<1>("h0")) @[AddRecFN.scala 112:10]
    node _notNaN_signOut_T_10 = and(_notNaN_signOut_T_9, closeSubMags) @[AddRecFN.scala 112:30]
    node _notNaN_signOut_T_11 = eq(close_totalCancellation, UInt<1>("h0")) @[AddRecFN.scala 112:49]
    node _notNaN_signOut_T_12 = and(_notNaN_signOut_T_10, _notNaN_signOut_T_11) @[AddRecFN.scala 112:46]
    node _notNaN_signOut_T_13 = and(_notNaN_signOut_T_12, close_notTotalCancellation_signOut) @[AddRecFN.scala 113:38]
    node _notNaN_signOut_T_14 = or(_notNaN_signOut_T_8, _notNaN_signOut_T_13) @[AddRecFN.scala 111:63]
    node _notNaN_signOut_T_15 = eq(notNaN_specialCase, UInt<1>("h0")) @[AddRecFN.scala 114:10]
    node _notNaN_signOut_T_16 = eq(closeSubMags, UInt<1>("h0")) @[AddRecFN.scala 114:33]
    node _notNaN_signOut_T_17 = and(_notNaN_signOut_T_15, _notNaN_signOut_T_16) @[AddRecFN.scala 114:30]
    node _notNaN_signOut_T_18 = and(_notNaN_signOut_T_17, far_signOut) @[AddRecFN.scala 114:47]
    node notNaN_signOut = or(_notNaN_signOut_T_14, _notNaN_signOut_T_18) @[AddRecFN.scala 113:77]
    node _common_sExpOut_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 116:41]
    node _common_sExpOut_T_1 = or(closeSubMags, _common_sExpOut_T) @[AddRecFN.scala 116:27]
    node _common_sExpOut_T_2 = mux(_common_sExpOut_T_1, io_b_sExp, io_a_sExp) @[AddRecFN.scala 116:13]
    node _common_sExpOut_T_3 = mux(closeSubMags, close_nearNormDist, far_subMags) @[AddRecFN.scala 117:18]
    node _common_sExpOut_T_4 = cvt(_common_sExpOut_T_3) @[AddRecFN.scala 117:66]
    node _common_sExpOut_T_5 = sub(_common_sExpOut_T_2, _common_sExpOut_T_4) @[AddRecFN.scala 117:13]
    node _common_sExpOut_T_6 = tail(_common_sExpOut_T_5, 1) @[AddRecFN.scala 117:13]
    node common_sExpOut = asSInt(_common_sExpOut_T_6) @[AddRecFN.scala 117:13]
    node common_sigOut = mux(closeSubMags, close_sigOut, far_sigOut) @[AddRecFN.scala 118:28]
    node _io_invalidExc_T = bits(io_a_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_1 = eq(_io_invalidExc_T, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_2 = and(io_a_isNaN, _io_invalidExc_T_1) @[common.scala 84:46]
    node _io_invalidExc_T_3 = bits(io_b_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_4 = eq(_io_invalidExc_T_3, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_5 = and(io_b_isNaN, _io_invalidExc_T_4) @[common.scala 84:46]
    node _io_invalidExc_T_6 = or(_io_invalidExc_T_2, _io_invalidExc_T_5) @[AddRecFN.scala 121:45]
    node _io_invalidExc_T_7 = or(_io_invalidExc_T_6, notSigNaN_invalidExc) @[AddRecFN.scala 121:71]
    node _io_rawOut_isNaN_T = or(io_a_isNaN, io_b_isNaN) @[AddRecFN.scala 125:35]
    io_invalidExc <= _io_invalidExc_T_7 @[AddRecFN.scala 121:19]
    io_rawOut_isNaN <= _io_rawOut_isNaN_T @[AddRecFN.scala 125:21]
    io_rawOut_isInf <= notNaN_isInfOut @[AddRecFN.scala 122:21]
    io_rawOut_isZero <= notNaN_isZeroOut @[AddRecFN.scala 123:22]
    io_rawOut_sign <= notNaN_signOut @[AddRecFN.scala 126:20]
    io_rawOut_sExp <= common_sExpOut @[AddRecFN.scala 124:20]
    io_rawOut_sig <= common_sigOut @[AddRecFN.scala 127:19]

  module AddRecFN :
    input io_subOp : UInt<1>
    input io_a : UInt<33>
    input io_b : UInt<33>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    inst addRawFN_ of AddRawFN @[AddRecFN.scala 147:26]
    inst roundRawFNToRecFN of RoundRawFNToRecFN @[AddRecFN.scala 157:15]
    node addRawFN_io_a_exp = bits(io_a, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _addRawFN_io_a_isZero_T = bits(addRawFN_io_a_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node addRawFN_io_a_isZero = eq(_addRawFN_io_a_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _addRawFN_io_a_isSpecial_T = bits(addRawFN_io_a_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node addRawFN_io_a_isSpecial = eq(_addRawFN_io_a_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _addRawFN_io_a_out_isNaN_T = bits(addRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _addRawFN_io_a_out_isNaN_T_1 = and(addRawFN_io_a_isSpecial, _addRawFN_io_a_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _addRawFN_io_a_out_isInf_T = bits(addRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _addRawFN_io_a_out_isInf_T_1 = eq(_addRawFN_io_a_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _addRawFN_io_a_out_isInf_T_2 = and(addRawFN_io_a_isSpecial, _addRawFN_io_a_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _addRawFN_io_a_out_sign_T = bits(io_a, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _addRawFN_io_a_out_sExp_T = cvt(addRawFN_io_a_exp) @[rawFloatFromRecFN.scala 59:27]
    node addRawFN_io_a_out_sig_hi_lo = eq(addRawFN_io_a_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node addRawFN_io_a_out_sig_lo = bits(io_a, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node addRawFN_io_a_out_sig_hi = cat(UInt<1>("h0"), addRawFN_io_a_out_sig_hi_lo) @[Cat.scala 30:58]
    node _addRawFN_io_a_out_sig_T = cat(addRawFN_io_a_out_sig_hi, addRawFN_io_a_out_sig_lo) @[Cat.scala 30:58]
    node addRawFN_io_b_exp = bits(io_b, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _addRawFN_io_b_isZero_T = bits(addRawFN_io_b_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node addRawFN_io_b_isZero = eq(_addRawFN_io_b_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _addRawFN_io_b_isSpecial_T = bits(addRawFN_io_b_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node addRawFN_io_b_isSpecial = eq(_addRawFN_io_b_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _addRawFN_io_b_out_isNaN_T = bits(addRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _addRawFN_io_b_out_isNaN_T_1 = and(addRawFN_io_b_isSpecial, _addRawFN_io_b_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _addRawFN_io_b_out_isInf_T = bits(addRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _addRawFN_io_b_out_isInf_T_1 = eq(_addRawFN_io_b_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _addRawFN_io_b_out_isInf_T_2 = and(addRawFN_io_b_isSpecial, _addRawFN_io_b_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _addRawFN_io_b_out_sign_T = bits(io_b, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _addRawFN_io_b_out_sExp_T = cvt(addRawFN_io_b_exp) @[rawFloatFromRecFN.scala 59:27]
    node addRawFN_io_b_out_sig_hi_lo = eq(addRawFN_io_b_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node addRawFN_io_b_out_sig_lo = bits(io_b, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node addRawFN_io_b_out_sig_hi = cat(UInt<1>("h0"), addRawFN_io_b_out_sig_hi_lo) @[Cat.scala 30:58]
    node _addRawFN_io_b_out_sig_T = cat(addRawFN_io_b_out_sig_hi, addRawFN_io_b_out_sig_lo) @[Cat.scala 30:58]
    node addRawFN_io_a_out_isNaN = _addRawFN_io_a_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 55:20]
    node addRawFN_io_a_out_isInf = _addRawFN_io_a_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 56:20]
    node addRawFN_io_a_out_isZero = addRawFN_io_a_isZero @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 57:20]
    node addRawFN_io_a_out_sign = _addRawFN_io_a_out_sign_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 58:20]
    node addRawFN_io_a_out_sExp = _addRawFN_io_a_out_sExp_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 59:20]
    node addRawFN_io_a_out_sig = _addRawFN_io_a_out_sig_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 60:20]
    node addRawFN_io_b_out_isNaN = _addRawFN_io_b_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 55:20]
    node addRawFN_io_b_out_isInf = _addRawFN_io_b_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 56:20]
    node addRawFN_io_b_out_isZero = addRawFN_io_b_isZero @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 57:20]
    node addRawFN_io_b_out_sign = _addRawFN_io_b_out_sign_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 58:20]
    node addRawFN_io_b_out_sExp = _addRawFN_io_b_out_sExp_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 59:20]
    node addRawFN_io_b_out_sig = _addRawFN_io_b_out_sig_T @[rawFloatFromRecFN.scala 54:23 rawFloatFromRecFN.scala 60:20]
    io_out <= roundRawFNToRecFN.io_out @[AddRecFN.scala 163:23]
    io_exceptionFlags <= roundRawFNToRecFN.io_exceptionFlags @[AddRecFN.scala 164:23]
    addRawFN_.io_subOp <= io_subOp @[AddRecFN.scala 149:30]
    addRawFN_.io_a_isNaN <= addRawFN_io_a_out_isNaN @[AddRecFN.scala 150:30]
    addRawFN_.io_a_isInf <= addRawFN_io_a_out_isInf @[AddRecFN.scala 150:30]
    addRawFN_.io_a_isZero <= addRawFN_io_a_out_isZero @[AddRecFN.scala 150:30]
    addRawFN_.io_a_sign <= addRawFN_io_a_out_sign @[AddRecFN.scala 150:30]
    addRawFN_.io_a_sExp <= addRawFN_io_a_out_sExp @[AddRecFN.scala 150:30]
    addRawFN_.io_a_sig <= addRawFN_io_a_out_sig @[AddRecFN.scala 150:30]
    addRawFN_.io_b_isNaN <= addRawFN_io_b_out_isNaN @[AddRecFN.scala 151:30]
    addRawFN_.io_b_isInf <= addRawFN_io_b_out_isInf @[AddRecFN.scala 151:30]
    addRawFN_.io_b_isZero <= addRawFN_io_b_out_isZero @[AddRecFN.scala 151:30]
    addRawFN_.io_b_sign <= addRawFN_io_b_out_sign @[AddRecFN.scala 151:30]
    addRawFN_.io_b_sExp <= addRawFN_io_b_out_sExp @[AddRecFN.scala 151:30]
    addRawFN_.io_b_sig <= addRawFN_io_b_out_sig @[AddRecFN.scala 151:30]
    addRawFN_.io_roundingMode <= io_roundingMode @[AddRecFN.scala 152:30]
    roundRawFNToRecFN.io_invalidExc <= addRawFN_.io_invalidExc @[AddRecFN.scala 158:39]
    roundRawFNToRecFN.io_infiniteExc <= UInt<1>("h0") @[AddRecFN.scala 159:39]
    roundRawFNToRecFN.io_in_isNaN <= addRawFN_.io_rawOut_isNaN @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_isInf <= addRawFN_.io_rawOut_isInf @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_isZero <= addRawFN_.io_rawOut_isZero @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_sign <= addRawFN_.io_rawOut_sign @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_sExp <= addRawFN_.io_rawOut_sExp @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_sig <= addRawFN_.io_rawOut_sig @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_roundingMode <= io_roundingMode @[AddRecFN.scala 161:39]
    roundRawFNToRecFN.io_detectTininess <= io_detectTininess @[AddRecFN.scala 162:41]

  module AddSubPE :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    input io_op : UInt<1>
    input io_rounding : UInt<3>
    input io_tininess : UInt<1>
    output io_out : UInt<33>

    inst addRecFN of AddRecFN @[AddSubPE.scala 34:24]
    reg op : UInt<1>, clock with :
      reset => (UInt<1>("h0"), op) @[AddSubPE.scala 21:19]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[AddSubPE.scala 24:26]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[AddSubPE.scala 27:26]
    reg in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_0) @[AddSubPE.scala 30:22]
    reg in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_1) @[AddSubPE.scala 31:22]
    reg addRecFN_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), addRecFN_out) @[AddSubPE.scala 40:30]
    io_out <= addRecFN_out @[AddSubPE.scala 42:10]
    op <= io_op @[AddSubPE.scala 21:19]
    rounding <= io_rounding @[AddSubPE.scala 24:26]
    tininess <= io_tininess @[AddSubPE.scala 27:26]
    in_0 <= io_in_0 @[AddSubPE.scala 30:22]
    in_1 <= io_in_1 @[AddSubPE.scala 31:22]
    addRecFN.io_subOp <= op @[AddSubPE.scala 35:21]
    addRecFN.io_a <= in_0 @[AddSubPE.scala 36:17]
    addRecFN.io_b <= in_1 @[AddSubPE.scala 37:17]
    addRecFN.io_roundingMode <= rounding @[AddSubPE.scala 38:30]
    addRecFN.io_detectTininess <= tininess @[AddSubPE.scala 39:30]
    addRecFN_out <= addRecFN.io_out @[AddSubPE.scala 40:30]

  module PE :
    input clock : Clock
    input reset : UInt<1>
    input io_Xi_0 : UInt<32>
    input io_Yi_0 : UInt<32>
    input io_Xi_1 : UInt<32>
    input io_Yi_1 : UInt<32>
    input io_aggr_0 : UInt<32>
    input io_aggr_1 : UInt<32>
    input io_aggr_2 : UInt<32>
    input io_aggr_3 : UInt<32>
    input io_m_0_sel : UInt<2>
    input io_m_1_sel : UInt<2>
    input io_m_2_sel : UInt<2>
    input io_m_3_sel : UInt<2>
    input io_m_4_sel : UInt<2>
    input io_m_5_sel : UInt<2>
    input io_m_6_sel : UInt<2>
    input io_m_7_sel : UInt<2>
    input io_m_8_sel : UInt<2>
    input io_m_9_sel : UInt<2>
    input io_addsub_0_op : UInt<1>
    input io_addsub_1_op : UInt<1>
    input io_rounding : UInt<3>
    input io_tininess : UInt<1>
    output io_out_0 : UInt<32>
    output io_out_1 : UInt<32>

    inst m_0 of MuxPE @[PE.scala 106:19]
    inst m_1 of MuxPE @[PE.scala 114:19]
    inst m_2 of MuxPE @[PE.scala 122:19]
    inst m_3 of MuxPE @[PE.scala 130:19]
    inst multModule_0 of MultPE @[PE.scala 141:28]
    inst multModule_1 of MultPE @[PE.scala 148:28]
    inst m_4 of MuxPE @[PE.scala 158:19]
    inst m_5 of MuxPE @[PE.scala 166:19]
    inst m_6 of MuxPE @[PE.scala 174:19]
    inst m_7 of MuxPE @[PE.scala 182:19]
    inst addsubModule_0 of AddSubPE @[PE.scala 193:30]
    inst addsubModule_1 of AddSubPE @[PE.scala 201:30]
    inst m_8 of MuxPE @[PE.scala 212:19]
    inst m_9 of MuxPE @[PE.scala 220:19]
    reg Xi_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_0) @[PE.scala 47:22]
    reg Yi_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_0) @[PE.scala 48:22]
    reg Xi_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_1) @[PE.scala 50:22]
    reg Yi_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_1) @[PE.scala 51:22]
    reg aggr_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_0) @[PE.scala 56:24]
    reg aggr_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_1) @[PE.scala 57:24]
    reg aggr_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_2) @[PE.scala 59:24]
    reg aggr_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_3) @[PE.scala 60:24]
    reg m_0_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_0_sel) @[PE.scala 65:25]
    reg m_1_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_1_sel) @[PE.scala 66:25]
    reg m_2_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_2_sel) @[PE.scala 67:25]
    reg m_3_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_3_sel) @[PE.scala 68:25]
    reg m_4_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_4_sel) @[PE.scala 69:25]
    reg m_5_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_5_sel) @[PE.scala 70:25]
    reg m_6_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_6_sel) @[PE.scala 71:25]
    reg m_7_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_7_sel) @[PE.scala 72:25]
    reg m_8_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_8_sel) @[PE.scala 73:25]
    reg m_9_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_9_sel) @[PE.scala 74:25]
    reg addsub_0_op : UInt<1>, clock with :
      reset => (UInt<1>("h0"), addsub_0_op) @[PE.scala 76:29]
    reg addsub_1_op : UInt<1>, clock with :
      reset => (UInt<1>("h0"), addsub_1_op) @[PE.scala 77:29]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[PE.scala 80:29]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[PE.scala 82:29]
    reg addsubModule_0_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), addsubModule_0_out) @[PE.scala 87:36]
    reg addsubModule_1_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), addsubModule_1_out) @[PE.scala 88:36]
    reg multModule_0_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), multModule_0_out) @[PE.scala 89:36]
    reg multModule_1_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), multModule_1_out) @[PE.scala 90:36]
    reg m_0_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_0_out) @[PE.scala 92:24]
    reg m_1_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_1_out) @[PE.scala 93:24]
    reg m_2_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_2_out) @[PE.scala 94:24]
    reg m_3_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_3_out) @[PE.scala 95:24]
    reg m_4_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_4_out) @[PE.scala 96:24]
    reg m_5_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_5_out) @[PE.scala 97:24]
    reg m_6_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_6_out) @[PE.scala 98:24]
    reg m_7_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_7_out) @[PE.scala 99:24]
    reg m_8_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_8_out) @[PE.scala 100:24]
    reg m_9_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_9_out) @[PE.scala 101:24]
    io_out_0 <= m_8_out @[PE.scala 231:12]
    io_out_1 <= m_9_out @[PE.scala 232:12]
    Xi_0 <= io_Xi_0 @[PE.scala 47:22]
    Yi_0 <= io_Yi_0 @[PE.scala 48:22]
    Xi_1 <= io_Xi_1 @[PE.scala 50:22]
    Yi_1 <= io_Yi_1 @[PE.scala 51:22]
    aggr_0 <= io_aggr_0 @[PE.scala 56:24]
    aggr_1 <= io_aggr_0 @[PE.scala 57:24]
    aggr_2 <= io_aggr_0 @[PE.scala 59:24]
    aggr_3 <= io_aggr_0 @[PE.scala 60:24]
    m_0_sel <= io_m_0_sel @[PE.scala 65:25]
    m_1_sel <= io_m_1_sel @[PE.scala 66:25]
    m_2_sel <= io_m_2_sel @[PE.scala 67:25]
    m_3_sel <= io_m_3_sel @[PE.scala 68:25]
    m_4_sel <= io_m_4_sel @[PE.scala 69:25]
    m_5_sel <= io_m_5_sel @[PE.scala 70:25]
    m_6_sel <= io_m_6_sel @[PE.scala 71:25]
    m_7_sel <= io_m_7_sel @[PE.scala 72:25]
    m_8_sel <= io_m_8_sel @[PE.scala 73:25]
    m_9_sel <= io_m_9_sel @[PE.scala 74:25]
    addsub_0_op <= io_addsub_0_op @[PE.scala 76:29]
    addsub_1_op <= io_addsub_1_op @[PE.scala 77:29]
    rounding <= io_rounding @[PE.scala 80:29]
    tininess <= io_tininess @[PE.scala 82:29]
    addsubModule_0_out <= mux(reset, UInt<32>("h0"), bits(addsubModule_0.io_out, 31, 0)) @[PE.scala 87:36 PE.scala 87:36 PE.scala 199:23]
    addsubModule_1_out <= mux(reset, UInt<32>("h0"), bits(addsubModule_1.io_out, 31, 0)) @[PE.scala 88:36 PE.scala 88:36 PE.scala 207:23]
    multModule_0_out <= mux(reset, UInt<32>("h0"), bits(multModule_0.io_out, 31, 0)) @[PE.scala 89:36 PE.scala 89:36 PE.scala 146:21]
    multModule_1_out <= mux(reset, UInt<32>("h0"), bits(multModule_1.io_out, 31, 0)) @[PE.scala 90:36 PE.scala 90:36 PE.scala 153:21]
    m_0_out <= mux(reset, UInt<32>("h0"), m_0.io_out) @[PE.scala 92:24 PE.scala 92:24 PE.scala 112:11]
    m_1_out <= mux(reset, UInt<32>("h0"), m_1.io_out) @[PE.scala 93:24 PE.scala 93:24 PE.scala 120:11]
    m_2_out <= mux(reset, UInt<32>("h0"), m_2.io_out) @[PE.scala 94:24 PE.scala 94:24 PE.scala 128:11]
    m_3_out <= mux(reset, UInt<32>("h0"), m_3.io_out) @[PE.scala 95:24 PE.scala 95:24 PE.scala 136:11]
    m_4_out <= mux(reset, UInt<32>("h0"), m_4.io_out) @[PE.scala 96:24 PE.scala 96:24 PE.scala 164:15]
    m_5_out <= mux(reset, UInt<32>("h0"), m_5.io_out) @[PE.scala 97:24 PE.scala 97:24 PE.scala 172:15]
    m_6_out <= mux(reset, UInt<32>("h0"), m_6.io_out) @[PE.scala 98:24 PE.scala 98:24 PE.scala 180:15]
    m_7_out <= mux(reset, UInt<32>("h0"), m_7.io_out) @[PE.scala 99:24 PE.scala 99:24 PE.scala 188:15]
    m_8_out <= mux(reset, UInt<32>("h0"), m_8.io_out) @[PE.scala 100:24 PE.scala 100:24 PE.scala 218:15]
    m_9_out <= mux(reset, UInt<32>("h0"), m_9.io_out) @[PE.scala 101:24 PE.scala 101:24 PE.scala 226:15]
    m_0.clock <= clock
    m_0.reset <= reset
    m_0.io_in_0 <= Xi_0 @[PE.scala 108:15]
    m_0.io_in_1 <= addsubModule_0_out @[PE.scala 109:15]
    m_0.io_in_2 is invalid
    m_0.io_in_3 is invalid
    m_0.io_sel <= m_0_sel @[PE.scala 107:14]
    m_1.clock <= clock
    m_1.reset <= reset
    m_1.io_in_0 <= Yi_0 @[PE.scala 116:15]
    m_1.io_in_1 <= addsubModule_0_out @[PE.scala 117:15]
    m_1.io_in_2 is invalid
    m_1.io_in_3 is invalid
    m_1.io_sel <= m_1_sel @[PE.scala 115:14]
    m_2.clock <= clock
    m_2.reset <= reset
    m_2.io_in_0 <= Xi_1 @[PE.scala 124:15]
    m_2.io_in_1 <= addsubModule_1_out @[PE.scala 125:15]
    m_2.io_in_2 is invalid
    m_2.io_in_3 is invalid
    m_2.io_sel <= m_2_sel @[PE.scala 123:14]
    m_3.clock <= clock
    m_3.reset <= reset
    m_3.io_in_0 <= Yi_1 @[PE.scala 132:15]
    m_3.io_in_1 <= addsubModule_1_out @[PE.scala 133:15]
    m_3.io_in_2 is invalid
    m_3.io_in_3 is invalid
    m_3.io_sel <= m_3_sel @[PE.scala 131:14]
    multModule_0.clock <= clock
    multModule_0.reset <= reset
    multModule_0.io_in_0 <= m_0_out @[PE.scala 144:24]
    multModule_0.io_in_1 <= m_1_out @[PE.scala 145:24]
    multModule_0.io_rounding <= rounding @[PE.scala 142:30]
    multModule_0.io_tininess <= tininess @[PE.scala 143:30]
    multModule_1.clock <= clock
    multModule_1.reset <= reset
    multModule_1.io_in_0 <= m_2_out @[PE.scala 151:24]
    multModule_1.io_in_1 <= m_3_out @[PE.scala 152:24]
    multModule_1.io_rounding <= rounding @[PE.scala 149:30]
    multModule_1.io_tininess <= tininess @[PE.scala 150:30]
    m_4.clock <= clock
    m_4.reset <= reset
    m_4.io_in_0 <= Xi_0 @[PE.scala 160:15]
    m_4.io_in_1 <= multModule_0_out @[PE.scala 161:15]
    m_4.io_in_2 <= aggr_0 @[PE.scala 162:15]
    m_4.io_in_3 is invalid
    m_4.io_sel <= m_0_sel @[PE.scala 159:15]
    m_5.clock <= clock
    m_5.reset <= reset
    m_5.io_in_0 <= Yi_0 @[PE.scala 168:15]
    m_5.io_in_1 <= multModule_1_out @[PE.scala 169:15]
    m_5.io_in_2 <= aggr_1 @[PE.scala 170:15]
    m_5.io_in_3 is invalid
    m_5.io_sel <= m_5_sel @[PE.scala 167:15]
    m_6.clock <= clock
    m_6.reset <= reset
    m_6.io_in_0 <= Xi_1 @[PE.scala 176:15]
    m_6.io_in_1 <= multModule_1_out @[PE.scala 177:15]
    m_6.io_in_2 <= aggr_2 @[PE.scala 178:15]
    m_6.io_in_3 is invalid
    m_6.io_sel <= m_6_sel @[PE.scala 175:15]
    m_7.clock <= clock
    m_7.reset <= reset
    m_7.io_in_0 <= Yi_1 @[PE.scala 184:15]
    m_7.io_in_1 <= multModule_1_out @[PE.scala 185:15]
    m_7.io_in_2 <= aggr_3 @[PE.scala 186:15]
    m_7.io_in_3 is invalid
    m_7.io_sel <= m_7_sel @[PE.scala 183:15]
    addsubModule_0.clock <= clock
    addsubModule_0.reset <= reset
    addsubModule_0.io_in_0 <= m_4_out @[PE.scala 195:26]
    addsubModule_0.io_in_1 <= m_5_out @[PE.scala 196:26]
    addsubModule_0.io_op <= addsub_0_op @[PE.scala 194:24]
    addsubModule_0.io_rounding <= rounding @[PE.scala 197:32]
    addsubModule_0.io_tininess <= tininess @[PE.scala 198:32]
    addsubModule_1.clock <= clock
    addsubModule_1.reset <= reset
    addsubModule_1.io_in_0 <= m_6_out @[PE.scala 203:26]
    addsubModule_1.io_in_1 <= m_7_out @[PE.scala 204:26]
    addsubModule_1.io_op <= addsub_1_op @[PE.scala 202:24]
    addsubModule_1.io_rounding <= rounding @[PE.scala 205:32]
    addsubModule_1.io_tininess <= tininess @[PE.scala 206:32]
    m_8.clock <= clock
    m_8.reset <= reset
    m_8.io_in_0 <= addsubModule_0_out @[PE.scala 214:15]
    m_8.io_in_1 <= multModule_0_out @[PE.scala 215:15]
    m_8.io_in_2 is invalid
    m_8.io_in_3 is invalid
    m_8.io_sel <= m_8_sel @[PE.scala 213:15]
    m_9.clock <= clock
    m_9.reset <= reset
    m_9.io_in_0 <= addsubModule_1_out @[PE.scala 222:15]
    m_9.io_in_1 <= multModule_1_out @[PE.scala 223:15]
    m_9.io_in_2 is invalid
    m_9.io_in_3 is invalid
    m_9.io_sel <= m_7_sel @[PE.scala 221:15]
