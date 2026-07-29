import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.ProteinStructure
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.EnergyLandscape

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure ThermodynamicsPackage {P : ProteinStructurePackage} {E : EnergyLandscapePackage P} where
  foldingTemperature : Float
  enthalpyChange : Float
  entropyChange : Float
  gibbsFreeEnergyChange : Float
  stabilityAtPhysiological : Prop

structure ThermodynamicsEvidence {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    (T : ThermodynamicsPackage P E) where
  gibbsNegative : T.gibbsFreeEnergyChange < 0
  enthalpyEntropyBalance : T.enthalpyChange < 0 ∧ T.entropyChange < 0
  stabilityAtPhysiologicalClosed : T.stabilityAtPhysiological

def ThermodynamicsClosed {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    (T : ThermodynamicsPackage P E) : Prop :=
  T.gibbsFreeEnergyChange < 0 ∧ T.stabilityAtPhysiological

theorem thermodynamics_closed_from_evidence
    {P : ProteinStructurePackage} {E : EnergyLandscapePackage P}
    (T : ThermodynamicsPackage P E) (Ev : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro Ev.gibbsNegative Ev.stabilityAtPhysiologicalClosed

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse