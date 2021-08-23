// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VMult.h for the primary calling header

#include "VMult___024root.h"
#include "VMult__Syms.h"

VL_INLINE_OPT void VMult___024root___sequent__TOP__1(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___sequent__TOP__1\n"); );
    // Init
    CData/*4:0*/ Mult__DOT___recFN_from_fN_in1_rawIn_normDist_T_39;
    CData/*4:0*/ Mult__DOT__recFN_from_fN_in1_rawIn_normDist;
    SData/*8:0*/ Mult__DOT__recFN_from_fN_in1_rawIn_adjustedExp;
    CData/*0:0*/ Mult__DOT__recFN_from_fN_in1_rawIn_isZero;
    CData/*4:0*/ Mult__DOT___recFN_from_fN_in2_rawIn_normDist_T_39;
    CData/*4:0*/ Mult__DOT__recFN_from_fN_in2_rawIn_normDist;
    SData/*8:0*/ Mult__DOT__recFN_from_fN_in2_rawIn_adjustedExp;
    CData/*0:0*/ Mult__DOT__recFN_from_fN_in2_rawIn_isZero;
    CData/*0:0*/ Mult__DOT__out_FP32_rawIn___05FisInf;
    IData/*24:0*/ Mult__DOT__out_FP32_rawIn___05Fsig;
    IData/*31:0*/ Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo;
    CData/*4:0*/ Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48;
    CData/*4:0*/ Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist;
    IData/*26:0*/ Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig;
    CData/*0:0*/ Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound;
    IData/*31:0*/ Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo;
    CData/*4:0*/ Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48;
    CData/*4:0*/ Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist;
    IData/*26:0*/ Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig;
    CData/*0:0*/ Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__rawIn___05FisNaN;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__magJustBelowOne;
    QData/*54:0*/ Mult__DOT__recFNToIN__DOT__shiftedSig;
    QData/*33:0*/ Mult__DOT__recFNToIN__DOT__alignedSig;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__common_inexact;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__roundIncr;
    IData/*31:0*/ Mult__DOT__recFNToIN__DOT__complUnroundedInt;
    // Body
    vlSelf->Mult__DOT__useINT_sel = vlSelf->io_useINT;
    vlSelf->Mult__DOT__round_mode = vlSelf->io_round;
    vlSelf->Mult__DOT__fN_in1 = vlSelf->io_in1;
    vlSelf->Mult__DOT__fN_in2 = vlSelf->io_in2;
    vlSelf->Mult__DOT__iNToRecFN_1_out = (((QData)((IData)(vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi)) 
                                           << 0x17U) 
                                          | (QData)((IData)(
                                                            ((1U 
                                                              & (IData)(
                                                                        (vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
                                                                         >> 0x1fU)))
                                                              ? 
                                                             (0x7fffffU 
                                                              & vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)
                                                              : 0U))));
    vlSelf->Mult__DOT__iNToRecFN_2_out = (((QData)((IData)(vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi)) 
                                           << 0x17U) 
                                          | (QData)((IData)(
                                                            ((1U 
                                                              & (IData)(
                                                                        (vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
                                                                         >> 0x1fU)))
                                                              ? 
                                                             (0x7fffffU 
                                                              & vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)
                                                              : 0U))));
    vlSelf->Mult__DOT__recFN_from_fN_in1 = (((QData)((IData)(vlSelf->Mult__DOT__recFN_from_fN_in1_hi)) 
                                             << 0x1dU) 
                                            | (QData)((IData)(vlSelf->Mult__DOT__recFN_from_fN_in1_lo)));
    vlSelf->Mult__DOT__recFN_from_fN_in2 = (((QData)((IData)(vlSelf->Mult__DOT__recFN_from_fN_in2_hi)) 
                                             << 0x1dU) 
                                            | (QData)((IData)(vlSelf->Mult__DOT__recFN_from_fN_in2_lo)));
    vlSelf->Mult__DOT__mulRecFN_out = (((QData)((IData)(
                                                        ((~ (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)) 
                                                         & (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_sign)))) 
                                        << 0x20U) | (QData)((IData)(
                                                                    (((((((((((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp) 
                                                                              & (~ 
                                                                                (((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isZero) 
                                                                                | VL_GTS_III(1,11,11, 0x6bU, (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp)))
                                                                                 ? 0x1c0U
                                                                                 : 0U))) 
                                                                             & (~ 
                                                                                ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut)
                                                                                 ? 0x194U
                                                                                 : 0U))) 
                                                                            & (~ 
                                                                               ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut)
                                                                                 ? 0x80U
                                                                                 : 0U))) 
                                                                           & (~ 
                                                                              ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut)
                                                                                ? 0x40U
                                                                                : 0U))) 
                                                                          | ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut)
                                                                              ? 0x6bU
                                                                              : 0U)) 
                                                                         | ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut)
                                                                             ? 0x17fU
                                                                             : 0U)) 
                                                                        | ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut)
                                                                            ? 0x180U
                                                                            : 0U)) 
                                                                       | ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)
                                                                           ? 0x1c0U
                                                                           : 0U)) 
                                                                      << 0x17U) 
                                                                     | (0x7fffffU 
                                                                        & (((((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut) 
                                                                              | (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isZero)) 
                                                                             | VL_GTS_III(1,11,11, 0x6bU, (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp)))
                                                                             ? 
                                                                            ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)
                                                                              ? 0x400000U
                                                                              : 0U)
                                                                             : 
                                                                            ((0x4000000U 
                                                                              & vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig)
                                                                              ? 
                                                                             (vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                                              >> 1U)
                                                                              : vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)) 
                                                                           | ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut)
                                                                               ? 0x7fffffU
                                                                               : 0U)))))));
    vlSelf->Mult__DOT__recFNToIN_out = (((IData)(vlSelf->Mult__DOT__recFNToIN__DOT__invalidExc) 
                                         | (IData)(vlSelf->Mult__DOT__recFNToIN__DOT__common_overflow))
                                         ? (((IData)(vlSelf->Mult__DOT__recFNToIN__DOT__excSign)
                                              ? 0x80000000U
                                              : 0U) 
                                            | ((IData)(vlSelf->Mult__DOT__recFNToIN__DOT__excSign)
                                                ? 0U
                                                : 0x7fffffffU))
                                         : vlSelf->Mult__DOT__recFNToIN__DOT__roundedInt);
    vlSelf->Mult__DOT__out_FP32 = (((IData)(vlSelf->Mult__DOT__out_FP32_hi) 
                                    << 0x17U) | vlSelf->Mult__DOT__out_FP32_lo);
    vlSelf->io_out = (QData)((IData)(((IData)(vlSelf->Mult__DOT__useINT_sel)
                                       ? vlSelf->Mult__DOT__recFNToIN_out
                                       : vlSelf->Mult__DOT__out_FP32)));
    Mult__DOT__out_FP32_rawIn___05Fsig = (((0U != (7U 
                                                   & (IData)(
                                                             (vlSelf->Mult__DOT__mulRecFN_out 
                                                              >> 0x1dU)))) 
                                           << 0x17U) 
                                          | (0x7fffffU 
                                             & (IData)(vlSelf->Mult__DOT__mulRecFN_out)));
    Mult__DOT__recFNToIN__DOT__rawIn___05FisNaN = (IData)(
                                                          (0xe0000000ULL 
                                                           == 
                                                           (0xe0000000ULL 
                                                            & vlSelf->Mult__DOT__mulRecFN_out)));
    Mult__DOT__out_FP32_rawIn___05FisInf = (IData)(
                                                   (0xc0000000ULL 
                                                    == 
                                                    (0xe0000000ULL 
                                                     & vlSelf->Mult__DOT__mulRecFN_out)));
    Mult__DOT__recFNToIN__DOT__magJustBelowOne = ((~ 
                                                   (1U 
                                                    & ((IData)(
                                                               (vlSelf->Mult__DOT__mulRecFN_out 
                                                                >> 0x17U)) 
                                                       >> 8U))) 
                                                  & (0xffU 
                                                     == 
                                                     (0xffU 
                                                      & (IData)(
                                                                (vlSelf->Mult__DOT__mulRecFN_out 
                                                                 >> 0x17U)))));
    Mult__DOT__recFNToIN__DOT__shiftedSig = (0x7fffffffffffffULL 
                                             & ((QData)((IData)(
                                                                ((0x800000U 
                                                                  & ((IData)(
                                                                             (vlSelf->Mult__DOT__mulRecFN_out 
                                                                              >> 0x17U)) 
                                                                     << 0xfU)) 
                                                                 | (0x7fffffU 
                                                                    & (IData)(vlSelf->Mult__DOT__mulRecFN_out))))) 
                                                << 
                                                ((0x100U 
                                                  & (IData)(
                                                            (vlSelf->Mult__DOT__mulRecFN_out 
                                                             >> 0x17U)))
                                                  ? 
                                                 (0x1fU 
                                                  & (IData)(
                                                            (vlSelf->Mult__DOT__mulRecFN_out 
                                                             >> 0x17U)))
                                                  : 0U)));
    Mult__DOT__recFN_from_fN_in1_rawIn_isZero = (IData)(
                                                        (0U 
                                                         == 
                                                         (0x7fffffffU 
                                                          & vlSelf->Mult__DOT__fN_in1)));
    Mult__DOT___recFN_from_fN_in1_rawIn_normDist_T_39 
        = ((0x20000U & vlSelf->Mult__DOT__fN_in1) ? 5U
            : ((0x10000U & vlSelf->Mult__DOT__fN_in1)
                ? 6U : ((0x8000U & vlSelf->Mult__DOT__fN_in1)
                         ? 7U : ((0x4000U & vlSelf->Mult__DOT__fN_in1)
                                  ? 8U : ((0x2000U 
                                           & vlSelf->Mult__DOT__fN_in1)
                                           ? 9U : (
                                                   (0x1000U 
                                                    & vlSelf->Mult__DOT__fN_in1)
                                                    ? 0xaU
                                                    : 
                                                   ((0x800U 
                                                     & vlSelf->Mult__DOT__fN_in1)
                                                     ? 0xbU
                                                     : 
                                                    ((0x400U 
                                                      & vlSelf->Mult__DOT__fN_in1)
                                                      ? 0xcU
                                                      : 
                                                     ((0x200U 
                                                       & vlSelf->Mult__DOT__fN_in1)
                                                       ? 0xdU
                                                       : 
                                                      ((0x100U 
                                                        & vlSelf->Mult__DOT__fN_in1)
                                                        ? 0xeU
                                                        : 
                                                       ((0x80U 
                                                         & vlSelf->Mult__DOT__fN_in1)
                                                         ? 0xfU
                                                         : 
                                                        ((0x40U 
                                                          & vlSelf->Mult__DOT__fN_in1)
                                                          ? 0x10U
                                                          : 
                                                         ((0x20U 
                                                           & vlSelf->Mult__DOT__fN_in1)
                                                           ? 0x11U
                                                           : 
                                                          ((0x10U 
                                                            & vlSelf->Mult__DOT__fN_in1)
                                                            ? 0x12U
                                                            : 
                                                           ((8U 
                                                             & vlSelf->Mult__DOT__fN_in1)
                                                             ? 0x13U
                                                             : 
                                                            ((4U 
                                                              & vlSelf->Mult__DOT__fN_in1)
                                                              ? 0x14U
                                                              : 
                                                             ((2U 
                                                               & vlSelf->Mult__DOT__fN_in1)
                                                               ? 0x15U
                                                               : 0x16U)))))))))))))))));
    Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->Mult__DOT__fN_in1 >> 0x1fU) ? (- vlSelf->Mult__DOT__fN_in1)
            : vlSelf->Mult__DOT__fN_in1);
    Mult__DOT__recFN_from_fN_in2_rawIn_isZero = (IData)(
                                                        (0U 
                                                         == 
                                                         (0x7fffffffU 
                                                          & vlSelf->Mult__DOT__fN_in2)));
    Mult__DOT___recFN_from_fN_in2_rawIn_normDist_T_39 
        = ((0x20000U & vlSelf->Mult__DOT__fN_in2) ? 5U
            : ((0x10000U & vlSelf->Mult__DOT__fN_in2)
                ? 6U : ((0x8000U & vlSelf->Mult__DOT__fN_in2)
                         ? 7U : ((0x4000U & vlSelf->Mult__DOT__fN_in2)
                                  ? 8U : ((0x2000U 
                                           & vlSelf->Mult__DOT__fN_in2)
                                           ? 9U : (
                                                   (0x1000U 
                                                    & vlSelf->Mult__DOT__fN_in2)
                                                    ? 0xaU
                                                    : 
                                                   ((0x800U 
                                                     & vlSelf->Mult__DOT__fN_in2)
                                                     ? 0xbU
                                                     : 
                                                    ((0x400U 
                                                      & vlSelf->Mult__DOT__fN_in2)
                                                      ? 0xcU
                                                      : 
                                                     ((0x200U 
                                                       & vlSelf->Mult__DOT__fN_in2)
                                                       ? 0xdU
                                                       : 
                                                      ((0x100U 
                                                        & vlSelf->Mult__DOT__fN_in2)
                                                        ? 0xeU
                                                        : 
                                                       ((0x80U 
                                                         & vlSelf->Mult__DOT__fN_in2)
                                                         ? 0xfU
                                                         : 
                                                        ((0x40U 
                                                          & vlSelf->Mult__DOT__fN_in2)
                                                          ? 0x10U
                                                          : 
                                                         ((0x20U 
                                                           & vlSelf->Mult__DOT__fN_in2)
                                                           ? 0x11U
                                                           : 
                                                          ((0x10U 
                                                            & vlSelf->Mult__DOT__fN_in2)
                                                            ? 0x12U
                                                            : 
                                                           ((8U 
                                                             & vlSelf->Mult__DOT__fN_in2)
                                                             ? 0x13U
                                                             : 
                                                            ((4U 
                                                              & vlSelf->Mult__DOT__fN_in2)
                                                              ? 0x14U
                                                              : 
                                                             ((2U 
                                                               & vlSelf->Mult__DOT__fN_in2)
                                                               ? 0x15U
                                                               : 0x16U)))))))))))))))));
    Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->Mult__DOT__fN_in2 >> 0x1fU) ? (- vlSelf->Mult__DOT__fN_in2)
            : vlSelf->Mult__DOT__fN_in2);
    vlSelf->Mult__DOT__recFNToIN__DOT__invalidExc = 
        ((IData)(Mult__DOT__recFNToIN__DOT__rawIn___05FisNaN) 
         | (IData)((0xc0000000ULL == (0xe0000000ULL 
                                      & vlSelf->Mult__DOT__mulRecFN_out))));
    vlSelf->Mult__DOT__recFNToIN__DOT__excSign = (1U 
                                                  & ((~ (IData)(Mult__DOT__recFNToIN__DOT__rawIn___05FisNaN)) 
                                                     & (IData)(
                                                               (vlSelf->Mult__DOT__mulRecFN_out 
                                                                >> 0x20U))));
    vlSelf->Mult__DOT__out_FP32_hi = ((0x100U & ((IData)(
                                                         (vlSelf->Mult__DOT__mulRecFN_out 
                                                          >> 0x20U)) 
                                                 << 8U)) 
                                      | (0xffU & ((
                                                   VL_GTS_III(1,10,10, 0x82U, 
                                                              (0x1ffU 
                                                               & (IData)(
                                                                         (vlSelf->Mult__DOT__mulRecFN_out 
                                                                          >> 0x17U))))
                                                    ? 0U
                                                    : 
                                                   ((0x1ffU 
                                                     & (IData)(
                                                               (vlSelf->Mult__DOT__mulRecFN_out 
                                                                >> 0x17U))) 
                                                    - (IData)(0x81U))) 
                                                  | (((IData)(
                                                              (0xe0000000ULL 
                                                               == 
                                                               (0xe0000000ULL 
                                                                & vlSelf->Mult__DOT__mulRecFN_out))) 
                                                      | (IData)(Mult__DOT__out_FP32_rawIn___05FisInf))
                                                      ? 0xffU
                                                      : 0U))));
    vlSelf->Mult__DOT__out_FP32_lo = (0x7fffffU & (
                                                   VL_GTS_III(1,10,10, 0x82U, 
                                                              (0x1ffU 
                                                               & (IData)(
                                                                         (vlSelf->Mult__DOT__mulRecFN_out 
                                                                          >> 0x17U))))
                                                    ? 
                                                   (0xffffffU 
                                                    & ((0xffffffU 
                                                        & (Mult__DOT__out_FP32_rawIn___05Fsig 
                                                           >> 1U)) 
                                                       >> 
                                                       (0x1fU 
                                                        & ((IData)(1U) 
                                                           - 
                                                           (0x1ffU 
                                                            & (IData)(
                                                                      (vlSelf->Mult__DOT__mulRecFN_out 
                                                                       >> 0x17U)))))))
                                                    : 
                                                   ((IData)(Mult__DOT__out_FP32_rawIn___05FisInf)
                                                     ? 0U
                                                     : Mult__DOT__out_FP32_rawIn___05Fsig)));
    Mult__DOT__recFNToIN__DOT__alignedSig = ((0x3fffffffeULL 
                                              & (Mult__DOT__recFNToIN__DOT__shiftedSig 
                                                 >> 0x15U)) 
                                             | (QData)((IData)(
                                                               (0U 
                                                                != 
                                                                (0x3fffffU 
                                                                 & (IData)(Mult__DOT__recFNToIN__DOT__shiftedSig))))));
    Mult__DOT__recFN_from_fN_in1_rawIn_normDist = (
                                                   (0x400000U 
                                                    & vlSelf->Mult__DOT__fN_in1)
                                                    ? 0U
                                                    : 
                                                   ((0x200000U 
                                                     & vlSelf->Mult__DOT__fN_in1)
                                                     ? 1U
                                                     : 
                                                    ((0x100000U 
                                                      & vlSelf->Mult__DOT__fN_in1)
                                                      ? 2U
                                                      : 
                                                     ((0x80000U 
                                                       & vlSelf->Mult__DOT__fN_in1)
                                                       ? 3U
                                                       : 
                                                      ((0x40000U 
                                                        & vlSelf->Mult__DOT__fN_in1)
                                                        ? 4U
                                                        : (IData)(Mult__DOT___recFN_from_fN_in1_rawIn_normDist_T_39))))));
    Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48 
        = ((0x20000U & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
            ? 0xeU : ((0x10000U & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                       ? 0xfU : ((0x8000U & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                  ? 0x10U : ((0x4000U 
                                              & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                              ? 0x11U
                                              : ((0x2000U 
                                                  & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 0x12U
                                                  : 
                                                 ((0x1000U 
                                                   & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 0x13U
                                                   : 
                                                  ((0x800U 
                                                    & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 0x14U
                                                    : 
                                                   ((0x400U 
                                                     & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 0x15U
                                                     : 
                                                    ((0x200U 
                                                      & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 0x16U
                                                      : 
                                                     ((0x100U 
                                                       & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 0x17U
                                                       : 
                                                      ((0x80U 
                                                        & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0x18U
                                                        : 
                                                       ((0x40U 
                                                         & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0x19U
                                                         : 
                                                        ((0x20U 
                                                          & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0x1aU
                                                          : 
                                                         ((0x10U 
                                                           & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0x1bU
                                                           : 
                                                          ((8U 
                                                            & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                            ? 0x1cU
                                                            : 
                                                           ((4U 
                                                             & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                             ? 0x1dU
                                                             : 
                                                            ((2U 
                                                              & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                              ? 0x1eU
                                                              : 0x1fU)))))))))))))))));
    Mult__DOT__recFN_from_fN_in2_rawIn_normDist = (
                                                   (0x400000U 
                                                    & vlSelf->Mult__DOT__fN_in2)
                                                    ? 0U
                                                    : 
                                                   ((0x200000U 
                                                     & vlSelf->Mult__DOT__fN_in2)
                                                     ? 1U
                                                     : 
                                                    ((0x100000U 
                                                      & vlSelf->Mult__DOT__fN_in2)
                                                      ? 2U
                                                      : 
                                                     ((0x80000U 
                                                       & vlSelf->Mult__DOT__fN_in2)
                                                       ? 3U
                                                       : 
                                                      ((0x40000U 
                                                        & vlSelf->Mult__DOT__fN_in2)
                                                        ? 4U
                                                        : (IData)(Mult__DOT___recFN_from_fN_in2_rawIn_normDist_T_39))))));
    Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48 
        = ((0x20000U & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
            ? 0xeU : ((0x10000U & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                       ? 0xfU : ((0x8000U & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                  ? 0x10U : ((0x4000U 
                                              & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                              ? 0x11U
                                              : ((0x2000U 
                                                  & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 0x12U
                                                  : 
                                                 ((0x1000U 
                                                   & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 0x13U
                                                   : 
                                                  ((0x800U 
                                                    & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 0x14U
                                                    : 
                                                   ((0x400U 
                                                     & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 0x15U
                                                     : 
                                                    ((0x200U 
                                                      & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 0x16U
                                                      : 
                                                     ((0x100U 
                                                       & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 0x17U
                                                       : 
                                                      ((0x80U 
                                                        & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0x18U
                                                        : 
                                                       ((0x40U 
                                                         & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0x19U
                                                         : 
                                                        ((0x20U 
                                                          & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0x1aU
                                                          : 
                                                         ((0x10U 
                                                           & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0x1bU
                                                           : 
                                                          ((8U 
                                                            & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                            ? 0x1cU
                                                            : 
                                                           ((4U 
                                                             & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                             ? 0x1dU
                                                             : 
                                                            ((2U 
                                                              & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                              ? 0x1eU
                                                              : 0x1fU)))))))))))))))));
    Mult__DOT__recFNToIN__DOT__complUnroundedInt = 
        ((1U & (IData)((vlSelf->Mult__DOT__mulRecFN_out 
                        >> 0x20U))) ? (~ (IData)((Mult__DOT__recFNToIN__DOT__alignedSig 
                                                  >> 2U)))
          : (IData)((Mult__DOT__recFNToIN__DOT__alignedSig 
                     >> 2U)));
    Mult__DOT__recFNToIN__DOT__common_inexact = ((0x100U 
                                                  & (IData)(
                                                            (vlSelf->Mult__DOT__mulRecFN_out 
                                                             >> 0x17U)))
                                                  ? 
                                                 (0U 
                                                  != 
                                                  (3U 
                                                   & (IData)(Mult__DOT__recFNToIN__DOT__alignedSig)))
                                                  : 
                                                 (0U 
                                                  != 
                                                  (7U 
                                                   & (IData)(
                                                             (vlSelf->Mult__DOT__mulRecFN_out 
                                                              >> 0x1dU)))));
    Mult__DOT__recFN_from_fN_in1_rawIn_adjustedExp 
        = (0x1ffU & (((0U == (0xffU & (vlSelf->Mult__DOT__fN_in1 
                                       >> 0x17U))) ? 
                      (~ (IData)(Mult__DOT__recFN_from_fN_in1_rawIn_normDist))
                       : (0xffU & (vlSelf->Mult__DOT__fN_in1 
                                   >> 0x17U))) + (0x80U 
                                                  | ((0U 
                                                      == 
                                                      (0xffU 
                                                       & (vlSelf->Mult__DOT__fN_in1 
                                                          >> 0x17U)))
                                                      ? 2U
                                                      : 1U))));
    Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist 
        = ((Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo 
            >> 0x1fU) ? 0U : ((0x40000000U & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                               ? 1U : ((0x20000000U 
                                        & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                        ? 2U : ((0x10000000U 
                                                 & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                 ? 3U
                                                 : 
                                                ((0x8000000U 
                                                  & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 4U
                                                  : 
                                                 ((0x4000000U 
                                                   & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 5U
                                                   : 
                                                  ((0x2000000U 
                                                    & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 6U
                                                    : 
                                                   ((0x1000000U 
                                                     & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 7U
                                                     : 
                                                    ((0x800000U 
                                                      & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 8U
                                                      : 
                                                     ((0x400000U 
                                                       & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 9U
                                                       : 
                                                      ((0x200000U 
                                                        & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0xaU
                                                        : 
                                                       ((0x100000U 
                                                         & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0xbU
                                                         : 
                                                        ((0x80000U 
                                                          & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0xcU
                                                          : 
                                                         ((0x40000U 
                                                           & Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0xdU
                                                           : (IData)(Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48)))))))))))))));
    Mult__DOT__recFN_from_fN_in2_rawIn_adjustedExp 
        = (0x1ffU & (((0U == (0xffU & (vlSelf->Mult__DOT__fN_in2 
                                       >> 0x17U))) ? 
                      (~ (IData)(Mult__DOT__recFN_from_fN_in2_rawIn_normDist))
                       : (0xffU & (vlSelf->Mult__DOT__fN_in2 
                                   >> 0x17U))) + (0x80U 
                                                  | ((0U 
                                                      == 
                                                      (0xffU 
                                                       & (vlSelf->Mult__DOT__fN_in2 
                                                          >> 0x17U)))
                                                      ? 2U
                                                      : 1U))));
    Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist 
        = ((Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo 
            >> 0x1fU) ? 0U : ((0x40000000U & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                               ? 1U : ((0x20000000U 
                                        & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                        ? 2U : ((0x10000000U 
                                                 & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                 ? 3U
                                                 : 
                                                ((0x8000000U 
                                                  & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                  ? 4U
                                                  : 
                                                 ((0x4000000U 
                                                   & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                   ? 5U
                                                   : 
                                                  ((0x2000000U 
                                                    & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                    ? 6U
                                                    : 
                                                   ((0x1000000U 
                                                     & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                     ? 7U
                                                     : 
                                                    ((0x800000U 
                                                      & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                      ? 8U
                                                      : 
                                                     ((0x400000U 
                                                       & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                       ? 9U
                                                       : 
                                                      ((0x200000U 
                                                        & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                        ? 0xaU
                                                        : 
                                                       ((0x100000U 
                                                         & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                         ? 0xbU
                                                         : 
                                                        ((0x80000U 
                                                          & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                          ? 0xcU
                                                          : 
                                                         ((0x40000U 
                                                           & Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)
                                                           ? 0xdU
                                                           : (IData)(Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48)))))))))))))));
    Mult__DOT__recFNToIN__DOT__roundIncr = (((((0U 
                                                == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                               & ((1U 
                                                   & (((IData)(
                                                               (vlSelf->Mult__DOT__mulRecFN_out 
                                                                >> 0x17U)) 
                                                       >> 8U) 
                                                      & ((3U 
                                                          == 
                                                          (3U 
                                                           & (IData)(
                                                                     (Mult__DOT__recFNToIN__DOT__alignedSig 
                                                                      >> 1U)))) 
                                                         | (3U 
                                                            == 
                                                            (3U 
                                                             & (IData)(Mult__DOT__recFNToIN__DOT__alignedSig)))))) 
                                                  | ((IData)(Mult__DOT__recFNToIN__DOT__magJustBelowOne) 
                                                     & (0U 
                                                        != 
                                                        (3U 
                                                         & (IData)(Mult__DOT__recFNToIN__DOT__alignedSig)))))) 
                                              | ((4U 
                                                  == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                                 & ((1U 
                                                     & (((IData)(
                                                                 (vlSelf->Mult__DOT__mulRecFN_out 
                                                                  >> 0x17U)) 
                                                         >> 8U) 
                                                        & (IData)(
                                                                  (Mult__DOT__recFNToIN__DOT__alignedSig 
                                                                   >> 1U)))) 
                                                    | (IData)(Mult__DOT__recFNToIN__DOT__magJustBelowOne)))) 
                                             | (((2U 
                                                  == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                                 | (6U 
                                                    == (IData)(vlSelf->Mult__DOT__round_mode))) 
                                                & ((IData)(
                                                           (vlSelf->Mult__DOT__mulRecFN_out 
                                                            >> 0x20U)) 
                                                   & (IData)(Mult__DOT__recFNToIN__DOT__common_inexact)))) 
                                            | ((3U 
                                                == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                               & ((~ (IData)(
                                                             (vlSelf->Mult__DOT__mulRecFN_out 
                                                              >> 0x20U))) 
                                                  & (IData)(Mult__DOT__recFNToIN__DOT__common_inexact))));
    vlSelf->Mult__DOT__recFN_from_fN_in1_lo = ((0x1f800000U 
                                                & ((IData)(Mult__DOT__recFN_from_fN_in1_rawIn_adjustedExp) 
                                                   << 0x17U)) 
                                               | (0x7fffffU 
                                                  & ((0U 
                                                      == 
                                                      (0xffU 
                                                       & (vlSelf->Mult__DOT__fN_in1 
                                                          >> 0x17U)))
                                                      ? 
                                                     (0x7ffffeU 
                                                      & ((IData)(
                                                                 (0x3fffffffffffffULL 
                                                                  & ((QData)((IData)(
                                                                                (0x7fffffU 
                                                                                & vlSelf->Mult__DOT__fN_in1))) 
                                                                     << (IData)(Mult__DOT__recFN_from_fN_in1_rawIn_normDist)))) 
                                                         << 1U))
                                                      : vlSelf->Mult__DOT__fN_in1)));
    vlSelf->Mult__DOT__recFN_from_fN_in1_hi = ((8U 
                                                & (vlSelf->Mult__DOT__fN_in1 
                                                   >> 0x1cU)) 
                                               | (7U 
                                                  & (((IData)(Mult__DOT__recFN_from_fN_in1_rawIn_isZero)
                                                       ? 0U
                                                       : 
                                                      ((IData)(Mult__DOT__recFN_from_fN_in1_rawIn_adjustedExp) 
                                                       >> 6U)) 
                                                     | ((3U 
                                                         == 
                                                         (3U 
                                                          & ((IData)(Mult__DOT__recFN_from_fN_in1_rawIn_adjustedExp) 
                                                             >> 7U))) 
                                                        & (0U 
                                                           != 
                                                           (0x7fffffU 
                                                            & vlSelf->Mult__DOT__fN_in1))))));
    vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)));
    vlSelf->Mult__DOT__recFN_from_fN_in2_lo = ((0x1f800000U 
                                                & ((IData)(Mult__DOT__recFN_from_fN_in2_rawIn_adjustedExp) 
                                                   << 0x17U)) 
                                               | (0x7fffffU 
                                                  & ((0U 
                                                      == 
                                                      (0xffU 
                                                       & (vlSelf->Mult__DOT__fN_in2 
                                                          >> 0x17U)))
                                                      ? 
                                                     (0x7ffffeU 
                                                      & ((IData)(
                                                                 (0x3fffffffffffffULL 
                                                                  & ((QData)((IData)(
                                                                                (0x7fffffU 
                                                                                & vlSelf->Mult__DOT__fN_in2))) 
                                                                     << (IData)(Mult__DOT__recFN_from_fN_in2_rawIn_normDist)))) 
                                                         << 1U))
                                                      : vlSelf->Mult__DOT__fN_in2)));
    vlSelf->Mult__DOT__recFN_from_fN_in2_hi = ((8U 
                                                & (vlSelf->Mult__DOT__fN_in2 
                                                   >> 0x1cU)) 
                                               | (7U 
                                                  & (((IData)(Mult__DOT__recFN_from_fN_in2_rawIn_isZero)
                                                       ? 0U
                                                       : 
                                                      ((IData)(Mult__DOT__recFN_from_fN_in2_rawIn_adjustedExp) 
                                                       >> 6U)) 
                                                     | ((3U 
                                                         == 
                                                         (3U 
                                                          & ((IData)(Mult__DOT__recFN_from_fN_in2_rawIn_adjustedExp) 
                                                             >> 7U))) 
                                                        & (0U 
                                                           != 
                                                           (0x7fffffU 
                                                            & vlSelf->Mult__DOT__fN_in2))))));
    vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)));
    vlSelf->Mult__DOT__recFNToIN__DOT__common_overflow 
        = (1U & (((IData)((vlSelf->Mult__DOT__mulRecFN_out 
                           >> 0x17U)) >> 8U) & ((0x20U 
                                                 <= 
                                                 (0xffU 
                                                  & (IData)(
                                                            (vlSelf->Mult__DOT__mulRecFN_out 
                                                             >> 0x17U)))) 
                                                | ((1U 
                                                    & (IData)(
                                                              (vlSelf->Mult__DOT__mulRecFN_out 
                                                               >> 0x20U)))
                                                    ? 
                                                   ((0x1fU 
                                                     == 
                                                     (0xffU 
                                                      & (IData)(
                                                                (vlSelf->Mult__DOT__mulRecFN_out 
                                                                 >> 0x17U)))) 
                                                    & ((0U 
                                                        != 
                                                        (0x7fffffffU 
                                                         & (IData)(
                                                                   (Mult__DOT__recFNToIN__DOT__alignedSig 
                                                                    >> 2U)))) 
                                                       | (IData)(Mult__DOT__recFNToIN__DOT__roundIncr)))
                                                    : 
                                                   ((0x1fU 
                                                     == 
                                                     (0xffU 
                                                      & (IData)(
                                                                (vlSelf->Mult__DOT__mulRecFN_out 
                                                                 >> 0x17U)))) 
                                                    | ((0x1eU 
                                                        == 
                                                        (0xffU 
                                                         & (IData)(
                                                                   (vlSelf->Mult__DOT__mulRecFN_out 
                                                                    >> 0x17U)))) 
                                                       & ((0x3fffffffU 
                                                           == 
                                                           (0x3fffffffU 
                                                            & (IData)(
                                                                      (Mult__DOT__recFNToIN__DOT__alignedSig 
                                                                       >> 2U)))) 
                                                          & (IData)(Mult__DOT__recFNToIN__DOT__roundIncr))))))));
    vlSelf->Mult__DOT__recFNToIN__DOT__roundedInt = 
        (((1U & ((IData)(Mult__DOT__recFNToIN__DOT__roundIncr) 
                 ^ (IData)((vlSelf->Mult__DOT__mulRecFN_out 
                            >> 0x20U)))) ? ((IData)(1U) 
                                            + Mult__DOT__recFNToIN__DOT__complUnroundedInt)
           : Mult__DOT__recFNToIN__DOT__complUnroundedInt) 
         | ((6U == (IData)(vlSelf->Mult__DOT__round_mode)) 
            & (IData)(Mult__DOT__recFNToIN__DOT__common_inexact)));
    Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
        = ((0x7fffffeU & ((IData)(((QData)((IData)(vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T)) 
                                   >> 7U)) << 1U)) 
           | (0U != (0x7fU & (IData)((QData)((IData)(vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T))))));
    Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
        = ((0x7fffffeU & ((IData)(((QData)((IData)(vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T)) 
                                   >> 7U)) << 1U)) 
           | (0U != (0x7fU & (IData)((QData)((IData)(vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T))))));
    Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = (IData)((0U != (3U & Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)));
    Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = (IData)((0U != (3U & Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)));
    vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & (((((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                            | (4U == (IData)(vlSelf->Mult__DOT__round_mode))) 
                           & (0U != (2U & Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                          | ((((2U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                               & (vlSelf->Mult__DOT__fN_in1 
                                  >> 0x1fU)) | ((3U 
                                                 == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                                & (~ 
                                                   (vlSelf->Mult__DOT__fN_in1 
                                                    >> 0x1fU)))) 
                             & (IData)(Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound)))
                          ? (((IData)(1U) + (0x1ffffffU 
                                             & (Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                                >> 2U))) 
                             & (~ ((((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                     & (0U != (2U & Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                                    & (~ (IData)((0U 
                                                  != 
                                                  (1U 
                                                   & Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)))))
                                    ? 1U : 0U))) : 
                         ((0x1ffffffU & (Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                         >> 2U)) | 
                          (((6U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                            & (IData)(Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound))
                            ? 1U : 0U))));
    vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & (((((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                            | (4U == (IData)(vlSelf->Mult__DOT__round_mode))) 
                           & (0U != (2U & Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                          | ((((2U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                               & (vlSelf->Mult__DOT__fN_in2 
                                  >> 0x1fU)) | ((3U 
                                                 == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                                & (~ 
                                                   (vlSelf->Mult__DOT__fN_in2 
                                                    >> 0x1fU)))) 
                             & (IData)(Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound)))
                          ? (((IData)(1U) + (0x1ffffffU 
                                             & (Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                                >> 2U))) 
                             & (~ ((((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                     & (0U != (2U & Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))) 
                                    & (~ (IData)((0U 
                                                  != 
                                                  (1U 
                                                   & Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)))))
                                    ? 1U : 0U))) : 
                         ((0x1ffffffU & (Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                         >> 2U)) | 
                          (((6U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                            & (IData)(Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound))
                            ? 1U : 0U))));
    vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi 
        = ((0x200U & (vlSelf->Mult__DOT__fN_in1 >> 0x16U)) 
           | (0x1ffU & (((0x7ffU & VL_EXTENDS_II(11,10, 
                                                 (0x1ffU 
                                                  & ((IData)(0xc0U) 
                                                     + 
                                                     (0x3ffU 
                                                      & VL_EXTENDS_II(10,9, 
                                                                      (0x40U 
                                                                       | (0x1fU 
                                                                          & (~ (IData)(Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)))))))))) 
                         + (0x7ffU & VL_EXTENDS_II(11,10, 
                                                   (3U 
                                                    & (vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                       >> 0x18U))))) 
                        & (~ ((1U & (IData)((vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
                                             >> 0x1fU)))
                               ? 0U : 0x1c0U)))));
    vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi 
        = ((0x200U & (vlSelf->Mult__DOT__fN_in2 >> 0x16U)) 
           | (0x1ffU & (((0x7ffU & VL_EXTENDS_II(11,10, 
                                                 (0x1ffU 
                                                  & ((IData)(0xc0U) 
                                                     + 
                                                     (0x3ffU 
                                                      & VL_EXTENDS_II(10,9, 
                                                                      (0x40U 
                                                                       | (0x1fU 
                                                                          & (~ (IData)(Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)))))))))) 
                         + (0x7ffU & VL_EXTENDS_II(11,10, 
                                                   (3U 
                                                    & (vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                       >> 0x18U))))) 
                        & (~ ((1U & (IData)((vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
                                             >> 0x1fU)))
                               ? 0U : 0x1c0U)))));
}

VL_INLINE_OPT void VMult___024root___combo__TOP__3(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___combo__TOP__3\n"); );
    // Init
    QData/*32:0*/ Mult__DOT__mulRecFN_io_a;
    QData/*32:0*/ Mult__DOT__mulRecFN_io_b;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isNaN;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isInf;
    IData/*24:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_sig;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isNaN;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isInf;
    IData/*24:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_sig;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isInf;
    SData/*9:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2;
    QData/*49:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sigOut_T;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp;
    SData/*15:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12;
    SData/*15:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22;
    SData/*15:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32;
    IData/*24:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55;
    IData/*24:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9;
    IData/*26:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask;
    IData/*26:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T;
    IData/*26:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp;
    VlWide<3>/*95:0*/ __Vtemp46;
    VlWide<3>/*95:0*/ __Vtemp47;
    VlWide<3>/*95:0*/ __Vtemp50;
    VlWide<3>/*95:0*/ __Vtemp51;
    VlWide<3>/*95:0*/ __Vtemp54;
    VlWide<3>/*95:0*/ __Vtemp55;
    VlWide<3>/*95:0*/ __Vtemp58;
    VlWide<3>/*95:0*/ __Vtemp59;
    VlWide<3>/*95:0*/ __Vtemp62;
    VlWide<3>/*95:0*/ __Vtemp63;
    VlWide<3>/*95:0*/ __Vtemp66;
    VlWide<3>/*95:0*/ __Vtemp67;
    VlWide<3>/*95:0*/ __Vtemp70;
    VlWide<3>/*95:0*/ __Vtemp71;
    VlWide<3>/*95:0*/ __Vtemp74;
    VlWide<3>/*95:0*/ __Vtemp75;
    VlWide<3>/*95:0*/ __Vtemp78;
    VlWide<3>/*95:0*/ __Vtemp79;
    VlWide<3>/*95:0*/ __Vtemp82;
    VlWide<3>/*95:0*/ __Vtemp83;
    VlWide<3>/*95:0*/ __Vtemp86;
    VlWide<3>/*95:0*/ __Vtemp87;
    // Body
    if (vlSelf->io_useINT) {
        Mult__DOT__mulRecFN_io_a = vlSelf->Mult__DOT__iNToRecFN_1_out;
        Mult__DOT__mulRecFN_io_b = vlSelf->Mult__DOT__iNToRecFN_2_out;
    } else {
        Mult__DOT__mulRecFN_io_a = vlSelf->Mult__DOT__recFN_from_fN_in1;
        Mult__DOT__mulRecFN_io_b = vlSelf->Mult__DOT__recFN_from_fN_in2;
    }
    Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isNaN 
        = (IData)((0xe0000000ULL == (0xe0000000ULL 
                                     & Mult__DOT__mulRecFN_io_a)));
    Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isInf 
        = (IData)((0xc0000000ULL == (0xe0000000ULL 
                                     & Mult__DOT__mulRecFN_io_a)));
    Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_sig 
        = (((0U != (7U & (IData)((Mult__DOT__mulRecFN_io_a 
                                  >> 0x1dU)))) << 0x17U) 
           | (0x7fffffU & (IData)(Mult__DOT__mulRecFN_io_a)));
    vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isZero 
        = ((0U == (7U & (IData)((Mult__DOT__mulRecFN_io_a 
                                 >> 0x1dU)))) | (0U 
                                                 == 
                                                 (7U 
                                                  & (IData)(
                                                            (Mult__DOT__mulRecFN_io_b 
                                                             >> 0x1dU)))));
    Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isNaN 
        = (IData)((0xe0000000ULL == (0xe0000000ULL 
                                     & Mult__DOT__mulRecFN_io_b)));
    Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isInf 
        = (IData)((0xc0000000ULL == (0xe0000000ULL 
                                     & Mult__DOT__mulRecFN_io_b)));
    vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_sign 
        = (1U & ((IData)((Mult__DOT__mulRecFN_io_a 
                          >> 0x20U)) ^ (IData)((Mult__DOT__mulRecFN_io_b 
                                                >> 0x20U))));
    Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_sig 
        = (((0U != (7U & (IData)((Mult__DOT__mulRecFN_io_b 
                                  >> 0x1dU)))) << 0x17U) 
           | (0x7fffffU & (IData)(Mult__DOT__mulRecFN_io_b)));
    Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2 
        = (0x3ffU & ((0x1ffU & (IData)((Mult__DOT__mulRecFN_io_a 
                                        >> 0x17U))) 
                     + (0x1ffU & (IData)((Mult__DOT__mulRecFN_io_b 
                                          >> 0x17U)))));
    Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isInf 
        = ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isInf) 
           | (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isInf));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp 
        = (((2U == (IData)(vlSelf->Mult__DOT__round_mode)) 
            & (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_sign)) 
           | ((3U == (IData)(vlSelf->Mult__DOT__round_mode)) 
              & (~ (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_sign))));
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut 
        = (((((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isNaN) 
              & (~ (Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_sig 
                    >> 0x16U))) | ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isNaN) 
                                   & (~ (Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_sig 
                                         >> 0x16U)))) 
            | (((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isInf) 
                & (0U == (7U & (IData)((Mult__DOT__mulRecFN_io_b 
                                        >> 0x1dU))))) 
               | ((0U == (7U & (IData)((Mult__DOT__mulRecFN_io_a 
                                        >> 0x1dU)))) 
                  & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isInf)))) 
           | ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_isNaN) 
              | (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_isNaN)));
    Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sigOut_T 
        = (0x3ffffffffffffULL & ((QData)((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_a_sig)) 
                                 * (QData)((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_b_sig))));
    __Vtemp46[0U] = 0U;
    __Vtemp46[1U] = 0U;
    __Vtemp46[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp47, __Vtemp46, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp50[0U] = 0U;
    __Vtemp50[1U] = 0U;
    __Vtemp50[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp51, __Vtemp50, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12 
        = ((0xffU & (__Vtemp47[1U] >> 0x12U)) | (0xff00U 
                                                 & (__Vtemp51[1U] 
                                                    >> 2U)));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp 
        = (((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
            | (4U == (IData)(vlSelf->Mult__DOT__round_mode))) 
           | (IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase 
        = (1U & (((~ (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)) 
                  & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isInf))) 
                 & (~ (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isZero))));
    vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
        = ((0x7fffffeU & ((IData)((Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sigOut_T 
                                   >> 0x16U)) << 1U)) 
           | (0U != (0x3fffffU & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sigOut_T))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22 
        = ((0xf0fU & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12) 
                      >> 4U)) | (0xf0f0U & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12) 
                                            << 4U)));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32 
        = ((0x3333U & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                       >> 2U)) | (0xccccU & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                                             << 2U)));
    __Vtemp54[0U] = 0U;
    __Vtemp54[1U] = 0U;
    __Vtemp54[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp55, __Vtemp54, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp58[0U] = 0U;
    __Vtemp58[1U] = 0U;
    __Vtemp58[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp59, __Vtemp58, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp62[0U] = 0U;
    __Vtemp62[1U] = 0U;
    __Vtemp62[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp63, __Vtemp62, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp66[0U] = 0U;
    __Vtemp66[1U] = 0U;
    __Vtemp66[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp67, __Vtemp66, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp70[0U] = 0U;
    __Vtemp70[1U] = 0U;
    __Vtemp70[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp71, __Vtemp70, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp74[0U] = 0U;
    __Vtemp74[1U] = 0U;
    __Vtemp74[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp75, __Vtemp74, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp78[0U] = 0U;
    __Vtemp78[1U] = 0U;
    __Vtemp78[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp79, __Vtemp78, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp82[0U] = 0U;
    __Vtemp82[1U] = 0U;
    __Vtemp82[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp83, __Vtemp82, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp86[0U] = 0U;
    __Vtemp86[1U] = 0U;
    __Vtemp86[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp87, __Vtemp86, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55 
        = ((0x80U & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))
            ? ((0x40U & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))
                ? 0U : ((4U & (__Vtemp55[0U] << 2U)) 
                        | ((2U & __Vtemp59[0U]) | (1U 
                                                   & (__Vtemp63[0U] 
                                                      >> 2U)))))
            : (7U | (0x1fffff8U & ((~ ((0x40U & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))
                                        ? (~ (((0x155540U 
                                                & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
                                                   << 5U)) 
                                               | (0x2aaa80U 
                                                  & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
                                                     << 7U))) 
                                              | ((0x20U 
                                                  & (__Vtemp67[1U] 
                                                     >> 0x15U)) 
                                                 | ((0x10U 
                                                     & (__Vtemp71[1U] 
                                                        >> 0x17U)) 
                                                    | ((8U 
                                                        & (__Vtemp75[1U] 
                                                           >> 0x19U)) 
                                                       | ((4U 
                                                           & (__Vtemp79[1U] 
                                                              >> 0x1bU)) 
                                                          | ((2U 
                                                              & (__Vtemp83[1U] 
                                                                 >> 0x1dU)) 
                                                             | (__Vtemp87[1U] 
                                                                >> 0x1fU))))))))
                                        : 0U)) << 3U))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
        = (((0x100U & ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2) 
                       - (IData)(0x100U))) ? 0U : Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55) 
           | (1U & (vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
                    >> 0x1aU)));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T 
        = (vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
           & (1U | (Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                    << 1U)));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask 
        = ((~ (1U | (Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                     << 1U))) & (3U | (Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                       << 2U)));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T 
        = (vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
           & Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask);
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = ((0U != Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T) 
           | (0U != Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T));
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & (((((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                            | (4U == (IData)(vlSelf->Mult__DOT__round_mode))) 
                           & (0U != Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T)) 
                          | ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp) 
                             & (IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound)))
                          ? (((IData)(1U) + (0x1ffffffU 
                                             & ((vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
                                                 >> 2U) 
                                                | (0x3fffffffU 
                                                   & Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9)))) 
                             & (~ ((((0U == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                     & (0U != Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundPosBit_T)) 
                                    & (~ (IData)((0U 
                                                  != Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___anyRoundExtra_T))))
                                    ? (1U | (Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                             << 1U))
                                    : 0U))) : ((0x1ffffffU 
                                                & ((vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
                                                    & (~ 
                                                       (3U 
                                                        | (Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                                           << 2U)))) 
                                                   >> 2U)) 
                                               | (((6U 
                                                    == (IData)(vlSelf->Mult__DOT__round_mode)) 
                                                   & (IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__anyRound))
                                                   ? 
                                                  (Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundPosMask 
                                                   >> 1U)
                                                   : 0U))));
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp 
        = (0x7ffU & (VL_EXTENDS_II(11,10, (0x3ffU & 
                                           ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2) 
                                            - (IData)(0x100U)))) 
                     + VL_EXTENDS_II(11,10, (3U & (vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                   >> 0x18U)))));
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut 
        = (((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase) 
            & VL_GTS_III(1,11,11, 0x6bU, (IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp))) 
           & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMagUp) 
              | (6U == (IData)(vlSelf->Mult__DOT__round_mode))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow 
        = ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__commonCase) 
           & VL_LTES_III(1,4,4, 3U, (0xfU & ((IData)(vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp) 
                                             >> 7U))));
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut 
        = ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow) 
           & (~ (IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp)));
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut 
        = ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isInf) 
           | ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow) 
              & (IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__overflow_roundMagUp)));
}

void VMult___024root___eval(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VMult___024root___sequent__TOP__1(vlSelf);
    }
    VMult___024root___combo__TOP__3(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VMult___024root___change_request_1(VMult___024root* vlSelf);

VL_INLINE_OPT QData VMult___024root___change_request(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___change_request\n"); );
    // Body
    return (VMult___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VMult___024root___change_request_1(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VMult___024root___eval_debug_assertions(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_useINT & 0xfeU))) {
        Verilated::overWidthError("io_useINT");}
    if (VL_UNLIKELY((vlSelf->io_round & 0xf8U))) {
        Verilated::overWidthError("io_round");}
}
#endif  // VL_DEBUG
