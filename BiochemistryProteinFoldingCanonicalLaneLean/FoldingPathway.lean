import canonicalLaneMathlib.SingularityModels

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure FoldingPathwayPackage {G : ProteinStructurePackage}
    {F : ProteinFoldingKineticsPackage G}
    (S : ThermodynamicsPackage G F) where
  intermediateStateSequence : Prop
  transitionStateBarrier : Prop
  pathClassification : Prop
  onPathwayOrMisfold : Prop

structure FoldingPathwayEvidence {G : ProteinStructurePackage}
    {F : ProteinFoldingKineticsPackage G}
    {S : ThermodynamicsPackage G F} (Q : FoldingPathwayPackage G F S) where
  intermediateStateSequenceClosed : Q.intermediateStateSequence
  transitionStateBarrierClosed : Q.transitionStateBarrier
  pathClassificationClosed : Q.pathClassification
  onPathwayOrMisfoldClosed : Q.onPathwayOrMisfold

def FoldingPathwayClosed {G : ProteinStructurePackage}
    {F : ProteinFoldingKineticsPackage G}
    {S : ThermodynamicsPackage G F} (Q : FoldingPathwayPackage G F S) : Prop :=
  Q.intermediateStateSequence ∧ Q.transitionStateBarrier ∧
  Q.pathClassification ∧ Q.onPathwayOrMisfold

theorem folding_pathway_closed_from_evidence
    {G : ProteinStructurePackage} {F : ProteinFoldingKineticsPackage G}
    {S : ThermodynamicsPackage G F} (Q : FoldingPathwayPackage G F S)
    (E : FoldingPathwayEvidence Q) : FoldingPathwayClosed Q := by
  exact And.intro E.intermediateStateSequenceClosed
    (And.intro E.transitionStateBarrierClosed
      (And.intro E.pathClassificationClosed E.onPathwayOrMisfoldClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse