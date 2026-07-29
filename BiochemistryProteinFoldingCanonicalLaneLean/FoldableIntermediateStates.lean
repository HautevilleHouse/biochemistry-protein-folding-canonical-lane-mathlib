import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure FoldableIntermediateStatesPackage where
  secondaryStructureElements : Prop
  intermediateConformations : Prop
  energyLandscape : Prop
  transitionState : Prop

structure FoldableIntermediateStatesEvidence (P : FoldableIntermediateStatesPackage) where
  secondaryStructureElementsClosed : P.secondaryStructureElements
  intermediateConformationsClosed : P.intermediateConformations
  energyLandscapeClosed : P.energyLandscape
  transitionStateClosed : P.transitionState

def FoldableIntermediateStatesClosed (P : FoldableIntermediateStatesPackage) : Prop :=
  P.secondaryStructureElements ∧ P.intermediateConformations ∧
  P.energyLandscape ∧ P.transitionState

theorem foldable_intermediate_states_closed_from_evidence
    (P : FoldableIntermediateStatesPackage) (E : FoldableIntermediateStatesEvidence P) :
    FoldableIntermediateStatesClosed P := by
  exact And.intro E.secondaryStructureElementsClosed
    (And.intro E.intermediateConformationsClosed
      (And.intro E.energyLandscapeClosed E.transitionStateClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse
