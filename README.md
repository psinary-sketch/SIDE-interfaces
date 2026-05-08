# SIDE-interfaces

Lean 4 kernel for INTERFACETS Part II: per-parameter Conservation Profiles, Connection Requires Structure, and the Parametric Mechanism Theorem.

## What this provides

Three new modules built on top of SIDE-kernel:

- **`Interfaces.Kappa`** — Real-valued κ as the transmission coefficient. Replaces the `Nat × 100` representation in `MetaKernel.SilentInterface`.
- **`Interfaces.ConservationProfile`** — Per-parameter κ vector over a `Formation`. Generalizes `SilentInterface` from one parameter to many.
- **`Interfaces.ConnectionRequiresStructure`** — The two main INTERFACETS Part II theorems: every non-trivial interface in a determined system has a structural witness; no mechanism for θ → κ(θ) = 0.

`Interfaces.lean` re-exports `Formation` from `Kernel.InFormation`, so downstream kernels (SIDE-trivium v0.2, SIDE-effects, SIDE-cosmo) can import Formation through SIDE-interfaces in a single import.

## The κ canonicalization

Two readings of κ appear in the corpus:

- **Reading 1 — Transmission coefficient** (SIEVE_CEILING_LEMMA Definition 2.4): κ = sup over A-side perturbations of |ΔP_B(δ)|/|δ|. κ = 0 means dark; κ = 1 means bright.
- **Reading 2 — Instantiation invariance** (INTERFACETS §2.1): κ = fraction of instantiations in which θ is invariant. κ = 0 means varies; κ = 1 means invariant.

The two are inverse-direction for the same observable: κ_invariance = 1 − κ_transmission.

**SIDE-interfaces uses Reading 1 as canonical.** Tested against settled instances: the product formula has typed κ = 0 in `MetaKernel.lean`; the dark cosmological sector has cited κ = 0 across cosmological documents. Reading 1 gives κ = 0 for both. Reading 2 gives κ = 1 for the product formula's σ = 1/2, contradicting the typed value.

For users working in the INTERFACETS direction, `kappa_invariance := 1 - kappa` is provided as a derived definition.

For users measuring κ from data rather than deriving it, `kappa_empirical := 1 - var_within / var_total` is provided separately.

## Build

```bash
lake update
lake exe cache get
lake build
```

## Status

v0.1 — skeleton phase. Definitions stated, theorems stated, `sorry` on proof obligations marked for discharge in v0.2.

## Provenance

Part of the PLACE TO STAND Research Programme. Author: J. York Seale. ORCID: 0009-0008-7993-0310.

License: MIT.
