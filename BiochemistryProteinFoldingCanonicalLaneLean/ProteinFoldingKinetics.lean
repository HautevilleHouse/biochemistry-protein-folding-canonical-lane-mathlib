import canonicalLaneMathlib.RicciFlowPDE

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure ProteinFoldingKineticsPackage (G : ProteinStructurePackage) where
  timeParameter : Type u
  concentrationAt : timeParameter → Type v
  initialConcentrationMatches : Prop
  differentialRateEquations : Prop
  foldingEquation : Prop
  maximalTimeInterval : Prop

structure ProteinFoldingKineticsEvidence {G : ProteinStructurePackage}
    (F : ProteinFoldingKineticsPackage G) where
  initialConcentrationMatchesClosed : F.initialConcentrationMatches
  differentialRateEquationsClosed : F.differentialRateEquations
  foldingEquationClosed : F.foldingEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def ProteinFoldingKineticsClosed {G : ProteinStructurePackage}
    (F : ProteinFoldingKineticsPackage G) : Prop :=
  F.initialConcentrationMatches ∧
  F.differentialRateEquations ∧
  F.foldingEquation ∧
  F.maximalTimeInterval

theorem protein_folding_kinetics_closed_from_evidence
    {G : ProteinStructurePackage} (F : ProteinFoldingKineticsPackage G)
    (E : ProteinFoldingKineticsEvidence F) : ProteinFoldingKineticsClosed F := by
  exact And.intro E.initialConcentrationMatchesClosed
    (And.intro E.differentialRateEquationsClosed
      (And.intro E.foldingEquationClosed E.maximalTimeIntervalClosed))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse