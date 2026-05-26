/-
  InterfaceSplit.lean  ·  LV-L-1b  ·  source-fidelity Interface Split
  ====================================================================

  Closes the open item flagged in
    SIDE-interfaces/Interfaces/ConservationProfile.lean (interface_split docstring):
    "The full source-fidelity form with explicit `f : A → B` and parameter family
     ... is reserved for a future `SIDE-interface-split` kernel (LV-L-1b)."

  Source statement (INTERFACE_CONSERVATION_HODGE_AND_INTERFACETS §III.5,
  INTERFACETS_REFINED §4, Proposition 1):

      "For any non-trivial interface f : A → B with d observable parameters,
       at least one parameter is non-conservative.  Equivalently, rank(I) < d."

  This file gives the explicit-map form.  It does NOT re-derive the rank
  arithmetic — that is `Interfaces.ConservationProfile.interface_split`, already
  proved (0 sorry) in the SIDE-interfaces kernel.  It carries the explicit
  interface map `f : A → B` and discharges the source statement from it.

  HONESTY NOTE — the one modeling step, made explicit (not smuggled).
  The link "f non-injective ⟹ some observable parameter collapses to a
  non-structural conservation value (κ < 0.75)" is the bimodality bridge of
  INTERFACETS_REFINED §3 — an empirical/structural modeling claim, NOT a pure
  theorem.  It is therefore carried as an EXPLICIT field `collapse` of the
  `Interface` structure, visible as data, exactly as the source treats it.
  Nothing here proves the bridge; it formalizes the logical shape faithfully
  with the bridge in plain sight.

  STATUS: draft for compile-verification on the D: toolchain (vanilla Lean 4 +
  Mathlib, matching SIDE-interfaces).  Not compiled in the authoring environment.
  Mathematical content per the PLACE TO STAND programme; to be reviewed by the author.

  Vendoring/federation: imports the SIDE-interfaces `Interfaces` library directly
  (this file is intended to live in, or beside, that kernel).
-/
import Mathlib.Logic.Function.Basic
import Interfaces.ConservationProfile

namespace Interfaces

open Interfaces.ConservationProfile

/-- An **interface** in source-fidelity form: an explicit map `f : A → B`,
    the conservation profile of its `d = #params` observable parameters, and the
    bimodality bridge as explicit data.

    `collapse` is the INTERFACETS_REFINED §3 modeling link, stated — not hidden:
    a non-injective interface drives at least one observable parameter below the
    structural threshold κ = 0.75. -/
structure Interface (A B params : Type) [Fintype params] where
  map      : A → B
  profile  : ConservationProfile params
  collapse : ¬ Function.Injective map → ∃ x, profile.kvec x < (75 : Real) / 100

variable {A B params : Type} [Fintype params]

/-- **Source statement, first half.**  A non-trivial (non-injective) interface
    has at least one non-conservative observable parameter.  This is the
    `collapse` bridge, surfaced as a named theorem. -/
theorem interface_has_nonconservative_parameter
    (I : Interface A B params) (h_noninj : ¬ Function.Injective I.map) :
    ∃ x, I.profile.kvec x < (75 : Real) / 100 :=
  I.collapse h_noninj

/-- **Source statement, second half — `rank(I) < d`.**
    For any non-injective interface, the structural rank is strictly below the
    observable-parameter count `dim = #params`.  Discharged by composing the
    bimodality bridge with the kernel's `interface_split`. -/
theorem interface_split_faithful
    (I : Interface A B params) (h_noninj : ¬ Function.Injective I.map) :
    structuralRank I.profile < dim I.profile := by
  apply interface_split I.profile
  intro h_all
  obtain ⟨x, hx⟩ := I.collapse h_noninj
  exact absurd (h_all x) (not_le.mpr hx)

end Interfaces
