import canonicalLaneMathlib.Surgery

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure MolecularChaperonesPackage {G : ProteinStructurePackage}
    {F : ProteinFoldingKineticsPackage G} {S : FoldingPathwayPackage F} where
  chaperoneTimesDiscrete : Prop
  chaperoneBindingRegion : Prop
  postChaperoneStateControlled : Prop
  foldingProgressSurvivesChaperone : Prop
  topologyChangeAccounted : Prop

structure MolecularChaperonesEvidence {G : ProteinStructurePackage}
    {F : ProteinFoldingKineticsPackage G} {S : FoldingPathwayPackage F}
    (U : MolecularChaperonesPackage G F S) where
  chaperoneTimesDiscreteClosed : U.chaperoneTimesDiscrete
  chaperoneBindingRegionClosed : U.chaperoneBindingRegion
  postChaperoneStateControlledClosed : U.postChaperoneStateControlled
  foldingProgressSurvivesChaperoneClosed : U.foldingProgressSurvivesChaperone
  topologyChangeAccountedClosed : U.topologyChangeAccounted

def MolecularChaperonesClosed {G : ProteinStructurePackage}
    {F : ProteinFoldingKineticsPackage G} {S : FoldingPathwayPackage F}
    (U : MolecularChaperonesPackage G F S) : Prop :=
  U.chaperoneTimesDiscrete ∧ U.chaperoneBindingRegion ∧
  U.postChaperoneStateControlled ∧ U.foldingProgressSurvivesChaperone ∧
  U.topologyChangeAccounted

theorem molecular_chaperones_closed_from_evidence
    {G : ProteinStructurePackage} {F : ProteinFoldingKineticsPackage G}
    {S : FoldingPathwayPackage F} (U : MolecularChaperonesPackage G F S)
    (E : MolecularChaperonesEvidence U) : MolecularChaperonesClosed U := by
  exact And.intro E.chaperoneTimesDiscreteClosed
    (And.intro E.chaperoneBindingRegionClosed
      (And.intro E.postChaperoneStateControlledClosed
        (And.intro E.foldingProgressSurvivesChaperoneClosed E.topologyChangeAccountedClosed)))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse