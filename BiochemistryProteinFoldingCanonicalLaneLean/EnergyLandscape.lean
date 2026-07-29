import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.ProteinStructure

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure EnergyLandscapePackage (P : ProteinStructurePackage) where
  nativeStateEnergy : Float
  unfoldedStateEnergy : Float
  barrierHeights : List Float
  funnelShape : Prop
  globalMinimumUnique : Prop

structure EnergyLandscapeEvidence {P : ProteinStructurePackage} (E : EnergyLandscapePackage P) where
  nativeEnergyLower : E.nativeStateEnergy < E.unfoldedStateEnergy
  barrierFinite : ∀ h ∈ E.barrierHeights, h > 0
  funnelShapeClosed : E.funnelShape
  globalMinimumUniqueClosed : E.globalMinimumUnique

def EnergyLandscapeClosed {P : ProteinStructurePackage} (E : EnergyLandscapePackage P) : Prop :=
  E.funnelShape ∧ E.globalMinimumUnique

theorem energy_landscape_closed_from_evidence
    {P : ProteinStructurePackage} (E : EnergyLandscapePackage P)
    (Ev : EnergyLandscapeEvidence E) : EnergyLandscapeClosed E := by
  exact And.intro Ev.funnelShapeClosed Ev.globalMinimumUniqueClosed

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse