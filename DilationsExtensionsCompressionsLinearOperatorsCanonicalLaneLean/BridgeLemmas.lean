import canonicalLaneMathlib.AdmissibleClass
import DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.DilationOperator

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DilationOperatorClosed (A.object : DilationOperatorPackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse