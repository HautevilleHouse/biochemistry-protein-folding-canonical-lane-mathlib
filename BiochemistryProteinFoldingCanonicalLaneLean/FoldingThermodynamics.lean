import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure ThermodynamicsPackage where
  gibbsFreeEnergy : Prop
  enthalpy : Prop
  entropy : Prop
  meltingTemperature : Prop
  heatCapacity : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  enthalpyClosed : T.enthalpy
  entropyClosed : T.entropy
  meltingTemperatureClosed : T.meltingTemperature
  heatCapacityClosed : T.heatCapacity

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.enthalpy ∧ T.entropy ∧ T.meltingTemperature ∧ T.heatCapacity

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage)
    (Ev : ThermodynamicsEvidence T) : ThermodynamicsClosed T := by
  exact And.intro Ev.gibbsFreeEnergyClosed
    (And.intro Ev.enthalpyClosed
      (And.intro Ev.entropyClosed
        (And.intro Ev.meltingTemperatureClosed Ev.heatCapacityClosed)))

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse