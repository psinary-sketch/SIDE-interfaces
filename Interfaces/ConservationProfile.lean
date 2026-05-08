import Mathlib.Data.Real.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Tactic.Linarith
import Interfaces.Kappa

namespace Interfaces

structure ConservationProfile (params : Type) [Fintype params] where
  kvec : params -> Real

namespace ConservationProfile

variable {params : Type} [Fintype params]

noncomputable def structuralSet (P : ConservationProfile params) : Finset params :=
  Finset.univ.filter (fun x => (75 : Real) / 100 <= P.kvec x)

noncomputable def splitSet (P : ConservationProfile params) : Finset params :=
  Finset.univ.filter (fun x => P.kvec x < (45 : Real) / 100)

noncomputable def continuousSet (P : ConservationProfile params) : Finset params :=
  Finset.univ.filter (fun x => (45 : Real) / 100 <= P.kvec x ∧ P.kvec x < (75 : Real) / 100)

noncomputable def structuralRank (P : ConservationProfile params) : Nat :=
  (structuralSet P).card

noncomputable def splitRank (P : ConservationProfile params) : Nat :=
  (splitSet P).card

noncomputable def continuousRank (P : ConservationProfile params) : Nat :=
  (continuousSet P).card

noncomputable def dim (_ : ConservationProfile params) : Nat :=
  (Finset.univ : Finset params).card

theorem rank_decomposition (P : ConservationProfile params) :
    structuralRank P + splitRank P + continuousRank P = dim P := by
  classical
  unfold structuralRank splitRank continuousRank dim
  unfold structuralSet splitSet continuousSet
  -- First split: univ partitions by the structural predicate (>= 0.75 vs not)
  have step1 :
      (Finset.univ.filter (fun x => (75 : Real) / 100 <= P.kvec x)).card +
      (Finset.univ.filter (fun x => ¬ ((75 : Real) / 100 <= P.kvec x))).card =
      (Finset.univ : Finset params).card :=
    Finset.card_filter_add_card_filter_not _
  -- Second split: among the "not structural" parameters, those below 0.45 vs those in [0.45, 0.75)
  have key : ∀ x ∈ (Finset.univ : Finset params),
      ¬ ((75 : Real) / 100 <= P.kvec x) ↔
      (P.kvec x < (45 : Real) / 100 ∨
        ((45 : Real) / 100 <= P.kvec x ∧ P.kvec x < (75 : Real) / 100)) := by
    intro x _
    constructor
    · intro h
      push_neg at h
      by_cases h2 : P.kvec x < (45 : Real) / 100
      · exact Or.inl h2
      · push_neg at h2
        exact Or.inr ⟨h2, h⟩
    · intro h
      rcases h with h | ⟨_, h⟩
      · linarith
      · linarith
  have step2 :
      (Finset.univ.filter (fun x => ¬ ((75 : Real) / 100 <= P.kvec x))).card =
      (Finset.univ.filter (fun x => P.kvec x < (45 : Real) / 100)).card +
      (Finset.univ.filter
        (fun x => (45 : Real) / 100 <= P.kvec x ∧ P.kvec x < (75 : Real) / 100)).card := by
    rw [Finset.filter_congr key, Finset.filter_or]
    rw [Finset.card_union_of_disjoint]
    -- Disjointness of the < 0.45 set and the [0.45, 0.75) set
    rw [Finset.disjoint_filter]
    intros _ _ h1 h2
    linarith [h2.1]
  linarith [step1, step2]

def IsAllDark (P : ConservationProfile params) : Prop :=
  ∀ x, P.kvec x < (45 : Real) / 100

def IsAllStructural (P : ConservationProfile params) : Prop :=
  ∀ x, (75 : Real) / 100 <= P.kvec x

end ConservationProfile

end Interfaces
