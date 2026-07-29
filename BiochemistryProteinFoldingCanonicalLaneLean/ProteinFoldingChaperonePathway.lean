import canonicalLaneMathlib.AdmissibleClass
import BiochemistryProteinFoldingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure ChaperonePathwayPackage where
  chaperoneBinding : Prop
  atpHydrolysis : Prop
  proteinRelease : Prop
  repeatCycles : Prop

structure ChaperonePathwayEvidence (C : ChaperonePathwayPackage) where
  chaperoneBindingClosed : C.chaperoneBinding
  atpHydrolysisClosed : C.atpHydrolysis
  proteinReleaseClosed : C.proteinRelease
  repeatCyclesClosed : C.repeatCycles

def ChaperonePathwayClosed (C : ChaperonePathwayPackage) : Prop :=
  C.chaperoneBinding ∧ C.atpHydrolysis ∧ C.proteinRelease ∧ C.repeatCycles

theorem chaperone_pathway_closed_from_evidence
    (C : ChaperonePathwayPackage) (E : ChaperonePathwayEvidence C) :
    ChaperonePathwayClosed C := by
  exact And.intro E.chaperoneBindingClosed
    (And.intro E.atpHydrolysisClosed
      (And.intro E.proteinReleaseClosed E.repeatCyclesClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse