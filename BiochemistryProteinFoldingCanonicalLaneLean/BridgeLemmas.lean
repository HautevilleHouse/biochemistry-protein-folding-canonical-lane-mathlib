import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProteinWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.foldingPathwayKnown A.object.thermodynamicStability

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse