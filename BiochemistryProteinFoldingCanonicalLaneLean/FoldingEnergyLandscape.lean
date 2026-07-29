import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

structure EnergyLandscapePackage where
  foldedState : Type u
  unfoldedState : Type v
  intermediateStates : Type w
  freeEnergySurface : Prop
  foldingFunnel : Prop
  frustrationIndex : Prop

structure EnergyLandscapeEvidence (E : EnergyLandscapePackage) where
  freeEnergySurfaceClosed : E.freeEnergySurface
  foldingFunnelClosed : E.foldingFunnel
  frustrationIndexClosed : E.frustrationIndex

def EnergyLandscapeClosed (E : EnergyLandscapePackage) : Prop :=
  E.freeEnergySurface ∧ E.foldingFunnel ∧ E.frustrationIndex

theorem energy_landscape_closed_from_evidence (E : EnergyLandscapePackage)
    (Ev : EnergyLandscapeEvidence E) : EnergyLandscapeClosed E := by
  exact And.intro Ev.freeEnergySurfaceClosed
    (And.intro Ev.foldingFunnelClosed Ev.frustrationIndexClosed)

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse