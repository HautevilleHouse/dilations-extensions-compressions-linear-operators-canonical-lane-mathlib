import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure DilationOperator (X : Type) [NormedAddCommGroup X] where
  T : X → X
  factor : ℝ
  factor_positive : factor > 0
  norm_condition : ∀ x : X, ‖T x‖ = factor * ‖x‖

structure DilationOperatorEvidence (D : DilationOperator X) where
  factor_positive_closed : D.factor_positive
  norm_condition_closed : D.norm_condition

def DilationOperatorClosed (D : DilationOperator X) : Prop :=
  D.factor_positive ∧ D.norm_condition

theorem dilation_operator_closed_from_evidence
    (D : DilationOperator X) (E : DilationOperatorEvidence D) :
    DilationOperatorClosed D := by
  exact And.intro E.factor_positive_closed E.norm_condition_closed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse