import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.SzNagyDilation

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure CompressionExtensionPackage {A : OperatorAlgebra} {D : IsometricDilationPackage A} (S : SzNagyDilationPackage D) where
  compressedOperator : A.space → A.space
  extendedOperator : D.extendingAlgebra.space → D.extendingAlgebra.space
  compressionRelation : Prop
  extensionRelation : Prop
  compressionRelationTerm : compressionRelation
  extensionRelationTerm : extensionRelation

structure CompressionExtensionEvidence {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D} (C : CompressionExtensionPackage S) where
  compressionRelationClosed : C.compressionRelation
  extensionRelationClosed : C.extensionRelation

def CompressionExtensionClosed {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D} (C : CompressionExtensionPackage S) : Prop :=
  C.compressionRelation ∧ C.extensionRelation

theorem compression_extension_closed_from_evidence
    {A : OperatorAlgebra} {D : IsometricDilationPackage A} {S : SzNagyDilationPackage D}
    (C : CompressionExtensionPackage S) (E : CompressionExtensionEvidence C) :
    CompressionExtensionClosed C := by
  exact And.intro E.compressionRelationClosed E.extensionRelationClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse