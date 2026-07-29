import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure IsometricDilation {X : Type} [NormedAddCommGroup X] (T : X → X) where
  H : Type
  [normedH : NormedAddCommGroup H]
  [innerH : InnerProductSpace ℝ H]
  V : X → H  -- isometric embedding
  R : H → H  -- unitary operator
  factor : ℝ
  factor_positive : factor > 0
  dilation_property : ∀ x : X, V (T x) = factor • (R (V x))
  embedding_isometry : ∀ x : X, ‖V x‖ = ‖x‖

structure IsometricDilationEvidence {X : Type} [NormedAddCommGroup X] {T : X → X}
    (D : IsometricDilation T) where
  factor_positive_closed : D.factor_positive
  dilation_property_closed : D.dilation_property
  embedding_isometry_closed : D.embedding_isometry

def IsometricDilationClosed {X : Type} [NormedAddCommGroup X] {T : X → X}
    (D : IsometricDilation T) : Prop :=
  D.factor_positive ∧ D.dilation_property ∧ D.embedding_isometry

theorem isometric_dilation_closed_from_evidence
    {X : Type} [NormedAddCommGroup X] {T : X → X}
    (D : IsometricDilation T) (E : IsometricDilationEvidence D) :
    IsometricDilationClosed D := by
  exact And.intro E.factor_positive_closed
    (And.intro E.dilation_property_closed E.embedding_isometry_closed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse