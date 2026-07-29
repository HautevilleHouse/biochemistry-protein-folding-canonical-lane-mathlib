import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure MolecularOrbitalPackage where
  hamiltonian : Prop
  orbitalEnergies : Prop
  electronDensity : Prop
  bondFormation : Prop

structure MolecularOrbitalEvidence (M : MolecularOrbitalPackage) where
  hamiltonianClosed : M.hamiltonian
  orbitalEnergiesClosed : M.orbitalEnergies
  electronDensityClosed : M.electronDensity
  bondFormationClosed : M.bondFormation

def MolecularOrbitalClosed (M : MolecularOrbitalPackage) : Prop :=
  M.hamiltonian ∧ M.orbitalEnergies ∧ M.electronDensity ∧ M.bondFormation

theorem molecular_orbital_closed_from_evidence (M : MolecularOrbitalPackage)
    (E : MolecularOrbitalEvidence M) : MolecularOrbitalClosed M := by
  exact And.intro E.hamiltonianClosed
    (And.intro E.orbitalEnergiesClosed
      (And.intro E.electronDensityClosed E.bondFormationClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse