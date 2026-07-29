import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure KineticsPackage where
  reactionRate : Prop
  activationEnergy : Prop
  transitionState : Prop
  foldingPathway : Prop

structure KineticsEvidence (K : KineticsPackage) where
  reactionRateClosed : K.reactionRate
  activationEnergyClosed : K.activationEnergy
  transitionStateClosed : K.transitionState
  foldingPathwayClosed : K.foldingPathway

def KineticsClosed (K : KineticsPackage) : Prop :=
  K.reactionRate ∧ K.activationEnergy ∧ K.transitionState ∧ K.foldingPathway

theorem kinetics_closed_from_evidence (K : KineticsPackage)
    (E : KineticsEvidence K) : KineticsClosed K := by
  exact And.intro E.reactionRateClosed
    (And.intro E.activationEnergyClosed
      (And.intro E.transitionStateClosed E.foldingPathwayClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse