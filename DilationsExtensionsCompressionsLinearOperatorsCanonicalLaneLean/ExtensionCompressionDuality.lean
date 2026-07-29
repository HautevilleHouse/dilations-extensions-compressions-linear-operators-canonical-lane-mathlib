import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure ExtensionCompressionPair (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  E : X → Y  -- extension operator
  C : Y → X  -- compression operator
  is_extension_of : ∀ x : X, C (E x) = x
  norm_extension : ‖E‖ = 1
  norm_compression : ‖C‖ = 1

structure ExtensionCompressionEvidence (P : ExtensionCompressionPair X Y) where
  is_extension_of_closed : P.is_extension_of
  norm_extension_closed : P.norm_extension
  norm_compression_closed : P.norm_compression

def ExtensionCompressionClosed (P : ExtensionCompressionPair X Y) : Prop :=
  P.is_extension_of ∧ P.norm_extension ∧ P.norm_compression

theorem extension_compression_closed_from_evidence
    (P : ExtensionCompressionPair X Y) (E : ExtensionCompressionEvidence P) :
    ExtensionCompressionClosed P := by
  exact And.intro E.is_extension_of_closed
    (And.intro E.norm_extension_closed E.norm_compression_closed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse