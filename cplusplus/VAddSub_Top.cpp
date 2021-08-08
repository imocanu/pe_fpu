// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VAddSub_Top.h"
#include "VAddSub_Top__Syms.h"

//============================================================
// Constructors

VAddSub_Top::VAddSub_Top(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VAddSub_Top__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_op{vlSymsp->TOP.io_op}
    , io_useINT{vlSymsp->TOP.io_useINT}
    , io_round{vlSymsp->TOP.io_round}
    , io_in1{vlSymsp->TOP.io_in1}
    , io_in2{vlSymsp->TOP.io_in2}
    , io_outIEEE{vlSymsp->TOP.io_outIEEE}
    , rootp{&(vlSymsp->TOP)}
{
}

VAddSub_Top::VAddSub_Top(const char* _vcname__)
    : VAddSub_Top(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VAddSub_Top::~VAddSub_Top() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VAddSub_Top___024root___eval_initial(VAddSub_Top___024root* vlSelf);
void VAddSub_Top___024root___eval_settle(VAddSub_Top___024root* vlSelf);
void VAddSub_Top___024root___eval(VAddSub_Top___024root* vlSelf);
QData VAddSub_Top___024root___change_request(VAddSub_Top___024root* vlSelf);
#ifdef VL_DEBUG
void VAddSub_Top___024root___eval_debug_assertions(VAddSub_Top___024root* vlSelf);
#endif  // VL_DEBUG
void VAddSub_Top___024root___final(VAddSub_Top___024root* vlSelf);

static void _eval_initial_loop(VAddSub_Top__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VAddSub_Top___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VAddSub_Top___024root___eval_settle(&(vlSymsp->TOP));
        VAddSub_Top___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAddSub_Top___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/AddSub_Top.v", 598, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAddSub_Top___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VAddSub_Top::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VAddSub_Top::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VAddSub_Top___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VAddSub_Top___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAddSub_Top___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/AddSub_Top.v", 598, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAddSub_Top___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VAddSub_Top::final() {
    VAddSub_Top___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VAddSub_Top::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VAddSub_Top::name() const {
    return vlSymsp->name();
}
