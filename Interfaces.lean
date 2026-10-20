/-
  Interfaces.lean

  SIDE-interfaces v0.1 root entry.

  Lifts INTERFACETS Part II to the kernel level:

  * Real-valued κ (transmission coefficient).
  * ConservationProfile P: a per-parameter kappa vector over a finite
    parameter type.
  * Connection Requires Structure: under the INTERFACETS bimodality
    hypothesis (every kappa < 0.45 or >= 0.75), a profile that is not
    all dark has a structural witness (kappa >= 0.75).
  * Parametric Mechanism Theorem: if no A-side change moves the
    observable, kappa = 0.

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
import Interfaces.InterfaceSplit
