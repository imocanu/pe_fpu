// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VAddSubMul32.h"
#include "VAddSubMul32__Syms.h"

//============================================================
// Constructors

VAddSubMul32::VAddSubMul32(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VAddSubMul32__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_in0{vlSymsp->TOP.io_in0}
    , io_in1{vlSymsp->TOP.io_in1}
    , io_outAdd{vlSymsp->TOP.io_outAdd}
    , io_outSub{vlSymsp->TOP.io_outSub}
    , io_outMul{vlSymsp->TOP.io_outMul}
    , rootp{&(vlSymsp->TOP)}
{
}

VAddSubMul32::VAddSubMul32(const char* _vcname__)
    : VAddSubMul32(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VAddSubMul32::~VAddSubMul32() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VAddSubMul32___024root___eval_initial(VAddSubMul32___024root* vlSelf);
void VAddSubMul32___024root___eval_settle(VAddSubMul32___024root* vlSelf);
void VAddSubMul32___024root___eval(VAddSubMul32___024root* vlSelf);
QData VAddSubMul32___024root___change_request(VAddSubMul32___024root* vlSelf);
#ifdef VL_DEBUG
void VAddSubMul32___024root___eval_debug_assertions(VAddSubMul32___024root* vlSelf);
#endif  // VL_DEBUG
void VAddSubMul32___024root___final(VAddSubMul32___024root* vlSelf);

static void _eval_initial_loop(VAddSubMul32__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VAddSubMul32___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VAddSubMul32___024root___eval_settle(&(vlSymsp->TOP));
        VAddSubMul32___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAddSubMul32___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/AddSubMul32.v", 1, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAddSubMul32___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VAddSubMul32::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VAddSubMul32::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VAddSubMul32___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VAddSubMul32___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAddSubMul32___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/AddSubMul32.v", 1, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAddSubMul32___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VAddSubMul32::final() {
    VAddSubMul32___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VAddSubMul32::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VAddSubMul32::name() const {
    return vlSymsp->name();
}
