// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VMult.h for the primary calling header

#include "VMult___024root.h"
#include "VMult__Syms.h"

void VMult___024root___ctor_var_reset(VMult___024root* vlSelf);

VMult___024root::VMult___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VMult___024root___ctor_var_reset(this);
}

void VMult___024root::__Vconfigure(VMult__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VMult___024root::~VMult___024root() {
}

void VMult___024root___settle__TOP__2(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___settle__TOP__2\n"); );
    // Init
    QData/*32:0*/ Mult__DOT__mulRecFN_io_a;
    QData/*32:0*/ Mult__DOT__mulRecFN_io_b;
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
    vlSelf->io_out = (QData)((IData)(((IData)(vlSelf->Mult__DOT__useINT_sel)
                                       ? vlSelf->Mult__DOT__recFNToIN_out
                                       : vlSelf->Mult__DOT__out_FP32)));
    Mult__DOT__recFN_from_fN_in1_rawIn_isZero = (IData)(
                                                        (0U 
                                                         == 
                                                         (0x7fffffffU 
                                                          & vlSelf->Mult__DOT__fN_in1)));
    Mult__DOT__recFN_from_fN_in2_rawIn_isZero = (IData)(
                                                        (0U 
                                                         == 
                                                         (0x7fffffffU 
                                                          & vlSelf->Mult__DOT__fN_in2)));
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
    Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->Mult__DOT__fN_in1 >> 0x1fU) ? (- vlSelf->Mult__DOT__fN_in1)
            : vlSelf->Mult__DOT__fN_in1);
    Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->Mult__DOT__fN_in2 >> 0x1fU) ? (- vlSelf->Mult__DOT__fN_in2)
            : vlSelf->Mult__DOT__fN_in2);
    if (vlSelf->io_useINT) {
        Mult__DOT__mulRecFN_io_a = vlSelf->Mult__DOT__iNToRecFN_1_out;
        Mult__DOT__mulRecFN_io_b = vlSelf->Mult__DOT__iNToRecFN_2_out;
    } else {
        Mult__DOT__mulRecFN_io_a = vlSelf->Mult__DOT__recFN_from_fN_in1;
        Mult__DOT__mulRecFN_io_b = vlSelf->Mult__DOT__recFN_from_fN_in2;
    }
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
    Mult__DOT__recFNToIN__DOT__alignedSig = ((0x3fffffffeULL 
                                              & (Mult__DOT__recFNToIN__DOT__shiftedSig 
                                                 >> 0x15U)) 
                                             | (QData)((IData)(
                                                               (0U 
                                                                != 
                                                                (0x3fffffU 
                                                                 & (IData)(Mult__DOT__recFNToIN__DOT__shiftedSig))))));
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
    __Vtemp2[0U] = 0U;
    __Vtemp2[1U] = 0U;
    __Vtemp2[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp3, __Vtemp2, (0x3fU 
                                                 & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp6[0U] = 0U;
    __Vtemp6[1U] = 0U;
    __Vtemp6[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp7, __Vtemp6, (0x3fU 
                                                 & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12 
        = ((0xffU & (__Vtemp3[1U] >> 0x12U)) | (0xff00U 
                                                & (__Vtemp7[1U] 
                                                   >> 2U)));
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
    vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(Mult__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)));
    vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(Mult__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)));
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
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32 
        = ((0x3333U & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                       >> 2U)) | (0xccccU & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                                             << 2U)));
    Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = (IData)((0U != (3U & Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)));
    Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__anyRound 
        = (IData)((0U != (3U & Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig)));
    __Vtemp10[0U] = 0U;
    __Vtemp10[1U] = 0U;
    __Vtemp10[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp11, __Vtemp10, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp14[0U] = 0U;
    __Vtemp14[1U] = 0U;
    __Vtemp14[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp15, __Vtemp14, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp18[0U] = 0U;
    __Vtemp18[1U] = 0U;
    __Vtemp18[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp19, __Vtemp18, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp22[0U] = 0U;
    __Vtemp22[1U] = 0U;
    __Vtemp22[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp23, __Vtemp22, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp26[0U] = 0U;
    __Vtemp26[1U] = 0U;
    __Vtemp26[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp27, __Vtemp26, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp30[0U] = 0U;
    __Vtemp30[1U] = 0U;
    __Vtemp30[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp31, __Vtemp30, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp34[0U] = 0U;
    __Vtemp34[1U] = 0U;
    __Vtemp34[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp35, __Vtemp34, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp38[0U] = 0U;
    __Vtemp38[1U] = 0U;
    __Vtemp38[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp39, __Vtemp38, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    __Vtemp42[0U] = 0U;
    __Vtemp42[1U] = 0U;
    __Vtemp42[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp43, __Vtemp42, (0x3fU 
                                                   & (~ (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))));
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55 
        = ((0x80U & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))
            ? ((0x40U & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))
                ? 0U : ((4U & (__Vtemp11[0U] << 2U)) 
                        | ((2U & __Vtemp15[0U]) | (1U 
                                                   & (__Vtemp19[0U] 
                                                      >> 2U)))))
            : (7U | (0x1fffff8U & ((~ ((0x40U & (IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2))
                                        ? (~ (((0x155540U 
                                                & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
                                                   << 5U)) 
                                               | (0x2aaa80U 
                                                  & ((IData)(Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
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
    Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
        = (((0x100U & ((IData)(Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw__DOT___common_sExpOut_T_2) 
                       - (IData)(0x100U))) ? 0U : Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55) 
           | (1U & (vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig 
                    >> 0x1aU)));
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

void VMult___024root___eval_initial(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void VMult___024root___eval_settle(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___eval_settle\n"); );
    // Body
    VMult___024root___settle__TOP__2(vlSelf);
}

void VMult___024root___final(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___final\n"); );
}

void VMult___024root___ctor_var_reset(VMult___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMult__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMult___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_in1 = VL_RAND_RESET_I(32);
    vlSelf->io_in2 = VL_RAND_RESET_I(32);
    vlSelf->io_useINT = VL_RAND_RESET_I(1);
    vlSelf->io_round = VL_RAND_RESET_I(3);
    vlSelf->io_out = VL_RAND_RESET_Q(33);
    vlSelf->Mult__DOT__useINT_sel = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__round_mode = VL_RAND_RESET_I(3);
    vlSelf->Mult__DOT__fN_in1 = VL_RAND_RESET_I(32);
    vlSelf->Mult__DOT__fN_in2 = VL_RAND_RESET_I(32);
    vlSelf->Mult__DOT__iNToRecFN_1_out = VL_RAND_RESET_Q(33);
    vlSelf->Mult__DOT__iNToRecFN_2_out = VL_RAND_RESET_Q(33);
    vlSelf->Mult__DOT__recFN_from_fN_in1_lo = VL_RAND_RESET_I(29);
    vlSelf->Mult__DOT__recFN_from_fN_in1_hi = VL_RAND_RESET_I(4);
    vlSelf->Mult__DOT__recFN_from_fN_in1 = VL_RAND_RESET_Q(33);
    vlSelf->Mult__DOT__recFN_from_fN_in2_lo = VL_RAND_RESET_I(29);
    vlSelf->Mult__DOT__recFN_from_fN_in2_hi = VL_RAND_RESET_I(4);
    vlSelf->Mult__DOT__recFN_from_fN_in2 = VL_RAND_RESET_Q(33);
    vlSelf->Mult__DOT__mulRecFN_out = VL_RAND_RESET_Q(33);
    vlSelf->Mult__DOT__recFNToIN_out = VL_RAND_RESET_I(32);
    vlSelf->Mult__DOT__out_FP32_lo = VL_RAND_RESET_I(23);
    vlSelf->Mult__DOT__out_FP32_hi = VL_RAND_RESET_I(9);
    vlSelf->Mult__DOT__out_FP32 = VL_RAND_RESET_I(32);
    vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig = VL_RAND_RESET_I(27);
    vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isZero = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_sign = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig = VL_RAND_RESET_I(26);
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp = VL_RAND_RESET_I(11);
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T = VL_RAND_RESET_Q(63);
    vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig = VL_RAND_RESET_I(26);
    vlSelf->Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi = VL_RAND_RESET_I(10);
    vlSelf->Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T = VL_RAND_RESET_Q(63);
    vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig = VL_RAND_RESET_I(26);
    vlSelf->Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi = VL_RAND_RESET_I(10);
    vlSelf->Mult__DOT__recFNToIN__DOT__roundedInt = VL_RAND_RESET_I(32);
    vlSelf->Mult__DOT__recFNToIN__DOT__common_overflow = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__recFNToIN__DOT__invalidExc = VL_RAND_RESET_I(1);
    vlSelf->Mult__DOT__recFNToIN__DOT__excSign = VL_RAND_RESET_I(1);
}
