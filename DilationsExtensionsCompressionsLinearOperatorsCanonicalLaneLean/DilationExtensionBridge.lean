import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure DilationExtensionBridge where
  X : Type
  [normedX : NormedAddCommGroup X]
  Y : Type
  [normedY : NormedAddCommGroup Y]
  T : X → X
  S : Y → Y
  factor : ℝ
  extension_map : X → Y
  compression_map : Y → X
  dilation_property : ∀ x : X, extension_map (T x) = factor • (S (extension_map x))
  compression_extension : ∀ x : X, compression_map (extension_map x) = x
  extension_isometry : ∀ x : X, ‖extension_map x‖ = ‖x‖
  compression_contractive : ∀ y : Y, ‖compression_map y‖ ≤ ‖y‖

structure DilationExtensionBridgeEvidence (B : DilationExtensionBridge) where
  dilation_property_closed : B.dilation_property
  compression_extension_closed : B.compression_extension
  extension_isometry_closed : B.extension_isometry
  compression_contractive_closed : B.compression_contractive

def DilationExtensionBridgeClosed (B : DilationExtensionBridge) : Prop :=
  B.dilation_property ∧ B.compression_extension ∧ B.extension_isometry ∧ B.compression_contractive

theorem dilation_extension_bridge_closed_from_evidence
    (B : DilationExtensionBridge) (E : DilationExtensionBridgeEvidence B) :
    DilationExtensionBridgeClosed B := by
  exact And.intro E.dilation_property_closed
    (And.intro E.compression_extension_closed
      (And.intro E.extension_isometry_closed E.compression_contractive_closed))

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse