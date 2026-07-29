import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure AminoAcid where
  name : String
  abbreviation : String
  sideChain : String

structure ProteinSequence where
  residues : List AminoAcid
  length : Nat
  sequenceString : String

structure SecondaryStructure where
  alphaHelices : List (Nat × Nat)
  betaSheets : List (Nat × Nat)
  loops : List (Nat × Nat)

structure TertiaryStructure where
  threeDCoordinates : List (Float × Float × Float)
  contacts : List (Nat × Nat)
  energy : Float

structure ProteinStructurePackage where
  sequence : ProteinSequence
  secondary : SecondaryStructure
  tertiary : TertiaryStructure
  foldingKnown : Prop
  stabilityKnown : Prop

structure ProteinStructureEvidence (P : ProteinStructurePackage) where
  sequenceVerified : P.sequence.length = P.sequence.residues.length
  secondaryConsistent : P.secondary.alphaHelices.length > 0 ∨ P.secondary.betaSheets.length > 0
  tertiaryConsistent : P.tertiary.threeDCoordinates.length = P.sequence.length * 3
  foldingKnownClosed : P.foldingKnown
  stabilityKnownClosed : P.stabilityKnown

def ProteinStructureClosed (P : ProteinStructurePackage) : Prop :=
  P.foldingKnown ∧ P.stabilityKnown

theorem protein_structure_closed_from_evidence
    (P : ProteinStructurePackage) (E : ProteinStructureEvidence P) :
    ProteinStructureClosed P := by
  exact And.intro E.foldingKnownClosed E.stabilityKnownClosed

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse