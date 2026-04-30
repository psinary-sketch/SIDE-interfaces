import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Tactic.Linarith
import Interfaces.Kappa
import Interfaces.ConservationProfile

namespace Interfaces

-- A non-trivial interface: not all parameters are dark.
def NontrivialInterface {params : Type} [Fintype params]
    (P : ConservationProfile params) : Prop :=
  ¬ ConservationProfile.IsAllDark P

-- A parameter is a structural witness if its κ is ≥ 0.75.
def StructuralWitness {params : Type} [Fintype params]
    (P : ConservationProfile params) (x : params) : Prop :=
  (75 : Real) / 100 <= P.kvec x

-- Connection Requires Structure (existence form).
-- A non-trivial interface produces at least one structural witness,
-- under the INTERFACETS bimodality hypothesis.
theorem connection_requires_structure
    {params : Type} [Fintype params]
    (P : ConservationProfile params)
    (h_nontrivial : NontrivialInterface P)
    (h_bimodality : ∀ x, P.kvec x < (45 : Real) / 100 ∨ (75 : Real) / 100 <= P.kvec x) :
    ∃ x : params, StructuralWitness P x := by
  unfold NontrivialInterface ConservationProfile.IsAllDark at h_nontrivial
  push_neg at h_nontrivial
  obtain ⟨x, hx⟩ := h_nontrivial
  refine ⟨x, ?_⟩
  unfold StructuralWitness
  have hb := h_bimodality x
  cases hb with
  | inl h_low => linarith
  | inr h_high => exact h_high

-- Parametric Mechanism Theorem (kernel form).
-- If no A-side perturbation affects the B-side observable for parameter θ,
-- then κ(P, f, a0) = 0 -- the parameter is dark to the interface.
theorem parametric_mechanism_theorem
    {A B : Type} [Fintype A]
    (P : B -> Real) (f : A -> B) (a0 : A)
    (h_no_mechanism : ∀ a : A, P (f a) = P (f a0)) :
    kappa P f a0 = 0 :=
  kappa_zero_of_no_mechanism P f a0 h_no_mechanism

end Interfaces
