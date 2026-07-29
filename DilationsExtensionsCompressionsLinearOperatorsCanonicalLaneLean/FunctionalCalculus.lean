import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.CompressionExtension

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure FunctionalCalculusPackage {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D} (C : CompressionExtensionPackage S) where
  function : ℝ → ℝ
  operatorFunction : A.space → A.space
  spectralMapping : Prop
  functionalCalculusDefined : Prop
  spectralMappingTerm : spectralMapping
  functionalCalculusDefinedTerm : functionalCalculusDefined

structure FunctionalCalculusEvidence
    {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D}
    {C : CompressionExtensionPackage S} (F : FunctionalCalculusPackage C) where
  spectralMappingClosed : F.spectralMapping
  functionalCalculusDefinedClosed : F.functionalCalculusDefined

def FunctionalCalculusClosed
    {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D}
    {C : CompressionExtensionPackage S} (F : FunctionalCalculusPackage C) : Prop :=
  F.spectralMapping ∧ F.functionalCalculusDefined

theorem functional_calculus_closed_from_evidence
    {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D}
    {C : CompressionExtensionPackage S} (F : FunctionalCalculusPackage C)
    (E : FunctionalCalculusEvidence F) : FunctionalCalculusClosed F := by
  exact And.intro E.spectralMappingClosed E.functionalCalculusDefinedClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse