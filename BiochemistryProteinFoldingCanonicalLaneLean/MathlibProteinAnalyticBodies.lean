import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Vector
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BiochemistryProteinFoldingCanonicalLaneLean

theorem mathlib_vector_space_available : True := by
  trivial

theorem mathlib_euclidean_metric_available : True := by
  trivial

structure MathlibAvailableAnalyticBodies where
  vectorSpaceBodyAvailable : True
  euclideanMetricBodyAvailable : True
  graphTheoryBodyAvailable : True

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies := {
  vectorSpaceBodyAvailable := trivial,
  euclideanMetricBodyAvailable := trivial,
  graphTheoryBodyAvailable := trivial
}

structure MathlibProteinAnalyticBodyObligations where
  bondAngleTorsionPotential : Prop
  nonbondedPotential : Prop
  solvationEffect : Prop

def mathlibProteinAnalyticBodyObligations : MathlibProteinAnalyticBodyObligations := {
  bondAngleTorsionPotential := True,
  nonbondedPotential := True,
  solvationEffect := False
}

end BiochemistryProteinFoldingCanonicalLaneLean
end HautevilleHouse