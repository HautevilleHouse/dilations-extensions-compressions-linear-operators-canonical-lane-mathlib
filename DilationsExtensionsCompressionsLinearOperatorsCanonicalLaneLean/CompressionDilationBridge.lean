import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.CompressionOperator
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.DilationOperator

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

def bridgeClosed {X Y : Type u} [NormedAddCommGroup X] [NormedAddCommGroup Y]
    (D : DilationOperator X) (C : CompressionOperator X Y) : Prop :=
  ∃ (λ : ℝ), λ ≠ 0 ∧ D.factor = λ ∧ CompressionOperatorClosed C

theorem bridge_from_dilation_compression {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y] (D : DilationOperator X)
    (C : CompressionOperator X Y) (h : bridgeClosed D C) : DilationOperatorClosed D := by
  rcases h with ⟨λ, hλ, hf, hc⟩
  have hsc : ∀ x, ‖D.operator x‖ = |λ| * ‖x‖ := by
    intro x; rw [hλ]; exact D.scalesNorm x
  have hbnd : ∃ C', ∀ x, ‖D.operator x‖ ≤ C' * ‖x‖ := by
    use |λ|; intro x; rw [hsc x]; exact le_refl _
  exact ⟨D.linear, hbnd, hsc⟩

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse