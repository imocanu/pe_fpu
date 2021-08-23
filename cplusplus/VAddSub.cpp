// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VAddSub.h"
#include "VAddSub__Syms.h"

//============================================================
// Constructors

VAddSub::VAddSub(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VAddSub__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_op{vlSymsp->TOP.io_op}
    , io_useINT{vlSymsp->TOP.io_useINT}
    , io_in1{vlSymsp->TOP.io_in1}
    , io_in2{vlSymsp->TOP.io_in2}
    , io_out{vlSymsp->TOP.io_out}
    , rootp{&(vlSymsp->TOP)}
{
}

VAddSub::VAddSub(const char* _vcname__)
    : VAddSub(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VAddSub::~VAddSub() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VAddSub___024root___eval_initial(VAddSub___024root* vlSelf);
void VAddSub___024root___eval_settle(VAddSub___024root* vlSelf);
void VAddSub___024root___eval(VAddSub___024root* vlSelf);
QData VAddSub___024root___change_request(VAddSub___024root* vlSelf);
#ifdef VL_DEBUG
void VAddSub___024root___eval_debug_assertions(VAddSub___024root* vlSelf);
#endif  // VL_DEBUG
void VAddSub___024root___final(VAddSub___024root* vlSelf);

static void _eval_initial_loop(VAddSub__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VAddSub___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VAddSub___024root___eval_settle(&(vlSymsp->TOP));
        VAddSub___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAddSub___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/AddSub.v", 572, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAddSub___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VAddSub::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VAddSub::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VAddSub___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VAddSub___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAddSub___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/AddSub.v", 572, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAddSub___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VAddSub::final() {
    VAddSub___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VAddSub::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VAddSub::name() const {
    return vlSymsp->name();
}
