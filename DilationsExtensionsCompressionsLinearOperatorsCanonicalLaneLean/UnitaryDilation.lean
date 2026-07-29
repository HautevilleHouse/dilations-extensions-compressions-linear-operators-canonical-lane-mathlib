import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure UnitaryDilationPackage {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} (S : SpectralTheoremPackage E) where
  contractionOperator : D.boundedLinear
  largerSpace : D.HilbertSpace
  unitaryOperator : D.boundedLinear
  embeddingIsometry : D.boundedLinear
  dilationProperty : Prop
  minimality : Prop

structure UnitaryDilationEvidence {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} {S : SpectralTheoremPackage E}
    (U : UnitaryDilationPackage S) where
  dilationPropertyClosed : U.dilationProperty
  minimalityClosed : U.minimality

def UnitaryDilationClosed {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} {S : SpectralTheoremPackage E}
    (U : UnitaryDilationPackage S) : Prop :=
  U.dilationProperty ∧ U.minimality

theorem unitary_dilation_closed_from_evidence {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} {S : SpectralTheoremPackage E}
    (U : UnitaryDilationPackage S) (Ev : UnitaryDilationEvidence U) :
    UnitaryDilationClosed U := by
  exact And.intro Ev.dilationPropertyClosed Ev.minimalityClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse