// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAddSub.h for the primary calling header

#include "VAddSub___024root.h"
#include "VAddSub__Syms.h"

VL_INLINE_OPT void VAddSub___024root___sequent__TOP__1(VAddSub___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub___024root___sequent__TOP__1\n"); );
    // Init
    CData/*4:0*/ AddSub__DOT___recFN_from_fN_in1_rawIn_normDist_T_39;
    CData/*4:0*/ AddSub__DOT__recFN_from_fN_in1_rawIn_normDist;
    SData/*8:0*/ AddSub__DOT__recFN_from_fN_in1_rawIn_adjustedExp;
    CData/*0:0*/ AddSub__DOT__recFN_from_fN_in1_rawIn_isZero;
    CData/*4:0*/ AddSub__DOT___recFN_from_fN_in2_rawIn_normDist_T_39;
    CData/*4:0*/ AddSub__DOT__recFN_from_fN_in2_rawIn_normDist;
    SData/*8:0*/ AddSub__DOT__recFN_from_fN_in2_rawIn_adjustedExp;
    CData/*0:0*/ AddSub__DOT__recFN_from_fN_in2_rawIn_isZero;
    CData/*0:0*/ AddSub__DOT__out_IEEE_FP32_rawIn___05FisInf;
    IData/*24:0*/ AddSub__DOT__out_IEEE_FP32_rawIn___05Fsig;
    IData/*31:0*/ AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_adjustedNormDist_T_48;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist;
    IData/*26:0*/ AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig;
    IData/*31:0*/ AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_adjustedNormDist_T_48;
    CData/*4:0*/ AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist;
    IData/*26:0*/ AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig;
    CData/*0:0*/ AddSub__DOT__recFNToIN__DOT__rawIn___05FisNaN;
    QData/*54:0*/ AddSub__DOT__recFNToIN__DOT__shiftedSig;
    QData/*33:0*/ AddSub__DOT__recFNToIN__DOT__alignedSig;
    CData/*0:0*/ AddSub__DOT__recFNToIN__DOT__roundIncr_near_maxMag;
    IData/*31:0*/ AddSub__DOT__recFNToIN__DOT__complUnroundedInt;
    // Body
    vlSelf->AddSub__DOT__op_sel = vlSelf->io_op;
    vlSelf->AddSub__DOT__fN_in1 = vlSelf->io_in1;
    vlSelf->AddSub__DOT__fN_in2 = vlSelf->io_in2;
    vlSelf->AddSub__DOT__iNToRecFN_1_out = (((QData)((IData)(vlSelf->AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi)) 
                                             << 0x17U) 
                                            | (QData)((IData)(
                                                              ((1U 
                                                                & (IData)(
                                                                          (vlSelf->AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
                                                                           >> 0x1fU)))
                                                                ? 
                                                               (0x7fffffU 
                                                                & vlSelf->AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)
                                                                : 0U))));
    vlSelf->AddSub__DOT__iNToRecFN_2_out = (((QData)((IData)(vlSelf->AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi)) 
                                             << 0x17U) 
                                            | (QData)((IData)(
                                                              ((1U 
                                                                & (IData)(
                                                                          (vlSelf->AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
                                                                           >> 0x1fU)))
                                                                ? 
                                                               (0x7fffffU 
                                                                & vlSelf->AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)
                                                                : 0U))));
    vlSelf->AddSub__DOT__recFN_from_fN_in1 = (((QData)((IData)(vlSelf->AddSub__DOT__recFN_from_fN_in1_hi)) 
                                               << 0x1dU) 
                                              | (QData)((IData)(vlSelf->AddSub__DOT__recFN_from_fN_in1_lo)));
    vlSelf->AddSub__DOT__recFN_from_fN_in2 = (((QData)((IData)(vlSelf->AddSub__DOT__recFN_from_fN_in2_hi)) 
                                               << 0x1dU) 
                                              | (QData)((IData)(vlSelf->AddSub__DOT__recFN_from_fN_in2_lo)));
    vlSelf->AddSub__DOT__addRecFN_out = (((QData)((IData)(
                                                          (1U 
                                                           & ((~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)) 
                                                              & ((((((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns) 
                                                                     & (IData)(
                                                                               (vlSelf->AddSub__DOT__addRecFN_io_a 
                                                                                >> 0x20U))) 
                                                                    | ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf) 
                                                                       & (IData)(
                                                                                (vlSelf->AddSub__DOT__addRecFN_io_a 
                                                                                >> 0x20U)))) 
                                                                   | ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf) 
                                                                      & (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB))) 
                                                                  | ((((~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase)) 
                                                                       & (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)) 
                                                                      & (0U 
                                                                         != 
                                                                         (3U 
                                                                          & (IData)(
                                                                                (vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
                                                                                >> 0x18U))))) 
                                                                     & ((IData)(
                                                                                (vlSelf->AddSub__DOT__addRecFN_io_a 
                                                                                >> 0x20U)) 
                                                                        ^ 
                                                                        VL_GTS_III(1,27,27, 0U, vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum)))) 
                                                                 | (((~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase)) 
                                                                     & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags))) 
                                                                    & (VL_GTS_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                                                                        ? (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB)
                                                                        : (IData)(
                                                                                (vlSelf->AddSub__DOT__addRecFN_io_a 
                                                                                >> 0x20U))))))))) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           (((((((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp) 
                                                                 & (~ 
                                                                    (((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero) 
                                                                      | VL_GTS_III(1,11,11, 0x6bU, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp)))
                                                                      ? 0x1c0U
                                                                      : 0U))) 
                                                                & (~ 
                                                                   ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut)
                                                                     ? 0x40U
                                                                     : 0U))) 
                                                               | ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut)
                                                                   ? 0x180U
                                                                   : 0U)) 
                                                              | ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)
                                                                  ? 0x1c0U
                                                                  : 0U)) 
                                                             << 0x17U) 
                                                            | (0x7fffffU 
                                                               & ((((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut) 
                                                                    | (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero)) 
                                                                   | VL_GTS_III(1,11,11, 0x6bU, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp)))
                                                                   ? 
                                                                  ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)
                                                                    ? 0x400000U
                                                                    : 0U)
                                                                   : 
                                                                  ((0x4000000U 
                                                                    & vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig)
                                                                    ? 
                                                                   (vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                                    >> 1U)
                                                                    : vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig)))))));
    vlSelf->AddSub__DOT__recFNToIN_out = (((IData)(vlSelf->AddSub__DOT__recFNToIN__DOT__invalidExc) 
                                           | (IData)(vlSelf->AddSub__DOT__recFNToIN__DOT__common_overflow))
                                           ? (((IData)(vlSelf->AddSub__DOT__recFNToIN__DOT__excSign)
                                                ? 0x80000000U
                                                : 0U) 
                                              | ((IData)(vlSelf->AddSub__DOT__recFNToIN__DOT__excSign)
                                                  ? 0U
                                                  : 0x7fffffffU))
                                           : vlSelf->AddSub__DOT__recFNToIN__DOT__roundedInt);
    vlSelf->AddSub__DOT__out_IEEE_FP32 = (((IData)(vlSelf->AddSub__DOT__out_IEEE_FP32_hi) 
                                           << 0x17U) 
                                          | vlSelf->AddSub__DOT__out_IEEE_FP32_lo);
    AddSub__DOT__out_IEEE_FP32_rawIn___05Fsig = (((0U 
                                                   != 
                                                   (7U 
                                                    & (IData)(
                                                              (vlSelf->AddSub__DOT__addRecFN_out 
                                                               >> 0x1dU)))) 
                                                  << 0x17U) 
                                                 | (0x7fffffU 
                                                    & (IData)(vlSelf->AddSub__DOT__addRecFN_out)));
    AddSub__DOT__recFNToIN__DOT__rawIn___05FisNaN = (IData)(
                                                            (0xe0000000ULL 
                                                             == 
                                                             (0xe0000000ULL 
                                                              & vlSelf->AddSub__DOT__addRecFN_out)));
    AddSub__DOT__out_IEEE_FP32_rawIn___05FisInf = (IData)(
                                                          (0xc0000000ULL 
                                                           == 
                                                           (0xe0000000ULL 
                                                            & vlSelf->AddSub__DOT__addRecFN_out)));
    AddSub__DOT__recFNToIN__DOT__shiftedSig = (0x7fffffffffffffULL 
                                               & ((QData)((IData)(
                                                                  ((0x800000U 
                                                                    & ((IData)(
                                                                               (vlSelf->AddSub__DOT__addRecFN_out 
                                                                                >> 0x17U)) 
                                                                       << 0xfU)) 
                                                                   | (0x7fffffU 
                                                                      & (IData)(vlSelf->AddSub__DOT__addRecFN_out))))) 
                                                  << 
                                                  ((0x100U 
                                                    & (IData)(
                                                              (vlSelf->AddSub__DOT__addRecFN_out 
                                                               >> 0x17U)))
                                                    ? 
                                                   (0x1fU 
                                                    & (IData)(
                                                              (vlSelf->AddSub__DOT__addRecFN_out 
                                                               >> 0x17U)))
                                                    : 0U)));
    AddSub__DOT__recFN_from_fN_in1_rawIn_isZero = (IData)(
                                                          (0U 
                                                           == 
                                                           (0x7fffffffU 
                                                            & vlSelf->AddSub__DOT__fN_in1)));
    AddSub__DOT___recFN_from_fN_in1_rawIn_normDist_T_39 
        = ((0x20000U & vlSelf->AddSub__DOT__fN_in1)
            ? 5U : ((0x10000U & vlSelf->AddSub__DOT__fN_in1)
                     ? 6U : ((0x8000U & vlSelf->AddSub__DOT__fN_in1)
                              ? 7U : ((0x4000U & vlSelf->AddSub__DOT__fN_in1)
                                       ? 8U : ((0x2000U 
                                                & vlSelf->AddSub__DOT__fN_in1)
                                                ? 9U
                                                : (
                                                   (0x1000U 
                                                    & vlSelf->AddSub__DOT__fN_in1)
                                                    ? 0xaU
                                                    : 
                                                   ((0x800U 
                                                     & vlSelf->AddSub__DOT__fN_in1)
                                                     ? 0xbU
                                                     : 
                                                    ((0x400U 
                                                      & vlSelf->AddSub__DOT__fN_in1)
                                                      ? 0xcU
                                                      : 
                                                     ((0x200U 
                                                       & vlSelf->AddSub__DOT__fN_in1)
                                                       ? 0xdU
                                                       : 
                                                      ((0x100U 
                                                        & vlSelf->AddSub__DOT__fN_in1)
                                                        ? 0xeU
                                                        : 
                                                       ((0x80U 
                                                         & vlSelf->AddSub__DOT__fN_in1)
                                                         ? 0xfU
                                                         : 
                                                        ((0x40U 
                                                          & vlSelf->AddSub__DOT__fN_in1)
                                                          ? 0x10U
                                                          : 
                                                         ((0x20U 
                                                           & vlSelf->AddSub__DOT__fN_in1)
                                                           ? 0x11U
                                                           : 
                                                          ((0x10U 
                                                            & vlSelf->AddSub__DOT__fN_in1)
                                                            ? 0x12U
                                                            : 
                                                           ((8U 
                                                             & vlSelf->AddSub__DOT__fN_in1)
                                                             ? 0x13U
                                                             : 
                                                            ((4U 
                                                              & vlSelf->AddSub__DOT__fN_in1)
                                                              ? 0x14U
                                                              : 
                                                             ((2U 
                                                               & vlSelf->AddSub__DOT__fN_in1)
                                                               ? 0x15U
                                                               : 0x16U)))))))))))))))));
    AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->AddSub__DOT__fN_in1 >> 0x1fU) ? 
           (- vlSelf->AddSub__DOT__fN_in1) : vlSelf->AddSub__DOT__fN_in1);
    AddSub__DOT__recFN_from_fN_in2_rawIn_isZero = (IData)(
                                                          (0U 
                                                           == 
                                                           (0x7fffffffU 
                                                            & vlSelf->AddSub__DOT__fN_in2)));
    AddSub__DOT___recFN_from_fN_in2_rawIn_normDist_T_39 
        = ((0x20000U & vlSelf->AddSub__DOT__fN_in2)
            ? 5U : ((0x10000U & vlSelf->AddSub__DOT__fN_in2)
                     ? 6U : ((0x8000U & vlSelf->AddSub__DOT__fN_in2)
                              ? 7U : ((0x4000U & vlSelf->AddSub__DOT__fN_in2)
                                       ? 8U : ((0x2000U 
                                                & vlSelf->AddSub__DOT__fN_in2)
                                                ? 9U
                                                : (
                                                   (0x1000U 
                                                    & vlSelf->AddSub__DOT__fN_in2)
                                                    ? 0xaU
                                                    : 
                                                   ((0x800U 
                                                     & vlSelf->AddSub__DOT__fN_in2)
                                                     ? 0xbU
                                                     : 
                                                    ((0x400U 
                                                      & vlSelf->AddSub__DOT__fN_in2)
                                                      ? 0xcU
                                                      : 
                                                     ((0x200U 
                                                       & vlSelf->AddSub__DOT__fN_in2)
                                                       ? 0xdU
                                                       : 
                                                      ((0x100U 
                                                        & vlSelf->AddSub__DOT__fN_in2)
                                                        ? 0xeU
                                                        : 
                                                       ((0x80U 
                                                         & vlSelf->AddSub__DOT__fN_in2)
                                                         ? 0xfU
                                                         : 
                                                        ((0x40U 
                                                          & vlSelf->AddSub__DOT__fN_in2)
                                                          ? 0x10U
                                                          : 
                                                         ((0x20U 
                                                           & vlSelf->AddSub__DOT__fN_in2)
                                                           ? 0x11U
                                                           : 
                                                          ((0x10U 
                                                            & vlSelf->AddSub__DOT__fN_in2)
                                                            ? 0x12U
                                                            : 
                                                           ((8U 
                                                             & vlSelf->AddSub__DOT__fN_in2)
                                                             ? 0x13U
                                                             : 
                                                            ((4U 
                                                              & vlSelf->AddSub__DOT__fN_in2)
                                                              ? 0x14U
                                                              : 
                                                             ((2U 
                                                               & vlSelf->AddSub__DOT__fN_in2)
                                                               ? 0x15U
                                                               : 0x16U)))))))))))))))));
    AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo 
        = ((vlSelf->AddSub__DOT__fN_in2 >> 0x1fU) ? 
           (- vlSelf->AddSub__DOT__fN_in2) : vlSelf->AddSub__DOT__fN_in2);
    vlSelf->AddSub__DOT__recFNToIN__DOT__invalidExc 
        = ((IData)(AddSub__DOT__recFNToIN__DOT__rawIn___05FisNaN) 
           | (IData)((0xc0000000ULL == (0xe0000000ULL 
                                        & vlSelf->AddSub__DOT__addRecFN_out))));
    vlSelf->AddSub__DOT__recFNToIN__DOT__excSign = 
        (1U & ((~ (IData)(AddSub__DOT__recFNToIN__DOT__rawIn___05FisNaN)) 
               & (IData)((vlSelf->AddSub__DOT__addRecFN_out 
                          >> 0x20U))));
    vlSelf->AddSub__DOT__out_IEEE_FP32_hi = ((0x100U 
                                              & ((IData)(
                                                         (vlSelf->AddSub__DOT__addRecFN_out 
                                                          >> 0x20U)) 
                                                 << 8U)) 
                                             | (0xffU 
                                                & ((VL_GTS_III(1,10,10, 0x82U, 
                                                               (0x1ffU 
                                                                & (IData)(
                                                                          (vlSelf->AddSub__DOT__addRecFN_out 
                                                                           >> 0x17U))))
                                                     ? 0U
                                                     : 
                                                    ((0x1ffU 
                                                      & (IData)(
                                                                (vlSelf->AddSub__DOT__addRecFN_out 
                                                                 >> 0x17U))) 
                                                     - (IData)(0x81U))) 
                                                   | (((IData)(
                                                               (0xe0000000ULL 
                                                                == 
                                                                (0xe0000000ULL 
                                                                 & vlSelf->AddSub__DOT__addRecFN_out))) 
                                                       | (IData)(AddSub__DOT__out_IEEE_FP32_rawIn___05FisInf))
                                                       ? 0xffU
                                                       : 0U))));
    vlSelf->AddSub__DOT__out_IEEE_FP32_lo = (0x7fffffU 
                                             & (VL_GTS_III(1,10,10, 0x82U, 
                                                           (0x1ffU 
                                                            & (IData)(
                                                                      (vlSelf->AddSub__DOT__addRecFN_out 
                                                                       >> 0x17U))))
                                                 ? 
                                                (0xffffffU 
                                                 & ((0xffffffU 
                                                     & (AddSub__DOT__out_IEEE_FP32_rawIn___05Fsig 
                                                        >> 1U)) 
                                                    >> 
                                                    (0x1fU 
                                                     & ((IData)(1U) 
                                                        - 
                                                        (0x1ffU 
                                                         & (IData)(
                                                                   (vlSelf->AddSub__DOT__addRecFN_out 
                                                                    >> 0x17U)))))))
                                                 : 
                                                ((IData)(AddSub__DOT__out_IEEE_FP32_rawIn___05FisInf)
                                                  ? 0U
                                                  : AddSub__DOT__out_IEEE_FP32_rawIn___05Fsig)));
    AddSub__DOT__recFNToIN__DOT__alignedSig = ((0x3fffffffeULL 
                                                & (AddSub__DOT__recFNToIN__DOT__shiftedSig 
                                                   >> 0x15U)) 
                                               | (QData)((IData)(
                                                                 (0U 
                                                                  != 
                                                                  (0x3fffffU 
                                                                   & (IData)(AddSub__DOT__recFNToIN__DOT__shiftedSig))))));
    AddSub__DOT__recFN_from_fN_in1_rawIn_normDist = 
        ((0x400000U & vlSelf->AddSub__DOT__fN_in1) ? 0U
          : ((0x200000U & vlSelf->AddSub__DOT__fN_in1)
              ? 1U : ((0x100000U & vlSelf->AddSub__DOT__fN_in1)
                       ? 2U : ((0x80000U & vlSelf->AddSub__DOT__fN_in1)
                                ? 3U : ((0x40000U & vlSelf->AddSub__DOT__fN_in1)
                                         ? 4U : (IData)(AddSub__DOT___recFN_from_fN_in1_rawIn_normDist_T_39))))));
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
    AddSub__DOT__recFN_from_fN_in2_rawIn_normDist = 
        ((0x400000U & vlSelf->AddSub__DOT__fN_in2) ? 0U
          : ((0x200000U & vlSelf->AddSub__DOT__fN_in2)
              ? 1U : ((0x100000U & vlSelf->AddSub__DOT__fN_in2)
                       ? 2U : ((0x80000U & vlSelf->AddSub__DOT__fN_in2)
                                ? 3U : ((0x40000U & vlSelf->AddSub__DOT__fN_in2)
                                         ? 4U : (IData)(AddSub__DOT___recFN_from_fN_in2_rawIn_normDist_T_39))))));
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
    AddSub__DOT__recFNToIN__DOT__complUnroundedInt 
        = ((1U & (IData)((vlSelf->AddSub__DOT__addRecFN_out 
                          >> 0x20U))) ? (~ (IData)(
                                                   (AddSub__DOT__recFNToIN__DOT__alignedSig 
                                                    >> 2U)))
            : (IData)((AddSub__DOT__recFNToIN__DOT__alignedSig 
                       >> 2U)));
    AddSub__DOT__recFNToIN__DOT__roundIncr_near_maxMag 
        = (1U & ((1U & (((IData)((vlSelf->AddSub__DOT__addRecFN_out 
                                  >> 0x17U)) >> 8U) 
                        & (IData)((AddSub__DOT__recFNToIN__DOT__alignedSig 
                                   >> 1U)))) | ((~ 
                                                 (1U 
                                                  & ((IData)(
                                                             (vlSelf->AddSub__DOT__addRecFN_out 
                                                              >> 0x17U)) 
                                                     >> 8U))) 
                                                & (0xffU 
                                                   == 
                                                   (0xffU 
                                                    & (IData)(
                                                              (vlSelf->AddSub__DOT__addRecFN_out 
                                                               >> 0x17U)))))));
    AddSub__DOT__recFN_from_fN_in1_rawIn_adjustedExp 
        = (0x1ffU & (((0U == (0xffU & (vlSelf->AddSub__DOT__fN_in1 
                                       >> 0x17U))) ? 
                      (~ (IData)(AddSub__DOT__recFN_from_fN_in1_rawIn_normDist))
                       : (0xffU & (vlSelf->AddSub__DOT__fN_in1 
                                   >> 0x17U))) + (0x80U 
                                                  | ((0U 
                                                      == 
                                                      (0xffU 
                                                       & (vlSelf->AddSub__DOT__fN_in1 
                                                          >> 0x17U)))
                                                      ? 2U
                                                      : 1U))));
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
    AddSub__DOT__recFN_from_fN_in2_rawIn_adjustedExp 
        = (0x1ffU & (((0U == (0xffU & (vlSelf->AddSub__DOT__fN_in2 
                                       >> 0x17U))) ? 
                      (~ (IData)(AddSub__DOT__recFN_from_fN_in2_rawIn_normDist))
                       : (0xffU & (vlSelf->AddSub__DOT__fN_in2 
                                   >> 0x17U))) + (0x80U 
                                                  | ((0U 
                                                      == 
                                                      (0xffU 
                                                       & (vlSelf->AddSub__DOT__fN_in2 
                                                          >> 0x17U)))
                                                      ? 2U
                                                      : 1U))));
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
    vlSelf->AddSub__DOT__recFNToIN__DOT__roundedInt 
        = ((1U & ((IData)(AddSub__DOT__recFNToIN__DOT__roundIncr_near_maxMag) 
                  ^ (IData)((vlSelf->AddSub__DOT__addRecFN_out 
                             >> 0x20U)))) ? ((IData)(1U) 
                                             + AddSub__DOT__recFNToIN__DOT__complUnroundedInt)
            : AddSub__DOT__recFNToIN__DOT__complUnroundedInt);
    vlSelf->AddSub__DOT__recFNToIN__DOT__common_overflow 
        = (1U & (((IData)((vlSelf->AddSub__DOT__addRecFN_out 
                           >> 0x17U)) >> 8U) & ((0x20U 
                                                 <= 
                                                 (0xffU 
                                                  & (IData)(
                                                            (vlSelf->AddSub__DOT__addRecFN_out 
                                                             >> 0x17U)))) 
                                                | ((1U 
                                                    & (IData)(
                                                              (vlSelf->AddSub__DOT__addRecFN_out 
                                                               >> 0x20U)))
                                                    ? 
                                                   ((0x1fU 
                                                     == 
                                                     (0xffU 
                                                      & (IData)(
                                                                (vlSelf->AddSub__DOT__addRecFN_out 
                                                                 >> 0x17U)))) 
                                                    & ((0U 
                                                        != 
                                                        (0x7fffffffU 
                                                         & (IData)(
                                                                   (AddSub__DOT__recFNToIN__DOT__alignedSig 
                                                                    >> 2U)))) 
                                                       | (IData)(AddSub__DOT__recFNToIN__DOT__roundIncr_near_maxMag)))
                                                    : 
                                                   ((0x1fU 
                                                     == 
                                                     (0xffU 
                                                      & (IData)(
                                                                (vlSelf->AddSub__DOT__addRecFN_out 
                                                                 >> 0x17U)))) 
                                                    | ((0x1eU 
                                                        == 
                                                        (0xffU 
                                                         & (IData)(
                                                                   (vlSelf->AddSub__DOT__addRecFN_out 
                                                                    >> 0x17U)))) 
                                                       & ((0x3fffffffU 
                                                           == 
                                                           (0x3fffffffU 
                                                            & (IData)(
                                                                      (AddSub__DOT__recFNToIN__DOT__alignedSig 
                                                                       >> 2U)))) 
                                                          & (IData)(AddSub__DOT__recFNToIN__DOT__roundIncr_near_maxMag))))))));
    vlSelf->AddSub__DOT__recFN_from_fN_in1_lo = ((0x1f800000U 
                                                  & ((IData)(AddSub__DOT__recFN_from_fN_in1_rawIn_adjustedExp) 
                                                     << 0x17U)) 
                                                 | (0x7fffffU 
                                                    & ((0U 
                                                        == 
                                                        (0xffU 
                                                         & (vlSelf->AddSub__DOT__fN_in1 
                                                            >> 0x17U)))
                                                        ? 
                                                       (0x7ffffeU 
                                                        & ((IData)(
                                                                   (0x3fffffffffffffULL 
                                                                    & ((QData)((IData)(
                                                                                (0x7fffffU 
                                                                                & vlSelf->AddSub__DOT__fN_in1))) 
                                                                       << (IData)(AddSub__DOT__recFN_from_fN_in1_rawIn_normDist)))) 
                                                           << 1U))
                                                        : vlSelf->AddSub__DOT__fN_in1)));
    vlSelf->AddSub__DOT__recFN_from_fN_in1_hi = ((8U 
                                                  & (vlSelf->AddSub__DOT__fN_in1 
                                                     >> 0x1cU)) 
                                                 | (7U 
                                                    & (((IData)(AddSub__DOT__recFN_from_fN_in1_rawIn_isZero)
                                                         ? 0U
                                                         : 
                                                        ((IData)(AddSub__DOT__recFN_from_fN_in1_rawIn_adjustedExp) 
                                                         >> 6U)) 
                                                       | ((3U 
                                                           == 
                                                           (3U 
                                                            & ((IData)(AddSub__DOT__recFN_from_fN_in1_rawIn_adjustedExp) 
                                                               >> 7U))) 
                                                          & (0U 
                                                             != 
                                                             (0x7fffffU 
                                                              & vlSelf->AddSub__DOT__fN_in1))))));
    vlSelf->AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)));
    vlSelf->AddSub__DOT__recFN_from_fN_in2_lo = ((0x1f800000U 
                                                  & ((IData)(AddSub__DOT__recFN_from_fN_in2_rawIn_adjustedExp) 
                                                     << 0x17U)) 
                                                 | (0x7fffffU 
                                                    & ((0U 
                                                        == 
                                                        (0xffU 
                                                         & (vlSelf->AddSub__DOT__fN_in2 
                                                            >> 0x17U)))
                                                        ? 
                                                       (0x7ffffeU 
                                                        & ((IData)(
                                                                   (0x3fffffffffffffULL 
                                                                    & ((QData)((IData)(
                                                                                (0x7fffffU 
                                                                                & vlSelf->AddSub__DOT__fN_in2))) 
                                                                       << (IData)(AddSub__DOT__recFN_from_fN_in2_rawIn_normDist)))) 
                                                           << 1U))
                                                        : vlSelf->AddSub__DOT__fN_in2)));
    vlSelf->AddSub__DOT__recFN_from_fN_in2_hi = ((8U 
                                                  & (vlSelf->AddSub__DOT__fN_in2 
                                                     >> 0x1cU)) 
                                                 | (7U 
                                                    & (((IData)(AddSub__DOT__recFN_from_fN_in2_rawIn_isZero)
                                                         ? 0U
                                                         : 
                                                        ((IData)(AddSub__DOT__recFN_from_fN_in2_rawIn_adjustedExp) 
                                                         >> 6U)) 
                                                       | ((3U 
                                                           == 
                                                           (3U 
                                                            & ((IData)(AddSub__DOT__recFN_from_fN_in2_rawIn_adjustedExp) 
                                                               >> 7U))) 
                                                          & (0U 
                                                             != 
                                                             (0x7fffffU 
                                                              & vlSelf->AddSub__DOT__fN_in2))))));
    vlSelf->AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
        = (0x7fffffffffffffffULL & ((QData)((IData)(AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_extAbsIn_lo)) 
                                    << (IData)(AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)));
    AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
        = ((0x7fffffeU & ((IData)(((QData)((IData)(vlSelf->AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T)) 
                                   >> 7U)) << 1U)) 
           | (0U != (0x7fU & (IData)((QData)((IData)(vlSelf->AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T))))));
    AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
        = ((0x7fffffeU & ((IData)(((QData)((IData)(vlSelf->AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T)) 
                                   >> 7U)) << 1U)) 
           | (0U != (0x7fU & (IData)((QData)((IData)(vlSelf->AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T))))));
    vlSelf->AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & ((0U != (2U & AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))
                          ? ((IData)(1U) + (0x1ffffffU 
                                            & (AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                               >> 2U)))
                          : (0x1ffffffU & (AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                           >> 2U))));
    vlSelf->AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & ((0U != (2U & AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig))
                          ? ((IData)(1U) + (0x1ffffffU 
                                            & (AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                               >> 2U)))
                          : (0x1ffffffU & (AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__adjustedSig 
                                           >> 2U))));
    vlSelf->AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi 
        = ((0x200U & (vlSelf->AddSub__DOT__fN_in1 >> 0x16U)) 
           | (0x1ffU & (((0x7ffU & VL_EXTENDS_II(11,10, 
                                                 (0x1ffU 
                                                  & ((IData)(0xc0U) 
                                                     + 
                                                     (0x3ffU 
                                                      & VL_EXTENDS_II(10,9, 
                                                                      (0x40U 
                                                                       | (0x1fU 
                                                                          & (~ (IData)(AddSub__DOT__iNToRecFN_1__DOT__intAsRawFloat_adjustedNormDist)))))))))) 
                         + (0x7ffU & VL_EXTENDS_II(11,10, 
                                                   (3U 
                                                    & (vlSelf->AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                       >> 0x18U))))) 
                        & (~ ((1U & (IData)((vlSelf->AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T 
                                             >> 0x1fU)))
                               ? 0U : 0x1c0U)))));
    vlSelf->AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi 
        = ((0x200U & (vlSelf->AddSub__DOT__fN_in2 >> 0x16U)) 
           | (0x1ffU & (((0x7ffU & VL_EXTENDS_II(11,10, 
                                                 (0x1ffU 
                                                  & ((IData)(0xc0U) 
                                                     + 
                                                     (0x3ffU 
                                                      & VL_EXTENDS_II(10,9, 
                                                                      (0x40U 
                                                                       | (0x1fU 
                                                                          & (~ (IData)(AddSub__DOT__iNToRecFN_2__DOT__intAsRawFloat_adjustedNormDist)))))))))) 
                         + (0x7ffU & VL_EXTENDS_II(11,10, 
                                                   (3U 
                                                    & (vlSelf->AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                       >> 0x18U))))) 
                        & (~ ((1U & (IData)((vlSelf->AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T 
                                             >> 0x1fU)))
                               ? 0U : 0x1c0U)))));
}

VL_INLINE_OPT void VAddSub___024root___combo__TOP__3(VAddSub___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub___024root___combo__TOP__3\n"); );
    // Init
    QData/*32:0*/ AddSub__DOT__addRecFN_io_b;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig;
    SData/*9:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp;
    SData/*9:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign;
    CData/*4:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4;
    SData/*12:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_reduced2SigSum;
    CData/*3:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1;
    IData/*28:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_mainAlignedSigSmaller;
    CData/*6:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_alignedSigSmaller_T_2;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller;
    IData/*27:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros;
    SData/*15:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12;
    SData/*15:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22;
    SData/*15:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55;
    IData/*24:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9;
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
    vlSelf->io_out = (QData)((IData)(((IData)(vlSelf->io_useINT)
                                       ? vlSelf->AddSub__DOT__recFNToIN_out
                                       : vlSelf->AddSub__DOT__out_IEEE_FP32)));
    if (vlSelf->io_useINT) {
        vlSelf->AddSub__DOT__addRecFN_io_a = vlSelf->AddSub__DOT__iNToRecFN_1_out;
        AddSub__DOT__addRecFN_io_b = vlSelf->AddSub__DOT__iNToRecFN_2_out;
    } else {
        vlSelf->AddSub__DOT__addRecFN_io_a = vlSelf->AddSub__DOT__recFN_from_fN_in1;
        AddSub__DOT__addRecFN_io_b = vlSelf->AddSub__DOT__recFN_from_fN_in2;
    }
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN 
        = (IData)((0xe0000000ULL == (0xe0000000ULL 
                                     & vlSelf->AddSub__DOT__addRecFN_io_a)));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf 
        = (IData)((0xc0000000ULL == (0xe0000000ULL 
                                     & vlSelf->AddSub__DOT__addRecFN_io_a)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
        = (((0U != (7U & (IData)((vlSelf->AddSub__DOT__addRecFN_io_a 
                                  >> 0x1dU)))) << 0x17U) 
           | (0x7fffffU & (IData)(vlSelf->AddSub__DOT__addRecFN_io_a)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN 
        = (IData)((0xe0000000ULL == (0xe0000000ULL 
                                     & AddSub__DOT__addRecFN_io_b)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros 
        = (IData)(((0ULL == (0xe0000000ULL & vlSelf->AddSub__DOT__addRecFN_io_a)) 
                   & (0ULL == (0xe0000000ULL & AddSub__DOT__addRecFN_io_b))));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf 
        = (IData)((0xc0000000ULL == (0xe0000000ULL 
                                     & AddSub__DOT__addRecFN_io_b)));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB 
        = (1U & ((IData)((AddSub__DOT__addRecFN_io_b 
                          >> 0x20U)) ^ (IData)(vlSelf->AddSub__DOT__op_sel)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
        = (((0U != (7U & (IData)((AddSub__DOT__addRecFN_io_b 
                                  >> 0x1dU)))) << 0x17U) 
           | (0x7fffffU & (IData)(AddSub__DOT__addRecFN_io_b)));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps 
        = (0x3ffU & ((0x1ffU & (IData)((vlSelf->AddSub__DOT__addRecFN_io_a 
                                        >> 0x17U))) 
                     - (0x1ffU & (IData)((AddSub__DOT__addRecFN_io_b 
                                          >> 0x17U)))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut 
        = ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf) 
           | (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns 
        = ((1U & (IData)((vlSelf->AddSub__DOT__addRecFN_io_a 
                          >> 0x20U))) == (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___far_sigSmaller_T_1 
        = (VL_GTS_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
            ? AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig
            : AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig);
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign 
        = ((0U != (0x1fU & ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps) 
                            >> 5U))) & ((0x1fU != (0x1fU 
                                                   & ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps) 
                                                      >> 5U))) 
                                        | (0U == (0x1fU 
                                                  & (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4 
        = (0x3ffU & (VL_GTS_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                      ? ((0x1ffU & (IData)((AddSub__DOT__addRecFN_io_b 
                                            >> 0x17U))) 
                         - (0x1ffU & (IData)((vlSelf->AddSub__DOT__addRecFN_io_a 
                                              >> 0x17U))))
                      : (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum 
        = (0x7ffffffU & (((((VL_LTES_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)) 
                             & (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                             ? (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
                                << 2U) : 0U) | ((VL_LTES_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)) 
                                                 & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)))
                                                 ? 
                                                (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
                                                 << 1U)
                                                 : 0U)) 
                          | (VL_GTS_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                              ? AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig
                              : 0U)) - ((0x4000000U 
                                         & (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
                                            << 2U)) 
                                        | (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
                                           << 1U))));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut) 
           | (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros));
    vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut 
        = (((((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN) 
              & (~ (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig 
                    >> 0x16U))) | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN) 
                                   & (~ (AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig 
                                         >> 0x16U)))) 
            | (((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf) 
                & (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf)) 
               & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))) 
           | ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isNaN) 
              | (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isNaN)));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags 
        = (((~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)) 
            & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign))) 
           & (1U >= (0x1fU & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4))));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT__alignDist 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__isMaxAlign)
            ? 0x1fU : (0x1fU & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT___modNatAlignDist_T_4)));
    AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4 
        = (0x7ffffffU & (VL_GTS_III(1,27,27, 0U, vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum)
                          ? (- vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum)
                          : vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum));
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
        = (0xfffffffU & (((0x7fffff8U & ((VL_GTS_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps))
                                           ? AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_sig
                                           : AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_sig) 
                                         << 3U)) + 
                          ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)
                            ? AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller
                            : (0x8000000U | (0x7ffffffU 
                                             & (~ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_alignedSigSmaller))))) 
                         + (1U & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
        = (0x1ffffffffffffffULL & ((QData)((IData)(
                                                   (0x3ffffffU 
                                                    & AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigSum_T_4))) 
                                   << ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2) 
                                       << 1U)));
    AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp 
        = (0x3ffU & ((((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags) 
                       | VL_GTS_III(1,10,10, 0U, (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps)))
                       ? (0x1ffU & (IData)((AddSub__DOT__addRecFN_io_b 
                                            >> 0x17U)))
                       : (0x1ffU & (IData)((vlSelf->AddSub__DOT__addRecFN_io_a 
                                            >> 0x17U)))) 
                     - ((0x3c0U & ((- (IData)((1U & 
                                               (((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)
                                                  ? 
                                                 ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2) 
                                                  << 1U)
                                                  : 
                                                 (1U 
                                                  & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))) 
                                                >> 5U)))) 
                                   << 6U)) | ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)
                                               ? ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_normDistReduced2) 
                                                  << 1U)
                                               : (1U 
                                                  & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)))))));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__addZeros) 
           | (((~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut)) 
               & (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)) 
              & (~ (IData)((0U != (3U & (IData)((vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T 
                                                 >> 0x18U))))))));
    vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
        = (0x7ffffffU & ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags)
                          ? (0x7fffffeU & ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T) 
                                           << 1U)) : 
                         ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns)
                           ? (0x7ffffffU & ((AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum 
                                             >> 1U) 
                                            | (1U & AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum)))
                           : AddSub__DOT__addRecFN__DOT__addRawFN___DOT__far_sigSum)));
    __Vtemp46[0U] = 0U;
    __Vtemp46[1U] = 0U;
    __Vtemp46[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp47, __Vtemp46, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp50[0U] = 0U;
    __Vtemp50[1U] = 0U;
    __Vtemp50[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp51, __Vtemp50, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12 
        = ((0xffU & (__Vtemp47[1U] >> 0x12U)) | (0xff00U 
                                                 & (__Vtemp51[1U] 
                                                    >> 2U)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22 
        = ((0xf0fU & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12) 
                      >> 4U)) | (0xf0f0U & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_12) 
                                            << 4U)));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32 
        = ((0x3333U & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                       >> 2U)) | (0xccccU & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_22) 
                                             << 2U)));
    __Vtemp54[0U] = 0U;
    __Vtemp54[1U] = 0U;
    __Vtemp54[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp55, __Vtemp54, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp58[0U] = 0U;
    __Vtemp58[1U] = 0U;
    __Vtemp58[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp59, __Vtemp58, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp62[0U] = 0U;
    __Vtemp62[1U] = 0U;
    __Vtemp62[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp63, __Vtemp62, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp66[0U] = 0U;
    __Vtemp66[1U] = 0U;
    __Vtemp66[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp67, __Vtemp66, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp70[0U] = 0U;
    __Vtemp70[1U] = 0U;
    __Vtemp70[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp71, __Vtemp70, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp74[0U] = 0U;
    __Vtemp74[1U] = 0U;
    __Vtemp74[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp75, __Vtemp74, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp78[0U] = 0U;
    __Vtemp78[1U] = 0U;
    __Vtemp78[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp79, __Vtemp78, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp82[0U] = 0U;
    __Vtemp82[1U] = 0U;
    __Vtemp82[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp83, __Vtemp82, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    __Vtemp86[0U] = 0U;
    __Vtemp86[1U] = 0U;
    __Vtemp86[2U] = 1U;
    VL_SHIFTRS_WWI(65,65,6, __Vtemp87, __Vtemp86, (0x3fU 
                                                   & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))));
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55 
        = ((0x80U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
            ? ((0x40U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
                ? 0U : ((4U & (__Vtemp55[0U] << 2U)) 
                        | ((2U & __Vtemp59[0U]) | (1U 
                                                   & (__Vtemp63[0U] 
                                                      >> 2U)))))
            : (7U | (0x1fffff8U & ((~ ((0x40U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
                                        ? (~ (((0x155540U 
                                                & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
                                                   << 5U)) 
                                               | (0x2aaa80U 
                                                  & ((IData)(AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_32) 
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
    AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
        = (((0x100U & (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp))
             ? 0U : AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT___roundMask_T_55) 
           | (1U & (vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                    >> 0x1aU)));
    vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
        = (0x3ffffffU & ((0U != (vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                                 & ((~ (1U | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                              << 1U))) 
                                    & (3U | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                             << 2U)))))
                          ? ((IData)(1U) + (0x1ffffffU 
                                            & ((vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                                                >> 2U) 
                                               | (0x3fffffffU 
                                                  & AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9))))
                          : (0x1ffffffU & ((vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig 
                                            & (~ (3U 
                                                  | (AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundMask_hi_9 
                                                     << 2U)))) 
                                           >> 2U))));
    vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp 
        = (0x7ffU & (VL_EXTENDS_II(11,10, (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sExp)) 
                     + VL_EXTENDS_II(11,10, (3U & (vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig 
                                                   >> 0x18U)))));
    vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut 
        = ((IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut) 
           | ((((~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut)) 
                & (~ (IData)(AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_isInfOut))) 
               & (~ (IData)(vlSelf->AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero))) 
              & VL_LTES_III(1,4,4, 3U, (0xfU & ((IData)(vlSelf->AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp) 
                                                >> 7U)))));
}

void VAddSub___024root___eval(VAddSub___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VAddSub___024root___sequent__TOP__1(vlSelf);
    }
    VAddSub___024root___combo__TOP__3(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VAddSub___024root___change_request_1(VAddSub___024root* vlSelf);

VL_INLINE_OPT QData VAddSub___024root___change_request(VAddSub___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub___024root___change_request\n"); );
    // Body
    return (VAddSub___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VAddSub___024root___change_request_1(VAddSub___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VAddSub___024root___eval_debug_assertions(VAddSub___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_op & 0xfeU))) {
        Verilated::overWidthError("io_op");}
    if (VL_UNLIKELY((vlSelf->io_useINT & 0xfeU))) {
        Verilated::overWidthError("io_useINT");}
}
#endif  // VL_DEBUG
