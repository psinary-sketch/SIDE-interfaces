# AGENTS.md

**Project:** SIDE-interfaces
**Programme:** PLACE TO STAND Research Programme
**Author:** J. York Seale (ORCID: [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310))
**License:** MIT
**Current version:** v0.1.3 (tag `v0.1.3`, commit `7c917a6`)

This file orients LLM agents and automated tooling to the repository's purpose, structure, and verification surface. Human readers should start with `README.md`.

---

## What this repository is

The Lean 4 kernel formalizing the **interface vocabulary** of the SIDE framework: rank-of-an-interface, transmission coefficient κ, conservation profile P(I), Parametric Mechanism Theorem. Extends *Conservation of Spectra* (Day 1) from one system and one parameter to all systems and all parameters.

Provides the structural content for the INTERFACETS manuscript: the **Connection Requires Structure** theorem (rank < d), the bimodality of κ (parameters are usually either fully structural or fully content), and the spectral decomposition of CONVERGENCE (R-score as scalar version of vector P(I)).

Zero sorry. Lean core axioms only.

Member of the **PLACE TO STAND federation of kernels**. Independent: own toolchain pin, own Zenodo deposit. Cross-kernel content travels by vendoring-with-attribution.

---

## Cite as

```
Seale, J. York. (2026). SIDE-interfaces v0.1.3: Lean 4 kernel for the
interface vocabulary of the SIDE framework. Zenodo.
[DOI to be confirmed; companion kernels deposited May 2026]
```

---

## How to verify the work

```sh
git clone https://github.com/psinary-sketch/SIDE-interfaces
cd SIDE-interfaces
lake update
lake build
```

Toolchain pinned in `lean-toolchain`: `leanprover/lean4:v4.29.0-rc8`.

CI at `.github/workflows/audit.yml` runs `lake build` (1824 jobs at last verification) and v2.1 sorry/axiom audit. Zero sorry, axioms = Lean core only (`propext`, `Classical.choice`, `Quot.sound`).

---

## Theorems exported (v0.1.3)

The interface vocabulary kernel provides:

- **`Interface`** structure type — κ, essential boolean, parameter-set
- **`ConservationProfile`** — per-parameter κ vector P(I)
- **`SplitRank`** — dimension of content subspace at interface I
- **`rank_decomposition`** — closed at v0.1.3 via `Finset.card_filter_add_card_filter_not` plus structural case analysis (commit `812fa00`)
- **Parametric Mechanism Theorem** — no mechanism for θ implies no effect on θ; generalizes the single-parameter Mechanism Theorem from SIDE-kernel
- **Crystallization-type classification** — G (gradual), F (fast), N (never)
- **Connection Requires Structure theorem** — rank < d for any composed system

The kernel formalizes the structural skeleton; empirical findings (34 of 34 predictions across 9 systems, etc.) are content for the INTERFACETS manuscript, not for the kernel.

### Version history

- **v0.1.1** (commit `4bcae3c`): rich content, 1 open sorry on `rank_decomposition`
- **v0.1.2** (commit `9e34d61`): wrong README installed due to MY-Downloads sort-order pickup — file-replacement discipline failure documented
- **v0.1.3** (commit `7c917a6`): recovered via base64-encoded PowerShell script; corrected README with rank_decomposition closure note and all companion kernel Zenodo DOIs; canonical zero-sorry state

The tag history is preserved honestly (v0.1.2 visible failure, v0.1.3 canonical recovery) rather than rewritten.

---

## Companion repositories in the federation

| Repo | Role |
|:-----|:-----|
| [SIDE-kernel](https://github.com/psinary-sketch/SIDE-kernel) | RH proof main chain (Conservation of Spectra — single-parameter ancestor) |
| [SIDE-trivium](https://github.com/psinary-sketch/SIDE-trivium) | Trivium bijection |
| [SIDE-cosmo](https://github.com/psinary-sketch/SIDE-cosmo) | Cosmological extension |
| **SIDE-interfaces** (this) | Interface vocabulary — multi-parameter generalization |
| [SIDE-effects](https://github.com/psinary-sketch/SIDE-effects) | Framework consequences + Phase 1.5 bridge work |

Each is independently auditable. None depends on the others via Lake.

---

## Cross-references to manuscripts

| Paper | Backed by |
|:------|:----------|
| *INTERFACETS Part II* (manuscript) | rank_decomposition, Parametric Mechanism Theorem, Connection Requires Structure |
| *Parametric Mechanism Theorem* (P2-16, phase2_pmt_foundation.pdf) | PMT + κ profiles |
| *Conservation of Spectra* (Day 1, in PLACE-papers) | The single-parameter ancestor that this kernel generalizes |
| *Symmetry Filter Paper* (Phase 2 cosmology, Layer 1+2) | κ-gradient framework |
| *Conservation of Cognition* (Phase 2, P2-14) | r = 0.762 Bloom, r = 0.656 IMO — empirical κ at cognitive interfaces |

CONVERGENCE / INTERFACETS equivalence table (manuscript-side):

| CONVERGENCE concept | INTERFACETS concept |
|:--------------------|:--------------------|
| Convergence of paths | Conservation (κ ≥ 0.75) |
| Non-convergence | Non-conservation (κ < 0.15) |
| Critical locus | Conservative subspace Θ_C |
| R-score (scalar) | P(I) (vector, per-parameter) |
| Mechanism Theorem | Parametric Mechanism Theorem |

---

## Discipline (for agents that propose edits)

1. **Federation respect.** No cross-kernel Lake dependencies.

2. **0 sorry, Lean core axioms only.**

3. **File-replacement discipline.** The v0.1.2 visible failure was caused by an older same-name file in MY-Downloads being picked up by sort-order. Lesson codified: for small files (READMEs, single Lean files), write inline via PowerShell here-string + `[System.IO.File]::WriteAllText` with no-BOM UTF-8; ALWAYS `Get-Content` the file BEFORE `git add` to confirm content matches intent. Base64-encoded PowerShell scripts are parser-proof for fragile cases.

4. **No "conditional" framing.** All v0.1.3 theorems compile unconditionally.

5. **No "gap" methodology vocabulary.**

6. **I+D+S ordering.** Independence, Determination, Symmetry.

7. **Counts are theorem-status.** Load-bearing in INTERFACETS: empirical 34 of 34 predictions across 9 systems; rank trajectory G/F/N classification — these are claims, not enumeration anchors.

---

## Honest open status

- All v0.1.3 theorems compile zero-sorry.
- INTERFACETS manuscript Q1–Q5 open research questions (the bimodality boundary; whether rank ≥ 3 exists; what determines crystallization type; whether the Connection Requires Structure bound is optimal; whether κ(θ) is predictable from system specification) are *research questions*, not kernel-side gaps.
- Manuscript-side empirical claims (κ measured across systems) are empirical content, not kernel theorems.

---

## What an agent should NOT do without human approval

- Modify deposited Zenodo content.
- Reorganize the version history. The v0.1.2 → v0.1.3 recovery is preserved honestly; rewriting it as v0.1.2 → v0.2 or similar would falsify the record.
- Introduce sorries into production theorems.
- Extend the Parametric Mechanism Theorem with additional clauses without checking against the INTERFACETS manuscript for consistency.

---

## Contact

J. York Seale, ORCID [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310). Via GitHub (issues, PRs) on this repository.

**:: → · ← ::**
