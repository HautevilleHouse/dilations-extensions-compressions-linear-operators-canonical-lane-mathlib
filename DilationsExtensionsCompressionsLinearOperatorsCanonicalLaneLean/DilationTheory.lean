import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure DilationPackage where
  operatorSpace : Type u
  dilationSpace : Type v
  isometry : Type w
  minimality : Prop
  uniqueness : Prop

structure DilationEvidence (D : DilationPackage) where
  minimalityClosed : D.minimality
  uniquenessClosed : D.uniqueness

def DilationClosed (D : DilationPackage) : Prop :=
  D.minimality ∧ D.uniqueness

theorem dilation_closed_from_evidence (D : DilationPackage) (E : DilationEvidence D) :
    DilationClosed D := by
  exact And.intro E.minimalityClosed E.uniquenessClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse