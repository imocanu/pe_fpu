// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAddSub_Top.h for the primary calling header

#include "VAddSub_Top___024root.h"
#include "VAddSub_Top__Syms.h"

VL_INLINE_OPT void VAddSub_Top___024root___combo__TOP__1(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___combo__TOP__1\n"); );
    // Init
    QData/*32:0*/ AddSub__DOT__addRecFN_io_a;
    QData/*32:0*/ AddSub__DOT__addRecFN_io_b;
    CData/*4:0*/ AddSub__DOT___addRecFN_io_a_rawIn_normDist_T_39;
    CData/*4:0*/ AddSub__DOT__addRecFN_io_a_rawIn_normDist;
    SData/*8:0*/ AddSub__DOT__addRecFN_io_a_rawIn_adjustedExp;
    CData/*0:0*/ AddSub__DOT__addRecFN_io_a_rawIn_isZero;
    CData/*4:0*/ AddSub__DOT___addRecFN_io_b_rawIn_normDist_T_39;
    CData/*4:0*/ AddSub__DOT__addRecFN_io_b_rawIn_normDist;
    SData/*8:0*/ AddSub__DOT__addRecFN_io_b_rawIn_adjustedExp;
    CData/*0:0*/ AddSub__DOT__addRecFN_io_b_rawIn_isZero;
    CData/*0:0*/ AddSub__DOT__io_outIEEE_rawIn___05FisInf;
    IData/*24:0*/ AddSub__DOT__io_outIEEE_rawIn___05Fsig;
    IData/*31:0*/ AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist;
    QData/*62:0*/ AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T;
    IData/*26:0*/ AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig;
    CData/*0:0*/ AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound;
    IData/*25:0*/ AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*31:0*/ AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist;
    QData/*62:0*/ AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T;
    IData/*26:0*/ AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig;
    CData/*0:0*/ AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound;
    IData/*25:0*/ AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sign;
    SData/*9:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns;
    SData/*9:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps;
    SData/*9:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign;
    CData/*4:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4;
    SData/*12:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum;
    CData/*3:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2;
    QData/*56:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1;
    IData/*28:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_mainAlignedSigSmaller;
    CData/*6:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_alignedSigSmaller_T_2;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller;
    IData/*27:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase;
    QData/*32:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp;
    SData/*15:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12;
    SData/*15:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22;
    SData/*15:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound;
    IData/*25:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    SData/*10:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut;
    VlWide<3>/*95:0*/ __Vtemp2;
    VlWide<3>/*95:0*/ __Vtemp3;
    VlWide<3>/*95:0*/ __Vtemp6;
    VlWide<3>/*95:0*/ __Vtemp7;
    VlWide<3>/*95:0*/ __Vtemp10;
    VlWide<3>/*95:0*/ __Vtemp11;
    VlWide<3>/*95:0*/ __Vtemp14;
    VlWide<3>/*95:0*/ __Vtemp15;
    VlWide<3>/*95:0*/ __Vtemp18;
    VlWide<3>/*95:0*/ __Vtemp19;
    VlWide<3>/*95:0*/ __Vtemp22;
    VlWide<3>/*95:0*/ __Vtemp23;
    VlWide<3>/*95:0*/ __Vtemp26;
    VlWide<3>/*95:0*/ __Vtemp27;
    VlWide<3>/*95:0*/ __Vtemp30;
    VlWide<3>/*95:0*/ __Vtemp31;
    VlWide<3>/*95:0*/ __Vtemp34;
    VlWide<3>/*95:0*/ __Vtemp35;
    VlWide<3>/*95:0*/ __Vtemp38;
    VlWide<3>/*95:0*/ __Vtemp39;
    VlWide<3>/*95:0*/ __Vtemp42;
    VlWide<3>/*95:0*/ __Vtemp43;
    // Body
    AddSub__DOT__addRecFN_io_a_rawIn_isZero = (IData)(
                                                      (0U 
                                                       == 
                                                       (0x7fffffffU 
                                                        & vlSelf->io_in1)));
    AddSub__DOT__addRecFN_io_b_rawIn_isZero = (IData)(
                                                      (0U 
                                                       == 
                                                       (0x7fffffffU 
                                                        & vlSelf->io_in2)));
    AddSub__DOT___addRecFN_io_a_rawIn_normDist_T_39 
        = ((0x20000U & vlSelf->io_in1) ? 5U : ((0x10000U 
                                                & vlSelf->io_in1)
                                                ? 6U
                                                : (
                                                   (0x8000U 
                                                    & vlSelf->io_in1)
                                                    ? 7U
                                                    : 
                                                   ((0x4000U 
                                                     & vlSelf->io_in1)
                                                     ? 8U
                                                     : 
                                                    ((0x2000U 
                                                      & vlSelf->io_in1)
                                                      ? 9U
                                                      : 
                                                     ((0x1000U 
                                                       & vlSelf->io_in1)
                                                       ? 0xaU
                                                       : 
                                                      ((0x800U 
                                                        & vlSelf->io_in1)
                                                        ? 0xbU
                                                        : 
                                                       ((0x400U 
                                                         & vlSelf->io_in1)
                                                         ? 0xcU
                                                         : 
                                                        ((0x200U 
                                                          & vlSelf->io_in1)
                                                          ? 0xdU
                                                          : 
                                                         ((0x100U 
                                                           & vlSelf->io_in1)
                                                           ? 0xeU
                                                           : 
                                                          ((0x80U 
                                                            & vlSelf->io_in1)
                                                            ? 0xfU
                                                            : 
                                                           ((0x40U 
                                                             & vlSelf->io_in1)
                                                             ? 0x10U
                                                             : 
                                                            ((0x20U 
                                                              & vlSelf->io_in1)
                                                              ? 0x11U
                                                              : 
                                                             ((0x10U 
                                                               & vlSelf->io_in1)
                                                               ? 0x12U
                                                               : 
                                                              ((8U 
                                                                & vlSelf->io_in1)
                                                                ? 0x13U
                                                                : 
                                                               ((4U 
                                                                 & vlSelf->io_in1)
                                                                 ? 0x14U
                                                                 : 
                                                                ((2U 
                                                                  & vlSelf->io_in1)
                                                                  ? 0x15U
                                                                  : 0x16U)))))))))))))))));
    AddSub__DOT___addRecFN_io_b_rawIn_normDist_T_39 
        = ((0x20000U & vlSelf->io_in2) ? 5U : ((0x10000U 
                                                & vlSelf->io_in2)
                                                ? 6U
                                                : (
                                                   (0x8000U 
                                                    & vlSelf->io_in2)
                                                    ? 7U
                                                    : 
                                                   ((0x4000U 
                                                     & vlSelf->io_in2)
                                                     ? 8U
                                                     : 
                                                    ((0x2000U 
                                                      & vlSelf->io_in2)
                                                      ? 9U
                                                      : 
                                                     ((0x1000U 
                                                       & vlSelf->io_in2)
                                                       ? 0xaU
                                                       : 
                                                      ((0x800U 
                                                        & vlSelf->io_in2)
                                                        ? 0xbU
                                                        : 
                                                       ((0x400U 
                                                         & vlSelf->io_in2)
                                                         ? 0xcU
                                                         : 
                                                        ((0x200U 
                                                          & vlSelf->io_in2)
                                                          ? 0xdU
                                                          : 
                                                         ((0x100U 
                                                           & vlSelf->io_in2)
                                                           ? 0xeU
                                                           : 
                                                          ((0x80U 
                                                            & vlSelf->io_in2)
                                                            ? 0xfU
                                                            : 
                                                           ((0x40U 
                                                             & vlSelf->io_in2)
                                                             ? 0x10U
                                                             : 
                                                            ((0x20U 
                                                              & vlSelf->io_in2)
                                                              ? 0x11U
                                                              : 
                                                             ((0x10U 
                                                               & vlSelf->io_in2)
                                                               ? 0x12U
                                                               : 
                                                              ((8U 
                                                                & vlSelf->io_in2)
                                                                ? 0x13U
                                                                : 
                                                               ((4U 
                                                                 & vlSelf->io_in2)
                                                                 ? 0x14U
                                                                 : 
                                                                ((2U 
                                                                  & vlSelf->io_in2)
                                                                  ? 0x15U
                                                                  : 0x16U)))))))))))))))));
    AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->io_in1 >> 0x1fU) ? (- vlSelf->io_in1)
            : vlSelf->io_in1);
    AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->io_in2 >> 0x1fU) ? (- vlSelf->io_in2)
            : vlSelf->io_in2);
    AddSub__DOT__addRecFN_io_a_rawIn_normDist = ((0x400000U 
                                                  & vlSelf->io_in1)
                                                  ? 0U
                                                  : 
                                                 ((0x200000U 
                                                   & vlSelf->io_in1)
                                                   ? 1U
                                                   : 
                                                  ((0x100000U 
                                                    & vlSelf->io_in1)
                                                    ? 2U
                                                    : 
                                                   ((0x80000U 
                                                     & vlSelf->io_in1)
                                                     ? 3U
                                                     : 
                                                    ((0x40000U 
                                                      & vlSelf->io_in1)
                                                      ? 4U
                                                      : (IData)(AddSub__DOT___addRecFN_io_a_rawIn_normDist_T_39))))));
    AddSub__DOT__addRecFN_io_b_rawIn_normDist = ((0x400000U 
                                                  & vlSelf->io_in2)
                                                  ? 0U
                                                  : 
                                                 ((0x200000U 
                                                   & vlSelf->io_in2)
                                                   ? 1U
                                                   : 
                                                  ((0x100000U 
                                                    & vlSelf->io_in2)
                                                    ? 2U
                                                    : 
                                                   ((0x80000U 
                                                     & vlSelf->io_in2)
                                                     ? 3U
                                                     : 
                                                    ((0x40000U 
                                                      & vlSelf->io_in2)
                                                      ? 4U
                                                      : (IData)(AddSub__DOT___addRecFN_io_b_rawIn_normDist_T_39))))));
    AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48 
        = ((0x20000U & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
            ? 0xeU : ((0x10000U & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                       ? 0xfU : ((0x8000U & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                  ? 0x10U : ((0x4000U 
                                              & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                              ? 0x11U
                                              : ((0x2000U 
                                                  & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 0x12U
                                                  : 
                                                 ((0x1000U 
                                                   & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 0x13U
                                                   : 
                                                  ((0x800U 
                                                    & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 0x14U
                                                    : 
                                                   ((0x400U 
                                                     & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 0x15U
                                                     : 
                                                    ((0x200U 
                                                      & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 0x16U
                                                      : 
                                                     ((0x100U 
                                                       & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 0x17U
                                                       : 
                                                      ((0x80U 
                                                        & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0x18U
                                                        : 
                                                       ((0x40U 
                                                         & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0x19U
                                                         : 
                                                        ((0x20U 
                                                          & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0x1aU
                                                          : 
                                                         ((0x10U 
                                                           & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0x1bU
                                                           : 
                                                          ((8U 
                                                            & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                            ? 0x1cU
                                                            : 
                                                           ((4U 
                                                             & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                             ? 0x1dU
                                                             : 
                                                            ((2U 
                                                              & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                              ? 0x1eU
                                                              : 0x1fU)))))))))))))))));
    AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48 
        = ((0x20000U & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
            ? 0xeU : ((0x10000U & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                       ? 0xfU : ((0x8000U & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                  ? 0x10U : ((0x4000U 
                                              & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                              ? 0x11U
                                              : ((0x2000U 
                                                  & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 0x12U
                                                  : 
                                                 ((0x1000U 
                                                   & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 0x13U
                                                   : 
                                                  ((0x800U 
                                                    & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 0x14U
                                                    : 
                                                   ((0x400U 
                                                     & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 0x15U
                                                     : 
                                                    ((0x200U 
                                                      & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 0x16U
                                                      : 
                                                     ((0x100U 
                                                       & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 0x17U
                                                       : 
                                                      ((0x80U 
                                                        & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0x18U
                                                        : 
                                                       ((0x40U 
                                                         & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0x19U
                                                         : 
                                                        ((0x20U 
                                                          & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0x1aU
                                                          : 
                                                         ((0x10U 
                                                           & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0x1bU
                                                           : 
                                                          ((8U 
                                                            & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                            ? 0x1cU
                                                            : 
                                                           ((4U 
                                                             & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                             ? 0x1dU
                                                             : 
                                                            ((2U 
                                                              & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                              ? 0x1eU
                                                              : 0x1fU)))))))))))))))));
    AddSub__DOT__addRecFN_io_a_rawIn_adjustedExp = 
        (0x1ffU & (((0U == (0xffU & (vlSelf->io_in1 
                                     >> 0x17U))) ? 
                    (~ (IData)(AddSub__DOT__addRecFN_io_a_rawIn_normDist))
                     : (0xffU & (vlSelf->io_in1 >> 0x17U))) 
                   + (0x80U | ((0U == (0xffU & (vlSelf->io_in1 
                                                >> 0x17U)))
                                ? 2U : 1U))));
    AddSub__DOT__addRecFN_io_b_rawIn_adjustedExp = 
        (0x1ffU & (((0U == (0xffU & (vlSelf->io_in2 
                                     >> 0x17U))) ? 
                    (~ (IData)(AddSub__DOT__addRecFN_io_b_rawIn_normDist))
                     : (0xffU & (vlSelf->io_in2 >> 0x17U))) 
                   + (0x80U | ((0U == (0xffU & (vlSelf->io_in2 
                                                >> 0x17U)))
                                ? 2U : 1U))));
    AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist 
        = ((AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo 
            >> 0x1fU) ? 0U : ((0x40000000U & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                               ? 1U : ((0x20000000U 
                                        & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                        ? 2U : ((0x10000000U 
                                                 & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                 ? 3U
                                                 : 
                                                ((0x8000000U 
                                                  & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 4U
                                                  : 
                                                 ((0x4000000U 
                                                   & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 5U
                                                   : 
                                                  ((0x2000000U 
                                                    & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 6U
                                                    : 
                                                   ((0x1000000U 
                                                     & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 7U
                                                     : 
                                                    ((0x800000U 
                                                      & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 8U
                                                      : 
                                                     ((0x400000U 
                                                       & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 9U
                                                       : 
                                                      ((0x200000U 
                                                        & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0xaU
                                                        : 
                                                       ((0x100000U 
                                                         & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0xbU
                                                         : 
                                                        ((0x80000U 
                                                          & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0xcU
                                                          : 
                                                         ((0x40000U 
                                                           & AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0xdU
                                                           : (IData)(AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48)))))))))))))));
    AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist 
        = ((AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo 
            >> 0x1fU) ? 0U : ((0x40000000U & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                               ? 1U : ((0x20000000U 
                                        & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                        ? 2U : ((0x10000000U 
                                                 & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                 ? 3U
                                                 : 
                                                ((0x8000000U 
                                                  & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 4U
                                                  : 
                                                 ((0x4000000U 
                                                   & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 5U
                                                   : 
                                                  ((0x2000000U 
                                                    & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 6U
                                                    : 
                                                   ((0x1000000U 
                                                     & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 7U
                                                     : 
                                                    ((0x800000U 
                                                      & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 8U
                                                      : 
                                                     ((0x400000U 
                                                       & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 9U
                                                       : 
                                                      ((0x200000U 
                                                        & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0xaU
                                                        : 
                                                       ((0x100000U 
                                                         & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0xbU
                                                         : 
                                                        ((0x80000U 
                                                          & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0xcU
                                                          : 
                                                         ((0x40000U 
                                                           & AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0xdU
                                                           : (IData)(AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48)))))))))))))));
    AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)));
    AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)));
    AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
        = ((0x7fffffeU & ((IData)(((QData)((IData)(AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T)) 
                                   >> 7U)) << 1U)) 
           | (0U != (0x7fU & (IData)((QData)((IData)(AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T))))));
    AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
        = ((0x7fffffeU & ((IData)(((QData)((IData)(AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T)) 
                                   >> 7U)) << 1U)) 
           | (0U != (0x7fU & (IData)((QData)((IData)(AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T))))));
    AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = (IData)((0U != (3U & AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)));
    AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = (IData)((0U != (3U & AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)));
    AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & (((((0U == (IData)(vlSelf->io_round)) 
                            | (4U == (IData)(vlSelf->io_round))) 
                           & (0U != (2U & AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                          | ((((2U == (IData)(vlSelf->io_round)) 
                               & (vlSelf->io_in1 >> 0x1fU)) 
                              | ((3U == (IData)(vlSelf->io_round)) 
                                 & (~ (vlSelf->io_in1 
                                       >> 0x1fU)))) 
                             & (IData)(AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound)))
                          ? (((IData)(1U) + (0x1ffffffU 
                                             & (AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                                >> 2U))) 
                             & (~ ((((0U == (IData)(vlSelf->io_round)) 
                                     & (0U != (2U & AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                                    & (~ (IData)((0U 
                                                  != 
                                                  (1U 
                                                   & AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)))))
                                    ? 1U : 0U))) : 
                         ((0x1ffffffU & (AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                         >> 2U)) | 
                          (((6U == (IData)(vlSelf->io_round)) 
                            & (IData)(AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound))
                            ? 1U : 0U))));
    AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & (((((0U == (IData)(vlSelf->io_round)) 
                            | (4U == (IData)(vlSelf->io_round))) 
                           & (0U != (2U & AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                          | ((((2U == (IData)(vlSelf->io_round)) 
                               & (vlSelf->io_in2 >> 0x1fU)) 
                              | ((3U == (IData)(vlSelf->io_round)) 
                                 & (~ (vlSelf->io_in2 
                                       >> 0x1fU)))) 
                             & (IData)(AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound)))
                          ? (((IData)(1U) + (0x1ffffffU 
                                             & (AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                                >> 2U))) 
                             & (~ ((((0U == (IData)(vlSelf->io_round)) 
                                     & (0U != (2U & AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                                    & (~ (IData)((0U 
                                                  != 
                                                  (1U 
                                                   & AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)))))
                                    ? 1U : 0U))) : 
                         ((0x1ffffffU & (AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                         >> 2U)) | 
                          (((6U == (IData)(vlSelf->io_round)) 
                            & (IData)(AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound))
                            ? 1U : 0U))));
    if (vlSelf->io_useINT) {
        AddSub__DOT__addRecFN_io_a = (((QData)((IData)(
                                                       (vlSelf->io_in1 
                                                        >> 0x1fU))) 
                                       << 0x20U) | (QData)((IData)(
                                                                   (((((0x7ffU 
                                                                        & VL_EXTENDS_II(11,10, 
                                                                                (0x1ffU 
                                                                                & ((IData)(0xc0U) 
                                                                                + 
                                                                                (0x3ffU 
                                                                                & VL_EXTENDS_II(10,9, 
                                                                                (0x40U 
                                                                                | (0x1fU 
                                                                                & (~ (IData)(AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)))))))))) 
                                                                       + 
                                                                       (0x7ffU 
                                                                        & VL_EXTENDS_II(11,10, 
                                                                                (3U 
                                                                                & (AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                                                >> 0x18U))))) 
                                                                      & (~ 
                                                                         ((1U 
                                                                           & (IData)(
                                                                                (AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
                                                                                >> 0x1fU)))
                                                                           ? 0U
                                                                           : 0x1c0U))) 
                                                                     << 0x17U) 
                                                                    | ((1U 
                                                                        & (IData)(
                                                                                (AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
                                                                                >> 0x1fU)))
                                                                        ? 
                                                                       (0x7fffffU 
                                                                        & AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)
                                                                        : 0U)))));
        AddSub__DOT__addRecFN_io_b = (((QData)((IData)(
                                                       (vlSelf->io_in2 
                                                        >> 0x1fU))) 
                                       << 0x20U) | (QData)((IData)(
                                                                   (((((0x7ffU 
                                                                        & VL_EXTENDS_II(11,10, 
                                                                                (0x1ffU 
                                                                                & ((IData)(0xc0U) 
                                                                                + 
                                                                                (0x3ffU 
                                                                                & VL_EXTENDS_II(10,9, 
                                                                                (0x40U 
                                                                                | (0x1fU 
                                                                                & (~ (IData)(AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)))))))))) 
                                                                       + 
                                                                       (0x7ffU 
                                                                        & VL_EXTENDS_II(11,10, 
                                                                                (3U 
                                                                                & (AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                                                >> 0x18U))))) 
                                                                      & (~ 
                                                                         ((1U 
                                                                           & (IData)(
                                                                                (AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
                                                                                >> 0x1fU)))
                                                                           ? 0U
                                                                           : 0x1c0U))) 
                                                                     << 0x17U) 
                                                                    | ((1U 
                                                                        & (IData)(
                                                                                (AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
                                                                                >> 0x1fU)))
                                                                        ? 
                                                                       (0x7fffffU 
                                                                        & AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)
                                                                        : 0U)))));
    } else {
        AddSub__DOT__addRecFN_io_a = (((QData)((IData)(
                                                       (vlSelf->io_in1 
                                                        >> 0x1fU))) 
                                       << 0x20U) | (QData)((IData)(
                                                                   (((((IData)(AddSub__DOT__addRecFN_io_a_rawIn_isZero)
                                                                        ? 0U
                                                                        : 
                                                                       ((IData)(AddSub__DOT__addRecFN_io_a_rawIn_adjustedExp) 
                                                                        >> 6U)) 
                                                                      | ((3U 
                                                                          == 
                                                                          (3U 
                                                                           & ((IData)(AddSub__DOT__addRecFN_io_a_rawIn_adjustedExp) 
                                                                              >> 7U))) 
                                                                         & (0U 
                                                                            != 
                                                                            (0x7fffffU 
                                                                             & vlSelf->io_in1)))) 
                                                                     << 0x1dU) 
                                                                    | ((0x1f800000U 
                                                                        & ((IData)(AddSub__DOT__addRecFN_io_a_rawIn_adjustedExp) 
                                                                           << 0x17U)) 
                                                                       | (0x7fffffU 
                                                                          & ((0U 
                                                                              == 
                                                                              (0xffU 
                                                                               & (vlSelf->io_in1 
                                                                                >> 0x17U)))
                                                                              ? 
                                                                             (0x7ffffeU 
                                                                              & ((IData)(
                                                                                (0x3fffffffffffffULL 
                                                                                & ((QData)((IData)(
                                                                                (0x7fffffU 
                                                                                & vlSelf->io_in1))) 
                                                                                << (IData)(AddSub__DOT__addRecFN_io_a_rawIn_normDist)))) 
                                                                                << 1U))
                                                                              : vlSelf->io_in1)))))));
        AddSub__DOT__addRecFN_io_b = (((QData)((IData)(
                                                       (vlSelf->io_in2 
                                                        >> 0x1fU))) 
                                       << 0x20U) | (QData)((IData)(
                                                                   (((((IData)(AddSub__DOT__addRecFN_io_b_rawIn_isZero)
                                                                        ? 0U
                                                                        : 
                                                                       ((IData)(AddSub__DOT__addRecFN_io_b_rawIn_adjustedExp) 
                                                                        >> 6U)) 
                                                                      | ((3U 
                                                                          == 
                                                                          (3U 
                                                                           & ((IData)(AddSub__DOT__addRecFN_io_b_rawIn_adjustedExp) 
                                                                              >> 7U))) 
                                                                         & (0U 
                                                                            != 
                                                                            (0x7fffffU 
                                                                             & vlSelf->io_in2)))) 
                                                                     << 0x1dU) 
                                                                    | ((0x1f800000U 
                                                                        & ((IData)(AddSub__DOT__addRecFN_io_b_rawIn_adjustedExp) 
                                                                           << 0x17U)) 
                                                                       | (0x7fffffU 
                                                                          & ((0U 
                                                                              == 
                                                                              (0xffU 
                                                                               & (vlSelf->io_in2 
                                                                                >> 0x17U)))
                                                                              ? 
                                                                             (0x7ffffeU 
                                                                              & ((IData)(
                                                                                (0x3fffffffffffffULL 
                                                                                & ((QData)((IData)(
                                                                                (0x7fffffU 
                                                                                & vlSelf->io_in2))) 
                                                                                << (IData)(AddSub__DOT__addRecFN_io_b_rawIn_normDist)))) 
                                                                                << 1U))
                                                                              : vlSelf->io_in2)))))));
    }
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN 
        = (IData)((0xe0000000ULL == (0xe0000000ULL 
                                     & AddSub__DOT__addRecFN_io_a)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf 
        = (IData)((0xc0000000ULL == (0xe0000000ULL 
                                     & AddSub__DOT__addRecFN_io_a)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
        = (((0U != (7U & (IData)((AddSub__DOT__addRecFN_io_a 
                                  >> 0x1dU)))) << 0x17U) 
           | (0x7fffffU & (IData)(AddSub__DOT__addRecFN_io_a)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN 
        = (IData)((0xe0000000ULL == (0xe0000000ULL 
                                     & AddSub__DOT__addRecFN_io_b)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros 
        = (IData)(((0ULL == (0xe0000000ULL & AddSub__DOT__addRecFN_io_a)) 
                   & (0ULL == (0xe0000000ULL & AddSub__DOT__addRecFN_io_b))));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf 
        = (IData)((0xc0000000ULL == (0xe0000000ULL 
                                     & AddSub__DOT__addRecFN_io_b)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB 
        = (1U & ((IData)((AddSub__DOT__addRecFN_io_b 
                          >> 0x20U)) ^ (IData)(vlSelf->io_op)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
        = (((0U != (7U & (IData)((AddSub__DOT__addRecFN_io_b 
                                  >> 0x1dU)))) << 0x17U) 
           | (0x7fffffU & (IData)(AddSub__DOT__addRecFN_io_b)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps 
        = (0x3ffU & ((0x1ffU & (IData)((AddSub__DOT__addRecFN_io_a 
                                        >> 0x17U))) 
                     - (0x1ffU & (IData)((AddSub__DOT__addRecFN_io_b 
                                          >> 0x17U)))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf) 
           | (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns 
        = ((1U & (IData)((AddSub__DOT__addRecFN_io_a 
                          >> 0x20U))) == (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
        = (VL_GTS_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
            ? AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig
            : AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig);
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign 
        = ((0U != (0x1fU & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps) 
                            >> 5U))) & ((0x1fU != (0x1fU 
                                                   & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps) 
                                                      >> 5U))) 
                                        | (0U == (0x1fU 
                                                  & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4 
        = (0x3ffU & (VL_GTS_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                      ? ((0x1ffU & (IData)((AddSub__DOT__addRecFN_io_b 
                                            >> 0x17U))) 
                         - (0x1ffU & (IData)((AddSub__DOT__addRecFN_io_a 
                                              >> 0x17U))))
                      : (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum 
        = (0x7ffffffU & (((((VL_LTES_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)) 
                             & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                             ? (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
                                << 2U) : 0U) | ((VL_LTES_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)) 
                                                 & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)))
                                                 ? 
                                                (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
                                                 << 1U)
                                                 : 0U)) 
                          | (VL_GTS_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                              ? AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig
                              : 0U)) - ((0x4000000U 
                                         & (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
                                            << 2U)) 
                                        | (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
                                           << 1U))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut) 
           | (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut 
        = (((((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN) 
              & (~ (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
                    >> 0x16U))) | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN) 
                                   & (~ (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
                                         >> 0x16U)))) 
            | (((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf) 
                & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf)) 
               & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))) 
           | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN) 
              | (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags 
        = (((~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)) 
            & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign))) 
           & (1U >= (0x1fU & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign)
            ? 0x1fU : (0x1fU & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
        = (0x7ffffffU & (VL_GTS_III(1,27,27, 0U, AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum)
                          ? (- AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum)
                          : AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_mainAlignedSigSmaller 
        = (0x1fffffffU & ((0x1fffffe0U & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                          << 5U)) >> (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_alignedSigSmaller_T_2 
        = ((((IData)((0U != (3U & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                   >> 0x16U)))) << 6U) 
            | (((IData)((0U != (0xfU & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                        >> 0x12U)))) 
                << 5U) | (((IData)((0U != (0xfU & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                                   >> 0xeU)))) 
                           << 4U) | (((IData)((0U != 
                                               (0xfU 
                                                & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                                   >> 0xaU)))) 
                                      << 3U) | (((IData)(
                                                         (0U 
                                                          != 
                                                          (0xfU 
                                                           & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                                              >> 6U)))) 
                                                 << 2U) 
                                                | (((IData)(
                                                            (0U 
                                                             != 
                                                             (0xfU 
                                                              & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
                                                                 >> 2U)))) 
                                                    << 1U) 
                                                   | (0U 
                                                      != 
                                                      (3U 
                                                       & AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1)))))))) 
           & ((0x40U & (VL_SHIFTRS_III(9,9,3, 0x100U, 
                                       (7U & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                              >> 2U))) 
                        << 5U)) | ((0x20U & (VL_SHIFTRS_III(9,9,3, 0x100U, 
                                                            (7U 
                                                             & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                                                >> 2U))) 
                                             << 3U)) 
                                   | ((0x10U & (VL_SHIFTRS_III(9,9,3, 0x100U, 
                                                               (7U 
                                                                & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                                                   >> 2U))) 
                                                << 1U)) 
                                      | ((8U & (VL_SHIFTRS_III(9,9,3, 0x100U, 
                                                               (7U 
                                                                & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                                                   >> 2U))) 
                                                >> 1U)) 
                                         | ((4U & (
                                                   VL_SHIFTRS_III(9,9,3, 0x100U, 
                                                                  (7U 
                                                                   & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                                                      >> 2U))) 
                                                   >> 3U)) 
                                            | ((2U 
                                                & (VL_SHIFTRS_III(9,9,3, 0x100U, 
                                                                  (7U 
                                                                   & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                                                      >> 2U))) 
                                                   >> 5U)) 
                                               | (1U 
                                                  & (VL_SHIFTRS_III(9,9,3, 0x100U, 
                                                                    (7U 
                                                                     & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist) 
                                                                        >> 2U))) 
                                                     >> 7U)))))))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum 
        = (((IData)((0U != (3U & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                  >> 0x18U)))) << 0xcU) 
           | (((IData)((0U != (3U & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                     >> 0x16U)))) << 0xbU) 
              | (((IData)((0U != (3U & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                        >> 0x14U)))) 
                  << 0xaU) | (((IData)((0U != (3U & 
                                               (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                >> 0x12U)))) 
                               << 9U) | (((IData)((0U 
                                                   != 
                                                   (3U 
                                                    & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                       >> 0x10U)))) 
                                          << 8U) | 
                                         (((IData)(
                                                   (0U 
                                                    != 
                                                    (3U 
                                                     & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                        >> 0xeU)))) 
                                           << 7U) | 
                                          (((IData)(
                                                    (0U 
                                                     != 
                                                     (3U 
                                                      & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                         >> 0xcU)))) 
                                            << 6U) 
                                           | (((IData)(
                                                       (0U 
                                                        != 
                                                        (3U 
                                                         & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                            >> 0xaU)))) 
                                               << 5U) 
                                              | (((IData)(
                                                          (0U 
                                                           != 
                                                           (3U 
                                                            & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                               >> 8U)))) 
                                                  << 4U) 
                                                 | (((IData)(
                                                             (0U 
                                                              != 
                                                              (3U 
                                                               & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                                  >> 6U)))) 
                                                     << 3U) 
                                                    | (((IData)(
                                                                (0U 
                                                                 != 
                                                                 (3U 
                                                                  & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                                     >> 4U)))) 
                                                        << 2U) 
                                                       | (((IData)(
                                                                   (0U 
                                                                    != 
                                                                    (3U 
                                                                     & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
                                                                        >> 2U)))) 
                                                           << 1U) 
                                                          | (0U 
                                                             != 
                                                             (3U 
                                                              & AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4))))))))))))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller 
        = ((0x7fffffeU & (AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_mainAlignedSigSmaller 
                          >> 2U)) | ((0U != (7U & AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_mainAlignedSigSmaller)) 
                                     | (0U != (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_alignedSigSmaller_T_2))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2 
        = ((0x1000U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
            ? 0U : ((0x800U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                     ? 1U : ((0x400U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                              ? 2U : ((0x200U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                       ? 3U : ((0x100U 
                                                & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                ? 4U
                                                : (
                                                   (0x80U 
                                                    & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                    ? 5U
                                                    : 
                                                   ((0x40U 
                                                     & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                     ? 6U
                                                     : 
                                                    ((0x20U 
                                                      & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                      ? 7U
                                                      : 
                                                     ((0x10U 
                                                       & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                       ? 8U
                                                       : 
                                                      ((8U 
                                                        & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                        ? 9U
                                                        : 
                                                       ((4U 
                                                         & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                         ? 0xaU
                                                         : 
                                                        ((2U 
                                                          & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum))
                                                          ? 0xbU
                                                          : 0xcU))))))))))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum 
        = (0xfffffffU & (((0x7fffff8U & ((VL_GTS_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                                           ? AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig
                                           : AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig) 
                                         << 3U)) + 
                          ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)
                            ? AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller
                            : (0x8000000U | (0x7ffffffU 
                                             & (~ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller))))) 
                         + (1U & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
        = (0x1ffffffffffffffULL & ((QData)((IData)(
                                                   (0x3ffffffU 
                                                    & AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4))) 
                                   << ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2) 
                                       << 1U)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp 
        = (0x3ffU & ((((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags) 
                       | VL_GTS_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)))
                       ? (0x1ffU & (IData)((AddSub__DOT__addRecFN_io_b 
                                            >> 0x17U)))
                       : (0x1ffU & (IData)((AddSub__DOT__addRecFN_io_a 
                                            >> 0x17U)))) 
                     - ((0x3c0U & ((- (IData)((1U & 
                                               (((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)
                                                  ? 
                                                 ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2) 
                                                  << 1U)
                                                  : 
                                                 (1U 
                                                  & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))) 
                                                >> 5U)))) 
                                   << 6U)) | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)
                                               ? ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2) 
                                                  << 1U)
                                               : (1U 
                                                  & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))))));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros) 
           | (((~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut)) 
               & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)) 
              & (~ (IData)((0U != (3U & (IData)((AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
                                                 >> 0x18U))))))));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sign 
        = (1U & (((((((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns) 
                      & (IData)((AddSub__DOT__addRecFN_io_a 
                                 >> 0x20U))) | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf) 
                                                & (IData)(
                                                          (AddSub__DOT__addRecFN_io_a 
                                                           >> 0x20U)))) 
                    | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf) 
                       & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB))) 
                   | ((((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros) 
                        | (((~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut)) 
                            & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)) 
                           & (~ (IData)((0U != (3U 
                                                & (IData)(
                                                          (AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
                                                           >> 0x18U)))))))) 
                       & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns))) 
                      & (2U == (IData)(vlSelf->io_round)))) 
                  | ((((~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase)) 
                       & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)) 
                      & (0U != (3U & (IData)((AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
                                              >> 0x18U))))) 
                     & ((IData)((AddSub__DOT__addRecFN_io_a 
                                 >> 0x20U)) ^ VL_GTS_III(1,27,27, 0U, AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum)))) 
                 | (((~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase)) 
                     & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags))) 
                    & (VL_GTS_III(1,10,10, 0U, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                        ? (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB)
                        : (IData)((AddSub__DOT__addRecFN_io_a 
                                   >> 0x20U))))));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
        = (0x7ffffffU & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)
                          ? (0x7fffffeU & ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T) 
                                           << 1U)) : 
                         ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)
                           ? (0x7ffffffU & ((AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum 
                                             >> 1U) 
                                            | (1U & AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum)))
                           : AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum)));
    __Vtemp2[0U] = 0U;
    __Vtemp2[1U] = 0U;
    __Vtemp2[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp3, __Vtemp2, (0x3fU 
                                                 & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp6[0U] = 0U;
    __Vtemp6[1U] = 0U;
    __Vtemp6[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp7, __Vtemp6, (0x3fU 
                                                 & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12 
        = ((0xffU & (__Vtemp3[1U] >> 0x12U)) | (0xff00U 
                                                & (__Vtemp7[1U] 
                                                   >> 2U)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase 
        = (1U & (((~ (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)) 
                  & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut))) 
                 & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp 
        = (((2U == (IData)(vlSelf->io_round)) & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sign)) 
           | ((3U == (IData)(vlSelf->io_round)) & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sign))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22 
        = ((0xf0fU & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12) 
                      >> 4U)) | (0xf0f0U & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12) 
                                            << 4U)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp 
        = (((0U == (IData)(vlSelf->io_round)) | (4U 
                                                 == (IData)(vlSelf->io_round))) 
           | (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32 
        = ((0x3333U & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                       >> 2U)) | (0xccccU & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                                             << 2U)));
    __Vtemp10[0U] = 0U;
    __Vtemp10[1U] = 0U;
    __Vtemp10[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp11, __Vtemp10, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp14[0U] = 0U;
    __Vtemp14[1U] = 0U;
    __Vtemp14[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp15, __Vtemp14, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp18[0U] = 0U;
    __Vtemp18[1U] = 0U;
    __Vtemp18[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp19, __Vtemp18, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp22[0U] = 0U;
    __Vtemp22[1U] = 0U;
    __Vtemp22[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp23, __Vtemp22, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp26[0U] = 0U;
    __Vtemp26[1U] = 0U;
    __Vtemp26[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp27, __Vtemp26, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp30[0U] = 0U;
    __Vtemp30[1U] = 0U;
    __Vtemp30[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp31, __Vtemp30, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp34[0U] = 0U;
    __Vtemp34[1U] = 0U;
    __Vtemp34[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp35, __Vtemp34, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp38[0U] = 0U;
    __Vtemp38[1U] = 0U;
    __Vtemp38[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp39, __Vtemp38, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp42[0U] = 0U;
    __Vtemp42[1U] = 0U;
    __Vtemp42[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp43, __Vtemp42, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55 
        = ((0x80U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
            ? ((0x40U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
                ? 0U : ((4U & (__Vtemp11[0U] << 2U)) 
                        | ((2U & __Vtemp15[0U]) | (1U 
                                                   & (__Vtemp19[0U] 
                                                      >> 2U)))))
            : (7U | (0x1fffff8U & ((~ ((0x40U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
                                        ? (~ (((0x155540U 
                                                & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
                                                   << 5U)) 
                                               | (0x2aaa80U 
                                                  & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
                                                     << 7U))) 
                                              | ((0x20U 
                                                  & (__Vtemp23[1U] 
                                                     >> 0x15U)) 
                                                 | ((0x10U 
                                                     & (__Vtemp27[1U] 
                                                        >> 0x17U)) 
                                                    | ((8U 
                                                        & (__Vtemp31[1U] 
                                                           >> 0x19U)) 
                                                       | ((4U 
                                                           & (__Vtemp35[1U] 
                                                              >> 0x1bU)) 
                                                          | ((2U 
                                                              & (__Vtemp39[1U] 
                                                                 >> 0x1dU)) 
                                                             | (__Vtemp43[1U] 
                                                                >> 0x1fU))))))))
                                        : 0U)) << 3U))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
        = (((0x100U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
             ? 0U : AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55) 
           | (1U & (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                    >> 0x1aU)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T 
        = (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
           & (1U | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                    << 1U)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask 
        = ((~ (1U | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                     << 1U))) & (3U | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                       << 2U)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T 
        = (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
           & AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask);
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = ((0U != AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T) 
           | (0U != AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & (((((0U == (IData)(vlSelf->io_round)) 
                            | (4U == (IData)(vlSelf->io_round))) 
                           & (0U != AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T)) 
                          | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp) 
                             & (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound)))
                          ? (((IData)(1U) + (0x1ffffffU 
                                             & ((AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                                                 >> 2U) 
                                                | (0x3fffffffU 
                                                   & AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9)))) 
                             & (~ ((((0U == (IData)(vlSelf->io_round)) 
                                     & (0U != AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T)) 
                                    & (~ (IData)((0U 
                                                  != AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T))))
                                    ? (1U | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                             << 1U))
                                    : 0U))) : ((0x1ffffffU 
                                                & ((AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                                                    & (~ 
                                                       (3U 
                                                        | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                                           << 2U)))) 
                                                   >> 2U)) 
                                               | (((6U 
                                                    == (IData)(vlSelf->io_round)) 
                                                   & (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound))
                                                   ? 
                                                  (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask 
                                                   >> 1U)
                                                   : 0U))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp 
        = (0x7ffU & (VL_EXTENDS_II(11,10, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp)) 
                     + VL_EXTENDS_II(11,10, (3U & (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                   >> 0x18U)))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut 
        = (((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase) 
            & VL_GTS_III(1,11,11, 0x6bU, (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp))) 
           & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp) 
              | (6U == (IData)(vlSelf->io_round))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow 
        = ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase) 
           & VL_LTES_III(1,4,4, 3U, (0xfU & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp) 
                                             >> 7U))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut 
        = ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow) 
           & (~ (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut) 
           | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow) 
              & (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
        = (((QData)((IData)(((~ (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)) 
                             & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sign)))) 
            << 0x20U) | (QData)((IData)((((((((((((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp) 
                                                  & (~ 
                                                     (((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero) 
                                                       | VL_GTS_III(1,11,11, 0x6bU, (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp)))
                                                       ? 0x1c0U
                                                       : 0U))) 
                                                 & (~ 
                                                    ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut)
                                                      ? 0x194U
                                                      : 0U))) 
                                                & (~ 
                                                   ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut)
                                                     ? 0x80U
                                                     : 0U))) 
                                               & (~ 
                                                  ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut)
                                                    ? 0x40U
                                                    : 0U))) 
                                              | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut)
                                                  ? 0x6bU
                                                  : 0U)) 
                                             | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut)
                                                 ? 0x17fU
                                                 : 0U)) 
                                            | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut)
                                                ? 0x180U
                                                : 0U)) 
                                           | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)
                                               ? 0x1c0U
                                               : 0U)) 
                                          << 0x17U) 
                                         | (0x7fffffU 
                                            & (((((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut) 
                                                  | (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero)) 
                                                 | VL_GTS_III(1,11,11, 0x6bU, (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp)))
                                                 ? 
                                                ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)
                                                  ? 0x400000U
                                                  : 0U)
                                                 : 
                                                ((0x4000000U 
                                                  & AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig)
                                                  ? 
                                                 (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                  >> 1U)
                                                  : AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)) 
                                               | ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut)
                                                   ? 0x7fffffU
                                                   : 0U)))))));
    AddSub__DOT__io_outIEEE_rawIn___05FisInf = (IData)(
                                                       (0xc0000000ULL 
                                                        == 
                                                        (0xe0000000ULL 
                                                         & AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out)));
    AddSub__DOT__io_outIEEE_rawIn___05Fsig = (((0U 
                                                != 
                                                (7U 
                                                 & (IData)(
                                                           (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
                                                            >> 0x1dU)))) 
                                               << 0x17U) 
                                              | (0x7fffffU 
                                                 & (IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out)));
    vlSelf->io_outIEEE = (QData)((IData)((((IData)(
                                                   (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
                                                    >> 0x20U)) 
                                           << 0x1fU) 
                                          | ((0x7f800000U 
                                              & (((VL_GTS_III(1,10,10, 0x82U, 
                                                              (0x1ffU 
                                                               & (IData)(
                                                                         (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
                                                                          >> 0x17U))))
                                                    ? 0U
                                                    : 
                                                   ((0x1ffU 
                                                     & (IData)(
                                                               (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
                                                                >> 0x17U))) 
                                                    - (IData)(0x81U))) 
                                                  | (((IData)(
                                                              (0xe0000000ULL 
                                                               == 
                                                               (0xe0000000ULL 
                                                                & AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out))) 
                                                      | (IData)(AddSub__DOT__io_outIEEE_rawIn___05FisInf))
                                                      ? 0xffU
                                                      : 0U)) 
                                                 << 0x17U)) 
                                             | (0x7fffffU 
                                                & (VL_GTS_III(1,10,10, 0x82U, 
                                                              (0x1ffU 
                                                               & (IData)(
                                                                         (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
                                                                          >> 0x17U))))
                                                    ? 
                                                   (0xffffffU 
                                                    & ((0xffffffU 
                                                        & (AddSub__DOT__io_outIEEE_rawIn___05Fsig 
                                                           >> 1U)) 
                                                       >> 
                                                       (0x1fU 
                                                        & ((IData)(1U) 
                                                           - 
                                                           (0x1ffU 
                                                            & (IData)(
                                                                      (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN_io_out 
                                                                       >> 0x17U)))))))
                                                    : 
                                                   ((IData)(AddSub__DOT__io_outIEEE_rawIn___05FisInf)
                                                     ? 0U
                                                     : AddSub__DOT__io_outIEEE_rawIn___05Fsig)))))));
}

void VAddSub_Top___024root___eval(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___eval\n"); );
    // Body
    VAddSub_Top___024root___combo__TOP__1(vlSelf);
}

QData VAddSub_Top___024root___change_request_1(VAddSub_Top___024root* vlSelf);

VL_INLINE_OPT QData VAddSub_Top___024root___change_request(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___change_request\n"); );
    // Body
    return (VAddSub_Top___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VAddSub_Top___024root___change_request_1(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VAddSub_Top___024root___eval_debug_assertions(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_op & 0xfeU))) {
        Verilated::overWidthError("io_op");}
    if (VL_UNLIKELY((vlSelf->io_useINT & 0xfeU))) {
        Verilated::overWidthError("io_useINT");}
    if (VL_UNLIKELY((vlSelf->io_round & 0xf8U))) {
        Verilated::overWidthError("io_round");}
}
#endif  // VL_DEBUG
