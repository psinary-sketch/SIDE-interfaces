import Mathlib.Data.Real.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Image
import Mathlib.Data.Finset.Max
import Mathlib.Tactic.Linarith

namespace Interfaces

noncomputable def responseSet
    {A B : Type*} [Fintype A]
    (P : B -> Real) (f : A -> B) (a0 : A) : Finset Real :=
  Finset.univ.image (fun a => |P (f a) - P (f a0)|)

noncomputable def kappa
    {A B : Type*} [Fintype A]
    (P : B -> Real) (f : A -> B) (a0 : A) : Real :=
  (responseSet P f a0).max' (by
    refine Finset.image_nonempty.mpr ?_
    exact ⟨a0, Finset.mem_univ a0⟩)

noncomputable def kappa_invariance
    {A B : Type*} [Fintype A]
    (P : B -> Real) (f : A -> B) (a0 : A) : Real :=
  1 - kappa P f a0

def IsDark
    {A B : Type*} [Fintype A]
    (P : B -> Real) (f : A -> B) (a0 : A) : Prop :=
  kappa P f a0 = 0

-- dark_iff_invariant (deferred to v0.2): IsDark P f a0 iff kappa_invariance P f a0 = 1
-- The correspondence follows from definition: unfolding both sides gives
-- `(kappa = 0) iff (1 - kappa = 1)`, which is immediate by linear arithmetic.

theorem kappa_zero_of_no_mechanism
    {A B : Type*} [Fintype A]
    (P : B -> Real) (f : A -> B) (a0 : A)
    (h_no_mechanism : ∀ a : A, P (f a) = P (f a0)) :
    kappa P f a0 = 0 := by
  unfold kappa responseSet
  have h_all_zero : ∀ x  ∈ Finset.univ.image (fun a => |P (f a) - P (f a0)|),
      x = 0 := by
    intro x hx
    rw [Finset.mem_image] at hx
    obtain ⟨a, _, hax⟩ := hx
    rw [← hax, h_no_mechanism a]
    simp
  have h_ne : (Finset.univ.image (fun a => |P (f a) - P (f a0)|)).Nonempty := by
    refine Finset.image_nonempty.mpr ?_
    exact ⟨a0, Finset.mem_univ a0⟩
  have h_max_in : (Finset.univ.image (fun a => |P (f a) - P (f a0)|)).max'
      h_ne ∈ Finset.univ.image (fun a => |P (f a) - P (f a0)|) :=
    Finset.max'_mem _ h_ne
  exact h_all_zero _ h_max_in

noncomputable def kappa_empirical
    (var_within var_total : Real) (_h_pos : var_total > 0) : Real :=
  1 - var_within / var_total

end Interfaces
