namespace Kernel

structure Formation where
  n1 : Nat
  n2 : Nat
  n3 : Nat
  n4 : Nat

def Formation.total (f : Formation) : Nat :=
  f.n1 + f.n2 + f.n3 + f.n4

def Formation.structural (f : Formation) : Nat :=
  f.n1 + f.n2 + f.n3

def Formation.dark (f : Formation) : Nat :=
  f.n4

def Formation.isDetermined (f : Formation) : Prop :=
  f.n4 = 0

instance (f : Formation) : Decidable f.isDetermined := by
  unfold Formation.isDetermined
  exact inferInstance

theorem information_is_in_formation
    (f : Formation) (h : f.isDetermined) :
    f.total = f.structural := by
  simp [Formation.total, Formation.structural, Formation.isDetermined] at *
  omega

def xi_formation : Formation := { n1 := 2, n2 := 3, n3 := 2, n4 := 0 }

theorem xi_determined : xi_formation.isDetermined := by decide

theorem xi_information_in_formation :
    xi_formation.total = xi_formation.structural :=
  information_is_in_formation xi_formation xi_determined

theorem xi_structural_seven :
    xi_formation.structural = 7 := by decide

end Kernel
