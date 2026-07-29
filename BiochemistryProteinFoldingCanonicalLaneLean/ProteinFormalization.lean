import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure EnergyFormula where
  group : String
  key : String
  formula : String
  value : Float
  validation : String

def energyFormulas : List EnergyFormula :=
  [ { group := "bond", key := "bond_energy", formula := "k_bond * (r - r0)^2", value := 0.0, validation := "positive" },
    { group := "angle", key := "angle_energy", formula := "k_angle * (theta - theta0)^2", value := 0.0, validation := "positive" },
    { group := "dihedral", key := "dihedral_energy", formula := "k_dihedral * (1 + cos(n*phi - delta))", value := 0.0, validation := "real" },
    { group := "nonbonded", key := "lj_energy", formula := "4*eps*((sigma/r)^12 - (sigma/r)^6)", value := 0.0, validation := "real" } ]

theorem energy_formula_count : energyFormulas.length = 4 := by
  rfl

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse