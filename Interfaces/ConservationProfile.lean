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
  sorry

def IsAllDark (P : ConservationProfile params) : Prop :=
  ∀ x, P.kvec x < (45 : Real) / 100

def IsAllStructural (P : ConservationProfile params) : Prop :=
  ∀ x, (75 : Real) / 100 <= P.kvec x

end ConservationProfile

end Interfaces
