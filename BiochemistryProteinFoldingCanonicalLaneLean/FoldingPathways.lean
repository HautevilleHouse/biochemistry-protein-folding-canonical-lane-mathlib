import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.ProteinStructure
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.EnergyLandscape

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure IntermediateState where
  structure : TertiaryStructure
  energy : Float
  populationFraction : Float

structure FoldingPathwaysPackage {P : ProteinStructurePackage} {E : EnergyLandscapePackage P} where
  intermediates : List IntermediateState
  transitionStates : List (IntermediateState × IntermediateState)
  foldingMechanism : Prop
  pathwayResolved : Prop

structure FoldingPathwaysEvidence {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    (F : FoldingPathwaysPackage P E) where
  intermediateEnergiesConsistent : ∀ i ∈ F.intermediates, i.energy > E.nativeStateEnergy ∧ i.energy < E.unfoldedStateEnergy
  transitionBarriersPos : ∀ (t : IntermediateState × IntermediateState) ∈ F.transitionStates,
    t.1.energy < t.2.energy ∧ (t.2.energy - t.1.energy) > 0
  foldingMechanismClosed : F.foldingMechanism
  pathwayResolvedClosed : F.pathwayResolved

def FoldingPathwaysClosed {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    (F : FoldingPathwaysPackage P E) : Prop :=
  F.foldingMechanism ∧ F.pathwayResolved

theorem folding_pathways_closed_from_evidence
    {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    (F : FoldingPathwaysPackage P E) (Ev : FoldingPathwaysEvidence F) :
    FoldingPathwaysClosed F := by
  exact And.intro Ev.foldingMechanismClosed Ev.pathwayResolvedClosed

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse