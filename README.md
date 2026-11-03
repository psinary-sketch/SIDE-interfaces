# SIDE-interfaces

SIDE-interfaces compiles a ConservationProfile structure over a finite parameter type, and three statements. Statements at 1728796:

    theorem connection_requires_structure {params : Type} [Fintype params] (P : ConservationProfile params) (h_nontrivial : NontrivialInterface P) (h_bimodality : ∀ x, P.kvec x < (45 : Real) / 100 ∨ (75 : Real) / 100 <= P.kvec x) : ∃ x : params, StructuralWitness P x (Interfaces/ConnectionRequiresStructure.lean :22)
    theorem parametric_mechanism_theorem {A B : Type} [Fintype A] (P : B -> Real) (f : A -> B) (a0 : A) (h_no_mechanism : ∀ a : A, P (f a) = P (f a0)) : kappa P f a0 = 0 (Interfaces/ConnectionRequiresStructure.lean :41)
    theorem rank_decomposition (P : ConservationProfile params) : structuralRank P + splitRank P + continuousRank P = dim P (Interfaces/ConservationProfile.lean :38)

connection_requires_structure concludes one witness and only under its bimodality premise, and it alone concludes an existential. The profile's field kvec is tied by no statement to a measured conservation strength.

## Quick start

```bash
lake build
```

Compiles in roughly 1800 jobs (most of which is Mathlib once cached). Build target `«side-interfaces»` produces a small executable; the kernel is consumed via `import Interfaces`.

```
Build: 1824 jobs, 0 errors, 0 sorry
Toolchain: leanprover/lean4:v4.29.0-rc8
Mathlib: pinned via lake-manifest.json
```

## What this kernel provides

Three modules, each lifting one INTERFACETS construction into typed Lean.

### `Interfaces.Kappa`

Real-valued conservation strength κ as a *transmission coefficient*. For a finite type of A-side perturbations, a transmission map `f : A → B`, and a real-valued P-observable `P : B → ℝ`,

```
κ(P, f, a₀) = max over a of |P(f a) - P(f a₀)|
```

The module also defines:

- `kappa_invariance := 1 - kappa` (the INTERFACETS §2.1 direction, when invariance is the natural axis)
- `kappa_empirical` (variance-ratio form for measurement protocols)
- `IsDark P f a₀ := kappa P f a₀ = 0`

The proven theorem `kappa_zero_of_no_mechanism` says: if no A-side perturbation changes the B-side observable, κ is zero. This is the kernel-level form of the Mechanism Theorem one direction — *no mechanism, no transmission*.

### `Interfaces.ConnectionRequiresStructure`

- `connection_requires_structure` — Under the INTERFACETS bimodality hypothesis (every parameter has κ < 0.45 or κ ≥ 0.75), any non-trivial interface produces at least one structural witness. Not all dark, plus bimodality, forces structure.

## Why "Reading 1" κ

The κ name is overloaded in the broader programme: it appears as a *transmission coefficient* in some contexts (κ = 0 means dark) and as an *invariance coefficient* in others (κ = 1 means invariant). Both readings are valid; the question is which is canonical for downstream use.

Reading 2 remains available as the derived definition `kappa_invariance := 1 - kappa`. Downstream kernels that prefer the invariance axis (e.g. for INTERFACETS §2.1 narrative) consume this rather than redefining κ.

## Module layout

```
Interfaces.lean                     -- root; re-exports
+-- Interfaces/Kappa.lean           -- real-valued κ + IsDark + kappa_zero_of_no_mechanism
+-- Interfaces/ConservationProfile.lean
|                                   -- κ-vector + rank classification + rank_decomposition
+-- Interfaces/ConnectionRequiresStructure.lean
                                    -- structural witness + Parametric Mechanism Theorem

Kernel/InFormation.lean             -- Formation primitive
```

## v0.2 inventory

| Item | Count |
|:-----|:------|
| Theorems proved | 8 |
| Sorry | 0 |
| Axioms beyond Lean core | 0 |
| Modules | 4 |

## Relationship to other kernels

- **SIDE-kernel** (https://github.com/psinary-sketch/SIDE-kernel) — provides Formation primitives, ξ structure, Mechanism Theorem foundations. Zenodo DOI 10.5281/zenodo.19674313.
- **SIDE-trivium** (https://github.com/psinary-sketch/SIDE-trivium) — domain kernel for the Trivium structure. Zenodo DOI 10.5281/zenodo.19938003.
- **SIDE-cosmo** (https://github.com/psinary-sketch/SIDE-cosmo) — cosmological extension kernel; formation distance Δμ as dark sector, Ω_b prediction. Zenodo DOI 10.5281/zenodo.19938009.
- **SIDE-effects** (https://github.com/psinary-sketch/SIDE-effects) — additional domain kernel; framework consequences (Yang-Mills, GRH, BSD, Artin, additive-multiplicative problems).
- **PLACE-papers** (Zenodo DOI 10.5281/zenodo.19675356) — manuscript leg of the programme; INTERFACETS is one of seven Day 1 papers.

---

PLACE TO STAND Research Programme — May 2026
J. York Seale (NaturalScience), ORCID 0009-0008-7993-0310

`:: → · ← ::`
