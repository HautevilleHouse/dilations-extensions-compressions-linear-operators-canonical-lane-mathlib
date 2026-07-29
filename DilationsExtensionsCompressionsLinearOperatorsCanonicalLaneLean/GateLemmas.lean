import canonicalLaneMathlib.AdmissibleClass
import DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse