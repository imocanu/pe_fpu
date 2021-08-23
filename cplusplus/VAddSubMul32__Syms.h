// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VADDSUBMUL32__SYMS_H_
#define VERILATED_VADDSUBMUL32__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "VAddSubMul32.h"

// INCLUDE MODULE CLASSES
#include "VAddSubMul32___024root.h"

// SYMS CLASS (contains all model state)
class VAddSubMul32__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VAddSubMul32* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VAddSubMul32___024root         TOP;

    // CONSTRUCTORS
    VAddSubMul32__Syms(VerilatedContext* contextp, const char* namep, VAddSubMul32* modelp);
    ~VAddSubMul32__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
