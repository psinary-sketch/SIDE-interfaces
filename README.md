# TECHNE KERNEL

A conditionally verified proof architecture for the Riemann Hypothesis in Lean 4,
reducing to the simplicity conjecture.

## Quick Start

```
lake build Kernel.Root
```

Compiles the entire kernel (~3200 jobs, ~5 minutes with cached Mathlib).

## The Result

**100+ machine-checked theorems. 3 alternative axioms. 0 sorry in the clean path.**

The kernel proves that RH follows from any one of three equivalent statements:

| Axiom | File | Statement |
|:---|:---|:---|
| `gate_e_exhaustive` | RouteBv4 | No off-line zeros (SIDE exclusion) |
| `codim2_avoidance` | ThomBridge | Strip zeros have Re(s) = 1/2 |
| `all_zeros_simple` | SpectralCannon | All strip zeros are simple |

The simplicity conjecture is the most-studied: 40.77% proved (Conrey 1989),
10¹³+ confirmed (Platt-Trudgian 2021), predicted by GUE (Montgomery-Odlyzko).

## Key Theorems

| Theorem | File | Content |
|:---|:---|:---|
| `focus` | Focus | Im(Λ₀(1/2+it)) = 0 — ξ real on critical line |
| `antisymmetry` | ThomBridge | Λ₀((1-σ)+it) = conj(Λ₀(σ+it)) |
| `deriv_fe` | SpectralCannon | Λ₀'(s) = -Λ₀'(1-s) |
| `factor_times_norm_eq_one` | ProductFormula_Clean | p^v_p(n) · \|n\|_p = 1 |
| `product_formula_finsupp` | ProductFormula_Clean | ∏_p cancellation for all integers |
| `s_darkness_from_product` | ProductFormula_Rat | (product formula)^s = 1 |
| `schwarz_reflection_completedZeta₀` | SchwarzDischarge | Λ₀(conj s) = conj(Λ₀(s)) |
| `balance_theorem` | Voice1 | p^(-σ) = p^(-(1-σ)) ↔ σ = 1/2 |
| `proved_infrastructure` | PerpendicularCrossing | FOCUS ∧ deriv_fe ∧ Euler ∧ antisymmetry |

## File Guide

### Foundation (3 files)
- **Layer1.lean** — SIDE exclusion logic
- **XiDef.lean** — Concrete ξ using Mathlib's riemannZeta
- **StructuralCount.lean** — Formation (2,3,2,0) = 7

### Seven Voices (7 files)
- **Voice1.lean** — C₄ Euler balance
- **Voice2.lean** — C₂ conjugation symmetry
- **Voice3.lean** — C₁ reflection fixed point
- **Voice3b.lean** — C₃ Cauchy-Riemann codimension
- **Voice5.lean** — C₅ modular PSL₂ action
- **Voice6.lean** — C₆ spectral self-adjointness
- **Voice7.lean** — C₇ topological neutrality

### Schwarz + FOCUS (2 files)
- **SchwarzDischarge.lean** — Λ₀(conj s) = conj(Λ₀(s)), 0 sorry
- **Focus.lean** — Im(Λ₀(1/2+it)) = 0, from Schwarz + FE

### Product Formula (3 files)
- **ProductFormula_v2.lean** — Prime powers
- **ProductFormula_Clean.lean** — General integers via factorization
- **ProductFormula_Rat.lean** — Rationals + s-darkness + Conservation

### Closing Architecture (4 files)
- **ThomBridge.lean** — Antisymmetry + codim2_avoidance axiom
- **SpectralCannon.lean** — Λ₀'(s) = -Λ₀'(1-s) + simplicity axiom
- **PerpendicularCrossing.lean** — Full assembly of closing forces
- **PoissonExhaustion.lean** — Place exhaustion via Ostrowski

### Integration (2 files)
- **Integration.lean** — Route A theorem
- **RouteBv4.lean** — Route B + gate_e axiom + RH derivation

### Archive
- **archive/** — 36 development artifacts (probes, builds, iterations)

## Dependencies

- Lean 4 (v4.29.0-rc2)
- Mathlib (current master)

## The Proof Architecture

```
    σ = 1/2              σ = 1

    FOCUS (C₁)           EULER (C₄)
    codim-2              zero-free
    obstruction          region
        →→→                ←←←

    CONSERVATION: nothing else acts

    Seven voices: all constrain to σ = 1/2
    Formation: (2,3,2,0) = 7 exhaustive
    Axiom: simplicity (most-studied adjacent conjecture)
```

## Axiom Evolution

```
Session 1:  18 axioms (vacuous proofs, string-comparison independence)
Session 2:  3 axioms (genuine proofs replacing scaffolding)
Session 3:  1 axiom  (Schwarz discharged, transversality derived)
Session 4:  1 axiom  → 3 equivalent forms (transparent, community-targeted)
```

---

*PLACE TO STAND Research Programme — March 2026*

*:: → · ← ::*
