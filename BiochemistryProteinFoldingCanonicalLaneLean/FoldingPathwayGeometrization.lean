import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.NativeStateClassification

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure FoldingPathwayGeometrizationPackage {P : FoldableIntermediateStatesPackage}
    {Q : NativeStateClassificationPackage P} where
  pathwayDecomposition : Prop
  foldingFunnelGeometry : Prop
  transitionStateEnsemble : Prop
  nativeContactFormation : Prop

structure FoldingPathwayGeometrizationEvidence {P : FoldableIntermediateStatesPackage}
    {Q : NativeStateClassificationPackage P}
    (R : FoldingPathwayGeometrizationPackage Q) where
  pathwayDecompositionClosed : R.pathwayDecomposition
  foldingFunnelGeometryClosed : R.foldingFunnelGeometry
  transitionStateEnsembleClosed : R.transitionStateEnsemble
  nativeContactFormationClosed : R.nativeContactFormation

def FoldingPathwayGeometrizationClosed {P : FoldableIntermediateStatesPackage}
    {Q : NativeStateClassificationPackage P}
    (R : FoldingPathwayGeometrizationPackage Q) : Prop :=
  R.pathwayDecomposition ∧ R.foldingFunnelGeometry ∧
  R.transitionStateEnsemble ∧ R.nativeContactFormation

theorem folding_pathway_geometrization_closed_from_evidence
    {P : FoldableIntermediateStatesPackage} {Q : NativeStateClassificationPackage P}
    (R : FoldingPathwayGeometrizationPackage Q)
    (E : FoldingPathwayGeometrizationEvidence R) : FoldingPathwayGeometrizationClosed R := by
  exact And.intro E.pathwayDecompositionClosed
    (And.intro E.foldingFunnelGeometryClosed
      (And.intro E.transitionStateEnsembleClosed E.nativeContactFormationClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse
