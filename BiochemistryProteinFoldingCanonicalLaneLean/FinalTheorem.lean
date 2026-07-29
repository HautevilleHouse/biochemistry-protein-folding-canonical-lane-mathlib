import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

def ConstrainedProteinFoldingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_protein_folding_endgame (A : AdmissibleClass) :
    ConstrainedProteinFoldingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse