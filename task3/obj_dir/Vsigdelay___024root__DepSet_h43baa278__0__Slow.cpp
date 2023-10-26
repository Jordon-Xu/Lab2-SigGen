// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsigdelay.h for the primary calling header

#include "verilated.h"

#include "Vsigdelay__Syms.h"
#include "Vsigdelay__Syms.h"
#include "Vsigdelay___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsigdelay___024root___dump_triggers__stl(Vsigdelay___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsigdelay___024root___eval_triggers__stl(Vsigdelay___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsigdelay__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsigdelay___024root___eval_triggers__stl\n"); );
    // Body
    vlSelf->__VstlTriggered.set(0U, (0U == vlSelf->__VstlIterCount));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsigdelay___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
