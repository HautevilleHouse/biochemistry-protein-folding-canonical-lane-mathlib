import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryProteinFoldingCanonicalLaneLean.FoldableIntermediateStates

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure NativeStateClassificationPackage (P : FoldableIntermediateStatesPackage) where
  nativeConformation : Type u
  nativeTopology : TopologicalSpace nativeConformation
  energyMinimum : Prop
  uniqueNativeState : Prop
  foldingFunnel : Prop
  conclusion : uniqueNativeState

structure NativeStateClassificationEvidence {P : FoldableIntermediateStatesPackage}
    (Q : NativeStateClassificationPackage P) where
  energyMinimumClosed : Q.energyMinimum
  uniqueNativeStateClosed : Q.uniqueNativeState
  foldingFunnelClosed : Q.foldingFunnel

def NativeStateClassificationClosed {P : FoldableIntermediateStatesPackage}
    (Q : NativeStateClassificationPackage P) : Prop :=
  Q.energyMinimum ∧ Q.uniqueNativeState ∧ Q.foldingFunnel

theorem native_state_classification_closed_from_evidence
    {P : FoldableIntermediateStatesPackage} (Q : NativeStateClassificationPackage P)
    (E : NativeStateClassificationEvidence Q) : NativeStateClassificationClosed Q := by
  exact And.intro E.energyMinimumClosed
    (And.intro E.uniqueNativeStateClosed E.foldingFunnelClosed)

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse
