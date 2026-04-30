/-
  Interfaces.lean

  SIDE-interfaces v0.1 root entry.

  Lifts INTERFACETS Part II to the kernel level:

  * Real-valued κ (transmission coefficient).
  * ConservationProfile P(I): per-parameter κ vector over a Formation.
  * Connection Requires Structure: every non-trivial interface
    in a determined system has a structural witness.
  * Parametric Mechanism Theorem: no mechanism for θ → κ(θ) = 0.

  Re-exports `Formation` from `Kernel.InFormation` so downstream
  kernels (SIDE-trivium, SIDE-effects, SIDE-cosmo) can import
  Formation through SIDE-interfaces and obtain the κ machinery
  on the same Formation in one import.
-/

-- Re-export the canonical Formation type from SIDE-kernel
import Kernel.InFormation

-- Local modules
import Interfaces.Kappa
import Interfaces.ConservationProfile
import Interfaces.ConnectionRequiresStructure
