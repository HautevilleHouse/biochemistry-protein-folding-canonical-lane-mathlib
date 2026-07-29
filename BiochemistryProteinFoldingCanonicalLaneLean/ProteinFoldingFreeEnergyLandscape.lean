import canonicalLaneMathlib.AdmissibleClass
import BiochemistryProteinFoldingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure FreeEnergyLandscapePackage where
  foldedState : Type u
  unfoldedState : Type v
  transitionState : Type w
  freeEnergyDifference : Prop
  barrierHeight : Prop
  foldingFunnel : Prop

structure FreeEnergyLandscapeEvidence (F : FreeEnergyLandscapePackage) where
  freeEnergyDifferenceClosed : F.freeEnergyDifference
  barrierHeightClosed : F.barrierHeight
  foldingFunnelClosed : F.foldingFunnel

def FreeEnergyLandscapeClosed (F : FreeEnergyLandscapePackage) : Prop :=
  F.freeEnergyDifference ∧ F.barrierHeight ∧ F.foldingFunnel

theorem free_energy_landscape_closed_from_evidence
    (F : FreeEnergyLandscapePackage) (E : FreeEnergyLandscapeEvidence F) :
    FreeEnergyLandscapeClosed F := by
  exact And.intro E.freeEnergyDifferenceClosed
    (And.intro E.barrierHeightClosed E.foldingFunnelClosed)

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse