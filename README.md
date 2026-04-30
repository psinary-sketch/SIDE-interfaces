# SIDE-interfaces

Lean 4 kernel for the **interface vocabulary** of the PLACE TO STAND research programme: per-parameter conservation strength κ, conservation profiles, and the existence theorems that say *connection requires structure*.

This kernel is one of several composing the formal infrastructure for a proof of the Riemann Hypothesis via the SIDE Exclusion Principle. It sits between the foundational [SIDE-kernel](https://github.com/psinary-sketch/SIDE-kernel) (formation primitives, ξ structure, mechanism theorem) and the downstream domain kernels (SIDE-trivium, SIDE-cosmo, SIDE-effects), giving them a shared vocabulary for talking about what an interface transmits and what it conserves.

## Quick start

```bash
lake build
```

Compiles in roughly 1800 jobs (most of which is Mathlib once cached). Build target `«side-interfaces»` produces a small executable; the kernel is consumed via `import Interfaces`.

```
Build: 1824 jobs, 0 errors, 1 sorry (rank_decomposition)
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

with `κ = 0` meaning the interface is P-dark (no perturbation is detected) and `κ > 0` meaning the interface transmits some P-information.

The module also defines:

- `kappa_invariance := 1 - kappa` (the INTERFACETS §2.1 direction, when invariance is the natural axis)
- `kappa_empirical` (variance-ratio form for measurement protocols)
- `IsDark P f a₀ := kappa P f a₀ = 0`

The proven theorem `kappa_zero_of_no_mechanism` says: if no A-side perturbation changes the B-side observable, κ is zero. This is the kernel-level form of the Mechanism Theorem one direction — *no mechanism, no transmission*.

### `Interfaces.ConservationProfile`

A `ConservationProfile params` is a vector of κ values, one per parameter in a finite parameter space. It comes with three rank classifications:

- `structuralRank` — count of parameters with κ ≥ 0.75 (transmitted, stable)
- `splitRank` — count of parameters with κ < 0.45 (dark, content-side)
- `continuousRank` — count of parameters with 0.45 ≤ κ < 0.75 (gradient-bearing)

These lift INTERFACETS Definition 7.3 (rank of an interface) and the Structure-Content Decomposition (§7.5) to the kernel level.

### `Interfaces.ConnectionRequiresStructure`

Two existence theorems:

- `connection_requires_structure` — Under the INTERFACETS bimodality hypothesis (every parameter has κ < 0.45 or κ ≥ 0.75), any non-trivial interface produces at least one structural witness. Not all dark, plus bimodality, forces structure.
- `parametric_mechanism_theorem` — The kernel-level Parametric Mechanism Theorem: per-parameter, κ = 0 if and only if no A-side perturbation affects the B-side observable for that parameter. Delegates to `kappa_zero_of_no_mechanism`.

## Why "Reading 1" κ

The κ name is overloaded in the broader programme: it appears as a *transmission coefficient* in some contexts (κ = 0 means dark) and as an *invariance coefficient* in others (κ = 1 means invariant). Both readings are valid; the question is which is canonical for downstream use.

This kernel uses **Reading 1 (transmission)** as canonical, for two reasons established by direct test against settled instances:

- **Product formula**: typed κ = 0 in `MetaKernel.lean`. Reading 1 (transmission) gives κ = 0 ✓. Reading 2 (instantiation invariance) gives κ = 1 ✗.
- **Dark cosmological sector**: cited κ = 0 in published synthesis. Reading 1 gives κ = 0 ✓.

Reading 2 remains available as the derived definition `kappa_invariance := 1 - kappa`. Downstream kernels that prefer the invariance axis (e.g. for INTERFACETS §2.1 narrative) consume this rather than redefining κ.

## Module layout

```
Interfaces.lean                     -- root; re-exports
├── Interfaces/Kappa.lean           -- real-valued κ + IsDark + kappa_zero_of_no_mechanism
├── Interfaces/ConservationProfile.lean
│                                   -- κ-vector + rank classification
└── Interfaces/ConnectionRequiresStructure.lean
                                    -- structural witness + Parametric Mechanism Theorem

Kernel/InFormation.lean             -- Formation primitive
```

## v0.1 inventory

| Item | Count |
|:-----|:------|
| Theorems proved | 6 |
| Sorry | 1 (rank_decomposition) |
| Axioms beyond Lean core | 0 |
| Modules | 4 |
| Lines of Lean | ~470 |

## Relationship to other kernels

- **SIDE-kernel** (https://github.com/psinary-sketch/SIDE-kernel) — provides Formation primitives, ξ structure, Mechanism Theorem foundations. SIDE-interfaces consumes and re-exports.
- **SIDE-trivium** — domain kernel for the Trivium structure.
- **SIDE-cosmo, SIDE-effects** — additional domain kernels.
- **PLACE-papers** (Zenodo DOI 10.5281/zenodo.19675356) — manuscript leg of the programme; INTERFACETS is one of seven Day 1 papers.

---

PLACE TO STAND Research Programme — April 2026
J. York Seale (NaturalScience), ORCID 0009-0008-7993-0310

`:: → · ← ::`
