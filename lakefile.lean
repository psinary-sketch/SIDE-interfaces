import Lake
open Lake DSL

package «side-interfaces» where
  -- Package configuration

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "de5ce8a9a66a4aa68a9bdbb35b63a06d34d9ca11"

-- Note: InFormation.lean is vendored locally as Kernel/InFormation.lean
-- in v0.1 because the upstream SIDE-kernel repo at commit 79b0d30 does
-- not yet contain it.

lean_lib «Kernel» where
  -- Vendored content

lean_lib «Interfaces» where
  -- Library root

@[default_target]
lean_exe «side-interfaces» where
  root := `Main
