import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.DilationOperator
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.ExtensionOperator

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure DilationExtensionPackage (X Y : Type u) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  dilation : DilationOperator X
  extension : ExtensionOperator X Y
  compatibility : Prop
  compatibilityClosed : compatibility

def DilationExtensionClosed {X Y : Type u} [NormedAddCommGroup X] [NormedAddCommGroup Y]
    (P : DilationExtensionPackage X Y) : Prop :=
  DilationOperatorClosed P.dilation ∧ ExtensionOperatorClosed P.extension ∧ P.compatibility

theorem dilation_extension_closed_from_evidence {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y] (P : DilationExtensionPackage X Y)
    (hdil : DilationOperatorClosed P.dilation)
    (hext : ExtensionOperatorClosed P.extension)
    (hcomp : P.compatibility) : DilationExtensionClosed P := by
  exact And.intro hdil (And.intro hext hcomp)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse