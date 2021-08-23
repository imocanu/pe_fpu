// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VMULT__SYMS_H_
#define VERILATED_VMULT__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "VMult.h"

// INCLUDE MODULE CLASSES
#include "VMult___024root.h"

// SYMS CLASS (contains all model state)
class VMult__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VMult* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VMult___024root                TOP;

    // CONSTRUCTORS
    VMult__Syms(VerilatedContext* contextp, const char* namep, VMult* modelp);
    ~VMult__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
