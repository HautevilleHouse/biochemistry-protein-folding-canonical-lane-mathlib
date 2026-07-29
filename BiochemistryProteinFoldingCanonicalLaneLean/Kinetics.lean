import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.ProteinStructure
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.EnergyLandscape
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.FoldingPathways

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure KineticsPackage {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    {F : FoldingPathwaysPackage P E} where
  foldingRate : Float
  unfoldingRate : Float
  rateConstants : Prop
  transitionStateTheory : Prop

structure KineticsEvidence {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    {F : FoldingPathwaysPackage P E} (K : KineticsPackage P E F) where
  ratesPositive : K.foldingRate > 0 ∧ K.unfoldingRate > 0
  rateConstantsClosed : K.rateConstants
  transitionStateTheoryClosed : K.transitionStateTheory

def KineticsClosed {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    {F : FoldingPathwaysPackage P E} (K : KineticsPackage P E F) : Prop :=
  K.rateConstants ∧ K.transitionStateTheory

theorem kinetics_closed_from_evidence
    {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    {F : FoldingPathwaysPackage P E} (K : KineticsPackage P E F)
    (Ev : KineticsEvidence K) : KineticsClosed K := by
  exact And.intro Ev.rateConstantsClosed Ev.transitionStateTheoryClosed

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse