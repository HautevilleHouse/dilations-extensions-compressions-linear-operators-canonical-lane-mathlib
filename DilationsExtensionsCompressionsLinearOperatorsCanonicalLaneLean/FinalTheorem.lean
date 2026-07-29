import canonicalLaneMathlib.AdmissibleClass
import DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.SzNagyDilation
import DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.AndoDilation

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

def ConstrainedDilationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dilation_endgame (A : AdmissibleClass) :
    ConstrainedDilationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse
