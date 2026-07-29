import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure ExtensionCompressionPackage {D : DilationOperatorPackage} where
  subspace : D.HilbertSpace → Prop
  extensionOperator : D.boundedLinear
  compressionOperator : D.boundedLinear
  extensionPreservesNorm : Prop
  compressionReducesNorm : Prop
  orthogonalityCondition : Prop

structure ExtensionCompressionEvidence {D : DilationOperatorPackage}
    (E : ExtensionCompressionPackage D) where
  extensionPreservesNormClosed : E.extensionPreservesNorm
  compressionReducesNormClosed : E.compressionReducesNorm
  orthogonalityConditionClosed : E.orthogonalityCondition

def ExtensionCompressionClosed {D : DilationOperatorPackage}
    (E : ExtensionCompressionPackage D) : Prop :=
  E.extensionPreservesNorm ∧ E.compressionReducesNorm ∧ E.orthogonalityCondition

theorem extension_compression_closed_from_evidence {D : DilationOperatorPackage}
    (E : ExtensionCompressionPackage D) (Ev : ExtensionCompressionEvidence E) :
    ExtensionCompressionClosed E := by
  exact And.intro Ev.extensionPreservesNormClosed
    (And.intro Ev.compressionReducesNormClosed Ev.orthogonalityConditionClosed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse