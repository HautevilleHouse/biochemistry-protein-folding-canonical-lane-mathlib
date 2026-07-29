import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure ProteinObject where
  sequence : String
  nativeStructure : String
  foldingPathwayKnown : Prop
  thermodynamicStability : Prop

structure AdmissibleClass where
  object : ProteinObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ProteinWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ProteinWitnessClosed (O : ProteinObject) : Prop :=
  O.foldingPathwayKnown ∧ O.thermodynamicStability

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse